-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-04-2022 a las 15:59:12
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
-- Base de datos: `mppd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MD_001_Documento`
--

DROP TABLE IF EXISTS `MD_001_Documento`;
CREATE TABLE IF NOT EXISTS `MD_001_Documento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wfd` int DEFAULT NULL,
  `numc` varchar(32) NOT NULL COMMENT 'Numero de Control',
  `fcre` timestamp NOT NULL COMMENT 'Fecha de Registro',
  `fori` timestamp NOT NULL COMMENT 'Fecha de Origen',
  `nori` varchar(32) NOT NULL COMMENT ' Numero de Origen',
  `saso` varchar(256) NOT NULL COMMENT 'Salida Asociada',
  `tdoc` varchar(256) NOT NULL COMMENT 'Tipo de Documento',
  `remi` varchar(256) NOT NULL COMMENT 'Remitente',
  `udep` varchar(256) NOT NULL COMMENT 'Unidad o Dependencia',
  `cont` text NOT NULL COMMENT 'Contenido',
  `inst` text NOT NULL COMMENT 'Instrucciones',
  `carc` varchar(32) NOT NULL COMMENT 'Codigo de Archivo',
  `nexp` varchar(32) NOT NULL COMMENT 'Numero de Expediente',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MD_001_Documento`
--

INSERT INTO `MD_001_Documento` (`id`, `wfd`, `numc`, `fcre`, `fori`, `nori`, `saso`, `tdoc`, `remi`, `udep`, `cont`, `inst`, `carc`, `nexp`, `fech`, `usua`) VALUES
(1, 1, '22032800000001', '2022-03-28 04:00:00', '2022-03-25 04:00:00', 'nd00091/76', '', '0.00', '0.00', '0.00', '<p>adadasdad</p>', '<p>adadadadasd</p>', '', '', '2022-03-28 17:28:38', ''),
(2, 2, '220328/00002', '2022-03-28 04:00:00', '2022-03-25 04:00:00', 'ndp-00092', '', '0.00', '0.00', '0.00', '<p>control de datos para el polimorfismo</p>', '<p>que le den por donde mas le duela a este cabron de la chigada</p>', '565657', '', '2022-03-28 17:30:40', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MD_003_Configuracion`
--

DROP TABLE IF EXISTS `MD_003_Configuracion`;
CREATE TABLE IF NOT EXISTS `MD_003_Configuracion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomb` varchar(256) NOT NULL COMMENT 'Nombre',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `tipo` varchar(32) NOT NULL COMMENT 'Tipo de Documentos',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo` (`tipo`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MD_003_Configuracion`
--

INSERT INTO `MD_003_Configuracion` (`id`, `nomb`, `obse`, `tipo`, `fech`, `usua`) VALUES
(1, 'OFICIO', 'OFICIO', '1', '2022-03-28 12:27:48', 'SISTEMA'),
(2, 'SOLICITUD', 'SOLICITUD', '1', '2022-03-28 12:27:48', ''),
(3, 'MINISTERIO DE VIVIENDA', 'MINISTERIO DE VIVIENDA', '2', '2022-03-28 12:29:08', 'SISTEMA'),
(4, 'COMANDANCIA DEL EJERCITO', 'COMANDANCIA DEL EJERCITO', '2', '2022-03-28 12:29:08', 'SISTEMA'),
(5, 'UNIDAD DE DEPENDENCIA', 'UNIDAD DE DEPENDENCIA', '3', '2022-03-28 12:30:21', 'SISTEMA'),
(6, 'UNIDAD MINISTERIAL', 'UNIDAD MINISTERIAL', '3', '2022-03-28 12:30:21', 'SISTEMA'),
(17, 'comandancia de la armada', 'comandancia de la armada', '2', '2022-03-31 11:42:56', ''),
(18, 'escuela nautica', 'escuela nautica', '3', '2022-03-31 18:24:15', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
