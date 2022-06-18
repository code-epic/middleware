// PDF es un formato de almacenamiento para documentos
// digitales independientes de plataformas de software
// o hardware. Este formato es de tipo compuesto
package pdf

import (
	"bytes"

	"github.com/dslipak/pdf"
)

//Leer Ruta del archivo PDF
func Leer(ruta string) (contenido []byte, err error) {
	var buf bytes.Buffer

	f, err := pdf.Open(ruta)
	b, err := f.GetPlainText()
	buf.ReadFrom(b)
	contenido = []byte(buf.String())
	return
}
