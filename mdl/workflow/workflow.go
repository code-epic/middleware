package workflow

import "time"

//WorkFlow El término workflow significa “flujo de trabajo” y se
//utiliza para identificar el modelo digital de un proceso a través
//de su racionalización y división en diferentes actividades (tareas)
//con el objetivo de optimizar el rendimiento y hacer más
//eficiente el uso de los recursos.
type WorkFlow struct {
	Id     string    `json:"id"`
	Nombre string    `json:"nombre"`
	Fecha  time.Time `json:"fecha"`
}
