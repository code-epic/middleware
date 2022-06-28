#!/bin/bash


#Press Ctrl+c capture exit system
trap ctrl_c INT 

function ctrl_c() { 
	tput cnorm 
	echo "\n\n[!] Saliendo del escaneo...\n\n" 
	exit 1
}


#Define function for help contents
function HelpFunc(){
	echo -e "\n\n Uso de la herramiento ./epic-tools.sh "
	echo -e "\n\t -s : Escanear rango de IP: "
	echo -e "\n\t\t 192.168.12.100-200"
	echo -e "\n\t -i : Instalar servicio code-epicd "
	echo -e "\n\t -c : Compilar code-epicd "
	echo -e "\n\t -v : Verificar dependicencias, Base de datos, Archivos de rutas y logs "
	echo -e "\n\t -u : Actualizar la version "
	echo -e "\n\t -h : Muestra la ayuda de la herramienta\n\n"
	tput cnorm; 
	exit 1
}


#Scan range ip machine desde hasta 192.0.0.1-10
function ScanRange(){
	IFS='.' read -r -a xip <<< "$addrs"
	ip="${xip[0]}.${xip[1]}.${xip[2]}"

	IFS='-' read -r -a xrango <<< "${xip[@]: -1}"
	x=${xrango[0]}
	y=${xrango[1]}
	
	for i in $(seq $x $y); do
		bash -c "ping -c 1 -W 0.1 $ip.$i" > /dev/null 2>&1 && echo "[+] HOST $ip.$i - ACTIVO "
	done; wait
}

function ScanForIP(){
	IFS=',' read -r -a xip <<< "$addrs"
	for ip in ${xip[@]}; do
		bash -c "ping -c 1 -W 0.1 $ip" > /dev/null 2>&1 && echo "[+] HOST $ip - ACTIVO "
	done; wait
}

#Config Directory
function ConfigDirectory(){
	echo -e "\nCreando directorios de respaldo de contenido\n"
	mkdir -p tmp/file/out
	mkdir -p tmp/file/source
	mkdir -p tmp/logs
	mkdir -p tmp/qr
}

#Verify requirements for system
#DataBase and command
function VerifyDependens(){
   echo -e "Verificando dependencias..."	
}
function GenerarRSA(){
	openssl genrsa -out sys/seguridad/private.rsa 4096
	openssl rsa -in sys/seguridad/private.rsa -pubout -out sys/seguridad/public.rsa.pub
}

#Build version diferents system
#GOARCH=amd64 GOOS=darwin|linux|window
#go build 
#-ldflags "-X github.com/code-epic/middleware/sys.Version=$(git describe --tags)" 
#-o ${BINARY_NAME}-darwin app.go
function Compile(){
	ConfigDirectory
	GenerarRSA
	go build -ldflags "-s -w -X github.com/code-epic/middleware/sys.Version=$(git describe --tags)" -o code-epicd
	echo -e "\n[+] En hora buena compilacion exitosa\n"
	upx code-epicd

	echo -e "\n[+] Felicitaciones el recuso se ha comprimido"
	exit 0

}

function Install(){
	exit 1
}

#Main Function Script
declare -i pCount=0; while getopts "i:c:s:r:h" arg; do
	case $arg in
		s) addrs=$OPTARG ;let pCount+=1 ; ScanRange;;
		r) addrs=$OPTARG ;let pCount+=1 ; ScanForIP;;
		i) sys=$OPTARG ;let pCount+=1 ; Install;;
		c) sys=$OPTARG ;let pCount+=1 ; Compile;;
		h) HelpFunc;;
	esac
done


if [ $pCount -eq 0 ]; then
	HelpFunc
fi
