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

//IUDQuery Insert, Update, Delete Generador de Consultas
func (C *Core) IUDQuery(consulta string, conexion *sql.DB, tipo int64) (jSon []byte, err error) {
	var M util.Mensajes
	rs, err := conexion.Exec(consulta)
	M.Fecha = time.Now()
	if err != nil {
		M.Msj = "Error ejecutando consulta: " + err.Error()
		M.Tipo = 0
		sys.QueryLog.Println("Core.IUDQuery : ", consulta, err.Error())
	} else if tipo == 0 {
		id, _ := rs.LastInsertId()
		M.Msj = strconv.FormatInt(id, 10)
		M.Tipo = 1
	} else {
		id, _ := rs.RowsAffected()
		M.Msj = "Filas afectadas, " + strconv.FormatInt(id, 10)
		M.Tipo = 2

	}

	jSon, err = json.Marshal(M)
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
			case reflect.Slice:
				valorstr := fmt.Sprintf("%s", v)
				valores += comax + "'" + strings.Trim(valorstr, " ") + "'"
			case reflect.Float32:
				f := evalreflect.Float()
				valores += comax + strconv.FormatFloat(f, 'f', 2, 64)
			case reflect.Float64:
				f := evalreflect.Float()
				valores += comax + strconv.FormatFloat(f, 'f', 2, 64)
			case reflect.Int32:
				n := evalreflect.Int()
				valores += comax + strconv.FormatInt(n, 10)
			case reflect.Int64:
				n := evalreflect.Int()
				valores += comax + strconv.FormatInt(n, 10)
			}

			j++
		}
		j = 0
		valores += ")"
		campos += ")"
		insert += campos + " VALUES " + valores + ";"
		db := sys.SQLTODO["PGODB"].DB
		_, err = db.Exec(insert)
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
	}
	return

}
