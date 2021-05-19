package web

import (
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/code-epic/esb/mdl/chat"
	"github.com/code-epic/esb/mdl/core"
	"github.com/code-epic/esb/sys"
	"github.com/code-epic/esb/util"
	"github.com/gorilla/mux"
	"github.com/gorilla/websocket"
)

type WebSocketCodeEpic struct{}

var (
	Mensajeria  = New()
	WsEnrutador = mux.NewRouter()
	wsocket     = chat.WSocket{}

	newline  = []byte{'\n'}
	space    = []byte{' '}
	Upgrader = websocket.Upgrader{
		CheckOrigin:     func(r *http.Request) bool { return true },
		ReadBufferSize:  1024,
		WriteBufferSize: 1024,
	}
)

//EscribirMensajes Enviar y transmitir mensajes entre usuarios
func (Wsc *WebSocketCodeEpic) EscribirMensajes(conn *websocket.Conn, usuario string, error bool) {
	var m = chat.WChat{}
	var r = chat.WChat{}
	var entregado = chat.WChat{}
	for {
		//Mensajeria.ListarUsuarios()

		entregado.Tiempo = time.Now()
		entregado.Tipo = 4
		e := conn.ReadJSON(&m)
		if e != nil {

			entregado.Tipo = 70
			entregado.Msj = "Error en el formato del mensaje"
			jr, _ := json.Marshal(entregado)
			conn.WriteMessage(websocket.TextMessage, jr)
			return
		} else {
			r.Msj = m.Msj
			r.De = usuario
			r.Tiempo = time.Now()
			r.Tipo = 3
			if m.Tipo != 0 {
				r.Tipo = m.Tipo
			}
			if Mensajeria.Usuario[m.Para].ch != nil {
				j, _ := json.Marshal(r)
				Mensajeria.Usuario[m.Para].ch <- j
				entregado.Para = m.Para
				entregado.Msj = "Entregado"
				jr, _ := json.Marshal(entregado)
				conn.WriteMessage(websocket.TextMessage, jr)
			} else {
				conn.Close()
				Mensajeria.EliminarUsuario(usuario)
				entregado.Msj = "No existe conexion con el destino"
				jr, _ := json.Marshal(entregado)
				conn.WriteMessage(websocket.TextMessage, jr)
			}
		}
	}
}

func LogicaDelMensajePorTiempo(conn *websocket.Conn, usuario string) {
	ch := time.Tick(3 * time.Second)
	for range ch {
		conn.WriteMessage(websocket.TextMessage, []byte("Actualizando"))
	}
}

//LogicaDelMensajePorCanales Permite establecer la logica de los mensajes en sus chanels
func (Wsc *WebSocketCodeEpic) LogicaDelMensajePorCanales(conn *websocket.Conn, usuario string, ch chan []byte) {
	for {
		select {
		case datos := <-ch:
			//fmt.Println("Entrando en el canal ", usuario)
			conn.WriteMessage(websocket.TextMessage, datos)
		}
	}
}

//CreandoWS Estableciendo WebSocket:Gorilla Tool Kit
func (Wsc *WebSocketCodeEpic) CreandoWS(w http.ResponseWriter, r *http.Request) {
	usuario := r.URL.Query().Get("id")
	conn, err := Upgrader.Upgrade(w, r, nil)
	util.Error(err)

	//go LogicaDelMensajePorTiempo(conn, usuario)
	error := Mensajeria.CrearUsuario(usuario)
	go Wsc.LogicaDelMensajePorCanales(conn, usuario, Mensajeria.Usuario[usuario].ch)
	go Wsc.EscribirMensajes(conn, usuario, error)

	wsocket.Listado = Mensajeria.ListarUsuariosMenos(usuario)
	wsocket.Usuario = Mensajeria.Usuario[usuario]
	wsocket.Mensaje = "Se Establecio la conexión con el servidor"
	j, _ := json.Marshal(wsocket)
	conn.WriteMessage(websocket.TextMessage, j)
}

func CargarWs() {
	var wsc WebSocketCodeEpic
	WsEnrutador.HandleFunc("/", Principal)
	WsEnrutador.HandleFunc("/ws", wsc.CreandoWS)
	WsEnrutador.HandleFunc("/ws/send", wsc.EnviarMensajeA)
}

func (Wsc *WebSocketCodeEpic) EnviarMensajeA(w http.ResponseWriter, r *http.Request) {
	var m = chat.WChat{}
	var M util.Mensajes
	M.Msj = "Enviando contenido"
	j, _ := json.Marshal(M)
	usuario := r.URL.Query().Get("id")

	m.Tiempo = time.Now()

	Mensajeria.Usuario[usuario].ch <- j
}

func (Wsc *WebSocketCodeEpic) EnviarMensajeSistema(usuario string, M interface{}) {

	j, _ := json.Marshal(M)
	Mensajeria.Usuario[usuario].ch <- j

}

type XRed struct {
	lst map[string]bool
}

type XServidor struct {
	ID          string `json:"id"`
	Host        string `json:"host"`
	Estatus     bool   `json:"estatus"`
	Mac         string `json:"mac"`
	Tipo        string `json:"tipo"`
	Descripcion string `json:"descripcion"`
}

func (Wsc *WebSocketCodeEpic) Analizar() {
	var xcore core.Core
	var lstServidores []XServidor
	var lstSerSalida []XServidor

	var err error

	var M util.Mensajes
	M.Tipo = 90
	jSon, _ := xcore.CrearNOSQL("sys-conection", "{}", sys.MongoDB)

	err = json.Unmarshal(jSon, &lstServidores)
	if err != nil {
		fmt.Println(err.Error())

	}

	for _, v := range lstServidores {
		var xSer XServidor
		xSer = v
		xSer.Estatus = false
		if util.ShPing("xping.sh", "", v.Host) {
			xSer.Estatus = true
		}
		lstSerSalida = append(lstSerSalida, xSer)

	}

	M.Msj = "Escaneo de la red"
	M.Contenido = lstSerSalida
	Wsc.EnviarMensajeSistema("panel", M)
	time.Sleep(3 * time.Second)
	Wsc.Analizar()

}
