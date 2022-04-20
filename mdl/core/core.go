package core

import (
	"fmt"
	"strconv"
	"strings"
	"time"

	"github.com/code-epic/middleware/sys"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

//Core Ejecucion
type Core struct {
	Sistema   string `json:"sistema"`
	Consulta  string `json:"consulta"`
	Ruta      string `json:"ruta"`
	Autor     string `json:"autor"`
	Resultado RS     `json:"Resultado"`
	ApiCore
}

//RS Establece la respuesta de la API
type RS struct {
	Cabecera []Definicion `json:"Cabecera"`
	Cuerpo   interface{}  `json:"Cuerpo"`
	Pie      interface{}  `json:"Pie"`
}

//Definicion Describe una oficinas
type Definicion struct {
	Nombre string `json:"nombre"`
	Tipo   string `json:"tipo"`
}

type Entrada struct {
	Campo   string `json:"campo"`
	Defecto string `json:"defecto"`
	Alias   string `json:"alias"`
	Tipo    string `json:"tipo"`
}
type Entradas struct {
	Dml       string    `json:"dml"` //Lenguaje de manipulacion de datos
	Condicion string    `json:"condicion"`
	Lista     []Entrada `json:"entradas"`
}

//ApiCore Estructura de conexion
type ApiCore struct {
	ID            primitive.ObjectID `json:"id" bson:"_id"`
	Modulo        string             `json:"modulo"`
	Driver        string             `json:"driver"`
	Tipo          string             `json:"tipo"`
	PreCodigo     string             `json:"precodigo"`
	Coleccion     string             `json:"coleccion"`
	Accion        string             `json:"accion"` //Define el origen para la accion de mongo update, find, delete
	Query         string             `json:"query"`
	Parametros    string             `json:"parametros"`
	Ruta          string             `json:"ruta"`
	Funcion       string             `json:"funcion"`
	Retorna       bool               `json:"retorna"`
	Concurrencia  bool               `json:"concurrencia"`
	Migrar        bool               `json:"migrar"`
	Metodo        string             `json:"metodo"`
	Destino       string             `json:"destino"`
	PuertoHttp    int                `json:"puertohttp"`
	PuertoHttps   int                `json:"puertohttps"`
	Protocolo     string             `json:"protocolo"`
	Prioridad     string             `json:"prioridad"`
	Entorno       string             `json:"entorno"`
	Estatus       bool               `json:"estatus" bson:"estatus,omitempty"`
	Relacional    bool               `json:"relacional"`
	Valores       interface{}        `json:"valores" bson:"valores,omitempty"`
	Logs          bool               `json:"logs"`
	Cache         int                `json:"cache"`
	Descripcion   string             `json:"descripcion"`
	Version       string             `json:"version"`
	Categoria     string             `json:"categoria"`
	Entradas      interface{}        `json:"entradas"`
	Salidas       interface{}        `json:"salidas"`
	Funcionalidad string             `json:"funcionalidad"`
	Resultado     interface{}        `json:"resultado"`
	Fecha         time.Time          `json:"fecha"`
	Autor         string             `json:"autor"`
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
			case "precodigo":
				api.PreCodigo = vs.(string)
			}

		}
	}

	if Valores && api.Coleccion != "" {
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

//actualizarEstatusAPI Identificar una API y cambiarle el estatus
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

//parsearApi evaluar parametros de una api
func (C *Core) ParsearApi() (cadena string, err error) {
	var sqlGen SQLGen
	//fmt.Println(api.Valores)
	if C.Valores != nil && fmt.Sprint(C.Valores) != "" && fmt.Sprint(C.Valores) != "map[]" {
		cadena, err = sqlGen.Ejecutar(C)
	} else {
		cadena = parsearParametros(C.Parametros, C.Query)
	}
	//fmt.Println(cadena)
	return
}

//parsearParametros evaluar parametros de la consultar y retornar una cadae con los reemplazos
func parsearParametros(parametros string, consulta string) (cadena string) {
	valores := strings.Split(parametros, ",")
	cantidad := len(valores)
	for i := 0; i < cantidad; i++ {
		svalor := valores[i]
		pos := "$" + strconv.Itoa(i)
		consulta = strings.Replace(consulta, pos, svalor, -1)
	}
	cadena = consulta
	return
}
