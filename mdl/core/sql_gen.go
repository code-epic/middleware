package core

import (
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

func (S *SQLGen) Insertar(objeto map[string]interface{}, consulta string, entradas []Entradas) (cadena string) {

	entrada, insercion, coma := "", "", ""
	i := 0
	for k, v := range objeto {
		if i > 0 {
			coma = ","
		}
		xelemento, xvalor := buscarParametro(entradas, k, S.EvaluarDato(v))
		entrada += coma + xelemento
		insercion += coma + xvalor
		i++
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
