package core

import (
	"fmt"

	"go.mongodb.org/mongo-driver/bson/primitive"
)

//Core Ejecucion
type Core struct {
	Sistema  string
	Consulta string
	Ruta     string
	Autor    string
	ApiCore
}

//Oficina Describe una oficinas
type Oficina struct {
	ID            string `json:"id"`
	CodigoOficina string `json:"codigo"`
	Descripcion   string `json:"descripcion"`
}

//ApiCore Estructura de conexion
type ApiCore struct {
	ID           primitive.ObjectID `json:"id" bson:"_id"`
	Modulo       string             `json:"modulo"`
	Driver       string             `json:"driver"`
	Tipo         string             `json:"tipo"`
	Coleccion    string             `json:"coleccion"`
	Query        string             `json:"query"`
	Parametros   string             `json:"parametros"`
	Ruta         string             `json:"ruta"`
	Funcion      string             `json:"funcion"`
	Retorna      bool               `json:"retorna"`
	Concurrencia bool               `json:"concurrencia"`
	Migrar       bool               `json:"migrar"`
	Metodo       string             `json:"metodo"`
	Destino      string             `json:"destino"`
	PuertoHttp   int                `json:"puertohttp"`
	PuertoHttps  int                `json:"puertohttps"`
	Protocolo    string             `json:"protocolo"`
	Prioridad    string             `json:"prioridad"`
	Entorno      string             `json:"entorno"`
	Estatus      bool               `json:"estatus" bson:"estatus,omitempty"`
	Relacional   bool               `json:"relacional"`
	Valores      interface{}        `json:"valores" bson:"valores,omitempty"`
	Logs         bool               `json:"logs"`
	Cache        int                `json:"cache"`
	Descripcion  string             `json:"descripcion"`
}

//Object Objeto para reflexiones
type Object map[string]interface{}

//OperarConsulta Control de resultados
func (C *Core) OperarConsulta(v map[string]interface{}) (jSon []byte, err error) {

	jSon, err = C.CrearQuery(v)
	return
}

//Asignar valores y operaciones
func (C *Core) Asignar(v map[string]interface{}) (jSon []byte, err error) {
	var api ApiCore
	var Valores = false

	for k, vs := range v {
		switch k {
		case "relacional":
			if vs != nil {
				api.Relacional = vs.(bool)
			}
			break
		case "valores":
			if vs != nil {
				api.Valores = vs.(interface{})
				Valores = true
			}
			break
		case "coleccion":
			if vs != nil {
				api.Coleccion = vs.(string)
			}
			break
		case "query":
			if vs != nil {
				api.Query = vs.(string)
			}
			break
		case "tipo":
			if vs != nil {
				api.Tipo = vs.(string)
			}
			break
		}

	}

	if Valores == true {
		fmt.Println("Valor ", api.Valores)
		jSon, err = C.InsertNOSQL(api.Coleccion, api.Valores)
	} else {
		jSon, err = C.OperarConsulta(v)
	}
	return
}
