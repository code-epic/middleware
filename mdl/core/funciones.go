package core

import "github.com/code-epic/middleware/sys"

type Funciones struct {
	Id           string `json:"id"`
	Tipo         string `json:"tipo"`
	Nombre       string `json:"nombre"`
	Definicion   string `json:"definicion"`
	Version      string `json:"version"`
	Lenguaje     string
	Parametros   string
	Retorno      string
	Autor        string `json:"autor"`
	CodigoFuente string `json:"codigofuente"`
}

func (F *Funciones) Agregar(v interface{}) (jSon []byte, err error) {
	var c Core

	return c.InsertNOSQL(sys.CFUNCIONES, v)
}
