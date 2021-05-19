// En informática, una caché, antememoria o memoria intermedia es un componente de hardware o
// software que guarda datos para que las solicitudes futuras de esos datos se puedan atender
// con mayor rapidez; los datos almacenados en una caché pueden ser el resultado de un cálculo
// anterior o el duplicado de datos almacenados en otro lugar, generalmente, da velocidad de acceso
// más rápido. Se produce un acierto de caché cuando los datos solicitados se pueden encontrar en esta,
// mientras que un fallo de caché ocurre cuando no están dichos datos. La lectura de la caché es más
// rápida que volver a calcular un resultado o leer desde un almacén de datos más lento; por lo tanto,
// cuantas más solicitudes se puedan atender desde la memoria caché, más rápido funcionará el sistema.

package cache

import "go.mongodb.org/mongo-driver/bson/primitive"

//Cache componente para operar datos como resultados
type XCache struct {
	Patron    string             `json:"patron"`
	Contenido string             `json:"contenido"`
	Intencion int                `json:"intencion"`
	Peso      string             `json:"peso"`
	Origen    primitive.ObjectID `json:"origen"`
	Funcion   string             `json:"funcion"`
}
