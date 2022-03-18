package workflow

//Estado Los estados se representan como el lugar que ocupa un documento
//o vértices, etiquetados con su nombre en el interior.
type Estado struct {
	Id          string
	Nombre      string
	Descripcion string
}
