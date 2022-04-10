
DROP TABLE IF EXISTS `WKF_001_Definicion`;
CREATE TABLE IF NOT EXISTS `WKF_001_Definicion` (
  `id` int(11) NOT NULL AUTO_INCREMENT  COMMENT 'Identificador',
  `idap` int(11) NOT NULL COMMENT 'Id Aplicacion',
  `idmo` int(11) NOT NULL COMMENT 'Id Modulo',
  `nomb` varchar(64) NOT NULL COMMENT 'Nombre del WKF',
  `obse` varchar(256) NOT NULL COMMENT ' Observaciones',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
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
CREATE TABLE IF NOT EXISTS `WKF_003_Estado` (Mama*2611
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idw` int(11)  NOT NULL COMMENT 'Id Workflow',
  `nomb` varchar(64) NOT NULL COMMENT 'Nombre del Estado',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);
INSERT INTO `WKF_003_Estado`( `idw`, `nomb`, `obse`,`esta`) 
VALUES 
(2,'Registrar','Registrar Documento',0),
(2,'Control de Gestion','Departamento Control de Gestion',1),
(2,'Resoluciones','Despartamento de Resoluciones',1),
(2,'Secretaria','Departamento de Secretaria',1),
(2,'Ayudantía','Departamento del Ayudantía',1),
(2,'Timonel','Departamento de Timonel',1),
(2,'Acami','Departamento de Acami',1),
(2,'Personal','Departamento de Personal',1),
(2,'Salida','Salida de Documentos',1),
(2,'Papelera','Papelera',0);



DROP TABLE IF EXISTS `WKF_004_Transiciones`;
CREATE TABLE IF NOT EXISTS `WKF_004_Transiciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idw` int(11)  NOT NULL COMMENT 'Id Workflow',
  `func` varchar(64) NOT NULL COMMENT 'Id Formula',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


DROP TABLE IF EXISTS `WKF_005_Red`;
CREATE TABLE IF NOT EXISTS `WKF_005_Red` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idw` int(11)  NOT NULL COMMENT 'Identificador Workflow',
  `eo` int(11)  NOT NULL COMMENT 'Estado Orgine',
  `tr` int(11)  NOT NULL COMMENT 'Conjunto de transiciones',
  `edv` int(11)  NOT NULL COMMENT 'Estado Destino verdadero',
  `edf` int(11)  NOT NULL COMMENT 'Estado Destino falso',
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `idw` (`idw`)
);

DROP TABLE IF EXISTS `WKF_006_Documento`;
CREATE TABLE IF NOT EXISTS `WKF_006_Documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idw` int(11)  NOT NULL COMMENT 'Identificador Workflow',
  `nomb` varchar(64) NOT NULL COMMENT 'Nombre del Documento',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `estado` tinyint(1)  NOT NULL COMMENT 'Estado documento',
  `estatus` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `estado` (`estado`)
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
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `numc` (`numc`)
);



DROP TABLE IF EXISTS `WKF_007_ZHDocumento_Detalle`;
CREATE TABLE IF NOT EXISTS `WKF_007_ZHDocumento_Detalle` (
  `id` int(11) NOT NULL,
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
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `numc` (`numc`)
);





DROP TABLE IF EXISTS `WKF_008_Documento_Ubicacion`;
CREATE TABLE IF NOT EXISTS `WKF_008_Documento_Ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idd` int(11)  NOT NULL COMMENT 'Id Documento',
  `orig` int(11)  NOT NULL COMMENT 'Origen del Documento',
  `dest` int(11)  NOT NULL COMMENT 'Estado del documento de destino',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `llav` varchar(256)  NOT NULL COMMENT 'Llave',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `idd` (`idd`)
);

DROP TABLE IF EXISTS `WKF_009_Documento_Variante`;
CREATE TABLE IF NOT EXISTS `WKF_009_Documento_Variante` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `llav` varchar(256)  NOT NULL COMMENT 'Llave',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_010_Estatus`;
CREATE TABLE IF NOT EXISTS `WKF_010_Estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomb` varchar(64) NOT NULL,
  `obse` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


DROP TABLE IF EXISTS `WKF_011_Alerta`;
CREATE TABLE IF NOT EXISTS `WKF_011_Alerta` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idd` int(11)  NOT NULL COMMENT 'Id Documento',
  `ide` int(11)  NOT NULL COMMENT 'Identificador del estado',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `acti` tinyint(1)  NOT NULL COMMENT 'Activo',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `update` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Actualizacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `idd` (`idd`)
);

DROP TABLE IF EXISTS `WKF_012_Traza`;
CREATE TABLE IF NOT EXISTS `WKF_012_Traza` (
  `id` int(11) NOT NULL AUTO_INCREMENT  COMMENT 'Identificador',
  `idd` varchar(64)  NOT NULL COMMENT 'Id Documento',
  `ide` int(11)  NOT NULL COMMENT 'Identificador del estado',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `obse` varchar(256) NOT NULL  COMMENT 'Observaciones',
  `usua` varchar(256) NOT NULL  COMMENT 'Usuario Responsable',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `idd` (`idd`)
);


DROP TABLE IF EXISTS `WKF_013_Documentos_Adjuntos`;
CREATE TABLE IF NOT EXISTS `WKF_013_Documentos_Adjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT  COMMENT 'Identificador',
  `idd` varchar(64)  NOT NULL COMMENT 'Id Documento',
  `nomb` varchar(256) NOT NULL  COMMENT 'Nombre del Archivo',
  `usua` varchar(256) NOT NULL  COMMENT 'Usuario Responsable',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `idd` (`idd`)
);



DROP TABLE IF EXISTS `WKF_014_Campos_Dinamicos`;
CREATE TABLE IF NOT EXISTS `WKF_014_Campos_Dinamicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomb` varchar(64) NOT NULL COMMENT 'Nombre',
  `obse` varchar(256) NOT NULL COMMENT 'Descripcion',
  `clase` varchar(256) NOT NULL COMMENT 'Clasificacion',
  `form` varchar(256) NOT NULL COMMENT 'Formato del campo',
  `fnx` varchar(256) COMMENT 'Funcion de la API',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `fnx` (`fnx`)
);









DROP TRIGGER IF  EXISTS `iniciarDocumentos`;
DELIMITER $$
CREATE TRIGGER iniciarDocumentos
AFTER INSERT ON WKF_006_Documento
  FOR EACH ROW BEGIN
    INSERT INTO `WKF_012_Traza`(`idd`, `ide`, `obse`, `esta`, `usua`, `fech`) 
    VALUES (NEW.id, NEW.estado, NEW.obse, NEW.estatus, NEW.usua, NEW.fech);
    
    INSERT INTO `WKF_008_Documento_Ubicacion`(`idd`, `orig`, `dest`, `esta`, `llav`, `usua`)
     VALUES (NEW.id, NEW.estado, NEW.estado, 1, '',  NEW.usua);
END$$
DELIMITER ;


DROP TRIGGER IF  EXISTS `actualizarDocumentoDetalles`;
DELIMITER $$
CREATE TRIGGER actualizarDocumentoDetalles
AFTER UPDATE ON WKF_007_Documento_Detalle
  FOR EACH ROW BEGIN
      IF OLD.anom != '' THEN
        INSERT INTO `WKF_013_Documentos_Adjuntos`(`idd`, `nomb`, `usua`) 
        VALUES (OLD.wfd, OLD.anom, OLD.usua);
      END IF ;
END$$
DELIMITER ;

DROP TRIGGER IF  EXISTS `actualizarUbicacion`;
DELIMITER $$
CREATE TRIGGER actualizarUbicacion
AFTER UPDATE ON WKF_008_Documento_Ubicacion 
FOR EACH ROW 
  BEGIN
    IF NEW.llav != '' THEN
      UPDATE `WKF_006_Documento` SET estado=OLD.dest, usua=NEW.usua, estatus=NEW.esta WHERE id=OLD.idd;
    ELSEIF NEW.orig = 10 THEN
      DELETE FROM WKF_007_Documento_Detalle WHERE wfd = OLD.idd;
    ELSE
      UPDATE `WKF_006_Documento` SET usua=NEW.usua, estatus=NEW.esta WHERE id=OLD.idd;
    END IF ;
  END$$
DELIMITER ;




DROP TRIGGER IF  EXISTS `eliminarDocumentoDetalles`;
DELIMITER $$
CREATE TRIGGER eliminarDocumentoDetalles
AFTER DELETE ON WKF_007_Documento_Detalle
  FOR EACH ROW BEGIN
      INSERT INTO `WKF_007_ZHDocumento_Detalle`
        (id, wfd, numc, fcre, fori, nori, saso, tdoc, remi, udep, cont, 
        inst, carc, nexp, anom, usua, fech) 
      VALUES 
        (OLD.id, OLD.wfd, OLD.numc, OLD.fcre, OLD.fori, OLD.nori, OLD.saso, OLD.tdoc, OLD.remi, OLD.udep, OLD.cont, 
        OLD.inst, OLD.carc, OLD.nexp, OLD.anom, OLD.usua, OLD.fech);
END$$
DELIMITER ;

-- UPDATE WKF_008_Documento_Ubicacion SET dest=$0, esta=$1, llav=$2, fech=$3, usua=$4 WHERE idd=$5

/*
SELECT 
  ubic.dest AS destino,
  estado.nomb AS nombre,
  estado.obse AS descripcion
FROM 
  WKF_008_Documento_Ubicacion AS ubic
  JOIN WKF_003_Estado AS estado ON ubic.dest=estado.id
  WHERE ubic.dest=1 AND ubic.estatus=1 AND ubic.llav != ''
  GROUP BY ubic.dest
*/