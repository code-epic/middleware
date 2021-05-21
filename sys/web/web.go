package web

import (
	"fmt"
	"net/http"

	"github.com/code-epic/middleware/sys/web/api"
	"github.com/fatih/color"
	"github.com/gorilla/mux"
)

const vAPI string = "/v1/api/"

var (
	//Enrutador de API
	Enrutador = mux.NewRouter()

	wUsuario api.WUsuario
)

//Cargar los diferentes modulos del sistema
func Cargar() {
	CargarModulosPanel()
	CargarModulosWeb()
	CargarModulosSeguridad()

	WMAdminLTE()
	CargarModulosWebDevel()
}

//CargarModulosPanel Panel de Contencion
func CargarModulosPanel() {
	var wp api.WPanel
	fmt.Println("")
	fmt.Println("")
	fmt.Println("")
	FgBlue := color.New(color.FgBlue)
	BoldFgBlue := FgBlue.Add(color.Bold)
	BoldFgBlue.Println("..........................................................")
	BoldFgBlue.Println("...                                                       ")
	BoldFgBlue.Println("... Iniciando Carga de Elementos Para el Servidor Angular ")
	BoldFgBlue.Println("...              Módulos de Angular 11                    ")
	BoldFgBlue.Println("..........................................................")
	BoldFgBlue.Println("")
	prefixW := http.StripPrefix("/code-epic/", http.FileServer(http.Dir("public_web/panel/dist")))
	Enrutador.PathPrefix("/code-epic/").Handler(prefixW)

	Enrutador.HandleFunc(vAPI+"lmodulos", wUsuario.ValidarToken(wp.ListarModulos)).Methods("GET")
	Enrutador.HandleFunc(vAPI+"lmodulox", wp.ListarModulos).Methods("GET")                                        //Listar Modulos del sistema en la carpeta www/inc
	Enrutador.HandleFunc(vAPI+"larchivos/{id}", wUsuario.ValidarToken(wp.ListarArchivos)).Methods("GET")          //Listar archivos dentro del modulo de los inc
	Enrutador.HandleFunc(vAPI+"phtml", wUsuario.ValidarToken(wp.ProcesarHTML)).Methods("POST")                    //Procesar archivos html a scripts
	Enrutador.HandleFunc(vAPI+"gapihtml", wUsuario.ValidarToken(wp.GenerarAPIHTML)).Methods("POST")               //Procesar archivos html a scripts
	Enrutador.HandleFunc(vAPI+"ccoleccion", wUsuario.ValidarToken(wp.CrearColeccion)).Methods("POST")             //Crear Conexion
	Enrutador.HandleFunc(vAPI+"lcoleccion/{id}", wUsuario.ValidarToken(wp.ListarColecciones)).Methods("GET")      //Listar conexiones
	Enrutador.HandleFunc(vAPI+"sh", wUsuario.ValidarToken(wp.Sh)).Methods("POST")                                 //Ejecutar Script
	Enrutador.HandleFunc(vAPI+"drivers", wUsuario.ValidarToken(wp.Drivers)).Methods("GET")                        //Listar Drivers desde sys/drivers.json
	Enrutador.HandleFunc(vAPI+"evaluarconexion", wUsuario.ValidarToken(wp.EvaluarConexion)).Methods("POST")       //Ejecutar Evaluacion de conexion
	Enrutador.HandleFunc(vAPI+"establecerconexion", wUsuario.ValidarToken(wp.EstablecerConexion)).Methods("POST") //Establecer conexiones
	Enrutador.HandleFunc(vAPI+"evaluarpuente", wUsuario.ValidarToken(wp.EvaluarPuenteURL)).Methods("POST")        //Ejecutar Evaluacion puente url

}

//WMAdminLTE OpenSource tema de panel de control Tecnología Bootstrap3
func WMAdminLTE() {

	Cyan := color.New(color.FgHiCyan)
	BoldCyan := Cyan.Add(color.Bold)
	BoldCyan.Println("")
	BoldCyan.Println("")
	BoldCyan.Println("..........................................................")
	BoldCyan.Println("...                                                       ")
	BoldCyan.Println("... Iniciando Carga de Elementos Para el Servidor WEB     ")
	BoldCyan.Println("...              Módulos de AdminLTE V 3.5                ")
	BoldCyan.Println("..........................................................")
	BoldCyan.Println("")

	prefix := http.StripPrefix("/app", http.FileServer(http.Dir("public_web/www")))
	Enrutador.PathPrefix("/app/").Handler(prefix)

}

//CargarModulosWeb Cargador de modulos web
func CargarModulosWeb() {

	var ap api.API
	Enrutador.HandleFunc("/", Principal)
	Enrutador.HandleFunc(vAPI+"crud/{id}", wUsuario.ValidarToken(ap.Consultar)).Methods("GET")

	Enrutador.HandleFunc(vAPI+"crud", wUsuario.ValidarToken(ap.Crud)).Methods("GET")
	Enrutador.HandleFunc(vAPI+"crud", wUsuario.ValidarToken(ap.Crud)).Methods("POST")
	Enrutador.HandleFunc(vAPI+"crud", wUsuario.ValidarToken(ap.Crud)).Methods("PUT")
	Enrutador.HandleFunc(vAPI+"crud", wUsuario.ValidarToken(ap.Crud)).Methods("DELETE")
	Enrutador.HandleFunc(vAPI+"crud", wUsuario.ValidarToken(ap.Crud)).Methods("OPTIONS")

	Enrutador.HandleFunc("/devel/api/crud", ap.Crud).Methods("GET")
	Enrutador.HandleFunc("/devel/api/crud", ap.Crud).Methods("POST")
	Enrutador.HandleFunc("/devel/api/crud", ap.Crud).Methods("PUT")
	Enrutador.HandleFunc("/devel/api/crud", ap.Crud).Methods("DELETE")
	Enrutador.HandleFunc("/devel/api/crud", ap.Crud).Methods("OPTIONS")

	Enrutador.HandleFunc(vAPI+"listar", wUsuario.ValidarToken(ap.Listar)).Methods("GET")
	Enrutador.HandleFunc("/devel/api/listar", ap.Listar).Methods("GET")

}

//Principal Página inicial del sistema o bienvenida
func Principal(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Bienvenidos al Bus Empresarial de Datos")
}

//CargarModulosSeguridad Y cifrado
func CargarModulosSeguridad() {

	Enrutador.HandleFunc(vAPI+"wusuario/login", wUsuario.Login).Methods("POST")
	Enrutador.HandleFunc(vAPI+"wusuario/login", wUsuario.Opciones).Methods("OPTIONS")

	Enrutador.HandleFunc(vAPI+"wusuario/validar", wUsuario.ValidarToken(wUsuario.Autorizado)).Methods("POST")
	Enrutador.HandleFunc(vAPI+"wusuario/listar", wUsuario.ValidarToken(wUsuario.Listar)).Methods("GET")

	Enrutador.HandleFunc(vAPI+"wusuario", wUsuario.Crear).Methods("POST")
	Enrutador.HandleFunc(vAPI+"wusuario", wUsuario.ValidarToken(wUsuario.CambiarClave)).Methods("PUT")
	Enrutador.HandleFunc(vAPI+"wusuario", wUsuario.ValidarToken(wUsuario.Opciones)).Methods("OPTIONS")

	Enrutador.HandleFunc(vAPI+"wusuario", wUsuario.ValidarToken(wUsuario.Crear)).Methods("POST")
	Enrutador.HandleFunc(vAPI+"wusuario", wUsuario.ValidarToken(wUsuario.CambiarClave)).Methods("PUT")
	Enrutador.HandleFunc(vAPI+"wusuario", wUsuario.ValidarToken(wUsuario.Opciones)).Methods("OPTIONS")
	Enrutador.HandleFunc(vAPI+"wusuario/listar", wUsuario.ValidarToken(wUsuario.Listar)).Methods("GET")

}

//CargarModulosWebDevel Cargador de modulos web
func CargarModulosWebDevel() {

}
