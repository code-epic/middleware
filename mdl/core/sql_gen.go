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
	VALOR    string = "$values"
	ASIGNAR  string = "$set"
	DONDE    string = "$where"
	EJECUTAR string = "$exec"
)

type SQLGen struct {
	Dml     Dml
	valores map[string]interface{} //estructura

}

func (S *SQLGen) Ejecutar(C *Core) (cadena string, err error) {
	err = json.Unmarshal([]byte(fmt.Sprint(C.Valores)), &S.valores)
	util.Error(err)
	err = json.Unmarshal([]byte(fmt.Sprint(C.Entradas)), &S.Dml.LstEntradas)
	util.Error(err)

	switch C.Metodo {
	case "INSERTAR":
		cadena = S.Insertar(C.Query)
	case "ACTUALIZAR":
		cadena = S.Actualizar(C.Query)
	case "ElIMINAR":
		cadena = S.Eliminar(C.Query)
	}
	return
}

func (S *SQLGen) Insertar(consulta string) (cadena string) {

	entrada, insercion, coma := "", "", ""

	S.Dml.Nombre = VALOR
	S.Dml.Definir()
	for k, v := range S.Dml.Entrada {
		if k > 0 {
			coma = ","
		}
		contenido := S.ValidarEntrada(v.Tipo, S.EvaluarDato(S.Dml.ObtenerElementos(v.Alias, S.valores)))
		entrada += coma + v.Campo
		insercion += coma + contenido
	}
	cadena = `(` + entrada + `) VALUES ( ` + insercion + ` )`
	return strings.Replace(consulta, EJECUTAR, cadena, -1)

}

func (S *SQLGen) Actualizar(consulta string) (cadena string) {

	where, set, coma := "", "", ""
	S.Dml.Nombre = ASIGNAR
	S.Dml.Definir()
	//SET metodo de valores
	for k, v := range S.Dml.Entrada {
		if k > 0 {
			coma = ","
		}
		contenido := S.ValidarEntrada(v.Tipo, S.EvaluarDato(S.Dml.ObtenerElementos(v.Alias, S.valores)))
		set += coma + v.Campo + "=" + contenido
	}

	//WHERE metodo de valore
	condicion := ""
	S.Dml.Nombre = DONDE
	S.Dml.Definir()
	count := len(S.Dml.Entrada)
	for k, v := range S.Dml.Entrada {
		if k > 0 {
			condicion = " AND "
		}
		contenido := S.ValidarEntrada(v.Tipo, S.EvaluarDato(S.Dml.ObtenerElementos(v.Alias, S.valores)))
		where += condicion + v.Campo + "=" + contenido
	}
	if count > 0 {
		where = ` WHERE ` + where
	} else {
		where = ""
	}
	cadena = ` SET ` + set + where
	return strings.Replace(consulta, EJECUTAR, cadena, -1)

}

func (S *SQLGen) Eliminar(consulta string) (cadena string) {

	where := ""

	//WHERE metodo de valore
	condicion := ""
	S.Dml.Nombre = DONDE
	S.Dml.Definir()
	count := len(S.Dml.Entrada)
	fmt.Println("Cantidad de elementos del where ", count)
	for k, v := range S.Dml.Entrada {
		if k > 0 {
			condicion = " AND "
		}
		contenido := S.ValidarEntrada(v.Tipo, S.EvaluarDato(S.Dml.ObtenerElementos(v.Alias, S.valores)))
		where += condicion + v.Campo + "=" + contenido
	}
	where = ""
	if count > 0 {
		where = ` WHERE ` + where
	}
	cadena = where
	return strings.Replace(consulta, EJECUTAR, cadena, -1)
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

func (S *SQLGen) ValidarEntrada(tipo string, valor string) (cadena string) {
	switch tipo {
	case "string":
		cadena = "'" + valor + "'"
	case "date":
		cadena = "'" + valor + "'"
	case "int":
		if valor == "" {
			cadena = "0"
		} else {
			cadena = valor
		}
	default:

		cadena = valor
	}
	return
}
