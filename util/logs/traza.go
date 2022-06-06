package logs

import (
	"fmt"
	"time"

	"github.com/code-epic/middleware/sys/seguridad"
)

type Traza struct {
	seguridad.Usuario `json:"usuario"`
	Sistema           string    `json:"sistema"`
	Accion            string    `json:"accion"`
	Metodo            string    `json:"metodo"`
	Pregunta          string    `json:"pregunta"`
	CreadoEnFecha     time.Time `json:"creadoenfecha"`
	Contenido         string    `json:"contenido"`
	HuellaDigital     string    `json:"huelladigital"`
}

func (t *Traza) Salva() error {
	fmt.Println("Err: ", t.HuellaDigital)
	return nil
}
