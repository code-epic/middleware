package api

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	_ "net/http/pprof"
	"os"
	"runtime/pprof"

	"github.com/code-epic/middleware/mdl/core"
	"github.com/code-epic/middleware/sys/seguridad"
	"github.com/code-epic/middleware/util"
)

//UsuarioConectado Seguridad Informatica
var UsuarioConectado seguridad.Usuario
var UsuarioConectadoDinamico interface{}

//API estructuras generales
type API struct{}

//Crud conexion para solicitud de token
func (a *API) Crud(w http.ResponseWriter, r *http.Request) {
	var c core.Core
	Cabecera(w, r)
	var v map[string]interface{}

	f, err := os.Create("Crud.prof")
	if err != nil {
		log.Fatal(err)
	}
	pprof.StartCPUProfile(f)
	defer pprof.StopCPUProfile()
	e := json.NewDecoder(r.Body).Decode(&v)
	if e != nil {
		fmt.Println("Error en el objeto JSON")
		w.WriteHeader(http.StatusForbidden)
		return
	}
	j, _ := c.Asignar(v)
	w.WriteHeader(http.StatusOK)
	_, e = w.Write(j)
	util.Error(e)
}

//Listar conexion para solicitud de token
func (a *API) Listar(w http.ResponseWriter, r *http.Request) {
	var xcore core.Core
	Cabecera(w, r)
	j, _ := xcore.Listar()
	w.WriteHeader(http.StatusOK)
	_, e := w.Write(j)
	util.Error(e)

}
