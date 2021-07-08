package core

import (
	"strconv"
	"strings"

	"github.com/code-epic/middleware/sys"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

//Core Ejecucion
type Core struct {
	Sistema  string `json:"sistema"`
	Consulta string `json:"consulta"`
	Ruta     string `json:"ruta"`
	Autor    string `json:"autor"`
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
	Resultado    interface{}        `json:"resultado"`
}

//Object Objeto para reflexiones
type Object map[string]interface{}

//Asignar valores y operaciones
func (C *Core) Asignar(v map[string]interface{}) (jSon []byte, err error) {
	var api ApiCore
	var Valores = false

	for k, vs := range v {

		if vs != nil {
			switch k {
			case "relacional":
				api.Relacional = vs.(bool)
			case "valores":
				api.Valores = vs.(interface{})
				Valores = true
			case "coleccion":
				api.Coleccion = vs.(string)
			case "query":
				api.Query = vs.(string)
			case "tipo":
				api.Tipo = vs.(string)
			}

		}
	}

	if Valores {
		jSon, err = C.InsertNOSQL(api.Coleccion, api.Valores)
	} else {
		jSon, err = C.OperarConsulta(v)
	}
	return
}

//OperarConsulta Control de resultados
func (C *Core) OperarConsulta(v map[string]interface{}) (jSon []byte, err error) {

	jSon, err = C.CrearQuery(v)
	return
}

//actualizarEstatusAPI
func actualizarEstatusAPI(fn string, estatus bool) (err error) {

	c := sys.MongoDB.Collection(sys.APICORE)
	filtrar := bson.M{"funcion": bson.M{"$eq": fn}}
	actualizar := bson.M{"$set": bson.M{"estatus": estatus}}
	_, err = c.UpdateOne(
		sys.Contexto,
		filtrar,
		actualizar,
	)
	return
}

func parsearParametros(parametros string, consulta string) (cadena string) {
	valores := strings.Split(parametros, ",")
	cantidad := len(valores)
	for i := 0; i < cantidad; i++ {
		svalor := valores[i]
		pos := "$" + strconv.Itoa(i)
		cadena = strings.Replace(consulta, pos, svalor, -1)
	}
	return
}
