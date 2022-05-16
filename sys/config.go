package sys

import (
	"context"
	"database/sql"
	"encoding/json"
	"errors"
	"fmt"
	"log"
	"os"

	util "github.com/code-epic/middleware/util"
	"github.com/fatih/color"
	"go.mongodb.org/mongo-driver/mongo"
)

//Config Generacion de conexiones
type Config struct{}

//ManejadorDeConexiones Multiples conexiones a base de datos
type ManejadorDeConexiones struct {
	ID          string `json:"id"`
	Nombre      string `json:"nombre"`
	Descripcion string `json:"descripcion"`
}

//DriverSQL Establecer Driver's de conexion
type DriverSQL struct {
	Nombre   string
	SUrl     string
	Contexto context.Context
	DB       *sql.DB
	Estatus  bool
	Error    error
}

//DriverSQL Establecer Driver's de conexion
type DriverNOSQL struct {
	Nombre   string
	SUrl     string
	Contexto context.Context
	DB       *mongo.Database
	Estatus  bool
	Error    error
}

//Variables del modelo
var (
	Version           string
	MySQL             bool = false
	BaseDeDatos       BaseDatos
	MGConexion        *Mongo
	Contexto          context.Context
	MongoDB           *mongo.Database
	Error             error
	ListadoConexiones []string
	SQLTODO           = make(map[string]DriverSQL)
	NOSQLTODO         = make(map[string]DriverNOSQL)
	DRIVERS           []ManejadorDeConexiones
	CacheLog          *log.Logger
	QueryLog          *log.Logger
	SystemLog         *log.Logger
)

//Constantes del sistema
const (
	ACTIVAR_CONEXION_REMOTA       bool   = true
	DESACTIVAR_CONEXION_REMOTA    bool   = false
	ACTIVAR_LOG_REGISTRO          bool   = true
	DESACTIVAR_LOG_REGISTRO       bool   = false
	ACTIVAR_ROLES                 bool   = true
	DESACTIVAR_ROLES              bool   = false
	ACTIVAR_LIMITE_DE_CONSULTA    bool   = true
	DESACTIVAR_LIMITE_DE_CONSULTA bool   = false
	PUERTO                        string = "80"
	PUERTO_SSL                    string = "443"
	PUERTO_CHAT                   string = "3000"
	PUERTO_APP                    string = "2286"
	PUERTO_RPM                    string = "2611"
	PUERTO_DEV                    string = "2307"
	CODIFCACION_DE_ARCHIVOS       string = "UTF-8"
	MAXIMO_LIMITE_DE_USUARIO      int    = 100
	MAXIMO_LIMITE_DE_CONSULTAS    int    = 10
)

//BaseDatos Estructuras
type BaseDatos struct {
	CadenaDeConexion map[string]CadenaDeConexion
}

//CadenaDeConexion Conexion de datos
type CadenaDeConexion struct {
	ID          string `json:"id" bson:"id"`
	Driver      string `json:"driver" bson:"driver"`
	Usuario     string `json:"usuario" bson:"usuario"`
	Basedatos   string `json:"basedatos" bson:"basedatos"`
	Clave       string `json:"clave" bson:"clave"`
	Host        string `json:"host" bson:"host"`
	Puerto      string `json:"puerto" bson:"puerto"`
	SUrl        string `json:"url" bson:"url"`
	Descripcion string `json:"descripcion" bson:"descripcion"`
	Estatus     bool   `json:"estatus" bson:"estatus"`
}

//Conexiones 0: PostgreSQL, 1: MySQL, 2: MongoDB
var Conexiones []CadenaDeConexion

func init() {

	var a util.Archivo

	Magenta := color.New(color.FgMagenta)
	BoldMagenta := Magenta.Add(color.Bold)
	fmt.Println("")
	BoldMagenta.Println("..........................................................")
	BoldMagenta.Println(" ... Code Epic Techlogies version  ", Version)
	BoldMagenta.Println("..........................................................")
	BoldMagenta.Println("")
	fmt.Println("Iniciando Carga de Archivos Logs                 ")

	_, CacheLog = RegistrarLog("cache.log", "INFO: ")
	_, QueryLog = RegistrarLog("query.log", "WARNING: ")
	_, SystemLog = RegistrarLog("system.log", "ALERT: ")

	a.NombreDelArchivo = "sys/config_dev.json"
	data, _ := a.LeerTodo()
	e := json.Unmarshal(data, &Conexiones)
	for _, valor := range Conexiones {
		ListadoConexiones = append(ListadoConexiones, valor.Driver)
		cad := make(map[string]CadenaDeConexion)
		cad[valor.Driver] = CadenaDeConexion{
			ID:          valor.ID,
			Driver:      valor.Driver,
			Usuario:     valor.Usuario,
			Basedatos:   valor.Basedatos,
			Clave:       valor.Clave,
			Host:        valor.Host,
			Puerto:      valor.Puerto,
			SUrl:        valor.SUrl,
			Descripcion: valor.Descripcion,
			Estatus:     valor.Estatus,
		}

		switch valor.Driver {
		case "mongodb":
			MongoDBConexion(cad)
			NOSQLTODO[valor.ID] = DriverNOSQL{
				Nombre:   valor.Driver,
				DB:       MongoDB,
				Estatus:  true,
				Contexto: Contexto,
				Error:    nil,
			}
		}
	}

	util.Error(e)
	CargarDrivers()
}

//ConexionesDinamicas Permite establecer multiples conexiones
func (C *Config) ConexionesDinamicas(c CadenaDeConexion) (estatus bool) {
	estatus = true
	switch c.Driver {
	case "sqlserver17":
		db, er := CSQLServer(c)
		SQLTODO[c.ID] = DriverSQL{
			Nombre:   c.Driver,
			DB:       db,
			Estatus:  true,
			Contexto: Contexto,
			Error:    er,
		}
		break
	case "postgres13":
		db, er := CPostgres(c)
		SQLTODO[c.ID] = DriverSQL{
			Nombre:   c.Driver,
			DB:       db,
			Estatus:  true,
			Contexto: Contexto,
			Error:    er,
		}
		break
	case "postgres96":
		db, er := CPostgres(c)
		SQLTODO[c.ID] = DriverSQL{
			Nombre:   c.Driver,
			DB:       db,
			Estatus:  true,
			Contexto: Contexto,
			Error:    er,
		}
		break
	case "mongodb":
		db, er := CMongoDB(c)
		NOSQLTODO[c.ID] = DriverNOSQL{
			Nombre:   c.Driver,
			DB:       db,
			Estatus:  true,
			Contexto: Contexto,
			Error:    er,
		}
		break
	case "mysql8":
		db, er := CMySQL(c)
		SQLTODO[c.ID] = DriverSQL{
			Nombre:   c.Driver,
			DB:       db,
			Estatus:  true,
			Contexto: Contexto,
			Error:    er,
		}
		break
	case "mariadb":
		db, er := CMySQL(c)
		SQLTODO[c.ID] = DriverSQL{
			Nombre:   c.Driver,
			DB:       db,
			Estatus:  true,
			Contexto: Contexto,
			Error:    er,
		}
		break
	case "oracle19c":
		db, er := CSQLOracle(c)
		SQLTODO[c.ID] = DriverSQL{
			Nombre:   c.Driver,
			DB:       db,
			Estatus:  true,
			Contexto: Contexto,
			Error:    er,
		}
		break
	case "puenteurl":
		SQLTODO[c.ID] = DriverSQL{
			Nombre:   c.Driver,
			DB:       nil,
			Estatus:  true,
			Contexto: Contexto,
			Error:    nil,
			SUrl:     "",
		}
		break
	default:
		estatus = false
		break
	}

	return
}

//ConexionesDinamicas Permite establecer multiples conexiones
func (C *Config) EvaluarConexionesDinamicas(c CadenaDeConexion) (er error) {
	switch c.Driver {
	case "sqlserver17":
		_, er = CSQLServer(c)
		break
	case "postgres13":
		_, er = CPostgres(c)
		break
	case "mongodb":
		_, er = CMongoDB(c)
		break
	case "mysql8":
		_, er = CMySQL(c)
		break
	case "mariadb":
		_, er = CMySQL(c)
		break
	case "oracle19c":
		_, er = CSQLOracle(c)
		break

	case "puenteurl":
		break
	default:
		errString := "Driver: no funciona para " + c.Driver
		er = errors.New(errString)
		break
	}
	return
}

//CargarDrivers
func CargarDrivers() {
	var a util.Archivo
	a.NombreDelArchivo = "sys/drivers.json"
	data, _ := a.LeerTodo()
	e := json.Unmarshal(data, &DRIVERS)
	util.Error(e)
}

func RegistrarLog(file string, mensaje string) (err error, xLog *log.Logger) {
	f, err := os.OpenFile("./util/logs/"+file, os.O_WRONLY|os.O_CREATE|os.O_APPEND, 0644)
	if err != nil {
		color.Red("[-] Fallo la creacion del archivo log en: ./util/logs/" + file + " verifique los permisos de escritura")
	} else {
		color.Green("[+] Archivo log Activo en: ./util/logs/" + file)
	}
	xLog = log.New(f, mensaje, log.Ldate|log.Ltime|log.Lshortfile)
	return
}
