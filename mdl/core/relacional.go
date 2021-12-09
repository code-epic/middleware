package core

import (
	"database/sql"
	"encoding/binary"
	"encoding/json"
	"fmt"
	"strings"
	"time"

	"go.mongodb.org/mongo-driver/mongo"

	"github.com/code-epic/middleware/sys"
	"github.com/code-epic/middleware/util"
	"github.com/code-epic/middleware/util/cache"
	"github.com/code-epic/middleware/util/xzip"
	"go.mongodb.org/mongo-driver/bson"
)

//CrearQuery Creación dinamica de Consultas
func (C *Core) CrearQuery(v map[string]interface{}) (jSon []byte, err error) {
	var M util.Mensajes
	conexion, a, xmongo, msj := leerValores(v)

	M.Tipo = 1
	C.ApiCore = a

	M.Fecha = time.Now()
	if !a.Estatus {
		M.Msj = msj
		M.Tipo = 0
		jSon, _ = json.Marshal(M)
		err = actualizarEstatusAPI(a.Funcion, false)

		return jSon, err
	}
	consulta := parsearParametros(C.ApiCore.Parametros, C.ApiCore.Query)
	if a.Coleccion != "" {
		jSon, err = C.CrearNOSQL(C.ApiCore.Coleccion, consulta, xmongo)
		return
	}

	tpQuery := evaluarQuery(consulta)
	md5Cadena := util.GenerarMD5(consulta)
	M.Msj = "Proceso finalizado"
	jSon, existe := C.validarCache(md5Cadena)
	if !existe {
		switch tpQuery {
		case "select":
			if !C.ApiCore.Retorna && C.ApiCore.Migrar {
				go func() {
					jSon, err = C.Select(v, consulta, conexion)
				}()
				jSon, err = json.Marshal(M)
			} else {
				jSon, err = C.Select(v, consulta, conexion)
			}
		case "insert":
			jSon, err = C.IUDQuery(consulta, conexion, 0)
		default:
			jSon, err = C.IUDQuery(consulta, conexion, 0)
		}
	}
	if C.ApiCore.Logs {
		sys.QueryLog.Println(md5Cadena, consulta)
	}
	return
}

func leerValores(v map[string]interface{}) (db *sql.DB, a ApiCore, mgo *mongo.Database, mensaje string) {

	ApiCoreAux := retornaValores(v)
	c := sys.MongoDB.Collection(sys.APICORE)
	estatus := false

	//fmt.Println("Conexiones... ", ApiCoreAux)

	err := c.FindOne(sys.Contexto, bson.M{"funcion": ApiCoreAux.Funcion}).Decode(&a)
	if err != nil {
		fmt.Println("Error la funcion no existe: "+ApiCoreAux.Funcion, err.Error())
		mensaje = "Verifique la funcion no exite: " + ApiCoreAux.Funcion
		sys.SystemLog.Println("No existe la funcion: ", ApiCoreAux.Funcion, err.Error())
		return
	}

	if sys.SQLTODO[a.Driver].Estatus {
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
		case "funcion":
			a.Funcion = vs.(string)
		case "parametros":
			a.Parametros = vs.(string)
		case "metodo":
			a.Metodo = vs.(string)
		case "migrar":
			a.Migrar = vs.(bool)
		case "destino":
			a.Destino = vs.(string)
		case "retorna":
			a.Retorna = vs.(bool)
		}
	}
	return
}

func evaluarQuery(cadena string) (s string) {

	if strings.Contains(strings.ToLower(cadena), "select") {
		return "select"
	} else {
		return "insert"
	}
}

func (C *Core) validarCache(patron string) (rs []byte, estatus bool) {
	var xcache cache.XCache
	estatus = false
	if C.ApiCore.Cache == 1 {

		c := sys.MongoDB.Collection("sys-cache")
		err := c.FindOne(sys.Contexto, bson.M{"patron": patron}).Decode(&xcache)
		if err == nil {
			estatus = true
			rs = []byte(xzip.Descomprimir(xcache.Contenido))
		}
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
		_, err := C.InsertNOSQL("sys-cache", xcache)

		if err != nil {
			fmt.Println("Error. insertando patrones para el cache", err.Error())
			return
		}
	}
}
