package core

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"reflect"
	"strconv"
	"strings"
	"time"

	"github.com/code-epic/middleware/sys"
	"github.com/code-epic/middleware/util"
)

//Select Crear Consultas Sql
func (C *Core) Select(valor int, consulta string, conexion *sql.DB) (jSon []byte, err error) {
	var estatus bool
	var M util.Mensajes
	lista := make([]map[string]interface{}, 0)
	M.Tipo = 1

	C.RowData, err = conexion.Query(consulta)
	if err != nil {
		M.Msj = "Select fallo"
		M.Tipo = 0
		M.Fecha = time.Now()
		sys.QueryLog.Println("Core.Select: ", consulta, err.Error())
		jSon, err = json.Marshal(M)
		return
	}

	if valor == 1 {
		M.Msj = "Select por precarga"
		M.Tipo = 0
		M.Fecha = time.Now()
		return
	}
	cols, err := C.RowData.Columns()
	if err != nil {
		err = actualizarEstatusAPI(C.ApiCore.Funcion, false)

		return
	}

	colvals := make([]interface{}, len(cols))
	fila := 0
	for C.RowData.Next() {
		fila++
		colassoc := make(map[string]interface{}, len(cols))
		for i := range colvals {
			colvals[i] = new(interface{})
		}
		if err := C.RowData.Scan(colvals...); err != nil {
			err = actualizarEstatusAPI(C.ApiCore.Funcion, false)

		} else {
			for i, col := range cols {
				contenido := *colvals[i].(*interface{})
				colassoc[col] = C.evaluarDatos(col, contenido, fila)
			}
		}
		lista = append(lista, colassoc)
	}
	estatus = true
	if C.ApiCore.Migrar {
		go func() {
			jSon, err = C.IUDQueryBash(C.ApiCore.Destino, lista, "", conexion)
		}()
	}

	C.Cantidad = len(lista)
	C.Resultado.Cuerpo = lista
	jSon, err = json.Marshal(C.Resultado)

	err = actualizarEstatusAPI(C.ApiCore.Funcion, estatus)

	go C.cargarCache(util.GenerarMD5(consulta), jSon)

	return
}

//evaluarDatos Permite evaluar el tipo de dato de un registro
func (C *Core) evaluarDatos(columna string, contenido interface{}, posicion int) (rs interface{}) {
	tipo := "string"
	vs := ""
	evalreflect := reflect.ValueOf(contenido)

	switch evalreflect.Kind() {
	case reflect.Slice:
		valorstr := fmt.Sprintf("%s", contenido)
		tipo = "array"
		rs = strings.Trim(valorstr, " ")
		vs = strings.Trim(valorstr, " ")
	case reflect.String:
		tipo = "string"
		rs = evalreflect.String()
	case reflect.Float32:
		tipo = "double32"
		rs = evalreflect.Float()
	case reflect.Float64:
		tipo = "double64"
		rs = evalreflect.Float()
	case reflect.Int32:
		tipo = "integer32"
		rs = evalreflect.Int()
	case reflect.Int64:
		tipo = "integer64"
		rs = evalreflect.Int()
	}

	if posicion == 1 {
		var def Definicion
		def.Tipo = tipo

		if tipo == "array" {
			_, err := strconv.ParseFloat(vs, 64)
			if err == nil {
				def.Tipo = "number"
			}
		}

		def.Nombre = columna
		C.Resultado.Cabecera = append(C.Resultado.Cabecera, def)
	}

	return
}
