// Un archivos o ficheros informático es una secuencia de bytes
// almacenados en un dispositivo. Un archivo es identificado por
// un nombre y la descripción de la carpeta o directorio que lo
// contiene. A los archivos informáticos se les llama así porque
// son los equivalentes digitales de los archivos escritos en expedientes,
// tarjetas, libretas, papel o microfichas del entorno de oficina tradicional.
package archivos

type Archivos struct {
	Ruta            string
	Permisologia    string
	Certificacion   string
	PicarPorComodin string
}

// Arbrir documentos de formatos (txt, csv)
func (A *Archivos) Abrir() {}

// LeerTodo abre el documento por complento
func (A *Archivos) LeerTodo() {}

// LeerPorLineas recorre documentos linea por lineas aplicando split o parse
func (A *Archivos) LeerPorLineas() {}
