package qr

import (
	"fmt"

	qrcode "github.com/skip2/go-qrcode"
)

type Qr struct{}

func (Q *Qr) Generar(idApp string, hashEncode string, vesrion string) error {
	var code = "https://code-epic.com/vqr86/" + idApp + "/" + hashEncode
	err := qrcode.WriteFile(code, qrcode.Medium, 256, "tmp/qr/"+hashEncode+".png")
	if err != nil {
		fmt.Println("write error")
	}
	fmt.Println("Generacion de qr exitosa")
	return err
}
