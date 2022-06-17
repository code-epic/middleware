package api

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/code-epic/middleware/util"
)

//SubirArchivos Permite procesar archivos al sistema
func (wp *WPanel) SubirArchivos(w http.ResponseWriter, r *http.Request) {
	Cabecera(w, r)
	var traza util.Traza
	var M util.Mensajes

	ip := strings.Split(r.RemoteAddr, ":")
	traza.IP = ip[0]
	traza.Time = time.Now()
	traza.Usuario = UsuarioConectado.Login

	er := r.ParseMultipartForm(32 << 20)
	if er != nil {
		M.Tipo = 0
		M.Msj = "Proceso fallo"

		j, _ := json.Marshal(M)
		w.WriteHeader(http.StatusOK)
		w.Write(j)
		return
	}
	m := r.MultipartForm

	files := m.File["archivos"]
	codigo := r.FormValue("identificador")

	directorio := "./tmp/file/out/" + util.GCodeEncrypt(codigo)
	errr := os.Mkdir(directorio, 0777)

	if errr != nil {
		fmt.Println("El directorio ya existe!")
	}
	for i := range files {
		file, errf := files[i].Open()
		defer file.Close()
		if errf != nil {
			fmt.Println(errf)
			return
		}
		out, er := os.Create(directorio + "/" + util.GCodeEncrypt(files[i].Filename))
		defer out.Close()
		if er != nil {
			fmt.Println(er.Error())
			return
		}
		_, err := io.Copy(out, file) // file not files[i] !
		if err != nil {
			fmt.Println(err)
			return
		}
	} // Fin de archivos
	M.Msj = "Proceso exitoso"

	j, _ := json.Marshal(M)
	w.WriteHeader(http.StatusOK)
	w.Write(j)

}
