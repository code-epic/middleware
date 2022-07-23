//Aprendizaje Automatizado
package aa

import (
	"database/sql"
	"fmt"
	"os"
	"strings"

	"github.com/code-epic/middleware/sys"
	"github.com/code-epic/middleware/util"
)

var (
	db      *sql.DB
	estatus bool
)

type Neurona struct {
	ID           string
	Conocimiento string
}

type AA struct {
	Memoria []Neurona
}

func (ml *AA) Iniciar() {

}

func (ml *AA) Aprender(patron string, conocimiento string) bool {
	fmt.Println("Guardar recuerdo... ", conocimiento, " ", patron)
	return true
}

func (ml *AA) Recordar(patron string) {

}

func (ml *AA) Entrenar() {

}

func (ml *AA) Predecir() {

}

func (ml *AA) Analizar() {
	consulta := `SELECT titu, sonido FROM ( SELECT titu, COUNT(titu), SOUNDEX(titu) sonido FROM MD_000_CGenral WHERE titu IS NOT Null GROUP BY titu) AS tb ORDER BY tb.sonido;`

	if sys.SQLTODO["MPPD"].Estatus {
		fmt.Println("Conexion entrante")
		drv := sys.SQLTODO["MPPD"]
		db = drv.DB
		estatus = true
	} else {
		fmt.Println("No exite el driver")
		return
	}

	row, err := db.Query(consulta)
	if err != nil {

		fmt.Println("Entrando en los datos", err.Error())
		return

	}

	file, err := os.Create("./tmp/ml/aa.sdr")
	if err != nil {
		fmt.Println("fallamos creando archivo")
		return

	}
	defer file.Close()
	registros := ""
	for row.Next() {
		var titulo, sonido sql.NullString

		row.Scan(&titulo, &sonido)
		registros = picar(util.ValidarNullString(titulo), util.ValidarNullString(sonido))
		fmt.Fprintf(file, registros)
	}

	fmt.Println("Proceso de indexacion finalizado")

}

func picar(cadena string, sonido string) (registros string) {

	palabras := strings.Split(cadena, " ")
	for i := 0; i < len(palabras); i++ {
		//registros += palabras[i] + "\n"
		registros += palabras[i] + ";" + sonido + "\n"
	}
	return
}
