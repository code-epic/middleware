//cifrado
package cifrado

//Cifrado
type Cifrado interface {
	Encriptar() ([]byte, error)
	Desencriptar() ([]byte, error)
}

//AES
type AES struct {
}

//ECC
type ECC struct {
}

//RSA
type RSA struct {
}
