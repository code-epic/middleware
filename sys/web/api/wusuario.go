package api

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"
	"time"

	"github.com/code-epic/middleware/mdl/core"
	"github.com/code-epic/middleware/util"
	jwt "github.com/golang-jwt/jwt/v4"
	"github.com/golang-jwt/jwt/v4/request"
	"github.com/gorilla/mux"

	"github.com/code-epic/middleware/sys/seguridad"
)

type WUsuario struct{}

//Crear Usuario del sistema
func (u *WUsuario) Crear(w http.ResponseWriter, r *http.Request) {
	var usuario seguridad.Usuario
	var m util.Mensajes
	Cabecera(w, r)
	ip := strings.Split(r.RemoteAddr, ":")
	usuario.FirmaDigital.DireccionIP = ip[0]
	usuario.FirmaDigital.Tiempo = time.Now()
	usuario.FechaCreacion = time.Now()

	e := json.NewDecoder(r.Body).Decode(&usuario)
	util.Error(e)
	// if ip[0] == "192.168.6.45" {

	e = usuario.Salvar()
	if e != nil {
		w.WriteHeader(http.StatusForbidden)
		m.Msj = e.Error()
		m.Tipo = 1
		fmt.Println("Err: ", e.Error())
	} else {
		w.WriteHeader(http.StatusOK)
		m.Msj = "Usuario creado"
		m.Tipo = 0
	}
	// } else {
	// 	w.WriteHeader(http.StatusUnauthorized)
	// 	m.Msj = "El equipo donde no esta autorizado"
	// 	m.Tipo = 2
	// }

	m.Fecha = time.Now()
	j, _ := json.Marshal(m)
	w.Write(j)
}

//Clave de tipos
type Clave struct {
	Login   string `json:"login"`
	Clave   string `json:"clave"`
	Nueva   string `json:"nueva"`
	Repetir string `json:"repetir"`
	Correo  string `json:"correo"`
}

//CambiarClave ID
func (u *WUsuario) CambiarClave(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	var M util.Mensajes
	var usr seguridad.Usuario
	var datos Clave

	e := json.NewDecoder(r.Body).Decode(&datos)
	util.Error(e)
	ok := usr.CambiarClave(datos.Login, datos.Clave, datos.Nueva)
	M.Tipo = 1
	if ok != nil {
		M.Msj = ok.Error()
		M.Tipo = 0
	}
	j, _ := json.Marshal(M)
	w.WriteHeader(http.StatusOK)
	w.Write(j)
}

//Login conexion para solicitud de token
func (u *WUsuario) Login(w http.ResponseWriter, r *http.Request) {
	var usuario seguridad.Usuario
	var traza util.Traza
	Cabecera(w, r)
	e := json.NewDecoder(r.Body).Decode(&usuario)
	util.Error(e)
	e = usuario.Validar(usuario.Nombre, util.GenerarHash256([]byte(usuario.Clave)))
	util.Error(e)

	if usuario.Login != "" {

		usuario.Clave = ""
		min := time.Minute * 480
		token := seguridad.GenerarJWT(usuario, min)
		result := seguridad.RespuestaToken{Token: token}
		j, e := json.Marshal(result)

		if e != nil {

			fmt.Println("Control ", e.Error())
		}

		ip := strings.Split(r.RemoteAddr, ":")
		traza.Usuario = usuario.Login
		traza.Time = time.Now()
		traza.Log = "Inicio de sesi??n"
		traza.IP = ip[0]
		traza.Documento = "Usuario"

		fmt.Println("Acceso Permitido")

		w.WriteHeader(http.StatusOK)
		w.Write(j)
	} else {
		w.Header().Set("Content-Type", "application/text")
		w.WriteHeader(http.StatusForbidden)
		fmt.Fprintln(w, "Usuario y clave no validas")
	}
}

//ValidarToken Validacion de usuario
func (u *WUsuario) ValidarToken(fn http.HandlerFunc) http.HandlerFunc {
	var mensaje util.Mensajes

	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {

		Cabecera(w, r)
		token, e := request.ParseFromRequestWithClaims(r, request.OAuth2Extractor, &seguridad.Reclamaciones{}, func(token *jwt.Token) (interface{}, error) {
			reclamacion := token.Claims.(*seguridad.Reclamaciones)
			UsuarioConectado = reclamacion.Usuario
			return seguridad.LlavePublica, nil
		})

		if e != nil {
			switch e.(type) {
			case *jwt.ValidationError:
				vErr := e.(*jwt.ValidationError)
				switch vErr.Errors {
				case jwt.ValidationErrorExpired:
					w.WriteHeader(http.StatusUnauthorized)
					mensaje.Tipo = 2
					mensaje.Msj = "El token ha expirado"
					j, _ := json.Marshal(mensaje)
					w.Write(j)
					return
				case jwt.ValidationErrorSignatureInvalid:
					w.WriteHeader(http.StatusForbidden)
					mensaje.Tipo = 3
					mensaje.Msj = "La firma del token no coincide"
					j, _ := json.Marshal(mensaje)
					w.Write(j)
					return
				default:
					w.WriteHeader(http.StatusForbidden)
					mensaje.Tipo = 4
					mensaje.Msj = "Acceso denegado"
					j, _ := json.Marshal(mensaje)
					w.Write(j)
					return
				}
			default:
				w.WriteHeader(http.StatusForbidden)
				mensaje.Tipo = 5
				mensaje.Msj = "El token no es valido"
				j, _ := json.Marshal(mensaje)
				w.Write(j)
				return
			}
		}

		if token.Valid {
			fn(w, r)
		} else {
			CabeceraRechazada(w, http.StatusForbidden, "Err. token no es valido")
			return
		}
	})
}

//Autorizado Formando archivos
func (u *WUsuario) Autorizado(w http.ResponseWriter, r *http.Request) {
	var mensaje util.Mensajes
	Cabecera(w, r)
	w.WriteHeader(http.StatusOK)
	mensaje.Tipo = 1
	mensaje.Msj = "Acceso Autorizado"
	j, _ := json.Marshal(mensaje)
	w.Write(j)
}

//Consultar conexion para solicitud de token
func (u *WUsuario) Consultar(w http.ResponseWriter, r *http.Request) {
	var usuario seguridad.Usuario
	var traza util.Traza
	Cabecera(w, r)
	var cedula = mux.Vars(r)
	ced := cedula["id"]

	j, _ := usuario.Consultar(ced)

	ip := strings.Split(r.RemoteAddr, ":")
	traza.Usuario = usuario.Login
	traza.Time = time.Now()
	traza.Log = "Consultar Usuario"
	traza.IP = ip[0]
	traza.Documento = "Usuario"

	w.WriteHeader(http.StatusOK)
	w.Write(j)

}

//Listar Usuario del sistema
func (u *WUsuario) Listar(w http.ResponseWriter, r *http.Request) {
	var usuario seguridad.Usuario
	Cabecera(w, r)
	j, _ := usuario.Listar()
	w.WriteHeader(http.StatusOK)
	w.Write(j)
}

//Opciones Militar
func (u *WUsuario) Opciones(w http.ResponseWriter, r *http.Request) {
	CabeceraW(w, r)
	fmt.Println("Conectandose usuario v??a Extranet...")
	fmt.Fprintf(w, "Saludos")

}

//CambiarClaveW Control de Cambio de Clave
func (u *WUsuario) CambiarClaveW(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	var M util.Mensajes
	var usr seguridad.WUsuario
	var datos Clave

	e := json.NewDecoder(r.Body).Decode(&datos)
	util.Error(e)
	ok := usr.CambiarClave(datos.Login, datos.Clave, datos.Nueva)
	M.Tipo = 1
	if ok != nil {
		M.Msj = ok.Error()
		M.Tipo = 0
	}
	j, _ := json.Marshal(M)
	w.WriteHeader(http.StatusOK)
	w.Write(j)
}

//Access conexion para solicitud de token desde otros sistemas
func (u *WUsuario) Access(w http.ResponseWriter, r *http.Request) {
	var v map[string]interface{}
	//	var traza util.Traza
	var c core.Core
	Cabecera(w, r)
	e := json.NewDecoder(r.Body).Decode(&v)

	util.Error(e)
	c.Asignar(v)

	min := time.Minute * 480
	token := seguridad.GenerarJWTDinamico(c.Resultado.Cuerpo, min)
	result := seguridad.RespuestaToken{Token: token}

	j, _ := json.Marshal(result)
	w.WriteHeader(http.StatusOK)
	w.Write(j)
	//	} else {
	//	w.Header().Set("Content-Type", "application/text")
	//w.WriteHeader(http.StatusForbidden)
	//	fmt.Fprintln(w, "Usuario y clave no validas")
	//	}
}

//ValidarTokenDinamico Validacion de usuario
func (u *WUsuario) ValidarTokenDinamico(fn http.HandlerFunc) http.HandlerFunc {
	var mensaje util.Mensajes

	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {

		Cabecera(w, r)
		token, e := request.ParseFromRequestWithClaims(r, request.OAuth2Extractor, &seguridad.ReclamacionesDinamicas{}, func(token *jwt.Token) (interface{}, error) {
			reclamacion := token.Claims.(*seguridad.ReclamacionesDinamicas)
			UsuarioConectadoDinamico = reclamacion.Usuario
			return seguridad.LlavePublica, nil
		})

		if e != nil {
			switch e.(type) {
			case *jwt.ValidationError:
				vErr := e.(*jwt.ValidationError)
				switch vErr.Errors {
				case jwt.ValidationErrorExpired:
					w.WriteHeader(http.StatusUnauthorized)
					mensaje.Tipo = 2
					mensaje.Msj = "El token ha expirado"
					j, _ := json.Marshal(mensaje)
					w.Write(j)
					return
				case jwt.ValidationErrorSignatureInvalid:
					w.WriteHeader(http.StatusForbidden)
					mensaje.Tipo = 3
					mensaje.Msj = "La firma del token no coincide"
					j, _ := json.Marshal(mensaje)
					w.Write(j)
					return
				default:
					w.WriteHeader(http.StatusForbidden)
					mensaje.Tipo = 4
					mensaje.Msj = "Acceso denegado"
					j, _ := json.Marshal(mensaje)
					w.Write(j)
					return
				}
			default:
				w.WriteHeader(http.StatusForbidden)
				mensaje.Tipo = 5
				mensaje.Msj = "El token no es valido"
				j, _ := json.Marshal(mensaje)
				w.Write(j)
				return
			}
		}

		if token.Valid {
			fn(w, r)
		} else {
			CabeceraRechazada(w, http.StatusForbidden, "Err. token no es valido")
			return
		}
	})
}
