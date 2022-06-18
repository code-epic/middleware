package web

import (
	"fmt"
	"net/http"

	"github.com/code-epic/middleware/sys/web/api"
	"github.com/fatih/color"
	"github.com/gorilla/mux"
)

const vAPI string = "/v1/api/"
const vQua string = "/quality/api/"
const vDev string = "/devel/api/"

var (
	//Enrutador de API
	Enrutador = mux.NewRouter()
	wUsuario  api.WUsuario
)

//Cargar los diferentes modulos del sistema
func Cargar() {
	CargarModulosPanel()
	CargarModulosWeb()
	CargarModulosSeguridad()
	WMAdminLTE()
}

//CargarModulosPanel Panel de Contencion
func CargarModulosPanel() {
	var wp api.WPanel
	var Ambiente [3]string

	Ambiente[0] = vAPI
	Ambiente[1] = vDev
	Ambiente[2] = vQua

	color.Green("[+] Consola grafica activa -> public_web/panel/dist ")
	prefixW := http.StripPrefix("/consola", http.FileServer(http.Dir("public_web/panel/dist")))
	Enrutador.PathPrefix("/consola").Handler(prefixW)

	for i := 0; i < 3; i++ {
		vAmb := Ambiente[i]
		Enrutador.HandleFunc(vAmb+"lmodulos", wUsuario.ValidarToken(wp.ListarModulos)).Methods("GET")
		Enrutador.HandleFunc(vAmb+"larchivos/{id}", wUsuario.ValidarToken(wp.ListarArchivos)).Methods("GET")     //Listar archivos dentro del modulo de los inc
		Enrutador.HandleFunc(vAmb+"genqr/{id}", wp.GenQr).Methods("GET")                                         //Generar Qr metodo de validacion
		Enrutador.HandleFunc(vAmb+"phtml", wUsuario.ValidarToken(wp.ProcesarHTML)).Methods("POST")               //Procesar archivos html a scripts
		Enrutador.HandleFunc(vAmb+"gapihtml", wUsuario.ValidarToken(wp.GenerarAPIHTML)).Methods("POST")          //Procesar archivos html a scripts
		Enrutador.HandleFunc(vAmb+"ccoleccion", wUsuario.ValidarToken(wp.CrearColeccion)).Methods("POST")        //Crear Conexion
		Enrutador.HandleFunc(vAmb+"lcoleccion/{id}", wUsuario.ValidarToken(wp.ListarColecciones)).Methods("GET") //Listar conexiones
		Enrutador.HandleFunc(vAmb+"sh", wUsuario.ValidarToken(wp.Sh)).Methods("POST")                            //Ejecutar Script

		Enrutador.HandleFunc(vAmb+"drivers", wUsuario.ValidarToken(wp.Drivers)).Methods("GET")        //Listar Drivers desde sys/drivers.json
		Enrutador.HandleFunc(vAmb+"conexiones", wUsuario.ValidarToken(wp.WConexiones)).Methods("GET") //Listar Drivers desde sys/driver$s.json

		Enrutador.HandleFunc(vAmb+"evaluarconexion", wUsuario.ValidarToken(wp.EvaluarConexion)).Methods("POST")       //Ejecutar Evaluacion de conexion
		Enrutador.HandleFunc(vAmb+"establecerconexion", wUsuario.ValidarToken(wp.EstablecerConexion)).Methods("POST") //Establecer conexiones
		Enrutador.HandleFunc(vAmb+"evaluarpuente", wUsuario.ValidarToken(wp.EvaluarPuenteURL)).Methods("POST")        //Ejecutar Evaluacion puente url
		Enrutador.HandleFunc(vAmb+"subirarchivos", wUsuario.ValidarToken(wp.SubirArchivos)).Methods("POST")           //Subir Archivos al sistema
		Enrutador.HandleFunc(vAmb+"imgweb/{id}", wp.ObtenerImagenWeb).Methods("GET")                                  //Subir Archivos al sistema
		Enrutador.HandleFunc(vAmb+"dws/{id}/{doc}", wUsuario.ValidarToken(wp.ObtenerArchivoLocal)).Methods("GET")     //Subir Archivos al sistema
		Enrutador.HandleFunc(vAmb+"dw/{id}/{doc}", wp.ObtenerArchivoLocal).Methods("GET")                             //Subir Archivos al sistem
		Enrutador.HandleFunc(vAmb+"imgslocal/{id}", wp.ListarImagenLocal).Methods("GET")                              //Subir Archivos al sistema
	}
}

//WMAdminLTE OpenSource tema de panel de control Tecnología Bootstrap3
func WMAdminLTE() {
	color.Green("[+] Cargando elementos del servidor WEB -> public_web/www ")
	prefix := http.StripPrefix("/", http.FileServer(http.Dir("public_web/www")))
	Enrutador.PathPrefix("/").Handler(prefix)
}

//CargarModulosWeb Cargador de modulos web
func CargarModulosWeb() {
	var ap api.API

	//Produccion
	Enrutador.HandleFunc(vAPI+"crud:{id}", wUsuario.ValidarToken(ap.Crud)).Methods("GET")
	Enrutador.HandleFunc(vAPI+"crud:{id}", wUsuario.ValidarToken(ap.Crud)).Methods("POST")
	Enrutador.HandleFunc(vAPI+"crud:{id}", wUsuario.ValidarToken(ap.Crud)).Methods("PUT")
	Enrutador.HandleFunc(vAPI+"crud:{id}", wUsuario.ValidarToken(ap.Crud)).Methods("DELETE")
	Enrutador.HandleFunc(vAPI+"crud:{id}", wUsuario.ValidarToken(ap.Crud)).Methods("OPTIONS")
	Enrutador.HandleFunc(vAPI+"listar", wUsuario.ValidarToken(ap.Listar)).Methods("GET")

	Enrutador.HandleFunc(vAPI+"accion:{id}", wUsuario.ValidarTokenDinamico(ap.Crud)).Methods("POST")
	Enrutador.HandleFunc(vAPI+"accion:{id}", wUsuario.ValidarTokenDinamico(ap.Crud)).Methods("OPTIONS")
	//Calidad
	Enrutador.HandleFunc(vQua+"crud:{id}", ap.Crud).Methods("GET")
	Enrutador.HandleFunc(vQua+"crud:{id}", ap.Crud).Methods("POST")
	Enrutador.HandleFunc(vQua+"crud:{id}", ap.Crud).Methods("PUT")
	Enrutador.HandleFunc(vQua+"crud:{id}", ap.Crud).Methods("DELETE")
	Enrutador.HandleFunc(vQua+"crud:{id}", ap.Crud).Methods("OPTIONS")
	Enrutador.HandleFunc(vQua+"listar", ap.Listar).Methods("GET")

	//Desarrollo
	Enrutador.HandleFunc(vDev+"crud:{id}", ap.Crud).Methods("GET")
	Enrutador.HandleFunc(vDev+"crud:{id}", ap.Crud).Methods("POST")
	Enrutador.HandleFunc(vDev+"crud:{id}", ap.Crud).Methods("PUT")
	Enrutador.HandleFunc(vDev+"crud:{id}", ap.Crud).Methods("DELETE")
	Enrutador.HandleFunc(vDev+"crud:{id}", ap.Crud).Methods("OPTIONS")
	Enrutador.HandleFunc(vDev+"listar", ap.Listar).Methods("GET")

	Enrutador.HandleFunc(vDev+"accion:{id}", ap.Crud).Methods("POST")
	Enrutador.HandleFunc(vDev+"accion:{id}", ap.Crud).Methods("OPTIONS")
}

//Principal Página inicial del sistema o bienvenida
func Principal(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Bienvenidos al Bus Empresarial de Datos")
}

//CargarModulosSeguridad Y cifrado
func CargarModulosSeguridad() {

	Enrutador.HandleFunc(vAPI+"wusuario/login", wUsuario.Login).Methods("POST")
	Enrutador.HandleFunc(vAPI+"wusuario/login", wUsuario.Opciones).Methods("OPTIONS")

	Enrutador.HandleFunc(vAPI+"wusuario/access", wUsuario.Access).Methods("POST")
	Enrutador.HandleFunc(vAPI+"wusuario/access", wUsuario.Opciones).Methods("OPTIONS")

	Enrutador.HandleFunc(vAPI+"wusuario/validar", wUsuario.ValidarToken(wUsuario.Autorizado)).Methods("GET")
	Enrutador.HandleFunc(vAPI+"wusuario/listar", wUsuario.ValidarToken(wUsuario.Listar)).Methods("GET")

	Enrutador.HandleFunc(vAPI+"wusuario/obtenerjwt", wUsuario.Crear).Methods("POST")

	Enrutador.HandleFunc(vAPI+"wusuario/crear", wUsuario.ValidarToken(wUsuario.Crear)).Methods("POST")
	Enrutador.HandleFunc(vAPI+"wusuario/cambiarclave", wUsuario.ValidarToken(wUsuario.CambiarClave)).Methods("PUT")
	Enrutador.HandleFunc(vAPI+"wusuario/cambiarclave", wUsuario.ValidarToken(wUsuario.Opciones)).Methods("OPTIONS")

	Enrutador.HandleFunc(vDev+"wusuario/login", wUsuario.Login).Methods("POST")
	Enrutador.HandleFunc(vDev+"wusuario/login", wUsuario.Opciones).Methods("OPTIONS")

	Enrutador.HandleFunc(vDev+"wusuario/access", wUsuario.Access).Methods("POST")
	Enrutador.HandleFunc(vDev+"wusuario/access", wUsuario.Access).Methods("OPTIONS")

	Enrutador.HandleFunc(vDev+"wusuario/validar", wUsuario.ValidarToken(wUsuario.Autorizado)).Methods("GET")
	Enrutador.HandleFunc(vDev+"wusuario/listar", wUsuario.ValidarToken(wUsuario.Listar)).Methods("GET")

	Enrutador.HandleFunc(vDev+"wusuario/obtenerjwt", wUsuario.Crear).Methods("POST")

	Enrutador.HandleFunc(vDev+"wusuario/crear", wUsuario.ValidarToken(wUsuario.Crear)).Methods("POST")
	Enrutador.HandleFunc(vDev+"wusuario/cambiarclave", wUsuario.ValidarToken(wUsuario.CambiarClave)).Methods("PUT")
	Enrutador.HandleFunc(vDev+"wusuario/cambiarclave", wUsuario.ValidarToken(wUsuario.Opciones)).Methods("OPTIONS")

}
