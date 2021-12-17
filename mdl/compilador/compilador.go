//complilador
package compilador

import (
	"github.com/code-epic/middleware/sys"
	"github.com/novalagung/golpal"
)

type Compilador struct {
	Codigo string `json:"codigo"`
}

//EvaluarGolang La funcion evalua la expresion de una cadena y
//la ejecuta como parte del codigo
func (C *Compilador) EvaluarGolang(codigo string, funcion string) (out string, err error) {
	if codigo != "" {
		out, err = golpal.New().ExecuteRaw(codigo)
		if err != nil {
			sys.SystemLog.Println("Error en la precompilacion funcion: "+funcion+" ", err)
			return "No se logro ejecutar el codigo desde la funcion ", err
		}

	}
	return
}

//Ejecutar permite realizar la ejecucion de
func (C *Compilador) Ejecutar() {

}
