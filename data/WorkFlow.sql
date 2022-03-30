
DROP TABLE IF EXISTS `WKF_001_Definicion`;
CREATE TABLE IF NOT EXISTS `WKF_001_Definicion` (
  `id` int(11) NOT NULL AUTO_INCREMENT  COMMENT 'Identificador',
  `idap` int(11) NOT NULL COMMENT 'Id Aplicacion',
  `idmo` int(11) NOT NULL COMMENT 'Id Modulo',
  `nomb` varchar(64) NOT NULL COMMENT 'Nombre del WKF',
  `obse` varchar(256) NOT NULL COMMENT ' Observaciones',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);
INSERT INTO `WKF_001_Definicion`(`idap`, `idmo`, `nomb`, `obse`, `fech`) VALUES 
(0,0,'CORE','MIDDLEWARE',Now()),(3,1,'GDOC','MPPD',Now());


DROP TABLE IF EXISTS `WKF_002_Serie`;
CREATE TABLE IF NOT EXISTS `WKF_002_Serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `cod` varchar(64) NOT NULL  COMMENT 'Codigo para la formula',
  `long` INT NOT NULL  COMMENT 'Logitud de la serie',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);
INSERT INTO `WKF_002_Serie` (`id`, `cod`, `long`, `fech`, `obse`) 
VALUES (NULL, 'API', '8', CURRENT_TIMESTAMP, 'Generacion de Fnx Middleware');


DROP TABLE IF EXISTS `WKF_003_Estado`;
CREATE TABLE IF NOT EXISTS `WKF_003_Estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idw` int(11)  NOT NULL COMMENT 'Id Workflow',
  `nomb` varchar(64) NOT NULL COMMENT 'Nombre del Estado',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);
INSERT INTO `WKF_003_Estado`( `idw`, `nomb`, `obse`,`esta`) 
VALUES (2,'Registrar','Registrar Documento',0),
(2,'Control de Gestion','Departamento Control de Gestion',1),
(2,'Resoluciones','Despartamento de Resoluciones',1),
(2,'Secretaria','Departamento de Secretaria',1),
(2,'Ayudantía','Departamento del Ayudantía',1),
(2,'Timonel','Departamento de Timonel',1),
(2,'Acami','Departamento de Acami',1),
(2,'Personal','Departamento de Personal',1);



DROP TABLE IF EXISTS `WKF_004_Transiciones`;
CREATE TABLE IF NOT EXISTS `WKF_004_Transiciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idw` int(11)  NOT NULL COMMENT 'Id Workflow',
  `func` varchar(64) NOT NULL COMMENT 'Id Formula',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


DROP TABLE IF EXISTS `WKF_005_Red`;
CREATE TABLE IF NOT EXISTS `WKF_005_Red` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idw` int(11)  NOT NULL COMMENT 'Id Workflow',
  `eo` int(11)  NOT NULL COMMENT 'Estado Orgine',
  `tr` int(11)  NOT NULL COMMENT 'Conjunto de transiciones',
  `edv` int(11)  NOT NULL COMMENT 'Estado Destino verdadero',
  `edf` int(11)  NOT NULL COMMENT 'Estado Destino falso',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_006_Documento`;
CREATE TABLE IF NOT EXISTS `WKF_006_Documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `nomb` varchar(64) NOT NULL COMMENT 'Nombre del Documento',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `estado` tinyint(1)  NOT NULL COMMENT 'Estado documento',
  `estatus` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_007_Documento_Detalle`;
CREATE TABLE IF NOT EXISTS `WKF_007_Documento_Detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wfd` int(11),
  `numc` varchar(32)  NOT NULL COMMENT 'Numero de Control',
  `fcre` timestamp NOT NULL COMMENT 'Fecha de Registro',
  `fori` timestamp NOT NULL COMMENT 'Fecha de Origen',
  `nori` varchar(32) NOT NULL COMMENT ' Numero de Origen',
  `saso` varchar(256) NOT NULL COMMENT 'Salida Asociada',
  `tdoc` varchar(256) NOT NULL COMMENT 'Tipo de Documento',
  `remi` varchar(256) NOT NULL COMMENT 'Remitente',
  `udep` varchar(256) NOT NULL COMMENT 'Unidad o Dependencia',
  `cont` TEXT NOT NULL COMMENT 'Contenido',
  `inst` TEXT NOT NULL COMMENT 'Instrucciones',
  `carc` varchar(32) NOT NULL COMMENT 'Codigo de Archivo',
  `nexp` varchar(32) NOT NULL COMMENT 'Numero de Expediente',
  `anom` varchar(256) NOT NULL COMMENT 'Nombre de Archivo',
  `usua` varchar(256) NOT NULL,
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_008_Documento_Ubicacion`;
CREATE TABLE IF NOT EXISTS `WKF_008_Documento_Ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idd` varchar(64)  NOT NULL COMMENT 'Id Documento',
  `ide` int(11)  NOT NULL COMMENT 'Conjunto de transiciones',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_009_Estatus`;
CREATE TABLE IF NOT EXISTS `WKF_009_Estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomb` varchar(64) NOT NULL,
  `obse` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


DROP TABLE IF EXISTS `WKF_010_Alerta`;
CREATE TABLE IF NOT EXISTS `WKF_010_Alerta` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idd` int(11)  NOT NULL COMMENT 'Id Documento',
  `ide` int(11)  NOT NULL COMMENT 'Identificador del estado',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `acti` tinyint(1)  NOT NULL COMMENT 'Activo',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha del plazo',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_011_Traza`;
CREATE TABLE IF NOT EXISTS `WKF_011_Traza` (
  `id` int(11) NOT NULL AUTO_INCREMENT  COMMENT 'Identificador',
  `idd` varchar(64)  NOT NULL COMMENT 'Id Documento',
  `ide` int(11)  NOT NULL COMMENT 'Identificador del estado',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `obse` varchar(256) NOT NULL  COMMENT 'Observaciones',
  `usua` varchar(256) NOT NULL  COMMENT 'Usuario Responsable',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'Fecha del plazo',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


DROP TRIGGER IF  EXISTS `trazaDocumentos`;
DELIMITER $$
CREATE TRIGGER trazaDocumentos
AFTER INSERT ON WKF_006_Documento
  FOR EACH ROW BEGIN
    INSERT INTO `WKF_011_Traza`(`idd`, `ide`, `obse`, `esta`, `usua`, `fech`) 
    VALUES (NEW.id, NEW.estado, NEW.obse, NEW.estatus, NEW.usua, Now());
    INSERT INTO `WKF_008_Documento_Ubicacion`(`idd`, `ide`, `esta`, `obse`, `fech`, `usua`) 
    VALUES (NEW.id, NEW.estado, NEW.estatus, NEW.obse, Now(), NEW.usua);
END$$
DELIMITER ;

DROP TRIGGER IF  EXISTS `actualizarDocumentos`;
DELIMITER $$
CREATE TRIGGER actualizarDocumentos
BEFORE UPDATE ON WKF_006_Documento
  FOR EACH ROW BEGIN
    INSERT INTO `WKF_011_Traza`(`idd`, `ide`, `obse`, `esta`, `usua`, `fech`) 
     VALUES (OLD.id, OLD.estado, OLD.obse, OLD.estatus,OLD.usua,Now());
    INSERT INTO `WKF_008_Documento_Ubicacion`(`idd`, `ide`, `esta`, `obse`, `fech`, `usua`)
    VALUES (OLD.id, OLD.estado, OLD.estatus, OLD.obse, Now(), OLD.usua);
END$$
DELIMITER ;