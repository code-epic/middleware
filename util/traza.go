package util

import (
	"time"
)

//Traza Historico del Usuario
type Traza struct {
	Usuario       string        `json:"usuario" bson:"usuario"`
	Time          time.Time     `json:"tiempo" bson:"tiempo"`
	Log           string        `json:"log" bson:"log"`
	Documento     string        `json:"documento" bson:"documento"`
	IP            string        `json:"ip" bson:"ip"`
	Base          string        `json:"base" bson:"base"`
	Mensaje       interface{}   `json:"msj" bson:"msj"`
	Resultado     interface{}   `json:"rs" bson:"rs"`
	Opcional      interface{}   `json:"opt" bson:"opt"`
	Duracion      TiempoProceso `json:"Duracion" bson:"Duracion"`
	TextoDuracion string        `json:"txtduracion" bson:"txtduracion"`
	PesoOperacion string        `json:"peso" bson:"peso"`
}

//Crear Trazabilidad
func (t *Traza) Crear() (err error) {

	return
}
