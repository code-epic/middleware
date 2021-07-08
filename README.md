# Middleware

## Administración de datos distribuidas
Middleware o lógica de intercambio de información entre aplicaciones (interlogical), o Agente Intermedio, es un software que asiste a una aplicación para interactuar o comunicarse con otras aplicaciones, o paquetes de programas, redes, hardware o sistemas operativos. Este simplifica el trabajo de los programadores en la compleja tarea de generar las conexiones y sincronizaciones que son necesarias en los sistemas distribuidos. De esta forma, se provee una solución que mejora la calidad de servicio, así como la seguridad, el envío de mensajes, la actualización del directorio de servicio, etc.

Funciona como una capa de abstracción de software distribuida, que se sitúa entre las capas de aplicaciones y las capas inferiores (sistema operativo y red). El middleware abstrae de la complejidad y heterogeneidad de las redes de comunicaciones subyacentes, así como de los sistemas operativos y lenguajes de programación, proporcionando una API para la fácil programación y manejo de aplicaciones distribuidas. Dependiendo del problema a resolver y de las funciones necesarias, serán útiles diferentes tipos de servicios de middleware. Por lo general el middleware del lado cliente está implementado por el Sistema Operativo, el cual posee las bibliotecas que ejecutan todas las funcionalidades para la comunicación a través de la red.

## Tabla de contenido		
-	Introducción	
-	Cómo Funciona	
-	Redes Informáticas	
    -	Comunicaciones	
    -	Conexiones	
-	Aplicaciones	
-	Seguridad Informática	
    -	Seguridad basada En tokens	
    -	Seguridad basada en roles	
    -	Seguridad basada en perfiles	
    -	Seguridad basada en directivas	
-	CodeEpic Enterprise Service Bus (CESB)	
    -	API Interfaz de Programacion de Aplicaciones	
    -	Crear API REST FULL	
        -	Protocolos	
        -	Un Tipo de API	
        -	La Funcion o EndPoint	
        -	Drivers	
        -	Metodos de Peticiones HTTP	
        -	Código a partir de una Interfaz Grafica de Usuario (GUI)	
        -	Consumidores	
        -	Cache	
        -	Entorno	
-	Implementar Conexiones para WebSocket	
-	Bibliografias	

## Objetivo 
CodeEpic Middleware conecta distintas arquitecturas de aplicaciones permitiendo compatibilizar esas estructuras así logra ofrecer métodos en los diferentes ámbitos de conexión como son los entornos de: desarrollo, calidad y producción implantado un nuevo escenario para pruebas de integridad transfiriendo datos de una aplicación a otra del mismo modo entre archivos y/o base de datos.
La plataforma es un software que se conecta a otros sistemas y protocolos lo que sirve para:
-	Disimular una red desarticulada y distribuida.
-	Generar homogeneidad en un conjunto de aplicaciones de software
-	Proporcionar una interfaz uniforme a los desarrolladores para el desarrollo, usabilidad e interoperabilidad de sus aplicaciones
-	Ofrecer un grupo de servicios genéricos que permite que las aplicaciones funcionen conjuntamente y evita que los sistemas dupliquen esfuerzos

Asimismo, el middleware contribuye al desarrollo de aplicaciones proporcionando habituales abstracciones de programación, enmascarando la heterogeneidad de aplicaciones y la distribución de hardware y sistemas operativos subyacentes, y ocultando la información de programación de bajo nivel. Ayudar a los desarrolladores, los arquitectos y los líderes empresariales y de TI a automatizar las decisiones manuales, lo cual mejora la gestión de los recursos y el nivel de eficiencia general.
El middleware admite tiempos de ejecución conocidos y modernos para varios casos prácticos. Los desarrolladores y los arquitectos pueden trabajar con agilidad en diferentes plataformas, teniendo como referencia conjuntos de lenguajes de programación, marcos y tiempos de ejecución básicos. También ofrece las funciones que se utilizan con más frecuencia, como los servidores web, el inicio de sesión único (SSO), el servicio de mensajería y el almacenamiento en caché en memoria. permite que los desarrolladores conviertan las aplicaciones monolíticas heredadas en aplicaciones nativas de la nube, lo cual mantiene activas las herramientas importantes con un rendimiento mejorado y una mayor portabilidad.

Las herramientas de integración de middleware conectan sistemas internos y externos fundamentales. Las funciones de integración, como la transformación, la conectividad, la capacidad de composición y la mensajería empresarial, en combinación con la autenticación de SSO, permiten que los desarrolladores extiendan las funciones a otras aplicaciones con facilidad.
A muchos de los servicios de middleware se accede a través de las API, que son conjuntos de herramientas, definiciones y protocolos que permiten que las aplicaciones se comuniquen entre sí. Gracias a las API, es posible conectar productos y servicios completamente distintos con una capa común.
Si bien las API son una forma de compartir los datos entre las aplicaciones, otro enfoque es la transmisión de datos asíncrona, la cual replica un conjunto de datos en un almacén intermedio, donde los datos se pueden compartir entre varias aplicaciones. Una herramienta de middleware open source conocida para la transmisión de datos en tiempo real es RethingDB. 


## DEBIAN
sudo apt install unixodbc-dev


## Installation

### Iniciar desde GitHub

``` bash
# definir variables de entorno
$ go env -w GOPRIVATE=github.com/code-epic/*

$ env GIT_TERMINAL_PROMPT=1 go get github.com/code-epic/middleware


# acceder a la carpeta
$ cd public_web/panel/

# ejecutar el comando 
# esto instalará los modulos de NodeJS
$ npm install

```

## Usage

``` bash
# en la raiz
$ go run app.go

# acceder a public_web/panel y ejecutar el servidor en localhost:4200.
$ ng serve

# con minification para produccion se accede por https://localhost/code-epic/
$ ng build
```

