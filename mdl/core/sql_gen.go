package core

import "strings"

const (
	_VALUES string = "$values"
	_SET    string = "$set"
	_WHERE  string = "$where"
)

type SQLGen struct {
}

func (S *SQLGen) Insertar(objeto map[string]interface{}, consulta string, entradas []Entradas) (cadena string) {

	entrada, insercion, coma := "", "", ""
	i := 0
	for k, v := range objeto {
		if i > 0 {
			coma = ","
		}
		xelemento, xvalor := buscarParametro(entradas, k, evaluarTipoDeDatos(v), _VALUES)
		entrada += coma + xelemento
		insercion += coma + xvalor
		i++
	}
	cadena = `(` + entrada + `) VALUES ( ` + insercion + ` )`
	return strings.Replace(consulta, _VALUES, cadena, -1)

}

func (S *SQLGen) Actualizar(objeto map[string]interface{}, consulta string, entradas []Entradas) (cadena string) {
	return
}
