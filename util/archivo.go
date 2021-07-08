package util

import (
	"database/sql"
	"fmt"
	"io/ioutil"
	"os"
)

//Archivo Generacion de datos
type Archivo struct {
	Responsable      int
	Ruta             string
	NombreDelArchivo string
	Codificacion     string
	Cabecera         string
	Leer             bool
	Salvar           bool
	Fecha            string
	CantidadLineas   int
	Registros        int
	PostgreSQL       *sql.DB
	Canal            chan []byte
	Archivo          *os.File
}

//Directorio operaciones sobre un directorio
type Directorio struct {
	Ruta    string
	Listado []string `json:"listado"`
}

//Listar archivos del directorio principal
func (D *Directorio) Listar(ruta string, esDirectorio bool) error {
	files, err := ioutil.ReadDir(ruta)
	if err != nil {
		return err
	}

	for _, f := range files {
		if f.IsDir() == esDirectorio {
			D.Listado = append(D.Listado, f.Name())
		}
	}
	fmt.Println("Controlando datos ", D.Listado)
	return nil
}

//Crear archivos
func (a *Archivo) Crear(ruta string) (err error) {
	//Verifica que el archivo existe
	_, err = os.Stat(ruta)
	//Crea el archivo si no existe
	if os.IsNotExist(err) {
		var file, err = os.Create(ruta)
		if err != nil {
			return err
		}
		defer file.Close()
	} else {
		fmt.Println("Archivo ya creado ")
	}
	fmt.Println("File Created Successfully", ruta)
	return
}

//Escribir contenido del archivo
func (a *Archivo) Escribir(ruta string, contenido string) (err error) {
	// Abre archivo usando permisos READ & WRITE
	fmt.Println("Escribir archivo")
	file, err := os.OpenFile(ruta, os.O_RDWR, 0644)
	if err != nil {
		fmt.Println("File error: ", err.Error())
	}
	defer file.Close()
	// Escribe algo de texto linea por linea
	_, err = file.WriteString(contenido)
	if err != nil {
		fmt.Println("Archivo escribir error: ", err.Error())
	}
	// Salva los cambios
	err = file.Sync()
	return err
}

//LeerTodo Funcion que recorre todos el documento
func (a *Archivo) LeerTodo() (f []byte, err error) {
	f, err = ioutil.ReadFile(a.NombreDelArchivo)
	return
}
