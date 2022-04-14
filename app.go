/*
Copyright 2021 Carlos Peña.Todos los derechos reservados.
Middleware o lógica de intercambio de información entre aplicaciones (interlogical), o Agente Intermedio, es un software que
asiste a una aplicación para interactuar o comunicarse con otras aplicaciones, o paquetes
de programas, redes, hardware o
sistemas operativos. Este simplifica el trabajo de los programadores en
la compleja tarea de generar las conexiones y sincronizaciones
que son necesarias en los sistemas distribuidos. De esta forma, se provee una solución
que mejora la calidad de servicio, así
como la seguridad, el envío de mensajes, la actualización del directorio de servicio.

Funciona como una capa de abstracción de software distribuida, que se sitúa entre las capas de
aplicaciones y las capas inferiores (sistema operativo y red).
El middleware abstrae de la complejidad y heterogeneidad de las redes de comunicaciones
subyacentes, así como de los sistemas operativos y lenguajes de
programación, proporcionando una API para la fácil programación y manejo de
aplicaciones distribuidas. Dependiendo del problema a resolver y de las
funciones necesarias, serán útiles diferentes tipos de servicios de middleware. Por lo
general el middleware del lado cliente está implementado por el
Sistema Operativo, el cual posee las bibliotecas que ejecutan todas las funcionalidades
para la comunicación a través de la red.
*/
package main

import (
	"log"
	"net/http"
	"time"

	"github.com/code-epic/middleware/sys"
	"github.com/code-epic/middleware/sys/web"
	"github.com/fatih/color"
	"github.com/gorilla/context"
)

func init() {
}

func main() {

	Cyan := color.New(color.FgHiCyan)
	BoldCyan := Cyan.Add(color.Bold)

	web.Cargar()
	srv := &http.Server{
		Handler:      context.ClearHandler(web.Enrutador),
		Addr:         ":" + sys.PUERTO,
		WriteTimeout: 3 * time.Minute,
		ReadTimeout:  3 * time.Minute,
	}
	BoldCyan.Println("Servidor Escuchando en el puerto: ", sys.PUERTO)
	go srv.ListenAndServe()

	web.CargarWs()
	wser := &http.Server{
		Handler:      context.ClearHandler(web.WsEnrutador),
		Addr:         ":" + sys.PUERTO_CHAT,
		WriteTimeout: 5 * time.Minute,
		ReadTimeout:  5 * time.Minute,
	}
	BoldCyan.Println("Servidor Escuchando en el puerto: ", sys.PUERTO_CHAT)
	go wser.ListenAndServeTLS("sys/seguridad/https/app.ve.crt", "sys/seguridad/https/llave.key")

	var wsC web.WebSocketCodeEpic
	go wsC.Analizar()

	devser := &http.Server{
		Handler:      context.ClearHandler(web.Enrutador),
		Addr:         ":" + sys.PUERTO_DEV,
		WriteTimeout: 5 * time.Minute,
		ReadTimeout:  5 * time.Minute,
	}
	BoldCyan.Println("Servidor de desarrollo escuchando en el puerto: ", sys.PUERTO_DEV)
	go devser.ListenAndServeTLS("sys/seguridad/https/app.ve.crt", "sys/seguridad/https/llave.key")

	appser := &http.Server{
		Handler:      context.ClearHandler(web.Enrutador),
		Addr:         ":" + sys.PUERTO_APP,
		WriteTimeout: 5 * time.Minute,
		ReadTimeout:  5 * time.Minute,
	}
	BoldCyan.Println("Servidor de apliaciones escuchando en el puerto: ", sys.PUERTO_APP)
	go appser.ListenAndServeTLS("sys/seguridad/https/app.ve.crt", "sys/seguridad/https/llave.key")

	rpmser := &http.Server{
		Handler:      context.ClearHandler(web.Enrutador),
		Addr:         ":" + sys.PUERTO_RPM,
		WriteTimeout: 5 * time.Minute,
		ReadTimeout:  5 * time.Minute,
	}
	BoldCyan.Println("Servidor de RPM escuchando en el puerto: ", sys.PUERTO_RPM)
	go rpmser.ListenAndServeTLS("sys/seguridad/https/app.ve.crt", "sys/seguridad/https/llave.key")

	//
	//https://dominio.com/* Protocolo de capa de seguridad
	server := &http.Server{
		Handler:      context.ClearHandler(web.Enrutador),
		Addr:         ":" + sys.PUERTO_SSL,
		WriteTimeout: 280 * time.Second,
		ReadTimeout:  280 * time.Second,
	}

	BoldCyan.Println("Servidor Escuchando en el puerto: ", sys.PUERTO_SSL)
	log.Fatal(server.ListenAndServeTLS("sys/seguridad/https/app.ve.crt", "sys/seguridad/https/llave.key"))

}
