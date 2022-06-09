package cifrado_test

import (
	"strconv"
	"testing"

	"github.com/code-epic/middleware/util/cifrado"
)

var test = []func(t *testing.T){

	func(t *testing.T) {
		var cif cifrado.Rot
		encrypt := cif.Encrypt("Copyright CodeEpic")
		println(encrypt)
		t.Log("Iniciando procesos de validacion de cifrados")
		decript := cif.Encrypt(encrypt)
		println(decript)
	},
}

func TestGenerarCifrados(t *testing.T) {
	for i, fn := range test {
		t.Run(strconv.Itoa(i), fn)
	}

}
