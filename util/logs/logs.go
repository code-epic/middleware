// En informática, se usa el término registro, log o historial de log para referirse
// a la grabación secuencial en un archivo o en una base de datos de todos los acontecimientos
// (eventos o acciones) que afectan a un proceso particular (aplicación, actividad de una red informática, etc.).
// De esta forma constituye una evidencia del comportamiento del sistema.
// Por derivación, el proceso de generación del log se le suele llamar guardar, registrar o loguear
// (un neologismo del inglés logging) y al proceso o sistema que realiza la grabación en el log se le suele
// llamar logger o registrador.

package logs

import (
	"crypto/md5"
	"encoding/hex"
)

type Log struct {
	Id int
	Traza
}

func (l *Log) Firmar() {
	valor := md5.Sum([]byte(l.Usuario.Nombre + l.DireccionIP + l.DireccionMac + l.CreadoEnFecha.String()))
	l.HuellaDigital = hex.EncodeToString(valor[:])
}

func (l *Log) Validar() (b bool) {
	valor := md5.Sum([]byte(l.Usuario.Nombre + l.DireccionIP + l.DireccionMac + l.CreadoEnFecha.String()))
	s := hex.EncodeToString(valor[:])
	if s == l.HuellaDigital {
		b = true
	}
	return b
}
