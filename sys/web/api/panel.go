package api

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/code-epic/middleware/mdl/core"
	"github.com/code-epic/middleware/sys"
	"github.com/code-epic/middleware/util"
	"github.com/code-epic/middleware/util/webscraper"
	"github.com/gorilla/mux"
)

//WPanel Panel de control
type WPanel struct {
	Ruta      string      `json:"ruta"`
	Archivo   string      `json:"archivo"`
	Modulo    string      `json:"modulo"`
	Comando   string      `json:"cmd"`
	Script    string      `json:"script"`
	Flags     string      `json:"flag"`
	Ip        string      `json:"ip"`
	Coleccion string      `json:"coleccion"`
	Obj       interface{} `json:"objeto"`
}

//ListarModulos una interfaz blanca
func (wp *WPanel) ListarModulos(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)

	var directorio util.Directorio
	err := directorio.Listar("./public_web/www/ipostel/inc", true)

	if err == nil {
		j, _ := json.Marshal(directorio.Listado)
		w.WriteHeader(http.StatusOK)
		w.Write(j)
	} else {
		w.WriteHeader(http.StatusForbidden)
		w.Write([]byte("Error en la lista de archivos"))

	}
}

//ListarArchivos una interfaz blanca
func (wp *WPanel) ListarArchivos(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	var directorio util.Directorio
	var codigo = mux.Vars(r)

	directorio.Listar("./public_web/www/ipostel/inc/"+codigo["id"], false)
	j, _ := json.Marshal(directorio.Listado)
	w.WriteHeader(http.StatusOK)
	w.Write(j)
}

//ProcesarHTML una interfaz blanca
func (wp *WPanel) ProcesarHTML(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	var Ws webscraper.WebScraping
	e := json.NewDecoder(r.Body).Decode(&wp)
	if e == nil {
		Ws.Ruta = "./public_web/www/ipostel/inc/" + wp.Modulo + "/" + wp.Archivo
		err := Ws.Leer()
		if err != nil {
			fmt.Println("Error. ", err.Error())
		}
		j := Ws.Ver()
		w.WriteHeader(http.StatusOK)
		w.Write(j)
	} else {

		w.WriteHeader(http.StatusForbidden)
		w.Write([]byte("Error al procesar archivos"))
	}

}

//GenerarAPIHTML una interfaz blanca
func (wp *WPanel) GenerarAPIHTML(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)

	var ws webscraper.WebScraping
	e := json.NewDecoder(r.Body).Decode(&ws)
	if e == nil {

	}
	ws.Ruta = "./public_web/www/ipostel/inc/" + wp.Modulo + "/" + wp.Archivo
	err := ws.Leer()
	if err != nil {
		fmt.Println("Error. ", err.Error())
	}
	j := ws.Generar()
	w.WriteHeader(http.StatusOK)
	w.Write(j)
}

//ListarColecciones una interfaz blanca
func (wp *WPanel) ListarColecciones(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	var cr core.Core
	var coleccion = mux.Vars(r)
	j, _ := cr.CrearNOSQL(coleccion["id"], "{}", sys.MongoDB)
	w.WriteHeader(http.StatusOK)
	w.Write(j)
}

//CrearColeccion una interfaz blanca
func (wp *WPanel) CrearColeccion(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	var cr core.Core
	e := json.NewDecoder(r.Body).Decode(&wp)

	fmt.Println(wp)
	util.Error(e)
	j, _ := cr.InsertNOSQL(wp.Coleccion, wp.Obj)
	w.WriteHeader(http.StatusOK)
	w.Write(j)
}

//Sh una interfaz blanca para ejecutar comando del sistema operativo
func (wp *WPanel) Sh(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	e := json.NewDecoder(r.Body).Decode(&wp)
	fmt.Println("Entrando en la funcion")
	if e != nil {

		fmt.Println("Err. ", e.Error())
	}

	j, _ := util.Sh(wp.Script, wp.Flags, wp.Ip)
	w.WriteHeader(http.StatusOK)
	w.Write(j)
}

//Drivers una interfaz blanca para ejecutar comando del sistema operativo
func (wp *WPanel) Drivers(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	j, _ := json.Marshal(sys.DRIVERS)
	w.WriteHeader(http.StatusOK)
	w.Write(j)
}

//Conexiones una interfaz blanca para ejecutar comando del sistema operativo
func (wp *WPanel) WConexiones(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	j, _ := json.Marshal(sys.Conexiones)
	w.WriteHeader(http.StatusOK)
	w.Write(j)
}

//PruebaConexion Verificar Driver de conexion
func (wp *WPanel) EvaluarConexion(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	var M util.Mensajes
	var conn sys.Config
	var c sys.CadenaDeConexion
	estatus := http.StatusOK
	e := json.NewDecoder(r.Body).Decode(&c)
	util.Error(e)
	e = conn.EvaluarConexionesDinamicas(c)
	M.Tipo = 1
	if e != nil {
		M.Tipo = 0
		M.Msj = e.Error()
		estatus = http.StatusForbidden
	} else {
		M.Msj = "Evaluación exitosa: " + c.Host + "@" + c.Basedatos
	}
	j, _ := json.Marshal(M)
	w.WriteHeader(estatus)
	w.Write(j)
}

//PruebaConexion Verificar Driver de conexion
func (wp *WPanel) EstablecerConexion(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	var M util.Mensajes
	var conn sys.Config
	var c sys.CadenaDeConexion
	estatus := http.StatusOK

	e := json.NewDecoder(r.Body).Decode(&c)
	util.Error(e)
	valor := conn.ConexionesDinamicas(c)
	M.Tipo = 1
	if sys.SQLTODO[c.ID].Error != nil {
		M.Tipo = 0
		M.Msj = sys.SQLTODO[c.ID].Error.Error()
		estatus = http.StatusForbidden
	} else {
		if valor {
			M.Msj = "Se estableció la conexion : " + c.ID + "@" + sys.SQLTODO[c.ID].Nombre
		} else {
			M.Msj = "No se logro establecer conexión..."
			estatus = http.StatusForbidden
		}
	}
	j, _ := json.Marshal(M)
	w.WriteHeader(estatus)
	w.Write(j)
}

//EvaluarPuenteURL permite evaluar conexiones de Direcciones como URL
func (wp *WPanel) EvaluarPuenteURL(w http.ResponseWriter, r *http.Request) {
	var M util.Mensajes
	estatus := http.StatusOK
	direccion := r.URL.Query().Get("id")

	_, err := http.Get(direccion)
	M.Tipo = 1
	M.Msj = "Se estableció la conexion con @" + direccion
	if err != nil {
		M.Msj = "Fallo la conexion con @" + direccion
		sys.CacheLog.Println("Fallo la conexion con @" + direccion)
		M.Tipo = 1
		estatus = http.StatusForbidden
	}
	j, _ := json.Marshal(M)
	w.WriteHeader(estatus)
	w.Write(j)
}

//ObtenerImagenWeb Permite descargar imagenes mediante protocolo de seguridad JWT
func (wp *WPanel) ObtenerImagenWeb(w http.ResponseWriter, r *http.Request) {
	id := r.URL.Query().Get("id")
	reqImg, err := http.Get("http://www.google.com/intl/en_com/images/srpr/logo3w.png?id=" + id)
	if err != nil {
		fmt.Fprintf(w, "Error %d", err)
		return
	}
	buffer := make([]byte, reqImg.ContentLength)
	reqImg.Body.Read(buffer)
	w.Header().Set("Content-Length", fmt.Sprint(reqImg.ContentLength)) /* value: 7007 */
	w.Header().Set("Content-Type", reqImg.Header.Get("Content-Type"))  /* value: image/png */
	w.WriteHeader(http.StatusOK)
	w.Write(buffer)
}
