package core

import (
	"encoding/json"
	"fmt"
	"reflect"
	"strconv"
	"strings"

	"github.com/code-epic/middleware/util"
)

const (
	_VALOR   string = "$values"
	_ASIGNAR string = "$set"
	_DONDE   string = "$where"
)

type SQLGen struct {
	Dml *Dml
}

func (S *SQLGen) Ejecutar(C *Core) (cadena string, err error) {
	var valores map[string]interface{} //estructura
	var e []Entradas                   //entrada de datos
	err = json.Unmarshal([]byte(fmt.Sprint(C.Valores)), &valores)
	util.Error(err)
	err = json.Unmarshal([]byte(fmt.Sprint(C.Entradas)), &e)
	util.Error(err)

	switch C.Metodo {
	case "INSERTAR":
		S.Dml.Nombre = _VALOR
		S.Dml.Definir()
		S.Insertar(S.Dml.Entrada, valores, C.Query)
		break
	case "ACTUALIZAR":
		S.Actualizar(valores, C.Query, e)
		break
	}
	return
}

func (S *SQLGen) Insertar(esquema []Entrada, valores map[string]interface{}, consulta string) (cadena string) {

	entrada, insercion, coma := "", "", ""

	for k, v := range esquema {
		if k > 0 {
			coma = ","
		}
		contenido := S.EvaluarDato(S.Dml.ObtenerElementos(v.Alias, valores))
		entrada += coma + v.Campo
		insercion += coma + contenido
	}
	cadena = `(` + entrada + `) VALUES ( ` + insercion + ` )`
	return strings.Replace(consulta, _VALOR, cadena, -1)

}

func (S *SQLGen) Actualizar(objeto map[string]interface{}, consulta string, entradas []Entradas) (cadena string) {

	where, set, xcoma := "", "", ""
	i := 0
	//SET metodo de valores
	for k, v := range objeto {
		if i > 0 {
			xcoma = ","
		}
		fmt.Println(where, k, xcoma, v)
		i++
	}
	cadena = `SET ` + set + ` WHERE ` + where
	return
}

func (S *SQLGen) EvaluarDato(v interface{}) (valores string) {

	evalreflect := reflect.ValueOf(v)

	switch evalreflect.Kind() {
	case reflect.String:
		valorstr := fmt.Sprintf("%s", v)
		valores = util.Utf8_decode(strings.Trim(valorstr, " "))
	case reflect.Slice:
		valorstr := fmt.Sprintf("%s", v)
		valores = strings.Trim(valorstr, " ")
	case reflect.Float32:
		f := evalreflect.Float()
		valores = strconv.FormatFloat(f, 'f', 2, 64)
	case reflect.Float64:
		f := evalreflect.Float()
		valores = strconv.FormatFloat(f, 'f', 2, 64)
	case reflect.Int32:
		n := evalreflect.Int()
		valores = strconv.FormatInt(n, 10)
	case reflect.Int64:
		n := evalreflect.Int()
		valores = strconv.FormatInt(n, 10)
	}
	return

}
