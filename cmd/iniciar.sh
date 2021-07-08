#!/bin/sh



echo "Bajando el servicio code.esb"
echo "Por favor espere..."
pkill code.esb


echo "Eliminando la versión actual del servicio code.esb"
echo "Por favor	espere..."
rm -rf code.esb

echo "Compilando la nueva versión del servicio code.esb"
echo "Por favor	espere..."
go build -o code.esb app.go


echo "Compilando la nueva versión de Angular"
echo "Por favor	espere..."
cd public_web/panel/
ng build

cd ../../
echo "Lanzando nueva versión del servicio code.esb"
echo "Por favor	espere..."
## ./code.esb &
go run app.go