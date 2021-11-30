package bot

import "time"

type Bot struct {
	Id        string
	Tipo      string //N natural, F Formal, I Institucional
	Pregunta  string
	Respuesta string
	Terminos  string
	Fecha     time.Time
}

//Iniciar Contexto de conexion al chatbots
func (B *Bot) Iniciar() {

}

//Analizar aplicar razonamiento para establecer tipo
//Es el canal por el cual determinamos la busqueda
func (B *Bot) Analizar() {

}

//Finalizar la conversacion segun su contexto
func (B *Bot) Finalizar() {

}
