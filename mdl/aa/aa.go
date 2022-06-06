//Aprendizaje Automatizado
package aa

import "fmt"

type Neurona struct {
	ID           string
	Conocimiento string
}

type AA struct {
	Memoria []Neurona
}

func (ml *AA) Iniciar() {

}

func (ml *AA) Aprender(patron string, conocimiento string) bool {
	fmt.Println("Guardar recuerdo... ", conocimiento, " ", patron)
	return true
}

func (ml *AA) Recordar(patron string) {

}

func (ml *AA) Entrenar() {

}

func (ml *AA) Predecir() {

}

func (ml *AA) Analizar() {

}
