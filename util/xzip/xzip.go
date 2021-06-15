// Package zip en informática es un formato de compresión sin pérdida,
// muy utilizado para la compresión de datos como documentos, imágenes o programas.
// Para este tipo de archivos se utiliza generalmente la extensión ".zip".`
// Autor(Carlos Peña gesaodin@gmail.com 07ABR2021)
package xzip

import (
	"bytes"
	"compress/gzip"
	"encoding/base64"
	"io/ioutil"
	"log"
	"os"
)

//Comprimir Archivos de codigo fuentes
func Comprimir(databytes []byte) (str string) {
	var b bytes.Buffer
	gz := gzip.NewWriter(&b)
	if _, err := gz.Write(databytes); err != nil {
		panic(err)
	}
	if err := gz.Flush(); err != nil {
		panic(err)
	}
	if err := gz.Close(); err != nil {
		panic(err)
	}
	str = base64.StdEncoding.EncodeToString(b.Bytes())
	return
}

//Descomprimir una cadena
func Descomprimir(str string) string {
	data, _ := base64.StdEncoding.DecodeString(str)
	rdata := bytes.NewReader(data)
	r, _ := gzip.NewReader(rdata)
	s, _ := ioutil.ReadAll(r)
	return string(s)
}

//DescomprimirArchivos Origen del archivo en formato zip
func DescomprimirArchivos(origen string, destino string) {
	fr, err := os.Open(origen)
	if err != nil {
		log.Fatalln(err)
	}
	defer fr.Close()

	// Crea gzip.Reader
	gr, err := gzip.NewReader(fr)
	if err != nil {
		log.Fatalln(err)
	}
	defer gr.Close()

	// leer el contenido del archivo
	buf := make([]byte, 1024*1024*10) //
	n, err := gr.Read(buf)

	// Escribe los datos del archivo en el paquete
	fw, err := os.Create(gr.Header.Name)
	if err != nil {
		log.Fatalln(err)
	}
	_, err = fw.Write(buf[:n])
	if err != nil {
		log.Fatalln(err)
	}

}
