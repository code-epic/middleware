// se refiere a la confianza en algo.
package seguridad

import (
	"crypto/rsa"
	"io/ioutil"
	"time"

	"github.com/code-epic/middleware/util"
	jwt "github.com/golang-jwt/jwt/v4"
)

//Constantes Generales
const (
	ENCRIPTAMIENTO             = "md5"
	ACTIVARLIMITECONEXIONES    = true
	DESACTIVARLIMITECONEXIONES = false
)

//Variables de Seguridad
var (
	LlavePrivada *rsa.PrivateKey
	LlavePublica *rsa.PublicKey
	LlaveJWT     string
)

//init Función inicial del sistema
func init() {
	bytePrivados, err := ioutil.ReadFile("./sys/seguridad/private.rsa")
	util.Fatal(err)
	LlavePrivada, err = jwt.ParseRSAPrivateKeyFromPEM(bytePrivados)
	util.Fatal(err)
	bytePublicos, err := ioutil.ReadFile("./sys/seguridad/public.rsa.pub")
	util.Fatal(err)
	LlavePublica, err = jwt.ParseRSAPublicKeyFromPEM(bytePublicos)
	util.Fatal(err)
}

//GenerarJWT Json Web Token
func GenerarJWT(u Usuario, tiempo time.Duration) string {
	peticion := Reclamaciones{
		Usuario: u,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(tiempo).Unix(),
			Issuer:    "Code Epic Technologies ",
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodRS256, peticion)
	rs, e := token.SignedString(LlavePrivada)
	util.Fatal(e)
	return rs
}

//WGenerarJWT Json Web Token
func WGenerarJWT(u WUsuario) string {
	peticion := WReclamaciones{
		WUsuario: u,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(time.Second * 360).Unix(),
			Issuer:    "Code Epic Technologies",
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodRS256, peticion)
	rs, e := token.SignedString(LlavePrivada)
	util.Fatal(e)
	return rs
}

//GenerarJWT Json Web Token Dinamico Para desarrollo de Terceros
func GenerarJWTDinamico(u interface{}, tiempo time.Duration) string {
	peticion := ReclamacionesDinamicas{
		Usuario: u,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(tiempo).Unix(),
			Issuer:    "Code Epic Technologies Dynamic",
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodRS256, peticion)
	rs, e := token.SignedString(LlavePrivada)
	util.Fatal(e)
	return rs
}
