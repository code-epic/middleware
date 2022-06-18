package motor

import (
	"fmt"
)

type Motor struct {
	Salarios Salarios
	Peticion Peticion `json:"peticion"`
}

//Validar las solicitudes actuando como un interceptor
type Validar struct {
	Peticion   Peticion
	Certificar interface{}
	Cifrar     interface{}
}

type Peticion struct {
	Parametros string      `json:"parametros"`
	Huella     interface{} `json:"huella"`
}

func (M *Motor) Ejecutar() (jSon []byte, err error) {

	fmt.Println("Ejecutando valores de conexion")

	return
}

func inferencia(tipo int) {

	switch tipo {
	case 1:
		fmt.Println("Control de datos ")
	}
}
