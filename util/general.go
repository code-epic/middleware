package util

import (
	"context"
	"crypto/md5"
	"crypto/sha256"
	"database/sql"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"log"
	"os/exec"
	"path"
	"runtime"
	"strconv"
	"strings"
	"time"
)

//Mensajes Formato de salida para Json
type Mensajes struct {
	Msj         string      `json:"msj,onmitempty"`
	Tipo        int         `json:"tipo,onmitempty"`
	Fecha       time.Time   `json:"fecha,onmitempty"`
	Responsable int         `json:"responsable,onmitempty"`
	Contenido   interface{} `json:"contenido,onmitempty"`
}

//TiempoProceso Duracion de una funcion
type TiempoProceso struct {
	Inicio   time.Time     `json:"inicio,onmitempty"`
	Fin      time.Time     `json:"fin,onmitempty"`
	Duracion time.Duration `json:"duracion,onmitempty"`
}

//NullTime Tiempo nulo
type NullTime struct {
	Time  time.Time
	Valid bool
}

const (
	TB            = 1000000000000
	GB            = 1000000000
	MB            = 1000000
	KB            = 1000
	layout string = "2006-01-02"
)

//PesoHumano Valor del peso
func PesoHumano(length int, decimals int) (out string) {
	var unit string
	var i int
	var remainder int

	// Get whole number, and the remainder for decimals
	if length > TB {
		unit = "TB"
		i = length / TB
		remainder = length - (i * TB)
	} else if length > GB {
		unit = "GB"
		i = length / GB
		remainder = length - (i * GB)
	} else if length > MB {
		unit = "MB"
		i = length / MB
		remainder = length - (i * MB)
	} else if length > KB {
		unit = "KB"
		i = length / KB
		remainder = length - (i * KB)
	} else {
		return strconv.Itoa(length) + " B"
	}

	if decimals == 0 {
		return strconv.Itoa(i) + " " + unit
	}

	// This is to calculate missing leading zeroes
	width := 0
	if remainder > GB {
		width = 12
	} else if remainder > MB {
		width = 9
	} else if remainder > KB {
		width = 6
	} else {
		width = 3
	}

	// Insert missing leading zeroes
	remainderString := strconv.Itoa(remainder)
	for iter := len(remainderString); iter < width; iter++ {
		remainderString = "0" + remainderString
	}
	if decimals > len(remainderString) {
		decimals = len(remainderString)
	}

	return fmt.Sprintf("%d.%s %s", i, remainderString[:decimals], unit)
}

//ValidarNullFloat64 los campos nulos de la base de datos y retornar su valor original
func ValidarNullFloat64(b sql.NullFloat64) (f float64) {
	if b.Valid {
		f = b.Float64
	} else {
		f = 0
	}
	return
}

//ValidarNullTime los campos nulos de la base de datos y retorna fecha
func ValidarNullTime(b interface{}) (t time.Time) {
	t, e := b.(time.Time)
	if !e {
		return time.Now()
	}
	return
}

//ValidarNullString Validar los campos nulos de la base de datos y retornar su valor original
func ValidarNullString(b sql.NullString) (s string) {
	if b.Valid {
		s = b.String
	} else {
		s = "null"
	}
	return
}

func GetFechaConvert(f sql.NullString) (dateStamp time.Time) {
	fecha := ValidarNullString(f)
	if fecha != "null" {
		dateString := strings.Replace(fecha, "/", "-", -1)
		dateStamp, _ = time.Parse(layout, dateString)
	}
	return
}

//DiasDelMes los dias de un mes
func DiasDelMes(fecha time.Time) int {
	return 0
}

//CompletarCeros llenar con ceros antes y despues de una cadena
func CompletarCeros(cadena string, orientacion int, cantidad int) string {
	var result string
	cant := len(cadena)
	total := cantidad - cant
	for i := 0; i < total; i++ {
		result += "0"
	}
	if orientacion == 0 {
		result += cadena
	} else {
		result = cadena + result
	}
	return result
}

//CompletarEspacios llenar con ceros antes y despues de una cadena
func CompletarEspacios(cadena string, orientacion int, cantidad int) string {
	var result string
	cant := len(cadena)
	total := cantidad - cant
	for i := 0; i < total; i++ {
		result += " "
	}
	if orientacion == 0 {
		result += cadena
	} else {
		result = cadena + result
	}
	return result
}

//Fatal Error
func Fatal(e error) {
	if e != nil {
		log.Fatal(e)
	}
}

//GenerarHash256 Generar Claves 256 para usuarios
func GenerarHash256(password []byte) (encry string) {
	h := sha256.New()
	h.Write(password)
	encry = hex.EncodeToString(h.Sum(nil))
	return

}

//GenerarMD5 Generar patron md5 de encriptamiento
func GenerarMD5(text string) (encry string) {
	hash := md5.Sum([]byte(text))
	return hex.EncodeToString(hash[:])
}

//EliminarPuntoDecimal Reemplazando coma por puntos
func EliminarPuntoDecimal(cadena string) string {
	return strings.Replace(strings.Trim(cadena, " "), ".", "", -1)
}

//EliminarEspacioBlanco Reemplazando coma por puntos
func EliminarEspacioBlanco(cadena string) string {
	return strings.Replace(strings.Trim(cadena, " "), " ", "", -1)
}

//EliminarUnderScore Reemplazando UnderScore por 0
func EliminarUnderScore(cadena string) string {
	return strings.Replace(strings.Trim(cadena, " "), "_", "0", -1)
}

//EliminarGuionesFecha Reemplazando coma por puntos
func EliminarGuionesFecha(cadena string) string {
	return strings.Replace(strings.Trim(cadena, " "), "-", "", -1)
}

//ReemplazarGuionesPorSlah Reemplazando coma por puntos
func ReemplazarGuionesPorSlah(cadena string) string {
	return strings.Replace(strings.Trim(cadena, " "), "-", "/", -1)
}

//Error Procesa errores del sistema
func Error(e error) {
	if e != nil {
		fmt.Println("\n ESB Utilidad  Error: ", e.Error())
	}
}

//EjecutarScript ejecucion de comandos
func EjecutarScript() (err error) {
	ctx, cancel := context.WithTimeout(context.Background(), 100*time.Millisecond)
	defer cancel()

	if err := exec.CommandContext(ctx, "/bin/sh", "update.sh").Run(); err != nil {
		// This will fail after 100 milliseconds. The 5 second sleep
		// will be interrupted.
	}
	return
}

//GitAll Actualizando proyectos
func GitAll(paquete string, cmd string, origen string) (out []byte, err error) {
	if paquete == "bus" {
		origen = "."
	} else {
		origen = "public_web/SSSIFANB/" + paquete + "/"
	}
	argstr := []string{"gitall.sh", origen, cmd}
	out, err = exec.Command("/bin/sh", argstr...).Output()
	Error(err)
	return
}

//Utf8_decode codificacion para utf
func Utf8_decode(str string) string {
	var result string
	for i := range str {
		result += string(str[i])
	}
	return result
}

//ArchivoSplit picar segmentos de un archivo
func ArchivoSplit(s string) (dir string, file string) {
	dir, file = path.Split(s)
	//fmt.Printf("path.Split(%q) = dir: %q, file: %q\n", s, dir, file)
	return
}

func Sh(script string, flags string, sIP string) (out []byte, err error) {
	var M Mensajes
	M.Tipo = 1
	M.Fecha = time.Now()

	if runtime.GOOS == "darwin" {
		out, err = exec.Command("osascript", "-e", `do shell script "./cmd/`+script+` `+sIP+`"`).Output()
	} else {
		out, err = exec.Command("/bin/sh", `./cmd/`+script+` `+sIP+`"`).Output()
	}

	M.Msj = string(out)

	switch script {
	case "getmac.sh":
		parseErr := strings.Split(string(out), "at")
		M.Msj = strings.ToUpper(strings.Replace(parseErr[1][:19], " ", "", -1))
		break
	case "xping.sh":
		if strings.Contains(string(out), "1 packets received") {
			M.Msj = "ok"
		}
		break
	default:
		M.Tipo = 0
	}

	out, err = json.Marshal(M)

	return
}

func ShPing(script string, flags string, sIP string) (estatus bool) {
	var out []byte
	estatus = false
	if runtime.GOOS == "darwin" {
		out, _ = exec.Command("osascript", "-e", `do shell script "./cmd/`+script+` `+sIP+`"`).Output()
	} else {
		out, _ = exec.Command("/bin/sh", `./cmd/`+script+` `+sIP+`"`).Output()
	}

	if strings.Contains(string(out), "0.0% packet loss") {
		estatus = true
	}

	return
}
