package core

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"reflect"
	"strings"
	"time"

	"github.com/code-epic/middleware/sys"
	"github.com/code-epic/middleware/util"
)

//Select Crear Consultas Sql
func (C *Core) Select(v map[string]interface{}, consulta string, conexion *sql.DB) (jSon []byte, err error) {
	var estatus bool
	var M util.Mensajes
	lista := make([]map[string]interface{}, 0)
	M.Tipo = 1

	rs, e := conexion.Query(consulta)
	if e != nil {
		M.Msj = "Select fallo"
		M.Tipo = 0
		M.Fecha = time.Now()
		sys.QueryLog.Println("Core.Select: ", consulta, err.Error())
		jSon, err = json.Marshal(M)
		return
	}

	cols, err := rs.Columns()
	if err != nil {
		err = actualizarEstatusAPI(C.ApiCore.Funcion, false)

		return
	}

	colvals := make([]interface{}, len(cols))

	for rs.Next() {
		colassoc := make(map[string]interface{}, len(cols))
		for i := range colvals {
			colvals[i] = new(interface{})
		}
		if err := rs.Scan(colvals...); err != nil {
			err = actualizarEstatusAPI(C.ApiCore.Funcion, false)

		} else {
			for i, col := range cols {
				contenido := *colvals[i].(*interface{})
				evalreflect := reflect.ValueOf(contenido)
				switch evalreflect.Kind() {
				case reflect.Slice:
					valorstr := fmt.Sprintf("%s", contenido)
					colassoc[col] = strings.Trim(valorstr, " ")
				case reflect.String:
					colassoc[col] = evalreflect.String()
				case reflect.Float32:
					colassoc[col] = evalreflect.Float()
				case reflect.Float64:
					colassoc[col] = evalreflect.Float()
				case reflect.Int32:
					colassoc[col] = evalreflect.Int()
				case reflect.Int64:
					colassoc[col] = evalreflect.Int()
				}
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

	jSon, err = json.Marshal(lista)

	err = actualizarEstatusAPI(C.ApiCore.Funcion, estatus)
	go C.cargarCache(util.GenerarMD5(consulta), jSon)

	return
}
