//complilador
package compilador

import "github.com/novalagung/golpal"

type Compilador struct {
	Codigo string `json:"codigo"`
}

//Eval La funcion evalua la expresion de una cadena y
//la ejecuta como parte del codigo
func (C *Compilador) Eval(codigo string) string {
	out, err := golpal.New().ExecuteRaw(codigo)
	if err != nil {
		return "error"
	}
	return out
}

//Ejecutar permite realizar la ejecucion de
func (C *Compilador) Ejecutar() {

}
