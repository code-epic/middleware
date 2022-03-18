package workflow

//Transicion determina la funcion que se va a ejecutar. Una transición
//desde un estado a otro, dependiente de un símbolo del alfabeto,
//se representa mediante una arista dirigida
//que une a estos vértices, y que está etiquetada con dicho símbolo.
type Transicion struct {
	Id          string
	Nombre      string
	Descripcion string
}
