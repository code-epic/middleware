package webscraper

import (
	"encoding/binary"
	"encoding/json"
	"fmt"
	"io"
	"os"
	"strings"
	"time"

	"go.mongodb.org/mongo-driver/bson/primitive"

	"github.com/PuerkitoBio/goquery"
	"github.com/code-epic/middleware/mdl/core"
	"github.com/code-epic/middleware/sys"
	"github.com/code-epic/middleware/util"
	"go.mongodb.org/mongo-driver/mongo"
)

//CodigoFuente permite crear archivos ts, js
type CodigoFuente struct {
	Nombre         string   `json:"nombre"`
	Coleccion      string   `json:"coleccion"`
	Goblal         string   `json:"global"`
	Constructor    string   `json:"constructor"`
	Obtener        string   `json:"obtener"`
	Cargar         string   `json:"cargar"`
	Limpiar        string   `json:"limpiar"`
	Crear          string   `json:"crear"`
	Items          []string `json:"Items"`
	TypeScript     string   `json:"ts"`
	JavaScript     string   `json:"js"`
	ClavePrincipal string   `json:"claveprincipal"`
}

//WebScraping Herramienta que permite leer codigo fuente html para obtener id
type WebScraping struct {
	Ruta          string `json:"ruta"`
	Modulo        string `json:"modulo"`
	Directorio    string
	NombreArchivo string
	Archivo       io.Reader
	Items         []string `json:"Items"`
	Codigo        []CodigoFuente
	Duracion      util.TiempoProceso
	PesoOperacion string
	ApiCore       core.ApiCore `json:"ApiCore"`
	Parametros    interface{}
}

//Leer Archivos
func (W *WebScraping) Leer() (err error) {
	W.Archivo, err = os.Open(W.Ruta)
	W.obtener()
	//W.generar()
	return
}

//Obtener datos del archivo
func (W *WebScraping) obtener() error {
	W.Directorio, W.NombreArchivo = util.ArchivoSplit(W.Ruta)
	W.Duracion.Inicio = time.Now()
	doc, err := goquery.NewDocumentFromReader(W.Archivo)

	doc.Find("form").Each(func(i int, s *goquery.Selection) {
		var cf CodigoFuente
		cf.Nombre, _ = s.Attr("id")
		cf.Coleccion = "app-" + strings.ToLower(cf.Nombre)
		cf.Goblal, cf.Constructor, cf.Obtener, cf.Cargar, cf.Limpiar, cf.ClavePrincipal = W.elemento([]string{"input", "select"}, s)
		W.Codigo = append(W.Codigo, cf)
	})
	return err
}

func (W *WebScraping) elemento(element []string, doc *goquery.Selection) (cgbl string, ccon string, cobt string, ccarg string, climp string, clavePrincipal string) {
	cant := len(element)
	m := make(map[string]interface{}, 0)
	for i := 0; i < cant; i++ {
		doc.Find(element[i]).Each(func(i int, s *goquery.Selection) {
			atr, _ := s.Attr("id")
			atributo := strings.Split(atr, "_")
			valor := atributo[0]
			if len(atributo) > 1 {
				valor = atributo[1]
				clavePrincipal = strings.ToLower(valor)[3:]
			}
			a := strings.ToLower(valor)
			attr := seleccionarTipo(a[:3])

			W.Items = append(W.Items, a)

			m[a[3:]] = attr
			cgbl += "\t" + a[3:] + " : " + attr + "\n"

			ccon += "\t\t\t this." + a[3:] + " = \"\";\n"
			cobt += "\t\t\t this." + a[3:] + " = $(\"#" + valor + "\").val();\n"
			ccarg += "\t\t\t  $(\"#" + valor + "\").val(this." + a[3:] + ");\n"
			climp += "\t\t\t  $(\"#" + valor + "\").val(\"\");\n"
		})
		//W.Codigo = append(W.Codigo, cf)
	}
	js, _ := json.Marshal(m)
	W.Parametros = string(js)

	W.Duracion.Fin = time.Now()
	W.Duracion.Duracion = time.Since(W.Duracion.Inicio)

	return
}

func seleccionarTipo(prefijo string) (cadena string) {
	switch prefijo {
	case "cmb":
		cadena = "string"
		break
	case "boo":
		cadena = "boolean"
		break
	case "txt":
		cadena = "string"
		break
	case "num":
		cadena = "number"
		break
	case "chk":
		cadena = "number"
		break
	case "rdb":
		cadena = "boolean"
		break
	case "tms":
		cadena = "date"
		break
	default:
		cadena = "string"
		break
	}
	return cadena
}

//Ver datos del archivo
func (W *WebScraping) Ver() []byte {
	var lstC []string
	var M util.Traza

	for _, v := range W.Codigo {
		lstC = append(lstC, codigoClase(v))
		M.Mensaje = "ESB" + v.Nombre
	}
	j, _ := json.Marshal(lstC)
	M.Resultado = lstC
	M.Duracion.Inicio = W.Duracion.Inicio
	M.Duracion.Fin = W.Duracion.Fin
	M.Duracion.Duracion = W.Duracion.Duracion
	M.TextoDuracion = W.Duracion.Duracion.String()
	M.PesoOperacion = util.PesoHumano(binary.Size(j), 2)
	M.Opcional = W.Parametros
	k, _ := json.Marshal(M)
	return k
}

//Generar datos del archivo
func (W *WebScraping) Generar() []byte {
	var M util.Traza
	var arch util.Archivo
	var lstC []string
	var rs *mongo.InsertOneResult
	file := strings.Split(W.NombreArchivo, ".")

	ruta := "./public_web/www/js/" + file[0] + ".js"
	arch.Crear(ruta)

	for _, v := range W.Codigo {
		arch.Escribir(ruta, codigoClase(v))
		lstC = append(lstC, codigoClase(v))
		coleccion := "app-" + strings.ToLower(v.Nombre)
		W.ApiCore.Coleccion = coleccion

		W.ApiCore.Funcion = "CESB" + v.Nombre
		W.ApiCore.Query = ``
		W.ApiCore.Parametros = W.Parametros.(string)
		rs = generarCodigoCrud(W.ApiCore)

		W.ApiCore.Funcion = "RESB" + v.Nombre
		W.ApiCore.Query = `{"` + v.ClavePrincipal + `" : id }`
		W.ApiCore.Parametros = W.Parametros.(string)
		rs = generarCodigoCrud(W.ApiCore)

		W.ApiCore.Funcion = "LESB" + v.Nombre
		W.ApiCore.Query = `{"estatus": {$exists:true}}`
		W.ApiCore.Parametros = ""
		rs = generarCodigoCrud(W.ApiCore)

	}
	j, _ := json.Marshal(lstC)
	M.Resultado = lstC
	M.Mensaje = rs
	M.Duracion.Inicio = W.Duracion.Inicio
	M.Duracion.Fin = W.Duracion.Fin
	M.Duracion.Duracion = W.Duracion.Duracion

	M.PesoOperacion = util.PesoHumano(binary.Size(j), 2)
	k, _ := json.Marshal(M)
	return k
}

//GenerarCodigoCrud Metodos, Salvar y Actualizar
func generarCodigoCrud(api core.ApiCore) (rs *mongo.InsertOneResult) {
	api.ID = primitive.NewObjectID()
	api.Concurrencia = false
	api.Retorna = true
	api.Metodo = "POST"
	api.Protocolo = "HTTPS"
	api.PuertoHttps = 2286
	api.Logs = false
	api.Estatus = true

	c := sys.MongoDB.Collection(sys.APICORE)

	rs, err := c.InsertOne(sys.Contexto, api)
	if err != nil {
		fmt.Println("Error creando Query en Mongodb ", err.Error())
	}

	return

}
