
DROP TABLE IF EXISTS `WKF_001_Definicion`;
CREATE TABLE IF NOT EXISTS `WKF_001_Definicion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idap` int(11) NOT NULL, -- Id Aplicacion
  `idmo` int(11) NOT NULL, -- Id Modulo
  `nomb` varchar(64) NOT NULL,
  `obse` varchar(256) NOT NULL,
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_002_Serie`;
CREATE TABLE IF NOT EXISTS `WKF_002_Serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(64) NOT NULL,
  `long` INT NOT NULL,
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `obse` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);
INSERT INTO `WKF_002_Serie` (`id`, `cod`, `long`, `fech`, `obse`) VALUES (NULL, 'API', '8', CURRENT_TIMESTAMP, 'Generacion de Fnx Middleware');


DROP TABLE IF EXISTS `WKF_003_Estado`;
CREATE TABLE IF NOT EXISTS `WKF_003_Estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idw` int(11)  NOT NULL, -- Id Workflow
  `nomb` varchar(64) NOT NULL,
  `obse` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


DROP TABLE IF EXISTS `WKF_004_Transiciones`;
CREATE TABLE IF NOT EXISTS `WKF_004_Transiciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idw` int(11)  NOT NULL, -- Id Workflow
  `func` varchar(64) NOT NULL,
  `obse` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


DROP TABLE IF EXISTS `WKF_005_Red`;
CREATE TABLE IF NOT EXISTS `WKF_005_Red` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idw` int(11)  NOT NULL, -- Id Workflow
  `eo` int(11)  NOT NULL, -- Estado Orgine
  `tr` int(11)  NOT NULL, -- Conjunto de transiciones
  `ed` int(11)  NOT NULL, -- Estado Destino
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_006_Documento`;
CREATE TABLE IF NOT EXISTS `WKF_006_Documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie` varchar(64) NOT NULL,
  `nomb` varchar(64) NOT NULL,
  `obse` varchar(256) NOT NULL,
  `tipo` tinyint(1)  NOT NULL, -- Tipo documento
  `esta` tinyint(1)  NOT NULL, -- Estatus
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_007_Documento_Detalle`;
CREATE TABLE IF NOT EXISTS `WKF_007_Documento_Detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie` varchar(64) NOT NULL,
  `nomb` varchar(64) NOT NULL,
  `obse` varchar(256) NOT NULL,
  `tipo` tinyint(1)  NOT NULL, -- Tipo documento
  `esta` tinyint(1)  NOT NULL, -- Estatus
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_008_Documento_Ubicacion`;
CREATE TABLE IF NOT EXISTS `WKF_008_Documento_Ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idd` int(11)  NOT NULL, -- Id Documento
  `ide` int(11)  NOT NULL, -- Conjunto de transiciones
  `esta` tinyint(1)  NOT NULL, -- Estatus
  `obse` varchar(256) NOT NULL,
  `responsable` varchar(256) NOT NULL,
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_009_Estatus`;
CREATE TABLE IF NOT EXISTS `WKF_003_Estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomb` varchar(64) NOT NULL,
  `obse` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


DROP TABLE IF EXISTS `WKF_010_Alerta`;
CREATE TABLE IF NOT EXISTS `WKF_009_Alerta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idd` int(11)  NOT NULL, -- Id Documento
  `nomb` varchar(64) NOT NULL,
  `obse` varchar(256) NOT NULL,
  `tipo` tinyint(1)  NOT NULL, -- Tipo documento
  `esta` tinyint(1)  NOT NULL, -- Estatus
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_011_Traza`;
CREATE TABLE IF NOT EXISTS `WKF_010_Traza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idd` int(11)  NOT NULL, -- Id Documento
  `ide` int(11)  NOT NULL, -- Conjunto de transiciones
  `obse` varchar(256) NOT NULL,
  `esta` tinyint(1)  NOT NULL, -- Estatus
  `usua` varchar(256) NOT NULL,
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

