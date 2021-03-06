
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
CREATE TABLE IF NOT EXISTS `WKF_003_Estado` (
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
(2,'Ayudant??a','Departamento del Ayudant??a',1),
(2,'Timonel','Departamento de Timonel',1),
(2,'Acami','Departamento de Acami',1),
(2,'Personal','Departamento de Personal',1),
(2,'Salida','Salida de Documentos',1),
(2,'Papelera','Papelera',0),
(2,'Archivar','Archivar',0),
(2,'Cerrado','Cerrado',0);



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
  `wfd` int(11) COMMENT 'Documento Id WorkFlow',
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
  `priv` int(11) COMMENT 'Privacidad',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `numc` (`numc`)
);



DROP TABLE IF EXISTS `WKF_007_Historico_Documento`;
CREATE TABLE IF NOT EXISTS `WKF_007_Historico_Documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wfd` int(11) COMMENT 'Documento Id WorkFlow',
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
  `priv` int(11) COMMENT 'Privacidad',
  `tipo` int(11) NOT NULL COMMENT 'Tipo de Documento Papelera o historico',
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
  `idd` int(11)  NOT NULL COMMENT 'Id Documento',
  `acci` int(11)  NOT NULL COMMENT 'Accion del  Documento',
  `obse` TEXT NOT NULL COMMENT 'Contenido',
  `estado` tinyint(1)  NOT NULL COMMENT 'Estado',
  `estatus` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_010_Estatus`;
CREATE TABLE IF NOT EXISTS `WKF_010_Estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ide` int(11)  NOT NULL COMMENT 'Estado',
  `idc` int(11)  NOT NULL COMMENT 'Codigo',
  `nomb` varchar(64) NOT NULL COMMENT 'Nombre',
  `obse` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);
INSERT INTO `WKF_010_Estatus` (`id`, `ide`, `idc`, `nomb`, `obse`) 
VALUES 
(NULL, '1', '1', 'Registrado', 'Mesa de Parte'), 
(NULL, '1', '2', 'Clasificaci??n', 'Control de Gestion'),
(NULL, '2', '1', 'Recibido', 'Control de Gestion'), 
(NULL, '2', '2', 'Procesado', 'Control de Gestion'),
(NULL, '2', '3', 'Pendientes', 'Control de Gestion'),
(NULL, '3', '1', 'Recibido', 'Resoluciones'),
(NULL, '3', '2', 'Procesado', 'Resoluciones'),
(NULL, '3', '3', 'Pendientes', 'Resoluciones'),
(NULL, '4', '1', 'Recibido', 'Secretaria'),
(NULL, '4', '2', 'Ministerial', 'Secretaria'),
(NULL, '4', '3', 'Presidencial', 'Secretaria'),
(NULL, '5', '1', 'Recibido', 'Ayudantia'),
(NULL, '5', '2', 'Procesado', 'Ayudantia'),
(NULL, '5', '3', 'Pendientes', 'Ayudantia'),
(NULL, '6', '1', 'Recibido', 'Timonel'),
(NULL, '6', '2', 'Procesado', 'Timonel'),
(NULL, '6', '3', 'Pendientes', 'Timonel'),
(NULL, '7', '1', 'Recibido', 'Acami'),
(NULL, '7', '2', 'Procesado', 'Acami'),
(NULL, '7', '3', 'Pendientes', 'Acami'),
(NULL, '8', '1', 'Recibido', 'Personal'),
(NULL, '8', '2', 'Procesado', 'Personal'),
(NULL, '8', '3', 'Pendientes', 'Personal'),
(NULL, '9', '1', 'Recibido', 'Salida'),
(NULL, '9', '2', 'Procesado', 'Salida'),
(NULL, '9', '3', 'Pendientes', 'Salida'),
(NULL, '10', '1', 'Recibido', 'Papelera'),
(NULL, '10', '2', 'Procesado', 'Papelera'),
(NULL, '10', '3', 'Pendientes', 'Papelera'),
(NULL, '11', '1', 'Por Archivar', 'Archivar'),
(NULL, '11', '2', 'Archivado', 'Archivar'),
(NULL, '12', '1', 'Cerrado', 'Cerrado');




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
  UNIQUE(`idd`, `ide`, `esta`)
);



DROP TABLE IF EXISTS `WKF_011_Alerta_Historico`;
CREATE TABLE IF NOT EXISTS `WKF_011_Alerta_Historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `idd` int(11)  NOT NULL COMMENT 'Id Documento',
  `ide` int(11)  NOT NULL COMMENT 'Identificador del estado',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `acti` tinyint(1)  NOT NULL COMMENT 'Activo',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `update` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Actualizacion',
  PRIMARY KEY (`id`)
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
  `esta` varchar(256) COMMENT 'Estatus del campo',
  `usua` varchar(256) NOT NULL  COMMENT 'Usuario Responsable',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `fnx` (`fnx`)
);




DROP TABLE IF EXISTS `WKF_015_SubDocumento`;
CREATE TABLE IF NOT EXISTS `WKF_015_SubDocumento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idd` int(11) COMMENT 'Documento Id WorkFlow',
  `ide` int(11)  NOT NULL COMMENT 'Estado del documento de destino',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `resu` TEXT  COMMENT 'Resumen',
  `deta` TEXT  COMMENT 'Detalle',
  `anom` varchar(256) COMMENT 'Nombre de Archivo',
  `priv` int(11) COMMENT 'Privacidad',
  `fcre` timestamp NOT NULL COMMENT 'Fecha de Registro',
  `cuen` varchar(256) COMMENT 'Cuenta Asociada',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `acti` int(11)  NOT NULL COMMENT 'ACtividad del Documento',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  INDEX `idd` (`idd`)
);

DROP TABLE IF EXISTS `WKF_015_SubDocumento_Historico`;
CREATE TABLE IF NOT EXISTS `WKF_015_SubDocumento_Historico` (
  `id` int(11),
  `idd` int(11) COMMENT 'Documento Id WorkFlow',
  `ide` int(11)  NOT NULL COMMENT 'Estado del documento de destino',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `resu` TEXT  COMMENT 'Resumen',
  `deta` TEXT  COMMENT 'Detalle',
  `anom` varchar(256) COMMENT 'Nombre de Archivo',
  `priv` int(11) COMMENT 'Privacidad',
  `fcre` timestamp NOT NULL COMMENT 'Fecha de Registro',
  `cuen` varchar(256) COMMENT 'Cuenta Asociada',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `acti` int(11)  NOT NULL COMMENT 'ACtividad del Documento',
  KEY `id` (`id`),
  INDEX `idd` (`idd`)
);

DROP TABLE IF EXISTS `WKF_015_SubDocumento_Variante`;
CREATE TABLE IF NOT EXISTS `WKF_015_SubDocumento_Variante` (
  `id` int(11) AUTO_INCREMENT,
  `ids` int(11) COMMENT 'SubDocumento Id WorkFlow',
  `esta` varchar(256)  NOT NULL COMMENT 'Estatus',
  `acci` TEXT  COMMENT 'Accion',
  `hist` TEXT  COMMENT 'Historico',
  `come` TEXT  COMMENT 'Comentario',
  `arch` TEXT  COMMENT 'Archivo',
  `anom` varchar(256) COMMENT 'Nombre de Archivo',
  `deci` varchar(256) COMMENT 'Decision',
  `fcre` timestamp NOT NULL COMMENT 'Fecha de Registro',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `upda` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Actualizacion',
  KEY `id` (`id`),
  UNIQUE(`ids`)

);

DROP TABLE IF EXISTS `WKF_015_SubDocumento_Traza`;
CREATE TABLE IF NOT EXISTS `WKF_015_SubDocumento_Traza` (
  `id` int(11)  AUTO_INCREMENT,
  `ids` int(11) COMMENT 'SubDocumento Id WorkFlow',
  `esta` varchar(256)  NOT NULL COMMENT 'Estatus',
  `acci` TEXT  COMMENT 'Accion',
  `hist` TEXT  COMMENT 'Historico',
  `come` TEXT  COMMENT 'Comentario',
  `arch` TEXT  COMMENT 'Archivo',
  `anom` varchar(256) COMMENT 'Nombre de Archivo',
  `deci` varchar(256) COMMENT 'Decision',
  `fcre` timestamp NOT NULL COMMENT 'Fecha de Registro',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `upda` TIMESTAMP NOT NULL COMMENT 'Actualizacion',
  KEY `id` (`id`)
);

DROP TABLE IF EXISTS `WKF_015_SubDocumento_Alerta`;
CREATE TABLE IF NOT EXISTS `WKF_015_SubDocumento_Alerta` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `ids` int(11)  NOT NULL COMMENT 'SubDocumento Id',
  `ide` int(11)  NOT NULL COMMENT 'Identificador del estado',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `acti` tinyint(1)  NOT NULL COMMENT 'Activo',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `update` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Actualizacion',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  UNIQUE(`ids`, `ide`, `esta`)
);

DROP TABLE IF EXISTS `WKF_015_SubDocumento_Alerta_Historico`;
CREATE TABLE IF NOT EXISTS `WKF_015_SubDocumento_Alerta_Historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `ids` int(11)  NOT NULL COMMENT 'SubDocumento Id',
  `ide` int(11)  NOT NULL COMMENT 'Identificador del estado',
  `esta` tinyint(1)  NOT NULL COMMENT 'Estatus',
  `acti` tinyint(1)  NOT NULL COMMENT 'Activo',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL COMMENT 'Usuario Responsable',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `update` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Actualizacion',
  PRIMARY KEY (`id`)
);











DROP TRIGGER IF  EXISTS `actualizarDocumentoDetalles`;
DELIMITER $$
CREATE TRIGGER actualizarDocumentoDetalles
AFTER UPDATE ON WKF_007_Documento_Detalle
  FOR EACH ROW BEGIN
    INSERT INTO `WKF_007_Historico_Documento`
      (wfd, numc, fcre, fori, nori, saso, tdoc, remi, udep, cont, 
      inst, carc, nexp, anom, usua, fech, tipo, priv) 
    VALUES 
      (OLD.wfd, OLD.numc, OLD.fcre, OLD.fori, OLD.nori, OLD.saso, OLD.tdoc, OLD.remi, OLD.udep, OLD.cont, 
      OLD.inst, OLD.carc, OLD.nexp, OLD.anom, OLD.usua, OLD.fech, 1, OLD.priv);

    IF OLD.anom != '' THEN
      INSERT INTO `WKF_013_Documentos_Adjuntos`(`idd`, `nomb`, `usua`) 
      VALUES (OLD.wfd, OLD.anom, OLD.usua);
    END IF;
END$$
DELIMITER ;


DROP TRIGGER IF  EXISTS `iniciarDocumentos`;
DELIMITER $$
CREATE TRIGGER iniciarDocumentos
AFTER INSERT ON WKF_006_Documento
  FOR EACH ROW BEGIN
    INSERT INTO `WKF_008_Documento_Ubicacion`(`idd`, `orig`, `dest`, `esta`, `llav`, `usua`)
     VALUES (NEW.id, NEW.estado, NEW.estado, 1, '',  NEW.usua);
END$$
DELIMITER ;


-- ANTES DE EJECUTAR EL UPDATE
-- llave != Promover al estado siguiente por nota de entrega
DROP TRIGGER IF EXISTS `actualizarUbicacion`;
DELIMITER $$
CREATE TRIGGER actualizarUbicacion
BEFORE UPDATE ON WKF_008_Documento_Ubicacion
FOR EACH ROW BEGIN
  IF NEW.dest = (SELECT id FROM WKF_003_Estado WHERE nomb='Papelera') THEN
    DELETE FROM WKF_007_Documento_Detalle WHERE wfd = OLD.idd;
    UPDATE `WKF_006_Documento` SET estado=NEW.dest, usua=NEW.usua, estatus=1 WHERE id=OLD.idd;
  END IF ;
  
  IF NEW.dest = 1 THEN
    UPDATE `WKF_006_Documento` SET  obse='RECHAZADO',  estado=1, usua=NEW.usua, estatus=1 WHERE id=OLD.idd;
  ELSEIF NEW.llav != OLD.llav THEN 
    UPDATE `WKF_006_Documento` SET obse='POR NOTA ENTREGA', estado=OLD.dest, usua=NEW.usua, estatus=NEW.esta WHERE id=OLD.idd;
  ELSE
    UPDATE `WKF_006_Documento` SET  obse='PROMOVIDO', estado=NEW.orig, usua=NEW.usua, estatus=NEW.esta WHERE id=OLD.idd;
  END IF ;
END$$
DELIMITER ;





DROP TRIGGER IF  EXISTS `actualizaDocumento`;
DELIMITER $$
CREATE TRIGGER actualizaDocumento
AFTER UPDATE ON WKF_006_Documento
  FOR EACH ROW BEGIN
    INSERT INTO `WKF_012_Traza`(`idd`, `ide`, `obse`, `esta`, `usua`, `fech`) 
    VALUES (OLD.id, OLD.estado, OLD.obse, OLD.estatus, OLD.usua, OLD.fech);
END$$
DELIMITER ;



DROP TRIGGER IF  EXISTS `eliminarDocumentoDetalles`;
DELIMITER $$
CREATE TRIGGER eliminarDocumentoDetalles
AFTER DELETE ON WKF_007_Documento_Detalle
  FOR EACH ROW BEGIN
      INSERT INTO `WKF_007_Historico_Documento`
        ( wfd, numc, fcre, fori, nori, saso, tdoc, remi, udep, cont, 
        inst, carc, nexp, anom, usua, fech, tipo, priv) 
      VALUES 
        ( OLD.wfd, OLD.numc, OLD.fcre, OLD.fori, OLD.nori, OLD.saso, OLD.tdoc, OLD.remi, OLD.udep, OLD.cont, 
        OLD.inst, OLD.carc, OLD.nexp, OLD.anom, OLD.usua, OLD.fech,9, OLD.priv);
END$$
DELIMITER ;



DROP TRIGGER IF  EXISTS `actualizarSubDocumento`;
DELIMITER $$
CREATE TRIGGER actualizarSubDocumento
AFTER UPDATE ON WKF_015_SubDocumento
FOR EACH ROW BEGIN
  INSERT INTO `WKF_015_SubDocumento_Historico`
    (`idd`, `come`, `ide`, `esta`, `resu`, `deta`, `anom`, `priv`, `fcre`, `cuen`, `usua`, `acti`) 
  VALUES 
    ( OLD.idd, OLD.come OLD.ide, OLD.esta, OLD.resu, OLD.deta, OLD.anom, OLD.priv, OLD.fcre, OLD.cuen, OLD.usua, OLD.acti );
END$$
DELIMITER ;





DROP TRIGGER IF  EXISTS `actualizarAlerta`;
DELIMITER $$
CREATE TRIGGER actualizarAlerta
AFTER UPDATE ON WKF_011_Alerta
FOR EACH ROW BEGIN
  INSERT INTO `WKF_011_Alerta_Historico`
  (`idd`, `ide`, `esta`, `acti`, `fech`, `usua`, `obse`, `update`) 
  VALUES 
  (OLD.idd,OLD.ide,OLD.esta,OLD.acti,OLD.fech,OLD.usua,OLD.obse,OLD.update);
END$$
DELIMITER ;



DROP TRIGGER IF  EXISTS `actualizarSubDocumentoVariante`;
DELIMITER $$
CREATE TRIGGER actualizarSubDocumentoVariante
AFTER UPDATE ON WKF_015_SubDocumento_Variante
FOR EACH ROW BEGIN
 INSERT INTO `WKF_015_SubDocumento_Traza`(`ids`, `esta`, `acci`, `hist`, `come`, `arch`, `anom`,`deci`, `fcre`, `usua`, `upda`)
  VALUES
 (OLD.ids,OLD.esta,OLD.acci,OLD.hist,come,OLD.arch,OLD.anom,OLD.deci,OLD.fcre,OLD.usua,OLD.upda);
END$$
DELIMITER ; 


DROP TRIGGER IF  EXISTS `actualizarSubDocumentoAlerta`;
DELIMITER $$
CREATE TRIGGER actualizarSubDocumentoAlerta
AFTER UPDATE ON WKF_015_SubDocumento_Alerta
FOR EACH ROW BEGIN
  INSERT INTO `WKF_015_SubDocumento_Alerta_Historico`
  (`ids`, `ide`, `esta`, `acti`, `fech`, `usua`, `obse`, `update`) 
  VALUES 
  (OLD.ids,OLD.ide,OLD.esta,OLD.acti,OLD.fech,OLD.usua,OLD.obse,OLD.update);
END$$
DELIMITER ;

-- SELECT UBI.idd,
--   DET.id, DET.numc, DET.fcre, DET.fori, 
--   DET.nori, DET.saso, DET.tdoc, DET.remi, 
--   DET.udep, DET.cont, DET.inst, DET.carc, DET.anom, 
--   DET.nexp, DET.fech, DET.usua, DET.priv,
--   EST.id AS idestado, EST.nomb AS estado, EST.obse AS desestado,
--   ACC.acci AS accion, ACC.obse AS observacion_accion
-- FROM WKF_006_Documento AS DOC
--   LEFT JOIN WKF_007_Documento_Detalle AS DET ON DOC.id=DET.wfd
--   LEFT JOIN WKF_003_Estado AS EST ON DOC.estado=EST.id
--   LEFT JOIN WKF_008_Documento_Ubicacion AS UBI ON UBI.idd=DOC.id
--   LEFT JOIN (SELECT * FROM `WKF_009_Documento_Variante` 
-- WHERE idd=$0 ORDER BY fech ASC LIMIT 1) AS ACC ON ACC.idd=DOC.estado 
-- WHERE DOC.estado=$0 AND DOC.estatus=$1 AND UBI.dest != 10 