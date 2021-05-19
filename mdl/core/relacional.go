package core

import (
	"database/sql"
	"encoding/binary"
	"encoding/json"
	"fmt"
	"reflect"
	"strconv"
	"strings"
	"time"

	"go.mongodb.org/mongo-driver/mongo"

	"github.com/code-epic/esb/sys"
	"github.com/code-epic/esb/util"
	"github.com/code-epic/esb/util/cache"
	"github.com/code-epic/esb/util/xzip"
	"go.mongodb.org/mongo-driver/bson"
)

//CrearQuery Creación dinamica de Consultas
func (C *Core) CrearQuery(v map[string]interface{}) (jSon []byte, err error) {
	var M util.Mensajes
	c := sys.MongoDB.Collection(sys.APICORE)
	conexion, a, xmongo := leerValores(v)

	C.ApiCore = a

	if a.Estatus != true {
		M.Msj = "Driver de conexión falló"
		M.Tipo = 1
		M.Fecha = time.Now()
		jSon, err = json.Marshal(M)

		estatus := false

		_, err := c.UpdateOne(
			sys.Contexto,
			bson.M{"funcion": a.Funcion},
			bson.D{
				{"$set", bson.D{{"estatus", estatus}}},
			},
		)

		//fmt.Printf("Documento Actualizado %v\n", result.ModifiedCount)
		return jSon, err
	}

	valores := strings.Split(C.ApiCore.Parametros, ",")
	consulta := C.ApiCore.Query
	cantidad := len(valores)
	for i := 0; i < cantidad; i++ {

		svalor := valores[i]
		pos := "$" + strconv.Itoa(i)
		consulta = strings.Replace(consulta, pos, svalor, -1)
	}

	if a.Coleccion != "" {
		jSon, err = C.CrearNOSQL(C.ApiCore.Coleccion, consulta, xmongo)
		return
	}

	tpQuery := evaluarQuery(consulta)

	jSon, existe := C.validarCache(util.GenerarMD5(consulta))
	//fmt.Println("tipo ", tpQuery)

	if !existe {
		for cf, vf := range tpQuery {
			if vf == true {
				switch cf {
				case "select":
					if C.ApiCore.Retorna == false && C.ApiCore.Migrar == true {
						var M util.Mensajes
						M.Msj = "Proceso finalizado"
						M.Tipo = 1
						go C.Select(v, consulta, conexion)
						jSon, err = json.Marshal(M)
					} else {
						jSon, err = C.Select(v, consulta, conexion)
					}

					break
				default:
					jSon, err = C.IUDQuery(consulta, conexion)
					break
				}
			}
		}
	}
	return
}

//Select Crear Consultas Sql
func (C *Core) Select(v map[string]interface{}, consulta string, conexion *sql.DB) (jSon []byte, err error) {
	var estatus bool
	var M util.Mensajes

	c := sys.MongoDB.Collection(sys.APICORE)
	lista := make([]map[string]interface{}, 0)

	rs, e := conexion.Query(consulta)
	//fmt.Println(consulta)
	if e != nil {
		M.Msj = "Select fallo"
		M.Tipo = 1
		M.Fecha = time.Now()
		jSon, err = json.Marshal(M)
		return
	}

	cols, err := rs.Columns()
	if err != nil {
		estatus = false
		_, err = c.UpdateOne(
			sys.Contexto,
			bson.M{"funcion": C.ApiCore.Funcion},
			bson.M{"$set": bson.M{"estatus": estatus}})
		return
	}

	colvals := make([]interface{}, len(cols))

	for rs.Next() {
		colassoc := make(map[string]interface{}, len(cols))
		for i := range colvals {
			colvals[i] = new(interface{})
		}
		if err := rs.Scan(colvals...); err != nil {
			estatus := false
			result, _ := c.UpdateOne(
				sys.Contexto,
				bson.M{"funcion": C.ApiCore.Funcion},
				bson.D{
					{"$set", bson.D{{"estatus", estatus}}},
				},
			)
			fmt.Printf("Documento Actualizado %v\n", result.ModifiedCount)
		}
		for i, col := range cols {
			contenido := *colvals[i].(*interface{})
			evalreflect := reflect.ValueOf(contenido)
			switch evalreflect.Kind() {
			case reflect.Slice:
				valorstr := fmt.Sprintf("%s", contenido)
				colassoc[col] = util.Utf8_decode(strings.Trim(valorstr, " "))
				break
			case reflect.String:
				colassoc[col] = evalreflect.String()
				break
			case reflect.Float32:
				colassoc[col] = evalreflect.Float()
				break
			case reflect.Float64:
				colassoc[col] = evalreflect.Float()
				break
			case reflect.Int32:
				colassoc[col] = evalreflect.Int()
				break
			case reflect.Int64:
				colassoc[col] = evalreflect.Int()
				break
			}
		}
		lista = append(lista, colassoc)
		estatus = true
	}
	if C.ApiCore.Migrar == true {
		go C.IUDQueryBash(C.ApiCore.Destino, lista, "", conexion)
	}

	jSon, err = json.Marshal(lista)

	_, err = c.UpdateOne(
		sys.Contexto,
		bson.M{"funcion": C.ApiCore.Funcion},
		bson.D{
			{"$set", bson.D{{"estatus", estatus}}},
		},
	)

	go C.cargarCache(util.GenerarMD5(consulta), jSon)

	return
}

//IUDQuery Insert, Update, Delete Generador de Consultas
func (C *Core) IUDQuery(consulta string, conexion *sql.DB) (jSon []byte, err error) {
	var M util.Mensajes
	_, err = conexion.Exec(consulta)
	M.Fecha = time.Now()
	if err != nil {
		M.Msj = "Erro ejecutando consulta: " + err.Error()
		M.Tipo = 0
		jSon, err = json.Marshal(M)
	} else {
		M.Msj = "Proceso Exitoso"
		M.Tipo = 1
		jSon, err = json.Marshal(M)
	}

	return

}

//IUDQueryBash Insert, Update, Delete Generador de Consultas
func (C *Core) IUDQueryBash(tabla string, lista []map[string]interface{}, consulta string, conexion *sql.DB) (jSon []byte, err error) {
	var M util.Mensajes
	var campos, valores string
	i := 0
	j := 0

	for _, valor := range lista {
		insert := "INSERT INTO " + tabla + " "
		campos = "("
		valores = "("
		i++

		for c, v := range valor {
			comax := ","
			if j == 0 {
				comax = ""
			}
			campos += comax + c

			evalreflect := reflect.ValueOf(v)

			switch evalreflect.Kind() {
			case reflect.String:
				valorstr := fmt.Sprintf("%s", v)
				valores += comax + "'" + util.Utf8_decode(strings.Trim(valorstr, " ")) + "'"
				break
			case reflect.Slice:
				valorstr := fmt.Sprintf("%s", v)
				valores += comax + "'" + strings.Trim(valorstr, " ") + "'"
				break
			case reflect.Float32:
				f := evalreflect.Float()
				valores += comax + strconv.FormatFloat(f, 'f', 2, 64)
				break
			case reflect.Float64:
				f := evalreflect.Float()
				valores += comax + strconv.FormatFloat(f, 'f', 2, 64)
				break
			case reflect.Int32:
				n := evalreflect.Int()
				valores += comax + strconv.FormatInt(n, 10)
				break
			case reflect.Int64:
				n := evalreflect.Int()
				valores += comax + strconv.FormatInt(n, 10)
				break
			}

			j++
		}
		j = 0
		valores += ")"
		campos += ")"
		insert += campos + " VALUES " + valores + ";"
		campos = ""
		valores = ""
		db := sys.SQLTODO["PGODB"].DB
		_, err = db.Exec(insert)
		M.Fecha = time.Now()
		if err != nil {
			fmt.Println("----> ", err.Error())
			M.Msj = "Erro ejecutando consulta: " + err.Error()
			M.Tipo = 0
			jSon, err = json.Marshal(M)
		} else {
			M.Msj = "Proceso Exitoso"
			M.Tipo = 1
			jSon, err = json.Marshal(M)
		}
	}
	return

}

func leerValores(v map[string]interface{}) (db *sql.DB, a ApiCore, mgo *mongo.Database) {

	ApiCoreAux := retornaValores(v)
	c := sys.MongoDB.Collection(sys.APICORE)
	estatus := false

	err := c.FindOne(sys.Contexto, bson.M{"funcion": ApiCoreAux.Funcion}).Decode(&a)
	if err != nil {
		fmt.Println("Error creando Query en Mongodb "+"funcion: "+ApiCoreAux.Funcion, err.Error())
		sys.SystemLog.Printf("Error creando Query en Mongodb funcion: %s %s", ApiCoreAux.Funcion, err.Error())
	}
	if sys.SQLTODO[a.Driver].Estatus != false {
		drv := sys.SQLTODO[a.Driver]
		db = drv.DB
		estatus = true
	}

	if a.Coleccion != "" {
		drv := sys.NOSQLTODO[a.Driver]
		mgo = drv.DB
		estatus = true
	}
	a.Parametros = ApiCoreAux.Parametros
	a.Migrar = ApiCoreAux.Migrar
	a.Metodo = ApiCoreAux.Metodo
	a.Destino = ApiCoreAux.Destino
	a.Retorna = ApiCoreAux.Retorna
	a.Estatus = estatus
	a.Funcion = ApiCoreAux.Funcion
	//fmt.Println("Driver seleccionado: ", a.Parametros, a.Coleccion)
	return
}

func retornaValores(v map[string]interface{}) (a ApiCore) {

	for k, vs := range v {

		switch k {
		case "coleccion":
			a.Coleccion = vs.(string)
			break
		case "funcion":
			a.Funcion = vs.(string)
			break
		case "parametros":
			a.Parametros = vs.(string)
			break
		case "metodo":
			a.Metodo = vs.(string)
			break
		case "migrar":
			a.Migrar = vs.(bool)
			break
		case "destino":
			a.Destino = vs.(string)
			break
		case "retorna":
			a.Retorna = vs.(bool)
			break
		}
	}
	return
}

func evaluarQuery(cadena string) (s map[string]bool) {
	s = make(map[string]bool)

	s["select"] = strings.Contains(strings.ToLower(cadena), "select")
	s["insert"] = strings.Contains(strings.ToLower(cadena), "insert")
	s["update"] = strings.Contains(strings.ToLower(cadena), "update")
	s["delete"] = strings.Contains(strings.ToLower(cadena), "delete")
	return s
}

func (C *Core) validarCache(patron string) (rs []byte, estatus bool) {
	var xcache cache.XCache
	estatus = false
	fmt.Println(patron)
	fmt.Println("Imprimiendo cache :", C.ApiCore.Cache)
	if C.ApiCore.Cache == 1 {

		c := sys.MongoDB.Collection("sys-cache")
		err := c.FindOne(sys.Contexto, bson.M{"patron": patron}).Decode(&xcache)
		if err != nil {
			fmt.Println("Error. en la busqueda de patrones para cache")
			estatus = false
			return
		}
		estatus = true
		fmt.Println(xcache.Contenido)
		fmt.Println("----------")

		fmt.Println("descomprimir recurso")
		rs = []byte(xzip.Descomprimir(xcache.Contenido))
	}

	return
}

func (C *Core) cargarCache(patron string, rs []byte) {
	var xcache cache.XCache
	if C.ApiCore.Cache == 1 {
		xcache.Patron = patron
		xcache.Contenido = xzip.Comprimir(rs)
		xcache.Peso = util.PesoHumano(binary.Size([]byte(xcache.Contenido)), 2)
		xcache.Origen = C.ApiCore.ID
		xcache.Funcion = C.ApiCore.Funcion
		C.InsertNOSQL("sys-cache", xcache)
	}
}
