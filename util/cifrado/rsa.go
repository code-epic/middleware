/**
En criptografía, RSA (Rivest, Shamir y Adleman) es un sistema
criptográfico de clave pública desarrollado en 1979, que utiliza
factorización de números enteros. Es el primer y más utilizado
algoritmo de este tipo y es válido tanto para cifrar como para firmar digitalmente.
La seguridad de este algoritmo radica en el problema de la factorización de números
enteros. Los mensajes enviados se representan mediante números, y el funcionamiento
se basa en el producto, conocido, de dos números primos grandes elegidos al
azar y mantenidos en secreto. Actualmente estos primos son del orden de 10^300, y se
prevé que su tamaño siempre crezca con el aumento de la capacidad de cálculo de los ordenadores.
*/
package cifrado

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"encoding/pem"
	"errors"
)

func Generar() (pubPEM []byte, keyPEM []byte) {
	bitSize := 4096
	key, err := rsa.GenerateKey(rand.Reader, bitSize)
	if err != nil {
		panic(err)
	}

	// Extract public component.
	pub := key.Public()

	// Encode private key to PKCS#1 ASN.1 PEM.
	keyPEM = pem.EncodeToMemory(
		&pem.Block{
			Type:  "RSA PRIVATE KEY",
			Bytes: x509.MarshalPKCS1PrivateKey(key),
		},
	)

	// Encode public key to PKCS#1 ASN.1 PEMea.r
	pubASN1, err := x509.MarshalPKIXPublicKey(pub)
	if err != nil {
		panic(err)
	}

	pubPEM = pem.EncodeToMemory(
		&pem.Block{
			Type:  "RSA PUBLIC KEY",
			Bytes: pubASN1,
		},
	)

	/** Write private key to file.
		if err := ioutil.WriteFile(filename+".rsa", keyPEM, 0700); err != nil {
			panic(err)
		}

		// Write public key to file.
		if err := ioutil.WriteFile(filename+".rsa.pub", pubPEM, 0755); err != nil {
			panic(err)
		}
	**/
	return
}

// cifrado
func RsaEncrypt(origData []byte, publicKey []byte) ([]byte, error) {

	//	fmt.Println(string(publicKey))
	block, _ := pem.Decode(publicKey)
	if block == nil {
		return nil, errors.New("public key error")
	}
	pubInterface, err := x509.ParsePKIXPublicKey(block.Bytes)
	if err != nil {
		return nil, err
	}
	pub := pubInterface.(*rsa.PublicKey)
	return rsa.EncryptPKCS1v15(rand.Reader, pub, origData)
}

// descifrar
func RsaDecrypt(ciphertext []byte, privateKey []byte) ([]byte, error) {
	//fmt.Println(string(privateKey))
	block, _ := pem.Decode(privateKey)
	if block == nil {
		return nil, errors.New("private key error!")
	}
	priv, err := x509.ParsePKCS1PrivateKey(block.Bytes)
	if err != nil {
		return nil, err
	}
	return rsa.DecryptPKCS1v15(rand.Reader, priv, ciphertext)
}

/**
func main() {
	publickey, privatekey := Generar()
	data, err := RsaEncrypt([]byte("test data......"), publickey)
	if err != nil {
		fmt.Println("Error")
	}

	fmt.Println("-------------------")

	fmt.Println(base64.StdEncoding.EncodeToString(data))

	fmt.Println("-------------------")
	origData, _ := RsaDecrypt(data, privatekey)
	fmt.Println(string(origData))
}**/
