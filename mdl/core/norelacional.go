package core

import (
	"encoding/json"
	"fmt"
	"time"

	"github.com/code-epic/middleware/sys"
	"github.com/code-epic/middleware/util"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
)

//InsertNOSQL Insert, Generador de Consultas
func (C *Core) InsertNOSQL(coleccion string, v interface{}) (jSon []byte, err error) {

	c := sys.MongoDB.Collection(coleccion)
	rs, err := c.InsertOne(sys.Contexto, v)
	if err != nil {
		fmt.Println("Error creando Coleccion en Mongodb ", err.Error())
	}
	jSon, _ = json.Marshal(rs)
	return

}

//Listar Insert, Generador de Consultas
func (C *Core) Listar() (jSon []byte, err error) {
	c := sys.MongoDB.Collection(sys.APICORE)
	var lst []ApiCore

	rs, err := c.Find(sys.Contexto, bson.M{})
	for rs.Next(sys.Contexto) {
		var api ApiCore
		e := rs.Decode(&api)
		util.Error(e)
		lst = append(lst, api)
	}
	jSon, _ = json.Marshal(lst)
	return
}

//CrearNOSQL Insert, Generador de Consultas
func (C *Core) CrearNOSQL(coleccion string, query string, db *mongo.Database) (jSon []byte, err error) {
	var M util.Mensajes
	//fmt.Println("Cargando consulta Coleccion: ", coleccion, query)
	c := db.Collection(coleccion)
	var lst []bson.M
	var bsonMap bson.M
	err = json.Unmarshal([]byte(query), &bsonMap)

	rs, err := c.Find(sys.Contexto, bsonMap)
	if err = rs.All(sys.Contexto, &lst); err != nil {
		M.Msj = "Driver de conexión falló"
		M.Tipo = 1
		M.Fecha = time.Now()
		jSon, err = json.Marshal(M)
		return
	}
	jSon, _ = json.Marshal(lst)
	return
}
