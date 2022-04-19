package core

type Dml struct {
	Nombre      string
	Accion      string
	Campos      interface{}
	LstEntradas []Entradas
	Entrada     []Entrada //Lista de Entrada de Datos por detalles
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
func (D *Dml) ObtenerElementos(alias string, valores map[string]interface{}) (contenido interface{}) {
	for k, v := range valores {
		if k == alias {
			contenido = v
		}

	}
	return

}
