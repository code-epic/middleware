-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-04-2022 a las 15:47:52
-- Versión del servidor: 8.0.22
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `code_epic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BOT_001_Chat`
--

CREATE TABLE `BOT_001_Chat` (
  `id` int UNSIGNED NOT NULL,
  `idio` varchar(8) DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `clas` varchar(32) DEFAULT NULL,
  `preg` text,
  `resp` text,
  `obse` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `BOT_001_Chat`
--

INSERT INTO `BOT_001_Chat` (`id`, `idio`, `tipo`, `clas`, `preg`, `resp`, `obse`) VALUES
(1, 'ESP', 'N', 'saludo', 'hola|Buenas|Buenos|Saludos|Quien Eres', '¡Hola! Soy Ipostelin, tu asistente virtual dispuesto a ayudarte para hacerte más fácil el día.\r\n\r\nCuéntame, ¿qué necesitas saber?', 'Saludo natural'),
(2, 'ESP', 'I', 'localizacion', '¿Dónde se encuentra ubicado mi paquete?|como ubico mi paquete|ubicacion de mi paquete', 'Debe comunicarse con su número de envió al 0212-405 3097, 3272, 3215, 3127, 3095, 3088. También se encuentra a su disposición nuestro WhatsApp \r\n0426-2156869', 'Como puedo ubicar mi paquete'),
(3, 'ESP', 'N', 'localizacion', '¿Cómo enviar un paquete?|como enviar paquetes', 'Desea consignar su envío desde Venezuela al extranjero o del extranjero a Venezuela?', 'envio de paquetes'),
(4, 'ESP', 'N', 'localizacion', '¿Cuándo llega mi paquete?|cuando llega mi envio|a que numero puedo llamar', 'Debe comunicarse con su número de envió al 0212-405 3097, 3272, 3215, 3127, 3095, 3088. También se encuentra a su disposición nuestro WhatsApp \r\n0426-2156869', 'Preguntas'),
(5, 'ESP', 'N', 'localizacion', '¿Cuál es mi oficina más cercana?', 'Por favor debe indicarnos su dirección y con gusto le informaremos cual es la oficina postal telegráfica mas cercana a su zona ', NULL),
(6, 'ESP', 'N', 'localizacion', '¿Cuáles son las oficinas disponibles?', ' Cronograma de apertura de las oficinas (CNC)', NULL),
(7, 'ESP', 'N', 'localizacion', '¿Cuáles son las oficinas de Caracas?', 'Cronograma de apertura de las oficinas (CNC)', NULL),
(8, 'ESP', 'I', 'reclamo', 'Realice un reclamo y no tengo respuesta| donde puedo hacer un reclamo|deseo hacer un reclamo', 'Debe comunicarse con su número de envió y reclamo al 0212-405 3097, 3272, 3215, 3127, 3095, 3088. También se encuentra a su disposición nuestro WhatsApp \r\n0426-2156869\r\nRealice un reclamo y no tengo respuesta', 'donde hacer reclamos'),
(9, 'ESP', 'I', 'reclamo', 'Mi encomienda, paquete, se encuentra en mal estado|encomiendo dañada|reclamar paquete', 'Usted debe comunicarse al 0212-405 3097, 3272, 3215, 3127, 3095, 3088.', NULL),
(10, 'ESP', 'I', 'reclamo', '¿Dónde puedo llamar para hacer un reclamo formal?|deseo hacer un reclamo|donde puedo reclamar', 'Si el envío es consignación nacional. Usted debe comunicarse al 0212-405 3097, 3272, 3215, 3127, 3095, 3088. También se encuentra a su disposición nuestro WhatsApp \r\n0426-2156869.\r\n\r\nSi es consignación al extranjero. Su remitente debe dirigirse a la oficina postal internacional de origen donde consignó el envío para realizar su reclamo formal.\r\n', NULL),
(11, 'ESP', 'I', 'reclamo', '¿Por qué mi paquete no llega?|mi paquete se extravio| envio extraviado', 'Debe comunicarse con su número de envió al 0212-405 3097, 3272, 3215, 3127, 3095, 3088.', NULL),
(12, 'ESP', 'I', 'reclamo', '¿Me cobraron sobreprecio en el envió?', 'Usted debe comunicarse al 0212-405 3097, 3272, 3215, 3127, 3095, 3088. También se encuentra a su disposición nuestro WhatsApp \r\n0426-2156869', NULL),
(13, 'ESP', 'I', 'reclamo', '¿Existe un lugar donde pueda ir a reclamar en persona?', 'Puede dirigirse a nuestra oficina principal ubicada en la av. José Ángel Lamas, Edificio Centro Postal Caracas PB División de reclamaciones nacionales e internacionales, San Martín 1020 Caracas o en cualquiera de nuestras oficinas Postales Telegráficas en el ámbito Nacional y con gusto le atenderán.', NULL),
(14, 'ESP', 'I', 'asistencia', '¿Cuánto sale enviar un paquete desde, hasta?', 'Desplegar el cátalo de servicio y luego de elegido el mismo se calcula el peso volumétrico', NULL),
(15, 'ESP', 'I', 'asistencia', '¿Qué horarios hay disponibles?', ' Cronograma de apertura de las oficinas (CNC) <a href=\'\'>Descargar</a>', NULL),
(16, 'ESP', 'I', 'asistencia', '¿Cómo puedo saber el código de una oficina?', 'Indíqueme por favor el nombre de oficina o  dirección y con gusto le indicaremos la información.', NULL),
(17, 'ESP', 'I', 'asistencia', '¿Cuánto tiempo tarda un envió al exterior?', 'Esta información depende del país de origen donde se realizó la consignación y el destino del mismo.', NULL),
(18, 'ESP', 'I', 'pregunta frecuente', 'modalidad de envio|modalidades de envio|forma de envio|logistica de envio', 'Tres Modalidades <br>\r\n1.- Integral:\r\nNos adaptamos a la necesidad, Solicite la asesoría de un ejecutivo de ventas. <br>\r\n2.- Taquilla:\r\nTraslado de paquetería hasta 30 kilos Por pieza, en mas de 200 Oficinas. <br>\r\n3.- Flete:\r\nTraslados urbanos y nacionales, dispones de vehículos Pick Up, Camiones\r\n350, 750 y NPR.', 'extraido del catalogoservicios.pdf'),
(19, 'ESP', 'N', 'preguntas frecuentes', 'que es EEB|envios expresos bolivariano| eeb| envio expreso| envios expresos ', 'Servicio Expreso de envió de\r\nCorrespondencia, Documentos\r\ncon Cobertura Nacional.', 'extraido del catalogoservicios.pdf'),
(20, 'ESP', 'N', 'preguntas frecuentes ', 'cual es la cobertura del eeb| cobertura de los envios expresos bolivarianos ', 'cobertura de los envios expresos bolivarianos (EEB):\r\n1.- Urbano:\r\nPiezas Consignadas en una Ciudad con\r\ndestino dentro de la misma Ciudad. <br>\r\n2.- Intraestatal:\r\nPiezas Consignadas en una Ciudad con\r\ndestino a otra Ciudad en el mismo Estado. <br>\r\n3.- Nacional:\r\nPiezas Consignadas en Estado con\r\ndestino a otro Estado.', 'extraido del catalogoservicios.pdf'),
(21, 'ESP', 'N', 'preguntas frecuentes ', 'cual es la cobertura del eeb| cobertura de los envios expresos bolivarianos ', 'cobertura de los envios expresos bolivarianos (EEB):<br>\r\n1.- Urbano:\r\nPiezas Consignadas en una Ciudad con\r\ndestino dentro de la misma Ciudad. <br>\r\n2.- Intraestatal:\r\nPiezas Consignadas en una Ciudad con\r\ndestino a otra Ciudad en el mismo Estado. <br>\r\n3.- Nacional:\r\nPiezas Consignadas en Estado con\r\ndestino a otro Estado.', 'extraido del catalogoservicios.pdf'),
(22, 'ESP', 'N', 'preguntas frecuentes', 'que es express mail service | que es ems| express mail service ', 'servicio expreso de recepción y envíos de paquetes, documentos y mercaderías internacional.', 'extraido del catalogoservicios.pdf'),
(23, 'ESP', 'N', 'preguntas frecuentes', 'cual es la cobertura EMS| cobertura express mail service| cobertura ems', 'la cobertura internacional del express mail service (EMS): <br>\r\nA.- América y el Caribe. <br>\r\nB.- Europa. <br>\r\nC.- África, Asia y Oceanía.\r\n', 'extraido del catalogoservicios.pdf'),
(24, 'ESP', 'I', 'preguntas frecuentes', 'Características del Servicio EMS| caracteristicas del express mail service', 'Características del Express Mail Service (EMS): <br>\r\n✓ Seguimiento y Rastreo a través del “Sistema Internacional Postal System (IPS).<br>\r\n✓ Limite de peso hasta 30 kilos.<br>\r\n✓ Cobertura Nacional.<br>\r\n✓ Entrega rápida y segura.<br>\r\n✓ Pago de contado o crédito.>br>\r\n✓ Tarifas económicas por peso volumétrico. <br>', 'extraido del catalogoservicios.pdf'),
(27, 'ESP', 'I', 'preguntas frecuentes', 'peso volumetrico EMS| peso volumetrico del espress mail service', 'A todos nuestros servicios de paquetería, se le aplica el calculo de peso volumétrico.<br>\r\nEnvíos Nacionales: <br>\r\nlargo cm x ancho cm x alto (cm)/5000 (cm3) <br>\r\nEnvíos Internacionales: <br>\r\nlargo cm x ancho cm x alto (cm)/6000 (cm3) ', 'extraido del catalogoservicios.pdf'),
(29, 'ESP', 'I', 'preguntas frecuentes', 'Limites de Dimensiones Admitidas en el express mail service| Limites de Dimensiones Admitidas del EMS', 'Limites de Dimensiones Admitidas en el express mail service (EMS): <br>\r\nQue no excedan de dos (2) metros en\r\ncualquier de sus lados, ni de tres (3) metros La suma de su Largo, ancho y alto.', 'extraido del catalogoservicios.pdf'),
(30, 'ESP', 'I', 'preguntas frecuentes', 'requisitos para el retiro de encomiendas EMS| requisitos para el retiro de pequeños paquetes EMS sujetos a control de aduanas| requisitos para el retiro de encomiendas express mail service| requisitos para el retiro de pequeños paquetes express mail service sujetos a control de aduanas', 'Requisitos para el retiro de pequeños paquetes del express mail service (EMS) sujetos a control de aduanas: <br>\r\n1.- Persona Natural: <br>\r\n01 fotocopia de la cédula de identidad.>br>\r\nTimbres fiscales por 0.25 (U.T) <br>\r\n01 estampilla postal (bs). <br>\r\n01 Fotocopia del RIF personal. <br>\r\n(Adicional): <br>\r\n2.- Persona Jurídica: <br>\r\n01 Fotocopia del registro mercantil. <br>\r\n01 Fotocopia del RIF empresarial. <br>\r\n3.- Autorizado: <br>\r\nAutorización original y copia. <br>\r\n01 copia de la fotocopia de la cédula del que autoriza.\r\n01 fotocopia del RIF del que autoriza.\r\n', 'extraido del catalogoservicios.pdf'),
(32, 'ESP', 'I', 'preguntas frecuentes', 'pasos para el retiro de encomiendas EMS| pasos para el retiro de encomiendas Express Mail Service', 'Pasos para el retiro de encomiendas Express Mail Service (EMS): <br>\r\n1.- Solicita el envió en taquilla. <br>\r\n2.- Realiza reconocimiento ante el Seniat. <br>\r\n3.- Efectúa el pago en el banco. <br>\r\n4.- Retira el Envió.', 'extraido del catalogoservicios.pdf'),
(33, 'ESP', 'N', 'preguntas frecuentes', 'sevicios postales internacionales| spu| que es servicios postales universales| concepto servicios postales universales ', 'Es el conjunto de servicios postales\r\nbásicos de calidad, disponibles a todos y\r\ntodas los habitantes del territorio\r\nnacional en todo momento, con un valor\r\nasequible cuya prestación es de carácter\r\nobligatorio por el operador designado', 'extraido del catalogoservicios.pdf'),
(34, 'ESP', 'N', 'preguntas frecuentes', 'cual es la Cobertura Nacional e Internacional de servicios postales universales| cual es la Cobertura Nacional e Internacional de spu', '✓ Cartas. <br>\r\n✓ Impresos. <br>\r\n✓ Tarjetas Postales. <br>\r\n✓ Cecograma ( envíos para personas con discapacidad visual).<br>\r\n✓ Pequeño Paquete. <br>\r\n', 'extraido del catalogoservicios.pdf'),
(35, 'ESP', 'N', 'preguntas frecuentes', 'que es el Apartado Postal| apartado postal| ap', 'Domicilio postal, el cual consiste en una casilla numerada, de que se otorga en\r\narrendamiento a las personas Naturales y Jurídicas con el objeto de recibir su\r\ncorrespondencia nacional e internacional.\r\n*Todo envió postal mayor a dos 2 kilos entrega por taquilla y paga la tarifa correspondiente.', 'extraido del catalogoservicios.pdf'),
(36, 'ESP', 'N', 'preguntas frecuentes', 'que es una Encomienda Internacionale| que son las Encomiendas Internacionales| EI| encomienda internacional', 'Paquetes y bultos que contienen mercaderías con un peso unitario máximo de veinte 20\r\nkilos, con seguimiento a través del Sistema Postal Internacional “Internacional Postal System”.', 'extraido del catalogoservicios.pdf'),
(37, 'ESP', 'N', 'preguntas frecuentes ', 'que es el servicio telegrafico| telegrafo| telegrafia| st', 'Escrito destinado a ser escrito por\r\ntelegrafía, para ser entregado al\r\ndestinatarios con cobertura nacional.<br>\r\nTelegrama Ordinario:<br>\r\nEscrito cuya aceptación es obligatoria y\r\nno lleva ninguna indicación de servicio.<br>Telegrama Urgente:<br>\r\nEscrito que se le da prioridad para su\r\ntransmisión y entrega al destinatario.\r\n\r\n\r\n', 'extraido del catalogoservicios.pdf'),
(38, 'ESP', 'I', 'preguntas frecuentes', 'servicios de telegrama| tipos de servicios de telegramas| servicio telegrafico ', 'servicios telegraficos:<br>\r\n1.- Copia certificada: Servicio donde el expedidor o destinatarios tiene derecho de solicitar una copia certificada de su telegrama.<br>\r\n2.- Petición de Confirmación de Entrega (PC): Es un aviso de servicio donde se le informa al remitente, fecha y datos personales de quién recibe el telegrama.<br>\r\n3.- Telefonograma: Consiste en consignar telegramas con destino nacional, a través de una llamada telefónica desde su casa u oficina marcando el numero telefónico 0800- IPOSTEL y/o (0212) 405-30-78.\r\n\r\n', 'extraido del catalogoservicios.pdf'),
(39, 'ESP', 'N', 'preguntas frecuentes', 'que es la filatelia| filatelia|f', 'la filatelia: <br>\r\nEs el arte del conocimiento, estudio y coleccionismo de los sellos\r\npostales, a través del cual se muestra la historia, cultura, ciencia,\r\ndeporte, política, paisajes naturales, arte, flora, el universo entre otros.', 'extraido del catalogoservicios.pdf'),
(40, 'ESP', 'I', 'preguntas frecuentes', 'Servicio de Abonados de filatelia| servicos abonados| filatelia ipostel| ', 'servicios abonados:\r\n<br>Consiste en la suscripción y asignación de un numero de registro mediante el cual\r\nlos interesados realizan abonos anticipados por una determinada cantidad de\r\nbolívares, en aras de garantizar la recepción de nuevas emisiones filatélicas una vez puestas en circulación. <br>\r\nLa suscripción es gratuita y podrá realizarse a través del siguiente correo electrónico:<br>\r\nfilatelia.ipostel@gmail.com', 'extraido del catalogoservicios.pdf'),
(41, 'ESP', 'I', 'preguntas frecuentes', 'Servicio de Abonados de filatelia| servicos abonados| filatelia ipostel| ', 'servicios abonados:\r\n<br>Consiste en la suscripción y asignación de un numero de registro mediante el cual\r\nlos interesados realizan abonos anticipados por una determinada cantidad de\r\nbolívares, en aras de garantizar la recepción de nuevas emisiones filatélicas una vez puestas en circulación. <br>\r\nLa suscripción es gratuita y podrá realizarse a través del siguiente correo electrónico:<br>\r\nfilatelia.ipostel@gmail.com', 'extraido del catalogoservicios.pdf'),
(42, 'ESP', 'N', 'preguntas frecuentes', 'cuales son los Elementos Filatelicos| elementos filatelicos| ef| filatelia ipostel', 'Elementos Filatélicos:<br>\r\n✓ Estampilla Postal.<br>\r\n✓ Sobre del primer día de circulación.<br>\r\n✓ Boletín informativo.<br>\r\n✓ Matasello.<br>\r\n✓ Tarjetas Postales.<br>\r\n✓ Porta estampilla.<br>\r\n✓ Álbum Filatélico.<br>', 'extraido del catalogoservicios.pdf'),
(43, 'ESP', 'N', 'preguntas frecuentes', 'que es la imprenta postal| imprenta postal| ip', 'imprenta postal: <br>Servicio de Impresión en general, publicidad y nuestros servicios\r\npropaganda a precio justo.', 'extraido del catalogoservicios.pdf'),
(44, 'ESP', 'N', 'preguntas frecuentes ', 'impresiones de| impresiones| servicios de impresiones| tipo de impresiones ', 'servios de impresiones de: <br>\r\nTrípticos, Dípticos, Leyes, Afiches, Poster, Volantes, Agendas, Block, Carpetas.<br>\r\nCatálogos, Calcomanías, Calendarios, Producción de Editorial, Propaganda, Panfletos, Impresión de libros, Impresión de alta calidad, Impresión Offset, Etiquetas.', 'extraido del catalogoservicios.pdf'),
(45, 'ESP', 'N', 'preguntas frecuentes', 'cual es la estructura unica de la direccion postal en Venezuela| estructura de la direccion postal de Venezuela | direccion postal de Venezuela\r\n', 'Estructura única de la dirección postal en Venezuela: <br>\r\nRecuerda Mantener este Orden. <br>\r\n✓ Nombre de Persona Natural o Jurídica. <br>\r\n✓ Localidad. <br>\r\n✓ Inmueble. <br>\r\n✓ Parroquia. <br>\r\n✓ Municipio. <br>\r\n✓ Cuidad o Pueblo. <br>\r\n✓ Estado. <br>\r\n✓ País (Envíos con destinos Internacionales). <br>\r\n✓ Zona Posta. <br>', 'extraido del catalogoservicios.pdf'),
(47, 'ESP', 'N', 'preguntas frecuentes', 'Le enviarán una encomienda desde el exterior|Necesita realizar una compra electrónica internacional| pasos para recibir encomiendas internacionales| ei| encomiendas internacionales', 'Pasos para recibir encomiendas internacionales: <br>\r\n1.- Realice su compra en\r\nla tienda online de su preferencia. <br>\r\n2.- Gestione el envió a través del correo oficial del país. <br>\r\n3.- Asegúrese que el envió tenga el número de seguimiento (Tracking). <br>\r\n4.- Realice el envió a través de: 0800-IPOSTEL, www.ipostel.gob.ve <br>\r\n5.- Deberá pagar al Seniat si el valor del contenido excede de USD 100. <br>\r\n6.- Reciba su envió en un tiempo promedio: <br> * Desde América: 7 días.<br>\r\n* Otro Origen: 8 dias.\r\n\r\n\r\n\r\n', 'extraido del catalogoservicios.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GEO_001_Paises`
--

CREATE TABLE `GEO_001_Paises` (
  `id` int UNSIGNED NOT NULL,
  `code` smallint DEFAULT NULL,
  `iso3166a1` char(2) DEFAULT NULL,
  `iso3166a2` char(3) DEFAULT NULL,
  `nombre` varchar(128) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `GEO_001_Paises`
--

INSERT INTO `GEO_001_Paises` (`id`, `code`, `iso3166a1`, `iso3166a2`, `nombre`) VALUES
(1, 4, 'AF', 'AFG', 'Afganistán'),
(2, 248, 'AX', 'ALA', 'Islas Gland'),
(3, 8, 'AL', 'ALB', 'Albania'),
(4, 276, 'DE', 'DEU', 'Alemania'),
(5, 20, 'AD', 'AND', 'Andorra'),
(6, 24, 'AO', 'AGO', 'Angola'),
(7, 660, 'AI', 'AIA', 'Anguilla'),
(8, 10, 'AQ', 'ATA', 'Antártida'),
(9, 28, 'AG', 'ATG', 'Antigua y Barbuda'),
(10, 530, 'AN', 'ANT', 'Antillas Holandesas'),
(11, 682, 'SA', 'SAU', 'Arabia Saudí'),
(12, 12, 'DZ', 'DZA', 'Argelia'),
(13, 32, 'AR', 'ARG', 'Argentina'),
(14, 51, 'AM', 'ARM', 'Armenia'),
(15, 533, 'AW', 'ABW', 'Aruba'),
(16, 36, 'AU', 'AUS', 'Australia'),
(17, 40, 'AT', 'AUT', 'Austria'),
(18, 31, 'AZ', 'AZE', 'Azerbaiyán'),
(19, 44, 'BS', 'BHS', 'Bahamas'),
(20, 48, 'BH', 'BHR', 'Bahréin'),
(21, 50, 'BD', 'BGD', 'Bangladesh'),
(22, 52, 'BB', 'BRB', 'Barbados'),
(23, 112, 'BY', 'BLR', 'Bielorrusia'),
(24, 56, 'BE', 'BEL', 'Bélgica'),
(25, 84, 'BZ', 'BLZ', 'Belice'),
(26, 204, 'BJ', 'BEN', 'Benin'),
(27, 60, 'BM', 'BMU', 'Bermudas'),
(28, 64, 'BT', 'BTN', 'Bhután'),
(29, 68, 'BO', 'BOL', 'Bolivia'),
(30, 70, 'BA', 'BIH', 'Bosnia y Herzegovina'),
(31, 72, 'BW', 'BWA', 'Botsuana'),
(32, 74, 'BV', 'BVT', 'Isla Bouvet'),
(33, 76, 'BR', 'BRA', 'Brasil'),
(34, 96, 'BN', 'BRN', 'Brunéi'),
(35, 100, 'BG', 'BGR', 'Bulgaria'),
(36, 854, 'BF', 'BFA', 'Burkina Faso'),
(37, 108, 'BI', 'BDI', 'Burundi'),
(38, 132, 'CV', 'CPV', 'Cabo Verde'),
(39, 136, 'KY', 'CYM', 'Islas Caimán'),
(40, 116, 'KH', 'KHM', 'Camboya'),
(41, 120, 'CM', 'CMR', 'Camerún'),
(42, 124, 'CA', 'CAN', 'Canadá'),
(43, 140, 'CF', 'CAF', 'República Centroafricana'),
(44, 148, 'TD', 'TCD', 'Chad'),
(45, 203, 'CZ', 'CZE', 'República Checa'),
(46, 152, 'CL', 'CHL', 'Chile'),
(47, 156, 'CN', 'CHN', 'China'),
(48, 196, 'CY', 'CYP', 'Chipre'),
(49, 162, 'CX', 'CXR', 'Isla de Navidad'),
(50, 336, 'VA', 'VAT', 'Ciudad del Vaticano'),
(51, 166, 'CC', 'CCK', 'Islas Cocos'),
(52, 170, 'CO', 'COL', 'Colombia'),
(53, 174, 'KM', 'COM', 'Comoras'),
(54, 180, 'CD', 'COD', 'República Democrática del Congo'),
(55, 178, 'CG', 'COG', 'Congo'),
(56, 184, 'CK', 'COK', 'Islas Cook'),
(57, 408, 'KP', 'PRK', 'Corea del Norte'),
(58, 410, 'KR', 'KOR', 'Corea del Sur'),
(59, 384, 'CI', 'CIV', 'Costa de Marfil'),
(60, 188, 'CR', 'CRI', 'Costa Rica'),
(61, 191, 'HR', 'HRV', 'Croacia'),
(62, 192, 'CU', 'CUB', 'Cuba'),
(63, 208, 'DK', 'DNK', 'Dinamarca'),
(64, 212, 'DM', 'DMA', 'Dominica'),
(65, 214, 'DO', 'DOM', 'República Dominicana'),
(66, 218, 'EC', 'ECU', 'Ecuador'),
(67, 818, 'EG', 'EGY', 'Egipto'),
(68, 222, 'SV', 'SLV', 'El Salvador'),
(69, 784, 'AE', 'ARE', 'Emiratos Árabes Unidos'),
(70, 232, 'ER', 'ERI', 'Eritrea'),
(71, 703, 'SK', 'SVK', 'Eslovaquia'),
(72, 705, 'SI', 'SVN', 'Eslovenia'),
(73, 724, 'ES', 'ESP', 'España'),
(74, 581, 'UM', 'UMI', 'Islas ultramarinas de Estados Unidos'),
(75, 840, 'US', 'USA', 'Estados Unidos'),
(76, 233, 'EE', 'EST', 'Estonia'),
(77, 231, 'ET', 'ETH', 'Etiopía'),
(78, 234, 'FO', 'FRO', 'Islas Feroe'),
(79, 608, 'PH', 'PHL', 'Filipinas'),
(80, 246, 'FI', 'FIN', 'Finlandia'),
(81, 242, 'FJ', 'FJI', 'Fiyi'),
(82, 250, 'FR', 'FRA', 'Francia'),
(83, 266, 'GA', 'GAB', 'Gabón'),
(84, 270, 'GM', 'GMB', 'Gambia'),
(85, 268, 'GE', 'GEO', 'Georgia'),
(86, 239, 'GS', 'SGS', 'Islas Georgias del Sur y Sandwich del Sur'),
(87, 288, 'GH', 'GHA', 'Ghana'),
(88, 292, 'GI', 'GIB', 'Gibraltar'),
(89, 308, 'GD', 'GRD', 'Granada'),
(90, 300, 'GR', 'GRC', 'Grecia'),
(91, 304, 'GL', 'GRL', 'Groenlandia'),
(92, 312, 'GP', 'GLP', 'Guadalupe'),
(93, 316, 'GU', 'GUM', 'Guam'),
(94, 320, 'GT', 'GTM', 'Guatemala'),
(95, 254, 'GF', 'GUF', 'Guayana Francesa'),
(96, 324, 'GN', 'GIN', 'Guinea'),
(97, 226, 'GQ', 'GNQ', 'Guinea Ecuatorial'),
(98, 624, 'GW', 'GNB', 'Guinea-Bissau'),
(99, 328, 'GY', 'GUY', 'Guyana'),
(100, 332, 'HT', 'HTI', 'Haití'),
(101, 334, 'HM', 'HMD', 'Islas Heard y McDonald'),
(102, 340, 'HN', 'HND', 'Honduras'),
(103, 344, 'HK', 'HKG', 'Hong Kong'),
(104, 348, 'HU', 'HUN', 'Hungría'),
(105, 356, 'IN', 'IND', 'India'),
(106, 360, 'ID', 'IDN', 'Indonesia'),
(107, 364, 'IR', 'IRN', 'Irán'),
(108, 368, 'IQ', 'IRQ', 'Iraq'),
(109, 372, 'IE', 'IRL', 'Irlanda'),
(110, 352, 'IS', 'ISL', 'Islandia'),
(111, 376, 'IL', 'ISR', 'Israel'),
(112, 380, 'IT', 'ITA', 'Italia'),
(113, 388, 'JM', 'JAM', 'Jamaica'),
(114, 392, 'JP', 'JPN', 'Japón'),
(115, 400, 'JO', 'JOR', 'Jordania'),
(116, 398, 'KZ', 'KAZ', 'Kazajstán'),
(117, 404, 'KE', 'KEN', 'Kenia'),
(118, 417, 'KG', 'KGZ', 'Kirguistán'),
(119, 296, 'KI', 'KIR', 'Kiribati'),
(120, 414, 'KW', 'KWT', 'Kuwait'),
(121, 418, 'LA', 'LAO', 'Laos'),
(122, 426, 'LS', 'LSO', 'Lesotho'),
(123, 428, 'LV', 'LVA', 'Letonia'),
(124, 422, 'LB', 'LBN', 'Líbano'),
(125, 430, 'LR', 'LBR', 'Liberia'),
(126, 434, 'LY', 'LBY', 'Libia'),
(127, 438, 'LI', 'LIE', 'Liechtenstein'),
(128, 440, 'LT', 'LTU', 'Lituania'),
(129, 442, 'LU', 'LUX', 'Luxemburgo'),
(130, 446, 'MO', 'MAC', 'Macao'),
(131, 807, 'MK', 'MKD', 'ARY Macedonia'),
(132, 450, 'MG', 'MDG', 'Madagascar'),
(133, 458, 'MY', 'MYS', 'Malasia'),
(134, 454, 'MW', 'MWI', 'Malawi'),
(135, 462, 'MV', 'MDV', 'Maldivas'),
(136, 466, 'ML', 'MLI', 'Malí'),
(137, 470, 'MT', 'MLT', 'Malta'),
(138, 238, 'FK', 'FLK', 'Islas Malvinas'),
(139, 580, 'MP', 'MNP', 'Islas Marianas del Norte'),
(140, 504, 'MA', 'MAR', 'Marruecos'),
(141, 584, 'MH', 'MHL', 'Islas Marshall'),
(142, 474, 'MQ', 'MTQ', 'Martinica'),
(143, 480, 'MU', 'MUS', 'Mauricio'),
(144, 478, 'MR', 'MRT', 'Mauritania'),
(145, 175, 'YT', 'MYT', 'Mayotte'),
(146, 484, 'MX', 'MEX', 'México'),
(147, 583, 'FM', 'FSM', 'Micronesia'),
(148, 498, 'MD', 'MDA', 'Moldavia'),
(149, 492, 'MC', 'MCO', 'Mónaco'),
(150, 496, 'MN', 'MNG', 'Mongolia'),
(151, 500, 'MS', 'MSR', 'Montserrat'),
(152, 508, 'MZ', 'MOZ', 'Mozambique'),
(153, 104, 'MM', 'MMR', 'Myanmar'),
(154, 516, 'NA', 'NAM', 'Namibia'),
(155, 520, 'NR', 'NRU', 'Nauru'),
(156, 524, 'NP', 'NPL', 'Nepal'),
(157, 558, 'NI', 'NIC', 'Nicaragua'),
(158, 562, 'NE', 'NER', 'Níger'),
(159, 566, 'NG', 'NGA', 'Nigeria'),
(160, 570, 'NU', 'NIU', 'Niue'),
(161, 574, 'NF', 'NFK', 'Isla Norfolk'),
(162, 578, 'NO', 'NOR', 'Noruega'),
(163, 540, 'NC', 'NCL', 'Nueva Caledonia'),
(164, 554, 'NZ', 'NZL', 'Nueva Zelanda'),
(165, 512, 'OM', 'OMN', 'Omán'),
(166, 528, 'NL', 'NLD', 'Países Bajos'),
(167, 586, 'PK', 'PAK', 'Pakistán'),
(168, 585, 'PW', 'PLW', 'Palau'),
(169, 275, 'PS', 'PSE', 'Palestina'),
(170, 591, 'PA', 'PAN', 'Panamá'),
(171, 598, 'PG', 'PNG', 'Papúa Nueva Guinea'),
(172, 600, 'PY', 'PRY', 'Paraguay'),
(173, 604, 'PE', 'PER', 'Perú'),
(174, 612, 'PN', 'PCN', 'Islas Pitcairn'),
(175, 258, 'PF', 'PYF', 'Polinesia Francesa'),
(176, 616, 'PL', 'POL', 'Polonia'),
(177, 620, 'PT', 'PRT', 'Portugal'),
(178, 630, 'PR', 'PRI', 'Puerto Rico'),
(179, 634, 'QA', 'QAT', 'Qatar'),
(180, 826, 'GB', 'GBR', 'Reino Unido'),
(181, 638, 'RE', 'REU', 'Reunión'),
(182, 646, 'RW', 'RWA', 'Ruanda'),
(183, 642, 'RO', 'ROU', 'Rumania'),
(184, 643, 'RU', 'RUS', 'Rusia'),
(185, 732, 'EH', 'ESH', 'Sahara Occidental'),
(186, 90, 'SB', 'SLB', 'Islas Salomón'),
(187, 882, 'WS', 'WSM', 'Samoa'),
(188, 16, 'AS', 'ASM', 'Samoa Americana'),
(189, 659, 'KN', 'KNA', 'San Cristóbal y Nevis'),
(190, 674, 'SM', 'SMR', 'San Marino'),
(191, 666, 'PM', 'SPM', 'San Pedro y Miquelón'),
(192, 670, 'VC', 'VCT', 'San Vicente y las Granadinas'),
(193, 654, 'SH', 'SHN', 'Santa Helena'),
(194, 662, 'LC', 'LCA', 'Santa Lucía'),
(195, 678, 'ST', 'STP', 'Santo Tomé y Príncipe'),
(196, 686, 'SN', 'SEN', 'Senegal'),
(197, 891, 'CS', 'SCG', 'Serbia y Montenegro'),
(198, 690, 'SC', 'SYC', 'Seychelles'),
(199, 694, 'SL', 'SLE', 'Sierra Leona'),
(200, 702, 'SG', 'SGP', 'Singapur'),
(201, 760, 'SY', 'SYR', 'Siria'),
(202, 706, 'SO', 'SOM', 'Somalia'),
(203, 144, 'LK', 'LKA', 'Sri Lanka'),
(204, 748, 'SZ', 'SWZ', 'Suazilandia'),
(205, 710, 'ZA', 'ZAF', 'Sudáfrica'),
(206, 736, 'SD', 'SDN', 'Sudán'),
(207, 752, 'SE', 'SWE', 'Suecia'),
(208, 756, 'CH', 'CHE', 'Suiza'),
(209, 740, 'SR', 'SUR', 'Surinam'),
(210, 744, 'SJ', 'SJM', 'Svalbard y Jan Mayen'),
(211, 764, 'TH', 'THA', 'Tailandia'),
(212, 158, 'TW', 'TWN', 'Taiwán'),
(213, 834, 'TZ', 'TZA', 'Tanzania'),
(214, 762, 'TJ', 'TJK', 'Tayikistán'),
(215, 86, 'IO', 'IOT', 'Territorio Británico del Océano Índico'),
(216, 260, 'TF', 'ATF', 'Territorios Australes Franceses'),
(217, 626, 'TL', 'TLS', 'Timor Oriental'),
(218, 768, 'TG', 'TGO', 'Togo'),
(219, 772, 'TK', 'TKL', 'Tokelau'),
(220, 776, 'TO', 'TON', 'Tonga'),
(221, 780, 'TT', 'TTO', 'Trinidad y Tobago'),
(222, 788, 'TN', 'TUN', 'Túnez'),
(223, 796, 'TC', 'TCA', 'Islas Turcas y Caicos'),
(224, 795, 'TM', 'TKM', 'Turkmenistán'),
(225, 792, 'TR', 'TUR', 'Turquía'),
(226, 798, 'TV', 'TUV', 'Tuvalu'),
(227, 804, 'UA', 'UKR', 'Ucrania'),
(228, 800, 'UG', 'UGA', 'Uganda'),
(229, 858, 'UY', 'URY', 'Uruguay'),
(230, 860, 'UZ', 'UZB', 'Uzbekistán'),
(231, 548, 'VU', 'VUT', 'Vanuatu'),
(232, 862, 'VE', 'VEN', 'Venezuela'),
(233, 704, 'VN', 'VNM', 'Vietnam'),
(234, 92, 'VG', 'VGB', 'Islas Vírgenes Británicas'),
(235, 850, 'VI', 'VIR', 'Islas Vírgenes de los Estados Unidos'),
(236, 876, 'WF', 'WLF', 'Wallis y Futuna'),
(237, 887, 'YE', 'YEM', 'Yemen'),
(238, 262, 'DJ', 'DJI', 'Yibuti'),
(239, 894, 'ZM', 'ZMB', 'Zambia'),
(240, 716, 'ZW', 'ZWE', 'Zimbabue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GEO_002_Ciudades`
--

CREATE TABLE `GEO_002_Ciudades` (
  `id_ciudad` int NOT NULL,
  `id_estado` int NOT NULL,
  `ciudad` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `capital` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `GEO_002_Ciudades`
--

INSERT INTO `GEO_002_Ciudades` (`id_ciudad`, `id_estado`, `ciudad`, `capital`) VALUES
(1, 1, 'Maroa', 0),
(2, 1, 'Puerto Ayacucho', 1),
(3, 1, 'San Fernando de Atabapo', 0),
(4, 2, 'Anaco', 0),
(5, 2, 'Aragua de Barcelona', 0),
(6, 2, 'Barcelona', 1),
(7, 2, 'Boca de Uchire', 0),
(8, 2, 'Cantaura', 0),
(9, 2, 'Clarines', 0),
(10, 2, 'El Chaparro', 0),
(11, 2, 'El Pao Anzoátegui', 0),
(12, 2, 'El Tigre', 0),
(13, 2, 'El Tigrito', 0),
(14, 2, 'Guanape', 0),
(15, 2, 'Guanta', 0),
(16, 2, 'Lechería', 0),
(17, 2, 'Onoto', 0),
(18, 2, 'Pariaguán', 0),
(19, 2, 'Píritu', 0),
(20, 2, 'Puerto La Cruz', 0),
(21, 2, 'Puerto Píritu', 0),
(22, 2, 'Sabana de Uchire', 0),
(23, 2, 'San Mateo Anzoátegui', 0),
(24, 2, 'San Pablo Anzoátegui', 0),
(25, 2, 'San Tomé', 0),
(26, 2, 'Santa Ana de Anzoátegui', 0),
(27, 2, 'Santa Fe Anzoátegui', 0),
(28, 2, 'Santa Rosa', 0),
(29, 2, 'Soledad', 0),
(30, 2, 'Urica', 0),
(31, 2, 'Valle de Guanape', 0),
(43, 3, 'Achaguas', 0),
(44, 3, 'Biruaca', 0),
(45, 3, 'Bruzual', 0),
(46, 3, 'El Amparo', 0),
(47, 3, 'El Nula', 0),
(48, 3, 'Elorza', 0),
(49, 3, 'Guasdualito', 0),
(50, 3, 'Mantecal', 0),
(51, 3, 'Puerto Páez', 0),
(52, 3, 'San Fernando de Apure', 1),
(53, 3, 'San Juan de Payara', 0),
(54, 4, 'Barbacoas', 0),
(55, 4, 'Cagua', 0),
(56, 4, 'Camatagua', 0),
(58, 4, 'Choroní', 0),
(59, 4, 'Colonia Tovar', 0),
(60, 4, 'El Consejo', 0),
(61, 4, 'La Victoria', 0),
(62, 4, 'Las Tejerías', 0),
(63, 4, 'Magdaleno', 0),
(64, 4, 'Maracay', 1),
(65, 4, 'Ocumare de La Costa', 0),
(66, 4, 'Palo Negro', 0),
(67, 4, 'San Casimiro', 0),
(68, 4, 'San Mateo', 0),
(69, 4, 'San Sebastián', 0),
(70, 4, 'Santa Cruz de Aragua', 0),
(71, 4, 'Tocorón', 0),
(72, 4, 'Turmero', 0),
(73, 4, 'Villa de Cura', 0),
(74, 4, 'Zuata', 0),
(75, 5, 'Barinas', 1),
(76, 5, 'Barinitas', 0),
(77, 5, 'Barrancas', 0),
(78, 5, 'Calderas', 0),
(79, 5, 'Capitanejo', 0),
(80, 5, 'Ciudad Bolivia', 0),
(81, 5, 'El Cantón', 0),
(82, 5, 'Las Veguitas', 0),
(83, 5, 'Libertad de Barinas', 0),
(84, 5, 'Sabaneta', 0),
(85, 5, 'Santa Bárbara de Barinas', 0),
(86, 5, 'Socopó', 0),
(87, 6, 'Caicara del Orinoco', 0),
(88, 6, 'Canaima', 0),
(89, 6, 'Ciudad Bolívar', 1),
(90, 6, 'Ciudad Piar', 0),
(91, 6, 'El Callao', 0),
(92, 6, 'El Dorado', 0),
(93, 6, 'El Manteco', 0),
(94, 6, 'El Palmar', 0),
(95, 6, 'El Pao', 0),
(96, 6, 'Guasipati', 0),
(97, 6, 'Guri', 0),
(98, 6, 'La Paragua', 0),
(99, 6, 'Matanzas', 0),
(100, 6, 'Puerto Ordaz', 0),
(101, 6, 'San Félix', 0),
(102, 6, 'Santa Elena de Uairén', 0),
(103, 6, 'Tumeremo', 0),
(104, 6, 'Unare', 0),
(105, 6, 'Upata', 0),
(106, 7, 'Bejuma', 0),
(107, 7, 'Belén', 0),
(108, 7, 'Campo de Carabobo', 0),
(109, 7, 'Canoabo', 0),
(110, 7, 'Central Tacarigua', 0),
(111, 7, 'Chirgua', 0),
(112, 7, 'Ciudad Alianza', 0),
(113, 7, 'El Palito', 0),
(114, 7, 'Guacara', 0),
(115, 7, 'Guigue', 0),
(116, 7, 'Las Trincheras', 0),
(117, 7, 'Los Guayos', 0),
(118, 7, 'Mariara', 0),
(119, 7, 'Miranda', 0),
(120, 7, 'Montalbán', 0),
(121, 7, 'Morón', 0),
(122, 7, 'Naguanagua', 0),
(123, 7, 'Puerto Cabello', 0),
(124, 7, 'San Joaquín', 0),
(125, 7, 'Tocuyito', 0),
(126, 7, 'Urama', 0),
(127, 7, 'Valencia', 1),
(128, 7, 'Vigirimita', 0),
(129, 8, 'Aguirre', 0),
(130, 8, 'Apartaderos Cojedes', 0),
(131, 8, 'Arismendi', 0),
(132, 8, 'Camuriquito', 0),
(133, 8, 'El Baúl', 0),
(134, 8, 'El Limón', 0),
(135, 8, 'El Pao Cojedes', 0),
(136, 8, 'El Socorro', 0),
(137, 8, 'La Aguadita', 0),
(138, 8, 'Las Vegas', 0),
(139, 8, 'Libertad de Cojedes', 0),
(140, 8, 'Mapuey', 0),
(141, 8, 'Piñedo', 0),
(142, 8, 'Samancito', 0),
(143, 8, 'San Carlos', 1),
(144, 8, 'Sucre', 0),
(145, 8, 'Tinaco', 0),
(146, 8, 'Tinaquillo', 0),
(147, 8, 'Vallecito', 0),
(148, 9, 'Tucupita', 1),
(149, 24, 'Caracas', 1),
(150, 24, 'El Junquito', 0),
(151, 10, 'Adícora', 0),
(152, 10, 'Boca de Aroa', 0),
(153, 10, 'Cabure', 0),
(154, 10, 'Capadare', 0),
(155, 10, 'Capatárida', 0),
(156, 10, 'Chichiriviche', 0),
(157, 10, 'Churuguara', 0),
(158, 10, 'Coro', 1),
(159, 10, 'Cumarebo', 0),
(160, 10, 'Dabajuro', 0),
(161, 10, 'Judibana', 0),
(162, 10, 'La Cruz de Taratara', 0),
(163, 10, 'La Vela de Coro', 0),
(164, 10, 'Los Taques', 0),
(165, 10, 'Maparari', 0),
(166, 10, 'Mene de Mauroa', 0),
(167, 10, 'Mirimire', 0),
(168, 10, 'Pedregal', 0),
(169, 10, 'Píritu Falcón', 0),
(170, 10, 'Pueblo Nuevo Falcón', 0),
(171, 10, 'Puerto Cumarebo', 0),
(172, 10, 'Punta Cardón', 0),
(173, 10, 'Punto Fijo', 0),
(174, 10, 'San Juan de Los Cayos', 0),
(175, 10, 'San Luis', 0),
(176, 10, 'Santa Ana Falcón', 0),
(177, 10, 'Santa Cruz De Bucaral', 0),
(178, 10, 'Tocopero', 0),
(179, 10, 'Tocuyo de La Costa', 0),
(180, 10, 'Tucacas', 0),
(181, 10, 'Yaracal', 0),
(182, 11, 'Altagracia de Orituco', 0),
(183, 11, 'Cabruta', 0),
(184, 11, 'Calabozo', 0),
(185, 11, 'Camaguán', 0),
(196, 11, 'Chaguaramas Guárico', 0),
(197, 11, 'El Socorro', 0),
(198, 11, 'El Sombrero', 0),
(199, 11, 'Las Mercedes de Los Llanos', 0),
(200, 11, 'Lezama', 0),
(201, 11, 'Onoto', 0),
(202, 11, 'Ortíz', 0),
(203, 11, 'San José de Guaribe', 0),
(204, 11, 'San Juan de Los Morros', 1),
(205, 11, 'San Rafael de Laya', 0),
(206, 11, 'Santa María de Ipire', 0),
(207, 11, 'Tucupido', 0),
(208, 11, 'Valle de La Pascua', 0),
(209, 11, 'Zaraza', 0),
(210, 12, 'Aguada Grande', 0),
(211, 12, 'Atarigua', 0),
(212, 12, 'Barquisimeto', 1),
(213, 12, 'Bobare', 0),
(214, 12, 'Cabudare', 0),
(215, 12, 'Carora', 0),
(216, 12, 'Cubiro', 0),
(217, 12, 'Cují', 0),
(218, 12, 'Duaca', 0),
(219, 12, 'El Manzano', 0),
(220, 12, 'El Tocuyo', 0),
(221, 12, 'Guaríco', 0),
(222, 12, 'Humocaro Alto', 0),
(223, 12, 'Humocaro Bajo', 0),
(224, 12, 'La Miel', 0),
(225, 12, 'Moroturo', 0),
(226, 12, 'Quíbor', 0),
(227, 12, 'Río Claro', 0),
(228, 12, 'Sanare', 0),
(229, 12, 'Santa Inés', 0),
(230, 12, 'Sarare', 0),
(231, 12, 'Siquisique', 0),
(232, 12, 'Tintorero', 0),
(233, 13, 'Apartaderos Mérida', 0),
(234, 13, 'Arapuey', 0),
(235, 13, 'Bailadores', 0),
(236, 13, 'Caja Seca', 0),
(237, 13, 'Canaguá', 0),
(238, 13, 'Chachopo', 0),
(239, 13, 'Chiguara', 0),
(240, 13, 'Ejido', 0),
(241, 13, 'El Vigía', 0),
(242, 13, 'La Azulita', 0),
(243, 13, 'La Playa', 0),
(244, 13, 'Lagunillas Mérida', 0),
(245, 13, 'Mérida', 1),
(246, 13, 'Mesa de Bolívar', 0),
(247, 13, 'Mucuchíes', 0),
(248, 13, 'Mucujepe', 0),
(249, 13, 'Mucuruba', 0),
(250, 13, 'Nueva Bolivia', 0),
(251, 13, 'Palmarito', 0),
(252, 13, 'Pueblo Llano', 0),
(253, 13, 'Santa Cruz de Mora', 0),
(254, 13, 'Santa Elena de Arenales', 0),
(255, 13, 'Santo Domingo', 0),
(256, 13, 'Tabáy', 0),
(257, 13, 'Timotes', 0),
(258, 13, 'Torondoy', 0),
(259, 13, 'Tovar', 0),
(260, 13, 'Tucani', 0),
(261, 13, 'Zea', 0),
(262, 14, 'Araguita', 0),
(263, 14, 'Carrizal', 0),
(264, 14, 'Caucagua', 0),
(265, 14, 'Chaguaramas Miranda', 0),
(266, 14, 'Charallave', 0),
(267, 14, 'Chirimena', 0),
(268, 14, 'Chuspa', 0),
(269, 14, 'Cúa', 0),
(270, 14, 'Cupira', 0),
(271, 14, 'Curiepe', 0),
(272, 14, 'El Guapo', 0),
(273, 14, 'El Jarillo', 0),
(274, 14, 'Filas de Mariche', 0),
(275, 14, 'Guarenas', 0),
(276, 14, 'Guatire', 0),
(277, 14, 'Higuerote', 0),
(278, 14, 'Los Anaucos', 0),
(279, 14, 'Los Teques', 1),
(280, 14, 'Ocumare del Tuy', 0),
(281, 14, 'Panaquire', 0),
(282, 14, 'Paracotos', 0),
(283, 14, 'Río Chico', 0),
(284, 14, 'San Antonio de Los Altos', 0),
(285, 14, 'San Diego de Los Altos', 0),
(286, 14, 'San Fernando del Guapo', 0),
(287, 14, 'San Francisco de Yare', 0),
(288, 14, 'San José de Los Altos', 0),
(289, 14, 'San José de Río Chico', 0),
(290, 14, 'San Pedro de Los Altos', 0),
(291, 14, 'Santa Lucía', 0),
(292, 14, 'Santa Teresa', 0),
(293, 14, 'Tacarigua de La Laguna', 0),
(294, 14, 'Tacarigua de Mamporal', 0),
(295, 14, 'Tácata', 0),
(296, 14, 'Turumo', 0),
(297, 15, 'Aguasay', 0),
(298, 15, 'Aragua de Maturín', 0),
(299, 15, 'Barrancas del Orinoco', 0),
(300, 15, 'Caicara de Maturín', 0),
(301, 15, 'Caripe', 0),
(302, 15, 'Caripito', 0),
(303, 15, 'Chaguaramal', 0),
(305, 15, 'Chaguaramas Monagas', 0),
(307, 15, 'El Furrial', 0),
(308, 15, 'El Tejero', 0),
(309, 15, 'Jusepín', 0),
(310, 15, 'La Toscana', 0),
(311, 15, 'Maturín', 1),
(312, 15, 'Miraflores', 0),
(313, 15, 'Punta de Mata', 0),
(314, 15, 'Quiriquire', 0),
(315, 15, 'San Antonio de Maturín', 0),
(316, 15, 'San Vicente Monagas', 0),
(317, 15, 'Santa Bárbara', 0),
(318, 15, 'Temblador', 0),
(319, 15, 'Teresen', 0),
(320, 15, 'Uracoa', 0),
(321, 16, 'Altagracia', 0),
(322, 16, 'Boca de Pozo', 0),
(323, 16, 'Boca de Río', 0),
(324, 16, 'El Espinal', 0),
(325, 16, 'El Valle del Espíritu Santo', 0),
(326, 16, 'El Yaque', 0),
(327, 16, 'Juangriego', 0),
(328, 16, 'La Asunción', 1),
(329, 16, 'La Guardia', 0),
(330, 16, 'Pampatar', 0),
(331, 16, 'Porlamar', 0),
(332, 16, 'Puerto Fermín', 0),
(333, 16, 'Punta de Piedras', 0),
(334, 16, 'San Francisco de Macanao', 0),
(335, 16, 'San Juan Bautista', 0),
(336, 16, 'San Pedro de Coche', 0),
(337, 16, 'Santa Ana de Nueva Esparta', 0),
(338, 16, 'Villa Rosa', 0),
(339, 17, 'Acarigua', 0),
(340, 17, 'Agua Blanca', 0),
(341, 17, 'Araure', 0),
(342, 17, 'Biscucuy', 0),
(343, 17, 'Boconoito', 0),
(344, 17, 'Campo Elías', 0),
(345, 17, 'Chabasquén', 0),
(346, 17, 'Guanare', 1),
(347, 17, 'Guanarito', 0),
(348, 17, 'La Aparición', 0),
(349, 17, 'La Misión', 0),
(350, 17, 'Mesa de Cavacas', 0),
(351, 17, 'Ospino', 0),
(352, 17, 'Papelón', 0),
(353, 17, 'Payara', 0),
(354, 17, 'Pimpinela', 0),
(355, 17, 'Píritu de Portuguesa', 0),
(356, 17, 'San Rafael de Onoto', 0),
(357, 17, 'Santa Rosalía', 0),
(358, 17, 'Turén', 0),
(359, 18, 'Altos de Sucre', 0),
(360, 18, 'Araya', 0),
(361, 18, 'Cariaco', 0),
(362, 18, 'Carúpano', 0),
(363, 18, 'Casanay', 0),
(364, 18, 'Cumaná', 1),
(365, 18, 'Cumanacoa', 0),
(366, 18, 'El Morro Puerto Santo', 0),
(367, 18, 'El Pilar', 0),
(368, 18, 'El Poblado', 0),
(369, 18, 'Guaca', 0),
(370, 18, 'Guiria', 0),
(371, 18, 'Irapa', 0),
(372, 18, 'Manicuare', 0),
(373, 18, 'Mariguitar', 0),
(374, 18, 'Río Caribe', 0),
(375, 18, 'San Antonio del Golfo', 0),
(376, 18, 'San José de Aerocuar', 0),
(377, 18, 'San Vicente de Sucre', 0),
(378, 18, 'Santa Fe de Sucre', 0),
(379, 18, 'Tunapuy', 0),
(380, 18, 'Yaguaraparo', 0),
(381, 18, 'Yoco', 0),
(382, 19, 'Abejales', 0),
(383, 19, 'Borota', 0),
(384, 19, 'Bramon', 0),
(385, 19, 'Capacho', 0),
(386, 19, 'Colón', 0),
(387, 19, 'Coloncito', 0),
(388, 19, 'Cordero', 0),
(389, 19, 'El Cobre', 0),
(390, 19, 'El Pinal', 0),
(391, 19, 'Independencia', 0),
(392, 19, 'La Fría', 0),
(393, 19, 'La Grita', 0),
(394, 19, 'La Pedrera', 0),
(395, 19, 'La Tendida', 0),
(396, 19, 'Las Delicias', 0),
(397, 19, 'Las Hernández', 0),
(398, 19, 'Lobatera', 0),
(399, 19, 'Michelena', 0),
(400, 19, 'Palmira', 0),
(401, 19, 'Pregonero', 0),
(402, 19, 'Queniquea', 0),
(403, 19, 'Rubio', 0),
(404, 19, 'San Antonio del Tachira', 0),
(405, 19, 'San Cristobal', 1),
(406, 19, 'San José de Bolívar', 0),
(407, 19, 'San Josecito', 0),
(408, 19, 'San Pedro del Río', 0),
(409, 19, 'Santa Ana Táchira', 0),
(410, 19, 'Seboruco', 0),
(411, 19, 'Táriba', 0),
(412, 19, 'Umuquena', 0),
(413, 19, 'Ureña', 0),
(414, 20, 'Batatal', 0),
(415, 20, 'Betijoque', 0),
(416, 20, 'Boconó', 0),
(417, 20, 'Carache', 0),
(418, 20, 'Chejende', 0),
(419, 20, 'Cuicas', 0),
(420, 20, 'El Dividive', 0),
(421, 20, 'El Jaguito', 0),
(422, 20, 'Escuque', 0),
(423, 20, 'Isnotú', 0),
(424, 20, 'Jajó', 0),
(425, 20, 'La Ceiba', 0),
(426, 20, 'La Concepción de Trujllo', 0),
(427, 20, 'La Mesa de Esnujaque', 0),
(428, 20, 'La Puerta', 0),
(429, 20, 'La Quebrada', 0),
(430, 20, 'Mendoza Fría', 0),
(431, 20, 'Meseta de Chimpire', 0),
(432, 20, 'Monay', 0),
(433, 20, 'Motatán', 0),
(434, 20, 'Pampán', 0),
(435, 20, 'Pampanito', 0),
(436, 20, 'Sabana de Mendoza', 0),
(437, 20, 'San Lázaro', 0),
(438, 20, 'Santa Ana de Trujillo', 0),
(439, 20, 'Tostós', 0),
(440, 20, 'Trujillo', 1),
(441, 20, 'Valera', 0),
(442, 21, 'Carayaca', 0),
(443, 21, 'Litoral', 0),
(444, 25, 'Archipiélago Los Roques', 0),
(445, 22, 'Aroa', 0),
(446, 22, 'Boraure', 0),
(447, 22, 'Campo Elías de Yaracuy', 0),
(448, 22, 'Chivacoa', 0),
(449, 22, 'Cocorote', 0),
(450, 22, 'Farriar', 0),
(451, 22, 'Guama', 0),
(452, 22, 'Marín', 0),
(453, 22, 'Nirgua', 0),
(454, 22, 'Sabana de Parra', 0),
(455, 22, 'Salom', 0),
(456, 22, 'San Felipe', 1),
(457, 22, 'San Pablo de Yaracuy', 0),
(458, 22, 'Urachiche', 0),
(459, 22, 'Yaritagua', 0),
(460, 22, 'Yumare', 0),
(461, 23, 'Bachaquero', 0),
(462, 23, 'Bobures', 0),
(463, 23, 'Cabimas', 0),
(464, 23, 'Campo Concepción', 0),
(465, 23, 'Campo Mara', 0),
(466, 23, 'Campo Rojo', 0),
(467, 23, 'Carrasquero', 0),
(468, 23, 'Casigua', 0),
(469, 23, 'Chiquinquirá', 0),
(470, 23, 'Ciudad Ojeda', 0),
(471, 23, 'El Batey', 0),
(472, 23, 'El Carmelo', 0),
(473, 23, 'El Chivo', 0),
(474, 23, 'El Guayabo', 0),
(475, 23, 'El Mene', 0),
(476, 23, 'El Venado', 0),
(477, 23, 'Encontrados', 0),
(478, 23, 'Gibraltar', 0),
(479, 23, 'Isla de Toas', 0),
(480, 23, 'La Concepción del Zulia', 0),
(481, 23, 'La Paz', 0),
(482, 23, 'La Sierrita', 0),
(483, 23, 'Lagunillas del Zulia', 0),
(484, 23, 'Las Piedras de Perijá', 0),
(485, 23, 'Los Cortijos', 0),
(486, 23, 'Machiques', 0),
(487, 23, 'Maracaibo', 1),
(488, 23, 'Mene Grande', 0),
(489, 23, 'Palmarejo', 0),
(490, 23, 'Paraguaipoa', 0),
(491, 23, 'Potrerito', 0),
(492, 23, 'Pueblo Nuevo del Zulia', 0),
(493, 23, 'Puertos de Altagracia', 0),
(494, 23, 'Punta Gorda', 0),
(495, 23, 'Sabaneta de Palma', 0),
(496, 23, 'San Francisco', 0),
(497, 23, 'San José de Perijá', 0),
(498, 23, 'San Rafael del Moján', 0),
(499, 23, 'San Timoteo', 0),
(500, 23, 'Santa Bárbara Del Zulia', 0),
(501, 23, 'Santa Cruz de Mara', 0),
(502, 23, 'Santa Cruz del Zulia', 0),
(503, 23, 'Santa Rita', 0),
(504, 23, 'Sinamaica', 0),
(505, 23, 'Tamare', 0),
(506, 23, 'Tía Juana', 0),
(507, 23, 'Villa del Rosario', 0),
(508, 21, 'La Guaira', 1),
(509, 21, 'Catia La Mar', 0),
(510, 21, 'Macuto', 0),
(511, 21, 'Naiguatá', 0),
(512, 25, 'Archipiélago Los Monjes', 0),
(513, 25, 'Isla La Tortuga y Cayos adyacentes', 0),
(514, 25, 'Isla La Sola', 0),
(515, 25, 'Islas Los Testigos', 0),
(516, 25, 'Islas Los Frailes', 0),
(517, 25, 'Isla La Orchila', 0),
(518, 25, 'Archipiélago Las Aves', 0),
(519, 25, 'Isla de Aves', 0),
(520, 25, 'Isla La Blanquilla', 0),
(521, 25, 'Isla de Patos', 0),
(522, 25, 'Islas Los Hermanos', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GEO_003_Estados`
--

CREATE TABLE `GEO_003_Estados` (
  `id_estado` int NOT NULL,
  `estado` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `iso_3166-2` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `GEO_003_Estados`
--

INSERT INTO `GEO_003_Estados` (`id_estado`, `estado`, `iso_3166-2`) VALUES
(1, 'Amazonas', 'VE-X'),
(2, 'Anzoátegui', 'VE-B'),
(3, 'Apure', 'VE-C'),
(4, 'Aragua', 'VE-D'),
(5, 'Barinas', 'VE-E'),
(6, 'Bolívar', 'VE-F'),
(7, 'Carabobo', 'VE-G'),
(8, 'Cojedes', 'VE-H'),
(9, 'Delta Amacuro', 'VE-Y'),
(10, 'Falcón', 'VE-I'),
(11, 'Guárico', 'VE-J'),
(12, 'Lara', 'VE-K'),
(13, 'Mérida', 'VE-L'),
(14, 'Miranda', 'VE-M'),
(15, 'Monagas', 'VE-N'),
(16, 'Nueva Esparta', 'VE-O'),
(17, 'Portuguesa', 'VE-P'),
(18, 'Sucre', 'VE-R'),
(19, 'Táchira', 'VE-S'),
(20, 'Trujillo', 'VE-T'),
(21, 'La Guaira', 'VE-W'),
(22, 'Yaracuy', 'VE-U'),
(23, 'Zulia', 'VE-V'),
(24, 'Distrito Capital', 'VE-A'),
(25, 'Dependencias Federales', 'VE-Z');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GEO_004_Municipios`
--

CREATE TABLE `GEO_004_Municipios` (
  `id_municipio` int NOT NULL,
  `id_estado` int NOT NULL,
  `municipio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `GEO_004_Municipios`
--

INSERT INTO `GEO_004_Municipios` (`id_municipio`, `id_estado`, `municipio`) VALUES
(1, 1, 'Alto Orinoco'),
(2, 1, 'Atabapo'),
(3, 1, 'Atures'),
(4, 1, 'Autana'),
(5, 1, 'Manapiare'),
(6, 1, 'Maroa'),
(7, 1, 'Río Negro'),
(8, 2, 'Anaco'),
(9, 2, 'Aragua'),
(10, 2, 'Manuel Ezequiel Bruzual'),
(11, 2, 'Diego Bautista Urbaneja'),
(12, 2, 'Fernando Peñalver'),
(13, 2, 'Francisco Del Carmen Carvajal'),
(14, 2, 'General Sir Arthur McGregor'),
(15, 2, 'Guanta'),
(16, 2, 'Independencia'),
(17, 2, 'José Gregorio Monagas'),
(18, 2, 'Juan Antonio Sotillo'),
(19, 2, 'Juan Manuel Cajigal'),
(20, 2, 'Libertad'),
(21, 2, 'Francisco de Miranda'),
(22, 2, 'Pedro María Freites'),
(23, 2, 'Píritu'),
(24, 2, 'San José de Guanipa'),
(25, 2, 'San Juan de Capistrano'),
(26, 2, 'Santa Ana'),
(27, 2, 'Simón Bolívar'),
(28, 2, 'Simón Rodríguez'),
(29, 3, 'Achaguas'),
(30, 3, 'Biruaca'),
(31, 3, 'Muñóz'),
(32, 3, 'Páez'),
(33, 3, 'Pedro Camejo'),
(34, 3, 'Rómulo Gallegos'),
(35, 3, 'San Fernando'),
(36, 4, 'Atanasio Girardot'),
(37, 4, 'Bolívar'),
(38, 4, 'Camatagua'),
(39, 4, 'Francisco Linares Alcántara'),
(40, 4, 'José Ángel Lamas'),
(41, 4, 'José Félix Ribas'),
(42, 4, 'José Rafael Revenga'),
(43, 4, 'Libertador'),
(44, 4, 'Mario Briceño Iragorry'),
(45, 4, 'Ocumare de la Costa de Oro'),
(46, 4, 'San Casimiro'),
(47, 4, 'San Sebastián'),
(48, 4, 'Santiago Mariño'),
(49, 4, 'Santos Michelena'),
(50, 4, 'Sucre'),
(51, 4, 'Tovar'),
(52, 4, 'Urdaneta'),
(53, 4, 'Zamora'),
(54, 5, 'Alberto Arvelo Torrealba'),
(55, 5, 'Andrés Eloy Blanco'),
(56, 5, 'Antonio José de Sucre'),
(57, 5, 'Arismendi'),
(58, 5, 'Barinas'),
(59, 5, 'Bolívar'),
(60, 5, 'Cruz Paredes'),
(61, 5, 'Ezequiel Zamora'),
(62, 5, 'Obispos'),
(63, 5, 'Pedraza'),
(64, 5, 'Rojas'),
(65, 5, 'Sosa'),
(66, 6, 'Caroní'),
(67, 6, 'Cedeño'),
(68, 6, 'El Callao'),
(69, 6, 'Gran Sabana'),
(70, 6, 'Heres'),
(71, 6, 'Piar'),
(72, 6, 'Angostura (Raúl Leoni)'),
(73, 6, 'Roscio'),
(74, 6, 'Sifontes'),
(75, 6, 'Sucre'),
(76, 6, 'Padre Pedro Chien'),
(77, 7, 'Bejuma'),
(78, 7, 'Carlos Arvelo'),
(79, 7, 'Diego Ibarra'),
(80, 7, 'Guacara'),
(81, 7, 'Juan José Mora'),
(82, 7, 'Libertador'),
(83, 7, 'Los Guayos'),
(84, 7, 'Miranda'),
(85, 7, 'Montalbán'),
(86, 7, 'Naguanagua'),
(87, 7, 'Puerto Cabello'),
(88, 7, 'San Diego'),
(89, 7, 'San Joaquín'),
(90, 7, 'Valencia'),
(91, 8, 'Anzoátegui'),
(92, 8, 'Tinaquillo'),
(93, 8, 'Girardot'),
(94, 8, 'Lima Blanco'),
(95, 8, 'Pao de San Juan Bautista'),
(96, 8, 'Ricaurte'),
(97, 8, 'Rómulo Gallegos'),
(98, 8, 'San Carlos'),
(99, 8, 'Tinaco'),
(100, 9, 'Antonio Díaz'),
(101, 9, 'Casacoima'),
(102, 9, 'Pedernales'),
(103, 9, 'Tucupita'),
(104, 10, 'Acosta'),
(105, 10, 'Bolívar'),
(106, 10, 'Buchivacoa'),
(107, 10, 'Cacique Manaure'),
(108, 10, 'Carirubana'),
(109, 10, 'Colina'),
(110, 10, 'Dabajuro'),
(111, 10, 'Democracia'),
(112, 10, 'Falcón'),
(113, 10, 'Federación'),
(114, 10, 'Jacura'),
(115, 10, 'José Laurencio Silva'),
(116, 10, 'Los Taques'),
(117, 10, 'Mauroa'),
(118, 10, 'Miranda'),
(119, 10, 'Monseñor Iturriza'),
(120, 10, 'Palmasola'),
(121, 10, 'Petit'),
(122, 10, 'Píritu'),
(123, 10, 'San Francisco'),
(124, 10, 'Sucre'),
(125, 10, 'Tocópero'),
(126, 10, 'Unión'),
(127, 10, 'Urumaco'),
(128, 10, 'Zamora'),
(129, 11, 'Camaguán'),
(130, 11, 'Chaguaramas'),
(131, 11, 'El Socorro'),
(132, 11, 'José Félix Ribas'),
(133, 11, 'José Tadeo Monagas'),
(134, 11, 'Juan Germán Roscio'),
(135, 11, 'Julián Mellado'),
(136, 11, 'Las Mercedes'),
(137, 11, 'Leonardo Infante'),
(138, 11, 'Pedro Zaraza'),
(139, 11, 'Ortíz'),
(140, 11, 'San Gerónimo de Guayabal'),
(141, 11, 'San José de Guaribe'),
(142, 11, 'Santa María de Ipire'),
(143, 11, 'Sebastián Francisco de Miranda'),
(144, 12, 'Andrés Eloy Blanco'),
(145, 12, 'Crespo'),
(146, 12, 'Iribarren'),
(147, 12, 'Jiménez'),
(148, 12, 'Morán'),
(149, 12, 'Palavecino'),
(150, 12, 'Simón Planas'),
(151, 12, 'Torres'),
(152, 12, 'Urdaneta'),
(179, 13, 'Alberto Adriani'),
(180, 13, 'Andrés Bello'),
(181, 13, 'Antonio Pinto Salinas'),
(182, 13, 'Aricagua'),
(183, 13, 'Arzobispo Chacón'),
(184, 13, 'Campo Elías'),
(185, 13, 'Caracciolo Parra Olmedo'),
(186, 13, 'Cardenal Quintero'),
(187, 13, 'Guaraque'),
(188, 13, 'Julio César Salas'),
(189, 13, 'Justo Briceño'),
(190, 13, 'Libertador'),
(191, 13, 'Miranda'),
(192, 13, 'Obispo Ramos de Lora'),
(193, 13, 'Padre Noguera'),
(194, 13, 'Pueblo Llano'),
(195, 13, 'Rangel'),
(196, 13, 'Rivas Dávila'),
(197, 13, 'Santos Marquina'),
(198, 13, 'Sucre'),
(199, 13, 'Tovar'),
(200, 13, 'Tulio Febres Cordero'),
(201, 13, 'Zea'),
(223, 14, 'Acevedo'),
(224, 14, 'Andrés Bello'),
(225, 14, 'Baruta'),
(226, 14, 'Brión'),
(227, 14, 'Buroz'),
(228, 14, 'Carrizal'),
(229, 14, 'Chacao'),
(230, 14, 'Cristóbal Rojas'),
(231, 14, 'El Hatillo'),
(232, 14, 'Guaicaipuro'),
(233, 14, 'Independencia'),
(234, 14, 'Lander'),
(235, 14, 'Los Salias'),
(236, 14, 'Páez'),
(237, 14, 'Paz Castillo'),
(238, 14, 'Pedro Gual'),
(239, 14, 'Plaza'),
(240, 14, 'Simón Bolívar'),
(241, 14, 'Sucre'),
(242, 14, 'Urdaneta'),
(243, 14, 'Zamora'),
(258, 15, 'Acosta'),
(259, 15, 'Aguasay'),
(260, 15, 'Bolívar'),
(261, 15, 'Caripe'),
(262, 15, 'Cedeño'),
(263, 15, 'Ezequiel Zamora'),
(264, 15, 'Libertador'),
(265, 15, 'Maturín'),
(266, 15, 'Piar'),
(267, 15, 'Punceres'),
(268, 15, 'Santa Bárbara'),
(269, 15, 'Sotillo'),
(270, 15, 'Uracoa'),
(271, 16, 'Antolín del Campo'),
(272, 16, 'Arismendi'),
(273, 16, 'García'),
(274, 16, 'Gómez'),
(275, 16, 'Maneiro'),
(276, 16, 'Marcano'),
(277, 16, 'Mariño'),
(278, 16, 'Península de Macanao'),
(279, 16, 'Tubores'),
(280, 16, 'Villalba'),
(281, 16, 'Díaz'),
(282, 17, 'Agua Blanca'),
(283, 17, 'Araure'),
(284, 17, 'Esteller'),
(285, 17, 'Guanare'),
(286, 17, 'Guanarito'),
(287, 17, 'Monseñor José Vicente de Unda'),
(288, 17, 'Ospino'),
(289, 17, 'Páez'),
(290, 17, 'Papelón'),
(291, 17, 'San Genaro de Boconoíto'),
(292, 17, 'San Rafael de Onoto'),
(293, 17, 'Santa Rosalía'),
(294, 17, 'Sucre'),
(295, 17, 'Turén'),
(296, 18, 'Andrés Eloy Blanco'),
(297, 18, 'Andrés Mata'),
(298, 18, 'Arismendi'),
(299, 18, 'Benítez'),
(300, 18, 'Bermúdez'),
(301, 18, 'Bolívar'),
(302, 18, 'Cajigal'),
(303, 18, 'Cruz Salmerón Acosta'),
(304, 18, 'Libertador'),
(305, 18, 'Mariño'),
(306, 18, 'Mejía'),
(307, 18, 'Montes'),
(308, 18, 'Ribero'),
(309, 18, 'Sucre'),
(310, 18, 'Valdéz'),
(341, 19, 'Andrés Bello'),
(342, 19, 'Antonio Rómulo Costa'),
(343, 19, 'Ayacucho'),
(344, 19, 'Bolívar'),
(345, 19, 'Cárdenas'),
(346, 19, 'Córdoba'),
(347, 19, 'Fernández Feo'),
(348, 19, 'Francisco de Miranda'),
(349, 19, 'García de Hevia'),
(350, 19, 'Guásimos'),
(351, 19, 'Independencia'),
(352, 19, 'Jáuregui'),
(353, 19, 'José María Vargas'),
(354, 19, 'Junín'),
(355, 19, 'Libertad'),
(356, 19, 'Libertador'),
(357, 19, 'Lobatera'),
(358, 19, 'Michelena'),
(359, 19, 'Panamericano'),
(360, 19, 'Pedro María Ureña'),
(361, 19, 'Rafael Urdaneta'),
(362, 19, 'Samuel Darío Maldonado'),
(363, 19, 'San Cristóbal'),
(364, 19, 'Seboruco'),
(365, 19, 'Simón Rodríguez'),
(366, 19, 'Sucre'),
(367, 19, 'Torbes'),
(368, 19, 'Uribante'),
(369, 19, 'San Judas Tadeo'),
(370, 20, 'Andrés Bello'),
(371, 20, 'Boconó'),
(372, 20, 'Bolívar'),
(373, 20, 'Candelaria'),
(374, 20, 'Carache'),
(375, 20, 'Escuque'),
(376, 20, 'José Felipe Márquez Cañizalez'),
(377, 20, 'Juan Vicente Campos Elías'),
(378, 20, 'La Ceiba'),
(379, 20, 'Miranda'),
(380, 20, 'Monte Carmelo'),
(381, 20, 'Motatán'),
(382, 20, 'Pampán'),
(383, 20, 'Pampanito'),
(384, 20, 'Rafael Rangel'),
(385, 20, 'San Rafael de Carvajal'),
(386, 20, 'Sucre'),
(387, 20, 'Trujillo'),
(388, 20, 'Urdaneta'),
(389, 20, 'Valera'),
(390, 21, 'Vargas'),
(391, 22, 'Arístides Bastidas'),
(392, 22, 'Bolívar'),
(407, 22, 'Bruzual'),
(408, 22, 'Cocorote'),
(409, 22, 'Independencia'),
(410, 22, 'José Antonio Páez'),
(411, 22, 'La Trinidad'),
(412, 22, 'Manuel Monge'),
(413, 22, 'Nirgua'),
(414, 22, 'Peña'),
(415, 22, 'San Felipe'),
(416, 22, 'Sucre'),
(417, 22, 'Urachiche'),
(418, 22, 'José Joaquín Veroes'),
(441, 23, 'Almirante Padilla'),
(442, 23, 'Baralt'),
(443, 23, 'Cabimas'),
(444, 23, 'Catatumbo'),
(445, 23, 'Colón'),
(446, 23, 'Francisco Javier Pulgar'),
(447, 23, 'Páez'),
(448, 23, 'Jesús Enrique Losada'),
(449, 23, 'Jesús María Semprún'),
(450, 23, 'La Cañada de Urdaneta'),
(451, 23, 'Lagunillas'),
(452, 23, 'Machiques de Perijá'),
(453, 23, 'Mara'),
(454, 23, 'Maracaibo'),
(455, 23, 'Miranda'),
(456, 23, 'Rosario de Perijá'),
(457, 23, 'San Francisco'),
(458, 23, 'Santa Rita'),
(459, 23, 'Simón Bolívar'),
(460, 23, 'Sucre'),
(461, 23, 'Valmore Rodríguez'),
(462, 24, 'Libertador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GEO_005_Parroquias`
--

CREATE TABLE `GEO_005_Parroquias` (
  `id_parroquia` int NOT NULL,
  `id_municipio` int NOT NULL,
  `parroquia` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `GEO_005_Parroquias`
--

INSERT INTO `GEO_005_Parroquias` (`id_parroquia`, `id_municipio`, `parroquia`) VALUES
(1, 1, 'Alto Orinoco'),
(2, 1, 'Huachamacare Acanaña'),
(3, 1, 'Marawaka Toky Shamanaña'),
(4, 1, 'Mavaka Mavaka'),
(5, 1, 'Sierra Parima Parimabé'),
(6, 2, 'Ucata Laja Lisa'),
(7, 2, 'Yapacana Macuruco'),
(8, 2, 'Caname Guarinuma'),
(9, 3, 'Fernando Girón Tovar'),
(10, 3, 'Luis Alberto Gómez'),
(11, 3, 'Pahueña Limón de Parhueña'),
(12, 3, 'Platanillal Platanillal'),
(13, 4, 'Samariapo'),
(14, 4, 'Sipapo'),
(15, 4, 'Munduapo'),
(16, 4, 'Guayapo'),
(17, 5, 'Alto Ventuari'),
(18, 5, 'Medio Ventuari'),
(19, 5, 'Bajo Ventuari'),
(20, 6, 'Victorino'),
(21, 6, 'Comunidad'),
(22, 7, 'Casiquiare'),
(23, 7, 'Cocuy'),
(24, 7, 'San Carlos de Río Negro'),
(25, 7, 'Solano'),
(26, 8, 'Anaco'),
(27, 8, 'San Joaquín'),
(28, 9, 'Cachipo'),
(29, 9, 'Aragua de Barcelona'),
(30, 11, 'Lechería'),
(31, 11, 'El Morro'),
(32, 12, 'Puerto Píritu'),
(33, 12, 'San Miguel'),
(34, 12, 'Sucre'),
(35, 13, 'Valle de Guanape'),
(36, 13, 'Santa Bárbara'),
(37, 14, 'El Chaparro'),
(38, 14, 'Tomás Alfaro'),
(39, 14, 'Calatrava'),
(40, 15, 'Guanta'),
(41, 15, 'Chorrerón'),
(42, 16, 'Mamo'),
(43, 16, 'Soledad'),
(44, 17, 'Mapire'),
(45, 17, 'Piar'),
(46, 17, 'Santa Clara'),
(47, 17, 'San Diego de Cabrutica'),
(48, 17, 'Uverito'),
(49, 17, 'Zuata'),
(50, 18, 'Puerto La Cruz'),
(51, 18, 'Pozuelos'),
(52, 19, 'Onoto'),
(53, 19, 'San Pablo'),
(54, 20, 'San Mateo'),
(55, 20, 'El Carito'),
(56, 20, 'Santa Inés'),
(57, 20, 'La Romereña'),
(58, 21, 'Atapirire'),
(59, 21, 'Boca del Pao'),
(60, 21, 'El Pao'),
(61, 21, 'Pariaguán'),
(62, 22, 'Cantaura'),
(63, 22, 'Libertador'),
(64, 22, 'Santa Rosa'),
(65, 22, 'Urica'),
(66, 23, 'Píritu'),
(67, 23, 'San Francisco'),
(68, 24, 'San José de Guanipa'),
(69, 25, 'Boca de Uchire'),
(70, 25, 'Boca de Chávez'),
(71, 26, 'Pueblo Nuevo'),
(72, 26, 'Santa Ana'),
(73, 27, 'Bergantín'),
(74, 27, 'Caigua'),
(75, 27, 'El Carmen'),
(76, 27, 'El Pilar'),
(77, 27, 'Naricual'),
(78, 27, 'San Crsitóbal'),
(79, 28, 'Edmundo Barrios'),
(80, 28, 'Miguel Otero Silva'),
(81, 29, 'Achaguas'),
(82, 29, 'Apurito'),
(83, 29, 'El Yagual'),
(84, 29, 'Guachara'),
(85, 29, 'Mucuritas'),
(86, 29, 'Queseras del medio'),
(87, 30, 'Biruaca'),
(88, 31, 'Bruzual'),
(89, 31, 'Mantecal'),
(90, 31, 'Quintero'),
(91, 31, 'Rincón Hondo'),
(92, 31, 'San Vicente'),
(93, 32, 'Guasdualito'),
(94, 32, 'Aramendi'),
(95, 32, 'El Amparo'),
(96, 32, 'San Camilo'),
(97, 32, 'Urdaneta'),
(98, 33, 'San Juan de Payara'),
(99, 33, 'Codazzi'),
(100, 33, 'Cunaviche'),
(101, 34, 'Elorza'),
(102, 34, 'La Trinidad'),
(103, 35, 'San Fernando'),
(104, 35, 'El Recreo'),
(105, 35, 'Peñalver'),
(106, 35, 'San Rafael de Atamaica'),
(107, 36, 'Pedro José Ovalles'),
(108, 36, 'Joaquín Crespo'),
(109, 36, 'José Casanova Godoy'),
(110, 36, 'Madre María de San José'),
(111, 36, 'Andrés Eloy Blanco'),
(112, 36, 'Los Tacarigua'),
(113, 36, 'Las Delicias'),
(114, 36, 'Choroní'),
(115, 37, 'Bolívar'),
(116, 38, 'Camatagua'),
(117, 38, 'Carmen de Cura'),
(118, 39, 'Santa Rita'),
(119, 39, 'Francisco de Miranda'),
(120, 39, 'Moseñor Feliciano González'),
(121, 40, 'Santa Cruz'),
(122, 41, 'José Félix Ribas'),
(123, 41, 'Castor Nieves Ríos'),
(124, 41, 'Las Guacamayas'),
(125, 41, 'Pao de Zárate'),
(126, 41, 'Zuata'),
(127, 42, 'José Rafael Revenga'),
(128, 43, 'Palo Negro'),
(129, 43, 'San Martín de Porres'),
(130, 44, 'El Limón'),
(131, 44, 'Caña de Azúcar'),
(132, 45, 'Ocumare de la Costa'),
(133, 46, 'San Casimiro'),
(134, 46, 'Güiripa'),
(135, 46, 'Ollas de Caramacate'),
(136, 46, 'Valle Morín'),
(137, 47, 'San Sebastían'),
(138, 48, 'Turmero'),
(139, 48, 'Arevalo Aponte'),
(140, 48, 'Chuao'),
(141, 48, 'Samán de Güere'),
(142, 48, 'Alfredo Pacheco Miranda'),
(143, 49, 'Santos Michelena'),
(144, 49, 'Tiara'),
(145, 50, 'Cagua'),
(146, 50, 'Bella Vista'),
(147, 51, 'Tovar'),
(148, 52, 'Urdaneta'),
(149, 52, 'Las Peñitas'),
(150, 52, 'San Francisco de Cara'),
(151, 52, 'Taguay'),
(152, 53, 'Zamora'),
(153, 53, 'Magdaleno'),
(154, 53, 'San Francisco de Asís'),
(155, 53, 'Valles de Tucutunemo'),
(156, 53, 'Augusto Mijares'),
(157, 54, 'Sabaneta'),
(158, 54, 'Juan Antonio Rodríguez Domínguez'),
(159, 55, 'El Cantón'),
(160, 55, 'Santa Cruz de Guacas'),
(161, 55, 'Puerto Vivas'),
(162, 56, 'Ticoporo'),
(163, 56, 'Nicolás Pulido'),
(164, 56, 'Andrés Bello'),
(165, 57, 'Arismendi'),
(166, 57, 'Guadarrama'),
(167, 57, 'La Unión'),
(168, 57, 'San Antonio'),
(169, 58, 'Barinas'),
(170, 58, 'Alberto Arvelo Larriva'),
(171, 58, 'San Silvestre'),
(172, 58, 'Santa Inés'),
(173, 58, 'Santa Lucía'),
(174, 58, 'Torumos'),
(175, 58, 'El Carmen'),
(176, 58, 'Rómulo Betancourt'),
(177, 58, 'Corazón de Jesús'),
(178, 58, 'Ramón Ignacio Méndez'),
(179, 58, 'Alto Barinas'),
(180, 58, 'Manuel Palacio Fajardo'),
(181, 58, 'Juan Antonio Rodríguez Domínguez'),
(182, 58, 'Dominga Ortiz de Páez'),
(183, 59, 'Barinitas'),
(184, 59, 'Altamira de Cáceres'),
(185, 59, 'Calderas'),
(186, 60, 'Barrancas'),
(187, 60, 'El Socorro'),
(188, 60, 'Mazparrito'),
(189, 61, 'Santa Bárbara'),
(190, 61, 'Pedro Briceño Méndez'),
(191, 61, 'Ramón Ignacio Méndez'),
(192, 61, 'José Ignacio del Pumar'),
(193, 62, 'Obispos'),
(194, 62, 'Guasimitos'),
(195, 62, 'El Real'),
(196, 62, 'La Luz'),
(197, 63, 'Ciudad Bolívia'),
(198, 63, 'José Ignacio Briceño'),
(199, 63, 'José Félix Ribas'),
(200, 63, 'Páez'),
(201, 64, 'Libertad'),
(202, 64, 'Dolores'),
(203, 64, 'Santa Rosa'),
(204, 64, 'Palacio Fajardo'),
(205, 65, 'Ciudad de Nutrias'),
(206, 65, 'El Regalo'),
(207, 65, 'Puerto Nutrias'),
(208, 65, 'Santa Catalina'),
(209, 66, 'Cachamay'),
(210, 66, 'Chirica'),
(211, 66, 'Dalla Costa'),
(212, 66, 'Once de Abril'),
(213, 66, 'Simón Bolívar'),
(214, 66, 'Unare'),
(215, 66, 'Universidad'),
(216, 66, 'Vista al Sol'),
(217, 66, 'Pozo Verde'),
(218, 66, 'Yocoima'),
(219, 66, '5 de Julio'),
(220, 67, 'Cedeño'),
(221, 67, 'Altagracia'),
(222, 67, 'Ascensión Farreras'),
(223, 67, 'Guaniamo'),
(224, 67, 'La Urbana'),
(225, 67, 'Pijiguaos'),
(226, 68, 'El Callao'),
(227, 69, 'Gran Sabana'),
(228, 69, 'Ikabarú'),
(229, 70, 'Catedral'),
(230, 70, 'Zea'),
(231, 70, 'Orinoco'),
(232, 70, 'José Antonio Páez'),
(233, 70, 'Marhuanta'),
(234, 70, 'Agua Salada'),
(235, 70, 'Vista Hermosa'),
(236, 70, 'La Sabanita'),
(237, 70, 'Panapana'),
(238, 71, 'Andrés Eloy Blanco'),
(239, 71, 'Pedro Cova'),
(240, 72, 'Raúl Leoni'),
(241, 72, 'Barceloneta'),
(242, 72, 'Santa Bárbara'),
(243, 72, 'San Francisco'),
(244, 73, 'Roscio'),
(245, 73, 'Salóm'),
(246, 74, 'Sifontes'),
(247, 74, 'Dalla Costa'),
(248, 74, 'San Isidro'),
(249, 75, 'Sucre'),
(250, 75, 'Aripao'),
(251, 75, 'Guarataro'),
(252, 75, 'Las Majadas'),
(253, 75, 'Moitaco'),
(254, 76, 'Padre Pedro Chien'),
(255, 76, 'Río Grande'),
(256, 77, 'Bejuma'),
(257, 77, 'Canoabo'),
(258, 77, 'Simón Bolívar'),
(259, 78, 'Güigüe'),
(260, 78, 'Carabobo'),
(261, 78, 'Tacarigua'),
(262, 79, 'Mariara'),
(263, 79, 'Aguas Calientes'),
(264, 80, 'Ciudad Alianza'),
(265, 80, 'Guacara'),
(266, 80, 'Yagua'),
(267, 81, 'Morón'),
(268, 81, 'Yagua'),
(269, 82, 'Tocuyito'),
(270, 82, 'Independencia'),
(271, 83, 'Los Guayos'),
(272, 84, 'Miranda'),
(273, 85, 'Montalbán'),
(274, 86, 'Naguanagua'),
(275, 87, 'Bartolomé Salóm'),
(276, 87, 'Democracia'),
(277, 87, 'Fraternidad'),
(278, 87, 'Goaigoaza'),
(279, 87, 'Juan José Flores'),
(280, 87, 'Unión'),
(281, 87, 'Borburata'),
(282, 87, 'Patanemo'),
(283, 88, 'San Diego'),
(284, 89, 'San Joaquín'),
(285, 90, 'Candelaria'),
(286, 90, 'Catedral'),
(287, 90, 'El Socorro'),
(288, 90, 'Miguel Peña'),
(289, 90, 'Rafael Urdaneta'),
(290, 90, 'San Blas'),
(291, 90, 'San José'),
(292, 90, 'Santa Rosa'),
(293, 90, 'Negro Primero'),
(294, 91, 'Cojedes'),
(295, 91, 'Juan de Mata Suárez'),
(296, 92, 'Tinaquillo'),
(297, 93, 'El Baúl'),
(298, 93, 'Sucre'),
(299, 94, 'La Aguadita'),
(300, 94, 'Macapo'),
(301, 95, 'El Pao'),
(302, 96, 'El Amparo'),
(303, 96, 'Libertad de Cojedes'),
(304, 97, 'Rómulo Gallegos'),
(305, 98, 'San Carlos de Austria'),
(306, 98, 'Juan Ángel Bravo'),
(307, 98, 'Manuel Manrique'),
(308, 99, 'General en Jefe José Laurencio Silva'),
(309, 100, 'Curiapo'),
(310, 100, 'Almirante Luis Brión'),
(311, 100, 'Francisco Aniceto Lugo'),
(312, 100, 'Manuel Renaud'),
(313, 100, 'Padre Barral'),
(314, 100, 'Santos de Abelgas'),
(315, 101, 'Imataca'),
(316, 101, 'Cinco de Julio'),
(317, 101, 'Juan Bautista Arismendi'),
(318, 101, 'Manuel Piar'),
(319, 101, 'Rómulo Gallegos'),
(320, 102, 'Pedernales'),
(321, 102, 'Luis Beltrán Prieto Figueroa'),
(322, 103, 'San José (Delta Amacuro)'),
(323, 103, 'José Vidal Marcano'),
(324, 103, 'Juan Millán'),
(325, 103, 'Leonardo Ruíz Pineda'),
(326, 103, 'Mariscal Antonio José de Sucre'),
(327, 103, 'Monseñor Argimiro García'),
(328, 103, 'San Rafael (Delta Amacuro)'),
(329, 103, 'Virgen del Valle'),
(330, 10, 'Clarines'),
(331, 10, 'Guanape'),
(332, 10, 'Sabana de Uchire'),
(333, 104, 'Capadare'),
(334, 104, 'La Pastora'),
(335, 104, 'Libertador'),
(336, 104, 'San Juan de los Cayos'),
(337, 105, 'Aracua'),
(338, 105, 'La Peña'),
(339, 105, 'San Luis'),
(340, 106, 'Bariro'),
(341, 106, 'Borojó'),
(342, 106, 'Capatárida'),
(343, 106, 'Guajiro'),
(344, 106, 'Seque'),
(345, 106, 'Zazárida'),
(346, 106, 'Valle de Eroa'),
(347, 107, 'Cacique Manaure'),
(348, 108, 'Norte'),
(349, 108, 'Carirubana'),
(350, 108, 'Santa Ana'),
(351, 108, 'Urbana Punta Cardón'),
(352, 109, 'La Vela de Coro'),
(353, 109, 'Acurigua'),
(354, 109, 'Guaibacoa'),
(355, 109, 'Las Calderas'),
(356, 109, 'Macoruca'),
(357, 110, 'Dabajuro'),
(358, 111, 'Agua Clara'),
(359, 111, 'Avaria'),
(360, 111, 'Pedregal'),
(361, 111, 'Piedra Grande'),
(362, 111, 'Purureche'),
(363, 112, 'Adaure'),
(364, 112, 'Adícora'),
(365, 112, 'Baraived'),
(366, 112, 'Buena Vista'),
(367, 112, 'Jadacaquiva'),
(368, 112, 'El Vínculo'),
(369, 112, 'El Hato'),
(370, 112, 'Moruy'),
(371, 112, 'Pueblo Nuevo'),
(372, 113, 'Agua Larga'),
(373, 113, 'El Paují'),
(374, 113, 'Independencia'),
(375, 113, 'Mapararí'),
(376, 114, 'Agua Linda'),
(377, 114, 'Araurima'),
(378, 114, 'Jacura'),
(379, 115, 'Tucacas'),
(380, 115, 'Boca de Aroa'),
(381, 116, 'Los Taques'),
(382, 116, 'Judibana'),
(383, 117, 'Mene de Mauroa'),
(384, 117, 'San Félix'),
(385, 117, 'Casigua'),
(386, 118, 'Guzmán Guillermo'),
(387, 118, 'Mitare'),
(388, 118, 'Río Seco'),
(389, 118, 'Sabaneta'),
(390, 118, 'San Antonio'),
(391, 118, 'San Gabriel'),
(392, 118, 'Santa Ana'),
(393, 119, 'Boca del Tocuyo'),
(394, 119, 'Chichiriviche'),
(395, 119, 'Tocuyo de la Costa'),
(396, 120, 'Palmasola'),
(397, 121, 'Cabure'),
(398, 121, 'Colina'),
(399, 121, 'Curimagua'),
(400, 122, 'San José de la Costa'),
(401, 122, 'Píritu'),
(402, 123, 'San Francisco'),
(403, 124, 'Sucre'),
(404, 124, 'Pecaya'),
(405, 125, 'Tocópero'),
(406, 126, 'El Charal'),
(407, 126, 'Las Vegas del Tuy'),
(408, 126, 'Santa Cruz de Bucaral'),
(409, 127, 'Bruzual'),
(410, 127, 'Urumaco'),
(411, 128, 'Puerto Cumarebo'),
(412, 128, 'La Ciénaga'),
(413, 128, 'La Soledad'),
(414, 128, 'Pueblo Cumarebo'),
(415, 128, 'Zazárida'),
(416, 113, 'Churuguara'),
(417, 129, 'Camaguán'),
(418, 129, 'Puerto Miranda'),
(419, 129, 'Uverito'),
(420, 130, 'Chaguaramas'),
(421, 131, 'El Socorro'),
(422, 132, 'Tucupido'),
(423, 132, 'San Rafael de Laya'),
(424, 133, 'Altagracia de Orituco'),
(425, 133, 'San Rafael de Orituco'),
(426, 133, 'San Francisco Javier de Lezama'),
(427, 133, 'Paso Real de Macaira'),
(428, 133, 'Carlos Soublette'),
(429, 133, 'San Francisco de Macaira'),
(430, 133, 'Libertad de Orituco'),
(431, 134, 'Cantaclaro'),
(432, 134, 'San Juan de los Morros'),
(433, 134, 'Parapara'),
(434, 135, 'El Sombrero'),
(435, 135, 'Sosa'),
(436, 136, 'Las Mercedes'),
(437, 136, 'Cabruta'),
(438, 136, 'Santa Rita de Manapire'),
(439, 137, 'Valle de la Pascua'),
(440, 137, 'Espino'),
(441, 138, 'San José de Unare'),
(442, 138, 'Zaraza'),
(443, 139, 'San José de Tiznados'),
(444, 139, 'San Francisco de Tiznados'),
(445, 139, 'San Lorenzo de Tiznados'),
(446, 139, 'Ortiz'),
(447, 140, 'Guayabal'),
(448, 140, 'Cazorla'),
(449, 141, 'San José de Guaribe'),
(450, 141, 'Uveral'),
(451, 142, 'Santa María de Ipire'),
(452, 142, 'Altamira'),
(453, 143, 'El Calvario'),
(454, 143, 'El Rastro'),
(455, 143, 'Guardatinajas'),
(456, 143, 'Capital Urbana Calabozo'),
(457, 144, 'Quebrada Honda de Guache'),
(458, 144, 'Pío Tamayo'),
(459, 144, 'Yacambú'),
(460, 145, 'Fréitez'),
(461, 145, 'José María Blanco'),
(462, 146, 'Catedral'),
(463, 146, 'Concepción'),
(464, 146, 'El Cují'),
(465, 146, 'Juan de Villegas'),
(466, 146, 'Santa Rosa'),
(467, 146, 'Tamaca'),
(468, 146, 'Unión'),
(469, 146, 'Aguedo Felipe Alvarado'),
(470, 146, 'Buena Vista'),
(471, 146, 'Juárez'),
(472, 147, 'Juan Bautista Rodríguez'),
(473, 147, 'Cuara'),
(474, 147, 'Diego de Lozada'),
(475, 147, 'Paraíso de San José'),
(476, 147, 'San Miguel'),
(477, 147, 'Tintorero'),
(478, 147, 'José Bernardo Dorante'),
(479, 147, 'Coronel Mariano Peraza '),
(480, 148, 'Bolívar'),
(481, 148, 'Anzoátegui'),
(482, 148, 'Guarico'),
(483, 148, 'Hilario Luna y Luna'),
(484, 148, 'Humocaro Alto'),
(485, 148, 'Humocaro Bajo'),
(486, 148, 'La Candelaria'),
(487, 148, 'Morán'),
(488, 149, 'Cabudare'),
(489, 149, 'José Gregorio Bastidas'),
(490, 149, 'Agua Viva'),
(491, 150, 'Sarare'),
(492, 150, 'Buría'),
(493, 150, 'Gustavo Vegas León'),
(494, 151, 'Trinidad Samuel'),
(495, 151, 'Antonio Díaz'),
(496, 151, 'Camacaro'),
(497, 151, 'Castañeda'),
(498, 151, 'Cecilio Zubillaga'),
(499, 151, 'Chiquinquirá'),
(500, 151, 'El Blanco'),
(501, 151, 'Espinoza de los Monteros'),
(502, 151, 'Lara'),
(503, 151, 'Las Mercedes'),
(504, 151, 'Manuel Morillo'),
(505, 151, 'Montaña Verde'),
(506, 151, 'Montes de Oca'),
(507, 151, 'Torres'),
(508, 151, 'Heriberto Arroyo'),
(509, 151, 'Reyes Vargas'),
(510, 151, 'Altagracia'),
(511, 152, 'Siquisique'),
(512, 152, 'Moroturo'),
(513, 152, 'San Miguel'),
(514, 152, 'Xaguas'),
(515, 179, 'Presidente Betancourt'),
(516, 179, 'Presidente Páez'),
(517, 179, 'Presidente Rómulo Gallegos'),
(518, 179, 'Gabriel Picón González'),
(519, 179, 'Héctor Amable Mora'),
(520, 179, 'José Nucete Sardi'),
(521, 179, 'Pulido Méndez'),
(522, 180, 'La Azulita'),
(523, 181, 'Santa Cruz de Mora'),
(524, 181, 'Mesa Bolívar'),
(525, 181, 'Mesa de Las Palmas'),
(526, 182, 'Aricagua'),
(527, 182, 'San Antonio'),
(528, 183, 'Canagua'),
(529, 183, 'Capurí'),
(530, 183, 'Chacantá'),
(531, 183, 'El Molino'),
(532, 183, 'Guaimaral'),
(533, 183, 'Mucutuy'),
(534, 183, 'Mucuchachí'),
(535, 184, 'Fernández Peña'),
(536, 184, 'Matriz'),
(537, 184, 'Montalbán'),
(538, 184, 'Acequias'),
(539, 184, 'Jají'),
(540, 184, 'La Mesa'),
(541, 184, 'San José del Sur'),
(542, 185, 'Tucaní'),
(543, 185, 'Florencio Ramírez'),
(544, 186, 'Santo Domingo'),
(545, 186, 'Las Piedras'),
(546, 187, 'Guaraque'),
(547, 187, 'Mesa de Quintero'),
(548, 187, 'Río Negro'),
(549, 188, 'Arapuey'),
(550, 188, 'Palmira'),
(551, 189, 'San Cristóbal de Torondoy'),
(552, 189, 'Torondoy'),
(553, 190, 'Antonio Spinetti Dini'),
(554, 190, 'Arias'),
(555, 190, 'Caracciolo Parra Pérez'),
(556, 190, 'Domingo Peña'),
(557, 190, 'El Llano'),
(558, 190, 'Gonzalo Picón Febres'),
(559, 190, 'Jacinto Plaza'),
(560, 190, 'Juan Rodríguez Suárez'),
(561, 190, 'Lasso de la Vega'),
(562, 190, 'Mariano Picón Salas'),
(563, 190, 'Milla'),
(564, 190, 'Osuna Rodríguez'),
(565, 190, 'Sagrario'),
(566, 190, 'El Morro'),
(567, 190, 'Los Nevados'),
(568, 191, 'Andrés Eloy Blanco'),
(569, 191, 'La Venta'),
(570, 191, 'Piñango'),
(571, 191, 'Timotes'),
(572, 192, 'Eloy Paredes'),
(573, 192, 'San Rafael de Alcázar'),
(574, 192, 'Santa Elena de Arenales'),
(575, 193, 'Santa María de Caparo'),
(576, 194, 'Pueblo Llano'),
(577, 195, 'Cacute'),
(578, 195, 'La Toma'),
(579, 195, 'Mucuchíes'),
(580, 195, 'Mucurubá'),
(581, 195, 'San Rafael'),
(582, 196, 'Gerónimo Maldonado'),
(583, 196, 'Bailadores'),
(584, 197, 'Tabay'),
(585, 198, 'Chiguará'),
(586, 198, 'Estánquez'),
(587, 198, 'Lagunillas'),
(588, 198, 'La Trampa'),
(589, 198, 'Pueblo Nuevo del Sur'),
(590, 198, 'San Juan'),
(591, 199, 'El Amparo'),
(592, 199, 'El Llano'),
(593, 199, 'San Francisco'),
(594, 199, 'Tovar'),
(595, 200, 'Independencia'),
(596, 200, 'María de la Concepción Palacios Blanco'),
(597, 200, 'Nueva Bolivia'),
(598, 200, 'Santa Apolonia'),
(599, 201, 'Caño El Tigre'),
(600, 201, 'Zea'),
(601, 223, 'Aragüita'),
(602, 223, 'Arévalo González'),
(603, 223, 'Capaya'),
(604, 223, 'Caucagua'),
(605, 223, 'Panaquire'),
(606, 223, 'Ribas'),
(607, 223, 'El Café'),
(608, 223, 'Marizapa'),
(609, 224, 'Cumbo'),
(610, 224, 'San José de Barlovento'),
(611, 225, 'El Cafetal'),
(612, 225, 'Las Minas'),
(613, 225, 'Nuestra Señora del Rosario'),
(614, 226, 'Higuerote'),
(615, 226, 'Curiepe'),
(616, 226, 'Tacarigua de Brión'),
(617, 227, 'Mamporal'),
(618, 228, 'Carrizal'),
(619, 229, 'Chacao'),
(620, 230, 'Charallave'),
(621, 230, 'Las Brisas'),
(622, 231, 'El Hatillo'),
(623, 232, 'Altagracia de la Montaña'),
(624, 232, 'Cecilio Acosta'),
(625, 232, 'Los Teques'),
(626, 232, 'El Jarillo'),
(627, 232, 'San Pedro'),
(628, 232, 'Tácata'),
(629, 232, 'Paracotos'),
(630, 233, 'Cartanal'),
(631, 233, 'Santa Teresa del Tuy'),
(632, 234, 'La Democracia'),
(633, 234, 'Ocumare del Tuy'),
(634, 234, 'Santa Bárbara'),
(635, 235, 'San Antonio de los Altos'),
(636, 236, 'Río Chico'),
(637, 236, 'El Guapo'),
(638, 236, 'Tacarigua de la Laguna'),
(639, 236, 'Paparo'),
(640, 236, 'San Fernando del Guapo'),
(641, 237, 'Santa Lucía del Tuy'),
(642, 238, 'Cúpira'),
(643, 238, 'Machurucuto'),
(644, 239, 'Guarenas'),
(645, 240, 'San Antonio de Yare'),
(646, 240, 'San Francisco de Yare'),
(647, 241, 'Leoncio Martínez'),
(648, 241, 'Petare'),
(649, 241, 'Caucagüita'),
(650, 241, 'Filas de Mariche'),
(651, 241, 'La Dolorita'),
(652, 242, 'Cúa'),
(653, 242, 'Nueva Cúa'),
(654, 243, 'Guatire'),
(655, 243, 'Bolívar'),
(656, 258, 'San Antonio de Maturín'),
(657, 258, 'San Francisco de Maturín'),
(658, 259, 'Aguasay'),
(659, 260, 'Caripito'),
(660, 261, 'El Guácharo'),
(661, 261, 'La Guanota'),
(662, 261, 'Sabana de Piedra'),
(663, 261, 'San Agustín'),
(664, 261, 'Teresen'),
(665, 261, 'Caripe'),
(666, 262, 'Areo'),
(667, 262, 'Capital Cedeño'),
(668, 262, 'San Félix de Cantalicio'),
(669, 262, 'Viento Fresco'),
(670, 263, 'El Tejero'),
(671, 263, 'Punta de Mata'),
(672, 264, 'Chaguaramas'),
(673, 264, 'Las Alhuacas'),
(674, 264, 'Tabasca'),
(675, 264, 'Temblador'),
(676, 265, 'Alto de los Godos'),
(677, 265, 'Boquerón'),
(678, 265, 'Las Cocuizas'),
(679, 265, 'La Cruz'),
(680, 265, 'San Simón'),
(681, 265, 'El Corozo'),
(682, 265, 'El Furrial'),
(683, 265, 'Jusepín'),
(684, 265, 'La Pica'),
(685, 265, 'San Vicente'),
(686, 266, 'Aparicio'),
(687, 266, 'Aragua de Maturín'),
(688, 266, 'Chaguamal'),
(689, 266, 'El Pinto'),
(690, 266, 'Guanaguana'),
(691, 266, 'La Toscana'),
(692, 266, 'Taguaya'),
(693, 267, 'Cachipo'),
(694, 267, 'Quiriquire'),
(695, 268, 'Santa Bárbara'),
(696, 269, 'Barrancas'),
(697, 269, 'Los Barrancos de Fajardo'),
(698, 270, 'Uracoa'),
(699, 271, 'Antolín del Campo'),
(700, 272, 'Arismendi'),
(701, 273, 'García'),
(702, 273, 'Francisco Fajardo'),
(703, 274, 'Bolívar'),
(704, 274, 'Guevara'),
(705, 274, 'Matasiete'),
(706, 274, 'Santa Ana'),
(707, 274, 'Sucre'),
(708, 275, 'Aguirre'),
(709, 275, 'Maneiro'),
(710, 276, 'Adrián'),
(711, 276, 'Juan Griego'),
(712, 276, 'Yaguaraparo'),
(713, 277, 'Porlamar'),
(714, 278, 'San Francisco de Macanao'),
(715, 278, 'Boca de Río'),
(716, 279, 'Tubores'),
(717, 279, 'Los Baleales'),
(718, 280, 'Vicente Fuentes'),
(719, 280, 'Villalba'),
(720, 281, 'San Juan Bautista'),
(721, 281, 'Zabala'),
(722, 283, 'Capital Araure'),
(723, 283, 'Río Acarigua'),
(724, 284, 'Capital Esteller'),
(725, 284, 'Uveral'),
(726, 285, 'Guanare'),
(727, 285, 'Córdoba'),
(728, 285, 'San José de la Montaña'),
(729, 285, 'San Juan de Guanaguanare'),
(730, 285, 'Virgen de la Coromoto'),
(731, 286, 'Guanarito'),
(732, 286, 'Trinidad de la Capilla'),
(733, 286, 'Divina Pastora'),
(734, 287, 'Monseñor José Vicente de Unda'),
(735, 287, 'Peña Blanca'),
(736, 288, 'Capital Ospino'),
(737, 288, 'Aparición'),
(738, 288, 'La Estación'),
(739, 289, 'Páez'),
(740, 289, 'Payara'),
(741, 289, 'Pimpinela'),
(742, 289, 'Ramón Peraza'),
(743, 290, 'Papelón'),
(744, 290, 'Caño Delgadito'),
(745, 291, 'San Genaro de Boconoito'),
(746, 291, 'Antolín Tovar'),
(747, 292, 'San Rafael de Onoto'),
(748, 292, 'Santa Fe'),
(749, 292, 'Thermo Morles'),
(750, 293, 'Santa Rosalía'),
(751, 293, 'Florida'),
(752, 294, 'Sucre'),
(753, 294, 'Concepción'),
(754, 294, 'San Rafael de Palo Alzado'),
(755, 294, 'Uvencio Antonio Velásquez'),
(756, 294, 'San José de Saguaz'),
(757, 294, 'Villa Rosa'),
(758, 295, 'Turén'),
(759, 295, 'Canelones'),
(760, 295, 'Santa Cruz'),
(761, 295, 'San Isidro Labrador'),
(762, 296, 'Mariño'),
(763, 296, 'Rómulo Gallegos'),
(764, 297, 'San José de Aerocuar'),
(765, 297, 'Tavera Acosta'),
(766, 298, 'Río Caribe'),
(767, 298, 'Antonio José de Sucre'),
(768, 298, 'El Morro de Puerto Santo'),
(769, 298, 'Puerto Santo'),
(770, 298, 'San Juan de las Galdonas'),
(771, 299, 'El Pilar'),
(772, 299, 'El Rincón'),
(773, 299, 'General Francisco Antonio Váquez'),
(774, 299, 'Guaraúnos'),
(775, 299, 'Tunapuicito'),
(776, 299, 'Unión'),
(777, 300, 'Santa Catalina'),
(778, 300, 'Santa Rosa'),
(779, 300, 'Santa Teresa'),
(780, 300, 'Bolívar'),
(781, 300, 'Maracapana'),
(782, 302, 'Libertad'),
(783, 302, 'El Paujil'),
(784, 302, 'Yaguaraparo'),
(785, 303, 'Cruz Salmerón Acosta'),
(786, 303, 'Chacopata'),
(787, 303, 'Manicuare'),
(788, 304, 'Tunapuy'),
(789, 304, 'Campo Elías'),
(790, 305, 'Irapa'),
(791, 305, 'Campo Claro'),
(792, 305, 'Maraval'),
(793, 305, 'San Antonio de Irapa'),
(794, 305, 'Soro'),
(795, 306, 'Mejía'),
(796, 307, 'Cumanacoa'),
(797, 307, 'Arenas'),
(798, 307, 'Aricagua'),
(799, 307, 'Cogollar'),
(800, 307, 'San Fernando'),
(801, 307, 'San Lorenzo'),
(802, 308, 'Villa Frontado (Muelle de Cariaco)'),
(803, 308, 'Catuaro'),
(804, 308, 'Rendón'),
(805, 308, 'San Cruz'),
(806, 308, 'Santa María'),
(807, 309, 'Altagracia'),
(808, 309, 'Santa Inés'),
(809, 309, 'Valentín Valiente'),
(810, 309, 'Ayacucho'),
(811, 309, 'San Juan'),
(812, 309, 'Raúl Leoni'),
(813, 309, 'Gran Mariscal'),
(814, 310, 'Cristóbal Colón'),
(815, 310, 'Bideau'),
(816, 310, 'Punta de Piedras'),
(817, 310, 'Güiria'),
(818, 341, 'Andrés Bello'),
(819, 342, 'Antonio Rómulo Costa'),
(820, 343, 'Ayacucho'),
(821, 343, 'Rivas Berti'),
(822, 343, 'San Pedro del Río'),
(823, 344, 'Bolívar'),
(824, 344, 'Palotal'),
(825, 344, 'General Juan Vicente Gómez'),
(826, 344, 'Isaías Medina Angarita'),
(827, 345, 'Cárdenas'),
(828, 345, 'Amenodoro Ángel Lamus'),
(829, 345, 'La Florida'),
(830, 346, 'Córdoba'),
(831, 347, 'Fernández Feo'),
(832, 347, 'Alberto Adriani'),
(833, 347, 'Santo Domingo'),
(834, 348, 'Francisco de Miranda'),
(835, 349, 'García de Hevia'),
(836, 349, 'Boca de Grita'),
(837, 349, 'José Antonio Páez'),
(838, 350, 'Guásimos'),
(839, 351, 'Independencia'),
(840, 351, 'Juan Germán Roscio'),
(841, 351, 'Román Cárdenas'),
(842, 352, 'Jáuregui'),
(843, 352, 'Emilio Constantino Guerrero'),
(844, 352, 'Monseñor Miguel Antonio Salas'),
(845, 353, 'José María Vargas'),
(846, 354, 'Junín'),
(847, 354, 'La Petrólea'),
(848, 354, 'Quinimarí'),
(849, 354, 'Bramón'),
(850, 355, 'Libertad'),
(851, 355, 'Cipriano Castro'),
(852, 355, 'Manuel Felipe Rugeles'),
(853, 356, 'Libertador'),
(854, 356, 'Doradas'),
(855, 356, 'Emeterio Ochoa'),
(856, 356, 'San Joaquín de Navay'),
(857, 357, 'Lobatera'),
(858, 357, 'Constitución'),
(859, 358, 'Michelena'),
(860, 359, 'Panamericano'),
(861, 359, 'La Palmita'),
(862, 360, 'Pedro María Ureña'),
(863, 360, 'Nueva Arcadia'),
(864, 361, 'Delicias'),
(865, 361, 'Pecaya'),
(866, 362, 'Samuel Darío Maldonado'),
(867, 362, 'Boconó'),
(868, 362, 'Hernández'),
(869, 363, 'La Concordia'),
(870, 363, 'San Juan Bautista'),
(871, 363, 'Pedro María Morantes'),
(872, 363, 'San Sebastián'),
(873, 363, 'Dr. Francisco Romero Lobo'),
(874, 364, 'Seboruco'),
(875, 365, 'Simón Rodríguez'),
(876, 366, 'Sucre'),
(877, 366, 'Eleazar López Contreras'),
(878, 366, 'San Pablo'),
(879, 367, 'Torbes'),
(880, 368, 'Uribante'),
(881, 368, 'Cárdenas'),
(882, 368, 'Juan Pablo Peñalosa'),
(883, 368, 'Potosí'),
(884, 369, 'San Judas Tadeo'),
(885, 370, 'Araguaney'),
(886, 370, 'El Jaguito'),
(887, 370, 'La Esperanza'),
(888, 370, 'Santa Isabel'),
(889, 371, 'Boconó'),
(890, 371, 'El Carmen'),
(891, 371, 'Mosquey'),
(892, 371, 'Ayacucho'),
(893, 371, 'Burbusay'),
(894, 371, 'General Ribas'),
(895, 371, 'Guaramacal'),
(896, 371, 'Vega de Guaramacal'),
(897, 371, 'Monseñor Jáuregui'),
(898, 371, 'Rafael Rangel'),
(899, 371, 'San Miguel'),
(900, 371, 'San José'),
(901, 372, 'Sabana Grande'),
(902, 372, 'Cheregüé'),
(903, 372, 'Granados'),
(904, 373, 'Arnoldo Gabaldón'),
(905, 373, 'Bolivia'),
(906, 373, 'Carrillo'),
(907, 373, 'Cegarra'),
(908, 373, 'Chejendé'),
(909, 373, 'Manuel Salvador Ulloa'),
(910, 373, 'San José'),
(911, 374, 'Carache'),
(912, 374, 'La Concepción'),
(913, 374, 'Cuicas'),
(914, 374, 'Panamericana'),
(915, 374, 'Santa Cruz'),
(916, 375, 'Escuque'),
(917, 375, 'La Unión'),
(918, 375, 'Santa Rita'),
(919, 375, 'Sabana Libre'),
(920, 376, 'El Socorro'),
(921, 376, 'Los Caprichos'),
(922, 376, 'Antonio José de Sucre'),
(923, 377, 'Campo Elías'),
(924, 377, 'Arnoldo Gabaldón'),
(925, 378, 'Santa Apolonia'),
(926, 378, 'El Progreso'),
(927, 378, 'La Ceiba'),
(928, 378, 'Tres de Febrero'),
(929, 379, 'El Dividive'),
(930, 379, 'Agua Santa'),
(931, 379, 'Agua Caliente'),
(932, 379, 'El Cenizo'),
(933, 379, 'Valerita'),
(934, 380, 'Monte Carmelo'),
(935, 380, 'Buena Vista'),
(936, 380, 'Santa María del Horcón'),
(937, 381, 'Motatán'),
(938, 381, 'El Baño'),
(939, 381, 'Jalisco'),
(940, 382, 'Pampán'),
(941, 382, 'Flor de Patria'),
(942, 382, 'La Paz'),
(943, 382, 'Santa Ana'),
(944, 383, 'Pampanito'),
(945, 383, 'La Concepción'),
(946, 383, 'Pampanito II'),
(947, 384, 'Betijoque'),
(948, 384, 'José Gregorio Hernández'),
(949, 384, 'La Pueblita'),
(950, 384, 'Los Cedros'),
(951, 385, 'Carvajal'),
(952, 385, 'Campo Alegre'),
(953, 385, 'Antonio Nicolás Briceño'),
(954, 385, 'José Leonardo Suárez'),
(955, 386, 'Sabana de Mendoza'),
(956, 386, 'Junín'),
(957, 386, 'Valmore Rodríguez'),
(958, 386, 'El Paraíso'),
(959, 387, 'Andrés Linares'),
(960, 387, 'Chiquinquirá'),
(961, 387, 'Cristóbal Mendoza'),
(962, 387, 'Cruz Carrillo'),
(963, 387, 'Matriz'),
(964, 387, 'Monseñor Carrillo'),
(965, 387, 'Tres Esquinas'),
(966, 388, 'Cabimbú'),
(967, 388, 'Jajó'),
(968, 388, 'La Mesa de Esnujaque'),
(969, 388, 'Santiago'),
(970, 388, 'Tuñame'),
(971, 388, 'La Quebrada'),
(972, 389, 'Juan Ignacio Montilla'),
(973, 389, 'La Beatriz'),
(974, 389, 'La Puerta'),
(975, 389, 'Mendoza del Valle de Momboy'),
(976, 389, 'Mercedes Díaz'),
(977, 389, 'San Luis'),
(978, 390, 'Caraballeda'),
(979, 390, 'Carayaca'),
(980, 390, 'Carlos Soublette'),
(981, 390, 'Caruao Chuspa'),
(982, 390, 'Catia La Mar'),
(983, 390, 'El Junko'),
(984, 390, 'La Guaira'),
(985, 390, 'Macuto'),
(986, 390, 'Maiquetía'),
(987, 390, 'Naiguatá'),
(988, 390, 'Urimare'),
(989, 391, 'Arístides Bastidas'),
(990, 392, 'Bolívar'),
(991, 407, 'Chivacoa'),
(992, 407, 'Campo Elías'),
(993, 408, 'Cocorote'),
(994, 409, 'Independencia'),
(995, 410, 'José Antonio Páez'),
(996, 411, 'La Trinidad'),
(997, 412, 'Manuel Monge'),
(998, 413, 'Salóm'),
(999, 413, 'Temerla'),
(1000, 413, 'Nirgua'),
(1001, 414, 'San Andrés'),
(1002, 414, 'Yaritagua'),
(1003, 415, 'San Javier'),
(1004, 415, 'Albarico'),
(1005, 415, 'San Felipe'),
(1006, 416, 'Sucre'),
(1007, 417, 'Urachiche'),
(1008, 418, 'El Guayabo'),
(1009, 418, 'Farriar'),
(1010, 441, 'Isla de Toas'),
(1011, 441, 'Monagas'),
(1012, 442, 'San Timoteo'),
(1013, 442, 'General Urdaneta'),
(1014, 442, 'Libertador'),
(1015, 442, 'Marcelino Briceño'),
(1016, 442, 'Pueblo Nuevo'),
(1017, 442, 'Manuel Guanipa Matos'),
(1018, 443, 'Ambrosio'),
(1019, 443, 'Carmen Herrera'),
(1020, 443, 'La Rosa'),
(1021, 443, 'Germán Ríos Linares'),
(1022, 443, 'San Benito'),
(1023, 443, 'Rómulo Betancourt'),
(1024, 443, 'Jorge Hernández'),
(1025, 443, 'Punta Gorda'),
(1026, 443, 'Arístides Calvani'),
(1027, 444, 'Encontrados'),
(1028, 444, 'Udón Pérez'),
(1029, 445, 'Moralito'),
(1030, 445, 'San Carlos del Zulia'),
(1031, 445, 'Santa Cruz del Zulia'),
(1032, 445, 'Santa Bárbara'),
(1033, 445, 'Urribarrí'),
(1034, 446, 'Carlos Quevedo'),
(1035, 446, 'Francisco Javier Pulgar'),
(1036, 446, 'Simón Rodríguez'),
(1037, 446, 'Guamo-Gavilanes'),
(1038, 448, 'La Concepción'),
(1039, 448, 'San José'),
(1040, 448, 'Mariano Parra León'),
(1041, 448, 'José Ramón Yépez'),
(1042, 449, 'Jesús María Semprún'),
(1043, 449, 'Barí'),
(1044, 450, 'Concepción'),
(1045, 450, 'Andrés Bello'),
(1046, 450, 'Chiquinquirá'),
(1047, 450, 'El Carmelo'),
(1048, 450, 'Potreritos'),
(1049, 451, 'Libertad'),
(1050, 451, 'Alonso de Ojeda'),
(1051, 451, 'Venezuela'),
(1052, 451, 'Eleazar López Contreras'),
(1053, 451, 'Campo Lara'),
(1054, 452, 'Bartolomé de las Casas'),
(1055, 452, 'Libertad'),
(1056, 452, 'Río Negro'),
(1057, 452, 'San José de Perijá'),
(1058, 453, 'San Rafael'),
(1059, 453, 'La Sierrita'),
(1060, 453, 'Las Parcelas'),
(1061, 453, 'Luis de Vicente'),
(1062, 453, 'Monseñor Marcos Sergio Godoy'),
(1063, 453, 'Ricaurte'),
(1064, 453, 'Tamare'),
(1065, 454, 'Antonio Borjas Romero'),
(1066, 454, 'Bolívar'),
(1067, 454, 'Cacique Mara'),
(1068, 454, 'Carracciolo Parra Pérez'),
(1069, 454, 'Cecilio Acosta'),
(1070, 454, 'Cristo de Aranza'),
(1071, 454, 'Coquivacoa'),
(1072, 454, 'Chiquinquirá'),
(1073, 454, 'Francisco Eugenio Bustamante'),
(1074, 454, 'Idelfonzo Vásquez'),
(1075, 454, 'Juana de Ávila'),
(1076, 454, 'Luis Hurtado Higuera'),
(1077, 454, 'Manuel Dagnino'),
(1078, 454, 'Olegario Villalobos'),
(1079, 454, 'Raúl Leoni'),
(1080, 454, 'Santa Lucía'),
(1081, 454, 'Venancio Pulgar'),
(1082, 454, 'San Isidro'),
(1083, 455, 'Altagracia'),
(1084, 455, 'Faría'),
(1085, 455, 'Ana María Campos'),
(1086, 455, 'San Antonio'),
(1087, 455, 'San José'),
(1088, 456, 'Donaldo García'),
(1089, 456, 'El Rosario'),
(1090, 456, 'Sixto Zambrano'),
(1091, 457, 'San Francisco'),
(1092, 457, 'El Bajo'),
(1093, 457, 'Domitila Flores'),
(1094, 457, 'Francisco Ochoa'),
(1095, 457, 'Los Cortijos'),
(1096, 457, 'Marcial Hernández'),
(1097, 458, 'Santa Rita'),
(1098, 458, 'El Mene'),
(1099, 458, 'Pedro Lucas Urribarrí'),
(1100, 458, 'José Cenobio Urribarrí'),
(1101, 459, 'Rafael Maria Baralt'),
(1102, 459, 'Manuel Manrique'),
(1103, 459, 'Rafael Urdaneta'),
(1104, 460, 'Bobures'),
(1105, 460, 'Gibraltar'),
(1106, 460, 'Heras'),
(1107, 460, 'Monseñor Arturo Álvarez'),
(1108, 460, 'Rómulo Gallegos'),
(1109, 460, 'El Batey'),
(1110, 461, 'Rafael Urdaneta'),
(1111, 461, 'La Victoria'),
(1112, 461, 'Raúl Cuenca'),
(1113, 447, 'Sinamaica'),
(1114, 447, 'Alta Guajira'),
(1115, 447, 'Elías Sánchez Rubio'),
(1116, 447, 'Guajira'),
(1117, 462, 'Altagracia'),
(1118, 462, 'Antímano'),
(1119, 462, 'Caricuao'),
(1120, 462, 'Catedral'),
(1121, 462, 'Coche'),
(1122, 462, 'El Junquito'),
(1123, 462, 'El Paraíso'),
(1124, 462, 'El Recreo'),
(1125, 462, 'El Valle'),
(1126, 462, 'La Candelaria'),
(1127, 462, 'La Pastora'),
(1128, 462, 'La Vega'),
(1129, 462, 'Macarao'),
(1130, 462, 'San Agustín'),
(1131, 462, 'San Bernardino'),
(1132, 462, 'San José'),
(1133, 462, 'San Juan'),
(1134, 462, 'San Pedro'),
(1135, 462, 'Santa Rosalía'),
(1136, 462, 'Santa Teresa'),
(1137, 462, 'Sucre (Catia)'),
(1138, 462, '23 de enero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEC_001_Aplicacion`
--

CREATE TABLE `SEC_001_Aplicacion` (
  `id` int UNSIGNED NOT NULL,
  `type` int NOT NULL,
  `serv` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomb` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de Aplicacion',
  `vers` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sope` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `db` varchar(64) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idio` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `obse` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `user` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `SEC_001_Aplicacion`
--

INSERT INTO `SEC_001_Aplicacion` (`id`, `type`, `serv`, `nomb`, `vers`, `sope`, `db`, `idio`, `obse`, `user`) VALUES
(1, 2, '127.0.1.1', 'ipostel', 'v1.0.0.1', 'LINUX', 'MYSQL', 'PHP', 'Sistema del Core Postal Venezolano', 'admin'),
(3, 1, 'localhost', 'Gestion De Documentos', '0.0.1', 'MACOS', 'MYSQL', 'TSC', 'La gestión documental o gestión de documentos es el conjunto de normas técnicas y prácticas usadas para administrar los documentos de todo tipo', 'administrador'),
(2, 2, '127.0.1.1', 'sssifanb', 'V1.0.0.1', 'MACOS', 'POSTGRES', 'PHP', 'Sistema de Seguridad Social Integral de la Fuerza Armada Bolivariana', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEC_002_Api`
--

CREATE TABLE `SEC_002_Api` (
  `id` bigint UNSIGNED NOT NULL,
  `nomb` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idfunc` varchar(128) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Id de la Funcion HEX',
  `func` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descr` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `param` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `esta` int NOT NULL,
  `idapp` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `SEC_002_Api`
--

INSERT INTO `SEC_002_Api` (`id`, `nomb`, `idfunc`, `func`, `descr`, `param`, `esta`, `idapp`) VALUES
(1, 'seguridad', '60e46a159727d7cd4fec89de', 'ListarPaises', 'Listar los paises del mundo con codigos', '', 1, 2),
(2, 'Control', '61129ed14cb46cb19491b515', 'ListarDiezPaises', 'Diez Paises', '', 1, 2),
(3, 'Consulta', '60e308d338db6904898622e7', 'LstComunicaciones', 'Listar consultas en general', '', 1, 1),
(4, 'SEGURIDAD', '60e4cce514f3854d338c109d', 'LstMenus', 'Listar los menus asociados a un. modulos', '', 1, 1),
(5, 'OPERATIVA', '61437035602b8158cbd2cf81', 'LstTaquillas', 'Listado de Taquillas activas', '', 1, 1),
(6, 'Control', '6149e042bcf8621345919d43', 'InsertarCliente', 'Insertar un Cliente Activo', '', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEC_003_Conexion`
--

CREATE TABLE `SEC_003_Conexion` (
  `id` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomb` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `func` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descr` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `param` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `esta` int NOT NULL,
  `idapp` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEC_004_Modulo`
--

CREATE TABLE `SEC_004_Modulo` (
  `id` int UNSIGNED NOT NULL,
  `nomb` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `descr` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `idapp` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `SEC_004_Modulo`
--

INSERT INTO `SEC_004_Modulo` (`id`, `nomb`, `descr`, `idapp`) VALUES
(1, 'Oficina Postal Privada', NULL, 1),
(2, 'Nomina', NULL, 2),
(3, 'Configuraciones', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEC_005_Menu`
--

CREATE TABLE `SEC_005_Menu` (
  `id` int UNSIGNED NOT NULL,
  `nomb` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `js` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `icon` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `clase` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `type` int NOT NULL,
  `idmod` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `SEC_005_Menu`
--

INSERT INTO `SEC_005_Menu` (`id`, `nomb`, `url`, `js`, `icon`, `clase`, `color`, `type`, `idmod`) VALUES
(1, 'Buzon', 'google.co.ve', 'acc', 'icon-test', 'new-top', '', 1, 1),
(2, 'Archivos', '', 'cargarstyle()', 'icon-test', 'file-upload', '', 1, 1),
(3, 'Concepto', '', '', 'icon-test', 'new-top', 'gb-waring', 1, 2),
(4, 'Panel de Control', '', '', 'icon-test', 'new-top', 'gb-waring', 1, 3),
(5, 'Directivas', '', '', 'icon-test', 'new-top', 'gb-waring', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEC_006_SubMenu`
--

CREATE TABLE `SEC_006_SubMenu` (
  `id` int UNSIGNED NOT NULL,
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `js` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `icon` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomb` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `clase` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEC_007_Accion`
--

CREATE TABLE `SEC_007_Accion` (
  `id` int UNSIGNED NOT NULL,
  `endpoint` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomb` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `func` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direc` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `SEC_007_Accion`
--

INSERT INTO `SEC_007_Accion` (`id`, `endpoint`, `nomb`, `func`, `direc`) VALUES
(1, '/v1/api/crud[LstPendiente]', 'Pendientes', 'Pendientes()', '@param\nestatus=0 AND fecha BETWEEN $finicio AND  $ffin;'),
(2, '/v1/api/crud[LstProcesados]', 'Procesados', 'Procesados()', '@param\nestatus=1'),
(3, '/v1/api/crud[LstConcilliados]', 'Conciliados', 'Conciliados()', '@param\nfech BETWEEN $finicio AND $ffin'),
(4, 'https://localhost/v1/api/crud', 'Listar Taquillas', 'LstTaquillas()', '@import validate txtnumero:number'),
(5, 'v1/api/crud:{id}', 'Guardar', 'GConceptos()', '@integridad de tabla'),
(6, 'v1/api/crud:{id}', 'Listar Usuarios', 'LUsuarios()', '@Listar cmbPais'),
(7, 'v1/api/crud:{id}', 'Crear', 'CrearDirectivas()', '@incluye valores numericos'),
(8, 'v1/api/crud:{id}', 'Listar', 'ListarDirectivas()', '@incluye combo de acceso'),
(9, 'v1/api/crud:{id}', 'Listar', 'ListarElementos()', '@importante numerico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEC_008_Menu_Accion`
--

CREATE TABLE `SEC_008_Menu_Accion` (
  `idmenu` int UNSIGNED DEFAULT NULL,
  `idact` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `SEC_008_Menu_Accion`
--

INSERT INTO `SEC_008_Menu_Accion` (`idmenu`, `idact`) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 5),
(3, 9),
(4, 6),
(5, 7),
(5, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEC_009_Menu_SubMenu`
--

CREATE TABLE `SEC_009_Menu_SubMenu` (
  `idmenu` int UNSIGNED DEFAULT NULL,
  `idsub` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEC_010_SubMenu_Action`
--

CREATE TABLE `SEC_010_SubMenu_Action` (
  `idsub` int UNSIGNED DEFAULT NULL,
  `idact` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tech`
--

CREATE TABLE `tech` (
  `oid` int NOT NULL,
  `nombre` varchar(64) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `version` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tech`
--

INSERT INTO `tech` (`oid`, `nombre`, `version`, `fecha`) VALUES
(1, 'Panel', '1.0.0 RC.1', '2021-05-23 19:45:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_001_Definicion`
--

CREATE TABLE `WKF_001_Definicion` (
  `id` int NOT NULL COMMENT 'Identificador',
  `idap` int NOT NULL COMMENT 'Id Aplicacion',
  `idmo` int NOT NULL COMMENT 'Id Modulo',
  `nomb` varchar(64) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del WKF',
  `obse` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT ' Observaciones',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `WKF_001_Definicion`
--

INSERT INTO `WKF_001_Definicion` (`id`, `idap`, `idmo`, `nomb`, `obse`, `fech`) VALUES
(1, 0, 0, 'CORE', 'MIDDLEWARE', '2022-04-11 15:47:12'),
(2, 3, 1, 'GDOC', 'MPPD', '2022-04-11 15:47:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_002_Serie`
--

CREATE TABLE `WKF_002_Serie` (
  `id` int NOT NULL COMMENT 'Identificador',
  `cod` varchar(64) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Codigo para la formula',
  `long` int NOT NULL COMMENT 'Logitud de la serie',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `obse` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Observaciones'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `WKF_002_Serie`
--

INSERT INTO `WKF_002_Serie` (`id`, `cod`, `long`, `fech`, `obse`) VALUES
(1, 'API', 8, '2022-04-11 15:47:13', 'Generacion de Fnx Middleware');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_003_Estado`
--

CREATE TABLE `WKF_003_Estado` (
  `id` int NOT NULL COMMENT 'Identificador',
  `idw` int NOT NULL COMMENT 'Id Workflow',
  `nomb` varchar(64) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del Estado',
  `obse` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Observaciones',
  `esta` tinyint(1) NOT NULL COMMENT 'Estatus',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `WKF_003_Estado`
--

INSERT INTO `WKF_003_Estado` (`id`, `idw`, `nomb`, `obse`, `esta`, `fech`) VALUES
(1, 2, 'Registrar', 'Registrar Documento', 0, '2022-04-11 15:47:13'),
(2, 2, 'Control de Gestion', 'Departamento Control de Gestion', 1, '2022-04-11 15:47:13'),
(3, 2, 'Resoluciones', 'Despartamento de Resoluciones', 1, '2022-04-11 15:47:13'),
(4, 2, 'Secretaria', 'Departamento de Secretaria', 1, '2022-04-11 15:47:13'),
(5, 2, 'Ayudantía', 'Departamento del Ayudantía', 1, '2022-04-11 15:47:13'),
(6, 2, 'Timonel', 'Departamento de Timonel', 1, '2022-04-11 15:47:13'),
(7, 2, 'Acami', 'Departamento de Acami', 1, '2022-04-11 15:47:13'),
(8, 2, 'Personal', 'Departamento de Personal', 1, '2022-04-11 15:47:13'),
(9, 2, 'Salida', 'Salida de Documentos', 1, '2022-04-11 15:47:13'),
(10, 2, 'Papelera', 'Papelera', 0, '2022-04-11 15:47:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_004_Transiciones`
--

CREATE TABLE `WKF_004_Transiciones` (
  `id` int NOT NULL COMMENT 'Identificador',
  `idw` int NOT NULL COMMENT 'Id Workflow',
  `func` varchar(64) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Id Formula',
  `obse` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Observaciones',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_005_Red`
--

CREATE TABLE `WKF_005_Red` (
  `id` int NOT NULL COMMENT 'Identificador',
  `idw` int NOT NULL COMMENT 'Identificador Workflow',
  `eo` int NOT NULL COMMENT 'Estado Orgine',
  `tr` int NOT NULL COMMENT 'Conjunto de transiciones',
  `edv` int NOT NULL COMMENT 'Estado Destino verdadero',
  `edf` int NOT NULL COMMENT 'Estado Destino falso',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_006_Documento`
--

CREATE TABLE `WKF_006_Documento` (
  `id` int NOT NULL COMMENT 'Identificador',
  `idw` int NOT NULL COMMENT 'Identificador Workflow',
  `nomb` varchar(64) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del Documento',
  `obse` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Observaciones',
  `estado` tinyint(1) NOT NULL COMMENT 'Estado documento',
  `estatus` tinyint(1) NOT NULL COMMENT 'Estatus',
  `usua` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Usuario',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Disparadores `WKF_006_Documento`
--
DELIMITER $$
CREATE TRIGGER `actualizaDocumento` AFTER UPDATE ON `WKF_006_Documento` FOR EACH ROW BEGIN
    INSERT INTO `WKF_012_Traza`(`idd`, `ide`, `obse`, `esta`, `usua`, `fech`) 
    VALUES (OLD.id, OLD.estado, OLD.obse, OLD.estatus, OLD.usua, OLD.fech);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `iniciarDocumentos` AFTER INSERT ON `WKF_006_Documento` FOR EACH ROW BEGIN
    INSERT INTO `WKF_008_Documento_Ubicacion`(`idd`, `orig`, `dest`, `esta`, `llav`, `usua`)
     VALUES (NEW.id, NEW.estado, NEW.estado, 1, '',  NEW.usua);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_007_Documento_Detalle`
--

CREATE TABLE `WKF_007_Documento_Detalle` (
  `id` int NOT NULL,
  `wfd` int DEFAULT NULL,
  `numc` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Numero de Control',
  `fcre` timestamp NOT NULL COMMENT 'Fecha de Registro',
  `fori` timestamp NOT NULL COMMENT 'Fecha de Origen',
  `nori` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT ' Numero de Origen',
  `saso` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Salida Asociada',
  `tdoc` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Tipo de Documento',
  `remi` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Remitente',
  `udep` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Unidad o Dependencia',
  `cont` text COLLATE utf8_spanish_ci NOT NULL COMMENT 'Contenido',
  `inst` text COLLATE utf8_spanish_ci NOT NULL COMMENT 'Instrucciones',
  `carc` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Codigo de Archivo',
  `nexp` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Numero de Expediente',
  `anom` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de Archivo',
  `usua` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Usuario Responsable',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Disparadores `WKF_007_Documento_Detalle`
--
DELIMITER $$
CREATE TRIGGER `actualizarDocumentoDetalles` AFTER UPDATE ON `WKF_007_Documento_Detalle` FOR EACH ROW BEGIN
    INSERT INTO `WKF_007_Historico_Documento`
      (id, wfd, numc, fcre, fori, nori, saso, tdoc, remi, udep, cont, 
      inst, carc, nexp, anom, usua, fech, tipo) 
    VALUES 
      (OLD.id, OLD.wfd, OLD.numc, OLD.fcre, OLD.fori, OLD.nori, OLD.saso, OLD.tdoc, OLD.remi, OLD.udep, OLD.cont, 
      OLD.inst, OLD.carc, OLD.nexp, OLD.anom, OLD.usua, OLD.fech, 1);

    IF OLD.anom != '' THEN
      INSERT INTO `WKF_013_Documentos_Adjuntos`(`idd`, `nomb`, `usua`) 
      VALUES (OLD.wfd, OLD.anom, OLD.usua);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `eliminarDocumentoDetalles` AFTER DELETE ON `WKF_007_Documento_Detalle` FOR EACH ROW BEGIN
      INSERT INTO `WKF_007_Historico_Documento`
        (id, wfd, numc, fcre, fori, nori, saso, tdoc, remi, udep, cont, 
        inst, carc, nexp, anom, usua, fech, tipo) 
      VALUES 
        (OLD.id, OLD.wfd, OLD.numc, OLD.fcre, OLD.fori, OLD.nori, OLD.saso, OLD.tdoc, OLD.remi, OLD.udep, OLD.cont, 
        OLD.inst, OLD.carc, OLD.nexp, OLD.anom, OLD.usua, OLD.fech,9);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_007_Historico_Documento`
--

CREATE TABLE `WKF_007_Historico_Documento` (
  `id` int NOT NULL,
  `wfd` int DEFAULT NULL,
  `numc` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Numero de Control',
  `fcre` timestamp NOT NULL COMMENT 'Fecha de Registro',
  `fori` timestamp NOT NULL COMMENT 'Fecha de Origen',
  `nori` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT ' Numero de Origen',
  `saso` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Salida Asociada',
  `tdoc` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Tipo de Documento',
  `remi` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Remitente',
  `udep` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Unidad o Dependencia',
  `cont` text COLLATE utf8_spanish_ci NOT NULL COMMENT 'Contenido',
  `inst` text COLLATE utf8_spanish_ci NOT NULL COMMENT 'Instrucciones',
  `carc` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Codigo de Archivo',
  `nexp` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Numero de Expediente',
  `anom` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de Archivo',
  `usua` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Usuario Responsable',
  `tipo` int NOT NULL COMMENT 'Tipo de Documento Papelera o historico',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_008_Documento_Ubicacion`
--

CREATE TABLE `WKF_008_Documento_Ubicacion` (
  `id` int NOT NULL COMMENT 'Identificador',
  `idd` int NOT NULL COMMENT 'Id Documento',
  `orig` int NOT NULL COMMENT 'Origen del Documento',
  `dest` int NOT NULL COMMENT 'Estado del documento de destino',
  `esta` tinyint(1) NOT NULL COMMENT 'Estatus',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `llav` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Llave',
  `usua` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Disparadores `WKF_008_Documento_Ubicacion`
--
DELIMITER $$
CREATE TRIGGER `actualizarUbicacion` BEFORE UPDATE ON `WKF_008_Documento_Ubicacion` FOR EACH ROW BEGIN
    IF NEW.dest = 10 THEN
      DELETE FROM WKF_007_Documento_Detalle WHERE wfd = OLD.idd;
      UPDATE `WKF_006_Documento` SET estado=NEW.dest, usua=NEW.usua, estatus=1 WHERE id=OLD.idd;
    END IF ;
    IF NEW.llav != '' THEN
      UPDATE `WKF_006_Documento` SET estado=OLD.dest, usua=NEW.usua, estatus=NEW.esta WHERE id=OLD.idd;
    ELSE
      UPDATE `WKF_006_Documento` SET usua=NEW.usua, estatus=NEW.esta WHERE id=OLD.idd;
    END IF ;
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_009_Documento_Variante`
--

CREATE TABLE `WKF_009_Documento_Variante` (
  `id` int NOT NULL COMMENT 'Identificador',
  `llav` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Llave',
  `usua` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Usuario',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_010_Estatus`
--

CREATE TABLE `WKF_010_Estatus` (
  `id` int NOT NULL,
  `nomb` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `obse` varchar(256) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_011_Alerta`
--

CREATE TABLE `WKF_011_Alerta` (
  `id` int NOT NULL COMMENT 'Identificador',
  `idd` int NOT NULL COMMENT 'Id Documento',
  `ide` int NOT NULL COMMENT 'Identificador del estado',
  `esta` tinyint(1) NOT NULL COMMENT 'Estatus',
  `acti` tinyint(1) NOT NULL COMMENT 'Activo',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Usuario Responsable',
  `obse` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Observaciones',
  `update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Actualizacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_012_Traza`
--

CREATE TABLE `WKF_012_Traza` (
  `id` int NOT NULL COMMENT 'Identificador',
  `idd` varchar(64) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Id Documento',
  `ide` int NOT NULL COMMENT 'Identificador del estado',
  `esta` tinyint(1) NOT NULL COMMENT 'Estatus',
  `obse` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Observaciones',
  `usua` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Usuario Responsable',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_013_Documentos_Adjuntos`
--

CREATE TABLE `WKF_013_Documentos_Adjuntos` (
  `id` int NOT NULL COMMENT 'Identificador',
  `idd` varchar(64) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Id Documento',
  `nomb` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del Archivo',
  `usua` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Usuario Responsable',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WKF_014_Campos_Dinamicos`
--

CREATE TABLE `WKF_014_Campos_Dinamicos` (
  `id` int NOT NULL,
  `nomb` varchar(64) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre',
  `obse` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcion',
  `clase` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Clasificacion',
  `form` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Formato del campo',
  `fnx` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Funcion de la API',
  `esta` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Estatus del campo',
  `usua` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Usuario Responsable',
  `fech` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `BOT_001_Chat`
--
ALTER TABLE `BOT_001_Chat`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `BOT_001_Chat` ADD FULLTEXT KEY `preg` (`preg`,`resp`);

--
-- Indices de la tabla `GEO_001_Paises`
--
ALTER TABLE `GEO_001_Paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `GEO_002_Ciudades`
--
ALTER TABLE `GEO_002_Ciudades`
  ADD PRIMARY KEY (`id_ciudad`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `GEO_003_Estados`
--
ALTER TABLE `GEO_003_Estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `GEO_004_Municipios`
--
ALTER TABLE `GEO_004_Municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `GEO_005_Parroquias`
--
ALTER TABLE `GEO_005_Parroquias`
  ADD PRIMARY KEY (`id_parroquia`),
  ADD KEY `id_municipio` (`id_municipio`);

--
-- Indices de la tabla `SEC_001_Aplicacion`
--
ALTER TABLE `SEC_001_Aplicacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `SEC_002_Api`
--
ALTER TABLE `SEC_002_Api`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `SEC_004_Modulo`
--
ALTER TABLE `SEC_004_Modulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `SEC_005_Menu`
--
ALTER TABLE `SEC_005_Menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `SEC_006_SubMenu`
--
ALTER TABLE `SEC_006_SubMenu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `SEC_007_Accion`
--
ALTER TABLE `SEC_007_Accion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `SEC_008_Menu_Accion`
--
ALTER TABLE `SEC_008_Menu_Accion`
  ADD UNIQUE KEY `idmenu_2` (`idmenu`,`idact`),
  ADD KEY `idmenu` (`idmenu`),
  ADD KEY `idact` (`idact`);

--
-- Indices de la tabla `tech`
--
ALTER TABLE `tech`
  ADD PRIMARY KEY (`oid`);

--
-- Indices de la tabla `WKF_001_Definicion`
--
ALTER TABLE `WKF_001_Definicion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `WKF_002_Serie`
--
ALTER TABLE `WKF_002_Serie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `WKF_003_Estado`
--
ALTER TABLE `WKF_003_Estado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `WKF_004_Transiciones`
--
ALTER TABLE `WKF_004_Transiciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `WKF_005_Red`
--
ALTER TABLE `WKF_005_Red`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `idw` (`idw`);

--
-- Indices de la tabla `WKF_006_Documento`
--
ALTER TABLE `WKF_006_Documento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `WKF_007_Documento_Detalle`
--
ALTER TABLE `WKF_007_Documento_Detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `numc` (`numc`);

--
-- Indices de la tabla `WKF_007_Historico_Documento`
--
ALTER TABLE `WKF_007_Historico_Documento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `numc` (`numc`);

--
-- Indices de la tabla `WKF_008_Documento_Ubicacion`
--
ALTER TABLE `WKF_008_Documento_Ubicacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `idd` (`idd`);

--
-- Indices de la tabla `WKF_009_Documento_Variante`
--
ALTER TABLE `WKF_009_Documento_Variante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `WKF_010_Estatus`
--
ALTER TABLE `WKF_010_Estatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `WKF_011_Alerta`
--
ALTER TABLE `WKF_011_Alerta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `idd` (`idd`);

--
-- Indices de la tabla `WKF_012_Traza`
--
ALTER TABLE `WKF_012_Traza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `idd` (`idd`);

--
-- Indices de la tabla `WKF_013_Documentos_Adjuntos`
--
ALTER TABLE `WKF_013_Documentos_Adjuntos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `idd` (`idd`);

--
-- Indices de la tabla `WKF_014_Campos_Dinamicos`
--
ALTER TABLE `WKF_014_Campos_Dinamicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `fnx` (`fnx`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `BOT_001_Chat`
--
ALTER TABLE `BOT_001_Chat`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `GEO_001_Paises`
--
ALTER TABLE `GEO_001_Paises`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT de la tabla `GEO_002_Ciudades`
--
ALTER TABLE `GEO_002_Ciudades`
  MODIFY `id_ciudad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;

--
-- AUTO_INCREMENT de la tabla `GEO_003_Estados`
--
ALTER TABLE `GEO_003_Estados`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `GEO_004_Municipios`
--
ALTER TABLE `GEO_004_Municipios`
  MODIFY `id_municipio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=463;

--
-- AUTO_INCREMENT de la tabla `GEO_005_Parroquias`
--
ALTER TABLE `GEO_005_Parroquias`
  MODIFY `id_parroquia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1139;

--
-- AUTO_INCREMENT de la tabla `SEC_001_Aplicacion`
--
ALTER TABLE `SEC_001_Aplicacion`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `SEC_002_Api`
--
ALTER TABLE `SEC_002_Api`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `SEC_004_Modulo`
--
ALTER TABLE `SEC_004_Modulo`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `SEC_005_Menu`
--
ALTER TABLE `SEC_005_Menu`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `SEC_006_SubMenu`
--
ALTER TABLE `SEC_006_SubMenu`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SEC_007_Accion`
--
ALTER TABLE `SEC_007_Accion`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `WKF_001_Definicion`
--
ALTER TABLE `WKF_001_Definicion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `WKF_002_Serie`
--
ALTER TABLE `WKF_002_Serie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `WKF_003_Estado`
--
ALTER TABLE `WKF_003_Estado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `WKF_004_Transiciones`
--
ALTER TABLE `WKF_004_Transiciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador';

--
-- AUTO_INCREMENT de la tabla `WKF_005_Red`
--
ALTER TABLE `WKF_005_Red`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador';

--
-- AUTO_INCREMENT de la tabla `WKF_006_Documento`
--
ALTER TABLE `WKF_006_Documento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador';

--
-- AUTO_INCREMENT de la tabla `WKF_007_Documento_Detalle`
--
ALTER TABLE `WKF_007_Documento_Detalle`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `WKF_008_Documento_Ubicacion`
--
ALTER TABLE `WKF_008_Documento_Ubicacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador';

--
-- AUTO_INCREMENT de la tabla `WKF_009_Documento_Variante`
--
ALTER TABLE `WKF_009_Documento_Variante`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador';

--
-- AUTO_INCREMENT de la tabla `WKF_010_Estatus`
--
ALTER TABLE `WKF_010_Estatus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `WKF_011_Alerta`
--
ALTER TABLE `WKF_011_Alerta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador';

--
-- AUTO_INCREMENT de la tabla `WKF_012_Traza`
--
ALTER TABLE `WKF_012_Traza`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador';

--
-- AUTO_INCREMENT de la tabla `WKF_013_Documentos_Adjuntos`
--
ALTER TABLE `WKF_013_Documentos_Adjuntos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador';

--
-- AUTO_INCREMENT de la tabla `WKF_014_Campos_Dinamicos`
--
ALTER TABLE `WKF_014_Campos_Dinamicos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `GEO_002_Ciudades`
--
ALTER TABLE `GEO_002_Ciudades`
  ADD CONSTRAINT `GEO_002_Ciudades_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `GEO_003_Estados` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `GEO_004_Municipios`
--
ALTER TABLE `GEO_004_Municipios`
  ADD CONSTRAINT `GEO_004_Municipios_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `GEO_003_Estados` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `GEO_005_Parroquias`
--
ALTER TABLE `GEO_005_Parroquias`
  ADD CONSTRAINT `GEO_005_Parroquias_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `GEO_004_Municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
