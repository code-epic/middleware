package cifrado

import "strings"

type Rot struct {
}

func (R *Rot) encrypt(r rune) rune {
	isLowerCase := r >= 'a' && r <= 'z'
	isUpperCase := r >= 'A' && r <= 'Z'

	if isLowerCase {

		if r >= 'm' {
			return r - 13
		} else {
			return r + 13
		}
	} else if isUpperCase {
		if r >= 'M' {
			return r - 13
		} else {
			return r + 13
		}
	}
	return r
}

func (R *Rot) Encrypt(cadena string) string {
	mapper := strings.Map(R.encrypt, cadena)
	return string(mapper)
}
