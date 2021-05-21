/*
Copyright 2021 Carlos Peña.Todos los derechos reservados.
En informática un Bus de Servicio Empresarial (ESB por sus siglas en inglés)
es un modelo de arquitectura de software que gestiona la comunicación entre
servicios web. Es un componente fundamental de la Arquitectura Orientada a
Servicios.
Un ESB generalmente proporciona una capa de abstracción construida sobre
una implementación de un sistema de mensajes de empresa que permita a los
expertos en integración explotar el valor del envío de mensajes sin tener que
escribir código. Al contrario que sucede con la clásica integración de
aplicaciones de empresa (IAE) que se basa en una pila monolítica sobre una
implantación distribuida cuando se hace necesario, de modo que trabajen
arquitectura hub and spoke, un bus de servicio de empresa se construye sobre
unas funciones base que se dividen en sus partes constituyentes, con una
armoniosamente según la demanda.
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
		WriteTimeout: 3 * time.Minute,
		ReadTimeout:  3 * time.Minute,
	}
	BoldCyan.Println("Servidor Escuchando en el puerto: ", sys.PUERTO_CHAT)
	go wser.ListenAndServeTLS("sys/seguridad/https/app.ve.crt", "sys/seguridad/https/llave.key")

	var wsC web.WebSocketCodeEpic

	go wsC.Analizar()

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
