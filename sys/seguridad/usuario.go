// Administración basada en Roles
// El control de acceso basado en roles (RBAC) es una función de seguridad para
// controlar el acceso de usuarios a tareas que normalmente están restringidas al
// superusuario. Mediante la aplicación de atributos de seguridad a procesos y
// usuarios, RBAC puede dividir las capacidades de superusuario entre varios
// administradores. La gestión de derechos de procesos se implementa a través de
// privilegios. La gestión de derechos de usuarios se implementa a través de RBAC.
package seguridad

import (
	"encoding/json"
	"fmt"
	"time"

	"go.mongodb.org/mongo-driver/bson"

	"github.com/code-epic/middleware/sys"
	"github.com/code-epic/middleware/util"
)

const (
	ROOT               string = "0xRO" //Todos los privilegios del sistema
	CONSULTA           string = "0xCO"
	ADMINISTRADOR      string = "0xAD"
	ADMINISTRADORGRUPO string = "0xAA"
	INVITADO           string = "0xIN"
	PRODUCCION         string = "0xPR"
	DESARROLLADOR      string = "0xDE"
	PASANTE            string = "0xPA"
	OPERADOR           string = "0xOP"
	TEST               string = "0xPR"
	HACK               string = "0xHA"
	PROOT              string = "Root"
	PPRESIDENTE        string = "Presidente"
	PADMIN             string = "Administrador"
	PGERENTE           string = "Gerente"
	PJEFE              string = "Jefe"
	GAFILIACION        string = "Afiliacion"
	ANALISTA           string = "Analista"
)

type MetodoSeguro struct {
	Consultar  bool `json:"consultar" bson:"consultar" `
	Insertar   bool `json:"insertar"`
	Actualizar bool `json:"actualizar"`
	Eliminar   bool `json:"eliminar"`
	Crud       bool `json:"crud"`
	CrearSQL   bool `json:"crearsql"`
	Todo       bool `json:"todo"`
	Funcion    bool `json:"funcion"`
}

//Usuario del Sistema
type Usuario struct {
	ID            string       `json:"id" bson:"_id"`
	Cedula        string       `json:"cedula" bson:"cedula"`
	Nombre        string       `json:"nombre" bson:"nombre"`
	Login         string       `json:"usuario" bson:"login"`
	Correo        string       `json:"correo" bson:"correo"`
	Clave         string       `json:"clave,omitempty" bson:"clave"`
	FechaCreacion time.Time    `json:"fechacreacion,omitempty" bson:"fechacreacion"`
	Estatus       int          `json:"estatus" bson:"estatus"`
	Token         string       `json:"token,omitempty" bson:"token"`
	Perfil        Perfil       `json:"Perfil,omitempty" bson:"Perfil"`
	FirmaDigital  FirmaDigital `json:"FirmaDigital,omitempty" bson:"firmadigital"`
	Aplicacion    []Aplicacion `json:"Aplicacion,omitempty" bson:"Aplicacion"`
}

//Aplicacion las diferentes aplicaciones del sistema
type Aplicacion struct {
	Id         string `json:"id"`
	Nombre     string `json:"nombre"`
	URL        string `json:"url"`
	Origen     string `json:"origen"`
	Comentario string `json:"comentario"`
	Version    string `json:"version"`
	Autor      string `json:"autor"`
	Rol        Rol    `json:"Rol,omitempty" bson:"Rol"`
}

// Perfil
type Perfil struct {
	Descripcion  string `json:"descripcion,omitempty"`
	Situacion    string `json:"situacion,omitempty" bson:"situacion"` //PM - PC
	Sucursal     string `json:"sucursal,omitempty" bson:"sucursal"`
	Departamento string `json:"departamento,omitempty" bson:"departamento"`
	Direccion    string `json:"direccion,omitempty" bson:"direccion"`
	Telefono     string `json:"telefono,omitempty" bson:"telefono"`
	Cargo        string `json:"cargo,omitempty" bson:"cargo"`
}

type Rol struct {
	Id          string `json:"id"`
	Nombre      string `json:"nombre"`
	Descripcion string `json:"descripcion" bson:"descipcion"`
	Menu        []Menu `json:"Menu,omitempty", bson:"Menu"`
}

// Privilegio
type Privilegio struct {
	Metodo      string `json:"nombre"`
	Descripcion string `json:"descripcion"`
	Accion      string `json:"accion"`
	Directiva   string `json:"directiva"`
}

//Menu
type Menu struct {
	Url         string       `json:"url,omitempty"`
	Js          string       `json:"js,omitempty"`
	Icono       string       `json:"icono,omitempty"`
	Nombre      string       `json:"nombre,omitempty"`
	Accion      string       `json:"accion,omitempty"`
	Clase       string       `json:"clase,omitempty"`
	Color       string       `json:"color,omitempty"`
	Privilegios []Privilegio `json:"Privilegios,omitempty"`
	SubMenu     []SubMenu    `json:"SubMenu,omitempty", bson:"SubMenu"`
}

//SubMenu
type SubMenu struct {
	Url         string       `json:"url,omitempty"`
	Js          string       `json:"js,omitempty"`
	Icono       string       `json:"icono,omitempty"`
	Nombre      string       `json:"nombre,omitempty"`
	Accion      string       `json:"accion,omitempty"`
	Clase       string       `json:"clase,omitempty"`
	Color       string       `json:"color,omitempty"`
	Privilegios []Privilegio `json:"Privilegios,omitempty"`
}

//FirmaDigital La firma permite identificar una maquina y persona autorizada por el sistema
type FirmaDigital struct {
	DireccionMac string    `json:"direccionmac,omitempty" bson:"direccionmac"`
	DireccionIP  string    `json:"direccionip,omitempty" bson:"direccionip"`
	Tiempo       time.Time `json:"tiempo,omitempty" bson:"tiempo"`
}

type RespuestaToken struct {
	Token string `json:"token"`
}

func (f *FirmaDigital) Registrar() bool {

	return true
}

//Salvar Metodo para crear usuarios del sistema
func (usr *Usuario) Salvar() (err error) {
	//usr.ID = bson .NewObjectId()
	usr.Clave = util.GenerarHash256([]byte(usr.Clave))
	usr.FechaCreacion = time.Now()
	fmt.Println("Creando Usuario")

	c := sys.MongoDB.Collection(sys.CUSUARIO)
	_, err = c.InsertOne(sys.Contexto, usr)
	return

}

//Validar Usuarios
func (usr *Usuario) Validar(login string, clave string) (err error) {
	usr.Nombre = ""
	c := sys.MongoDB.Collection(sys.CUSUARIO)
	//.Select(bson.M{"clave": false})
	err = c.FindOne(sys.Contexto, bson.M{"login": login, "clave": clave}).Decode(&usr)
	if err != nil {
		fmt.Println("Error: Validar usuario # ", err.Error())

	}

	return err
}

//CambiarClave Usuarios
func (usr *Usuario) CambiarClave(login string, clave string, nueva string) (err error) {
	usr.Nombre = ""
	c := sys.MongoDB.Collection("usuario")
	actualizar := make(map[string]interface{})
	actualizar["clave"] = util.GenerarHash256([]byte(nueva))
	antigua := util.GenerarHash256([]byte(clave))

	_, err = c.UpdateOne(sys.Contexto, bson.M{"login": login, "clave": antigua}, bson.M{"$set": actualizar})

	return
}

//Consultar el sistema de usuarios
func (usr *Usuario) Consultar(cedula string) (j []byte, err error) {
	usr.Nombre = ""
	c := sys.MongoDB.Collection("usuario")
	//.Select(bson.M{"clave": false})
	err = c.FindOne(sys.Contexto, bson.M{"cedula": cedula}).Decode(&usr)
	j, _ = json.Marshal(usr)
	return
}

//Listar el sistema de usuarios
func (usr *Usuario) Listar() (j []byte, err error) {
	var lstUsuario []Usuario
	c := sys.MongoDB.Collection("usuario")
	//Select(bson.M{"clave": false}).All
	err = c.FindOne(sys.Contexto, bson.M{}).Decode(&lstUsuario)
	j, _ = json.Marshal(lstUsuario)
	return
}
