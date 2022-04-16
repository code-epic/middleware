package core

type Dml struct {
	Nombre string
	Tipo   string
	Accion string
	Campos interface{}

	Entrada     []Entrada //Lista de Entrada de Datos por detalles
	LstEntradas []Entradas
	Salidas     interface{}

	Valores interface{}
}

//Definir el modelo de datos que obtener
//$values Valores por Insert
//$set, $where Update Set y Where
func (D *Dml) Definir() {
	for _, v := range D.LstEntradas {
		if v.Dml == D.Nombre {
			D.Entrada = v.Lista
		}
	}
}

//ObtenerElemento del modelo de datos
func (D *Dml) ObetenerElemen(elemento string, valor string) (campo string, contenido string) {
	for _, v := range D.Entrada {
		if v.Alias == elemento && v.Campo != "" {
			campo = v.Campo
			contenido = evaluarEntradas(v.Tipo, valor)
		}
	}
	return

}
