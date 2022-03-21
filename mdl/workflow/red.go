package workflow

import "time"

//Red el término se utiliza para definir a una estructura que cuenta
//con un patrón característico. Existen múltiples tipos de red,
//como la red informática, la red eléctrica y la red social.
type Red struct {
	EstadoOrigen  string
	Transicion    string
	EstadoDestino string
	Fecha         time.Time
	Usuario       string
}

//Iniciar una red de Documentos
func (rd *Red) Iniciar() {}

//Obtener los valores de una MEF
func (rd *Red) Obtener() {}

//Evaluar el tipo de MEF
func (rd *Red) Evaluar() {}
