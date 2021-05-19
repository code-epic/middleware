// Copyright 2017 Carlos Peña.Todos los derechos reservados.
package web

import (
	"fmt"
	"time"
)

//Manejo de Usuarios
type (
	Usuario struct {
		ID       string    `json:"id"`
		Conexion time.Time `json:"conexion"`
		ch       chan []byte
	}

	web struct {
		Usuario map[string]Usuario
	}
)

var instancia *web

func New() *web {
	if instancia == nil {
		w := &web{}
		w.Usuario = make(map[string]Usuario)
		instancia = w
	}
	return instancia
}

func (w *web) CrearUsuario(usuario string) bool {
	if validarUsuario(w.Usuario, usuario) == false {

		var user Usuario
		user.ID = usuario
		user.Conexion = time.Now()
		user.ch = make(chan []byte)
		w.Usuario[usuario] = user
		return true
	}

	return false //No se creo usuario
}

func validarUsuario(lista map[string]Usuario, comparacion string) bool {
	var resultado bool = false
	for c := range lista {
		fmt.Println("Nombre", c)
		if c == comparacion {
			resultado = true //Usuario registrado actualmente
		}
	}
	return resultado
}

func (w *web) EliminarUsuario(usuario string) bool {
	delete(w.Usuario, usuario)
	return true
}

func (w *web) ListarUsuarios() {
	fmt.Println("Listado de usuarios ")
	for _, v := range w.Usuario {
		fmt.Println("Usuario: ", v.ID)
	}
}

func (w *web) ListarUsuariosMenos(usuario string) (us []string) {
	for c := range w.Usuario {
		if c != usuario {
			us = append(us, c)
		}
	}
	return us
}
