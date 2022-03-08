package api

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/code-epic/middleware/mdl/core"
	"github.com/code-epic/middleware/sys/seguridad"
	"github.com/code-epic/middleware/util"
)

//UsuarioConectado Seguridad Informatica
var UsuarioConectado seguridad.Usuario

//API estructuras generales
type API struct{}

//Crud conexion para solicitud de token
func (a *API) Crud(w http.ResponseWriter, r *http.Request) {
	var c core.Core
	Cabecera(w, r)
	var v map[string]interface{}
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
