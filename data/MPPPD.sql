-- Consulta General de Busqueda Avanzada
DROP TABLE IF EXISTS `MD_000_CGenral`;
CREATE TABLE MD_000_CGenral (
  `id` INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
  `clas` varchar(32)  NOT NULL,
  `ranking` numeric(15,4)  NOT NULL,
  `tipo` varchar(1)  NOT NULL,
  `ubic` text,
  `cont` text,
  FULLTEXT (`ubic`,`cont`)
) ENGINE=InnoDB;


-- Manejo de Documentos Varios
DROP TABLE IF EXISTS `MD_001_Documento`;
CREATE TABLE IF NOT EXISTS `MD_001_Documento` (
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
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


-- Manejo de Documentos Varios
DROP TABLE IF EXISTS `MD_001_Proyecto`;
CREATE TABLE IF NOT EXISTS `MD_001_Proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomb` varchar(128)  NOT NULL COMMENT 'Nombre',
  `tipo` varchar(128) NOT NULL COMMENT 'Tipo de Proyecto',
  `ente` varchar(128) NOT NULL COMMENT 'Ente Contratante',
  `empr` varchar(128) NOT NULL COMMENT ' Numero de Origen',
  `fuen` varchar(256) NOT NULL COMMENT 'Fuente de Financiamiento',
  `ufin` varchar(256) NOT NULL COMMENT 'Usuario Final',
  `obje` TEXT NOT NULL COMMENT 'Objetivo',
  `obse` TEXT NOT NULL COMMENT 'Obsercaciones',
  `mone` varchar(4) COMMENT 'Tipo de moneda',
  `laps` varchar(128) NOT NULL COMMENT 'Lapso de Ejecucion',
  `tota` numeric(15,4)  COMMENT 'Monto total',
  `paga` numeric(15,4)  COMMENT 'Monto pagado',
  `deud` numeric(15,4)  COMMENT 'Deuda Pendiente',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


-- Manejo de Documentos Varios
DROP TABLE IF EXISTS `MD_002_Cotizaciones`;
CREATE TABLE IF NOT EXISTS `MD_002_Cotizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomb` varchar(128)  NOT NULL COMMENT 'Nombre',
  `fcre` timestamp NOT NULL COMMENT 'Fecha de Registro',
  `fvig` timestamp NOT NULL COMMENT 'Fecha de Vigencia',
  `obje` TEXT NOT NULL COMMENT 'Objetivo',
  `tota` numeric(15,4)  COMMENT 'Monto total',
  `paga` numeric(15,4)  COMMENT 'Monto pagado',
  `deud` numeric(15,4)  COMMENT 'Deuda Pendiente',
  `gara` numeric(15,4)  COMMENT 'Garantia',
  `mone` varchar(4) COMMENT 'Tipo de moneda',
  `laps` varchar(128) NOT NULL COMMENT 'Lapso de Ejecucion',
  `moda` varchar(128) NOT NULL COMMENT 'Modalidad',
  `fpag` varchar(128) NOT NULL COMMENT 'Forma de Pago',
  `resp` varchar(128) NOT NULL COMMENT 'Responsable',
  `carg` varchar(256) NOT NULL COMMENT 'Cargo Responsable',
  `obse` TEXT NOT NULL COMMENT 'Obsercaciones',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);

-- Configuracion de Documentos
DROP TABLE IF EXISTS `MD_003_Configuracion`;
CREATE TABLE IF NOT EXISTS `MD_003_Configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomb` varchar(256) NOT NULL COMMENT 'Nombre',
  `obse` varchar(256) NOT NULL COMMENT 'Observaciones',
  `tipo` varchar(32) NOT NULL COMMENT 'Tipo de Documentos',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL,
  INDEX (`tipo`),
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);



INSERT INTO MD_000_CGenral ( clas, ranking, tipo, ubic, cont) 
SELECT '', 0, 'E', 'DOCUMENTOS DE ENTRADA', 
 CONCAT(xdigital, ' ', xacto, ' ', xentrada, ' ', xasunto, ' ', xresolucion, ' ', xresponsable, ' ', xurl, ' ', xdatos) FROM ( 
  SELECT 
    CONCAT ( ed.fecha_entrada, ' ', ed.cuenta_oficio, ' ',  ed.digital ) AS xdigital, 
    IFNULL( ac.des_acto, '' ) as xacto,   
    IFNULL( te.des_tipo_entrada, '' ) as xentrada,
    CONCAT (ed.numero_resol, ' ', ed.fecha_resol, ' ', ed.asunto ) AS xasunto, 
    IFNULL( er.des_estado_resol, '' ) as xresolucion,
    CONCAT ( ed.responsable, ' ',  ed.numero_carpeta, ' ', ed.observacion ) AS xresponsable, 
    IFNULL( ce.url, '' ) as xurl,  
    CONCAT( ed.fecha_registro, ' ',  
    db.cedula,' ',  db.nombres_apellidos,' ', 
    ct.nombre_categoria,' ',  ct.nombre_corto, ' ', 
    cm.nombre_componente, ' ', cm.nombre_corto,' ', 
    gr.nombres_grado, ' ', gr.nombre_corto,' ', 
    cl.des_clasificacion, ' ', cl.des_corto_clas ) AS xdatos
  FROM entrada_documentos AS ed
  LEFT JOIN acto AS ac ON ed.cod_acto=ac.cod_acto
  LEFT JOIN tipo_entrada AS te ON ed.cod_tipo_entrada=te.cod_tipo_entrada
  LEFT JOIN carpeta_entrada ce ON ed.cod_carpeta=ce.cod_carpeta
  LEFT JOIN estado_resol er ON ed.estatus=er.cod_estado_resol
  LEFT JOIN datos_basicos AS db ON ed.cedula_entrada=db.cedula
  LEFT JOIN categoria AS ct ON db.cod_categoria=ct.cod_categoria
  LEFT JOIN componente AS cm ON db.cod_componente=cm.cod_componente 
  LEFT JOIN grado AS gr ON db.cod_grado=gr.cod_grado
  LEFT JOIN clasificacion AS cl ON db.cod_clasificacion=cl.cod_clasificacion 
  -- WHERE ed.cedula_entrada='11953710'
  ) 
AS Ax



SELECT 
MATCH (ubic,cont) AGAINST ('SEDEFANB CACERES' IN BOOLEAN MODE), cont FROM 
MD_000_CGenral 
WHERE MATCH (ubic,cont) AGAINST ('SEDEFANB CACERES' IN BOOLEAN MODE)


SELECT 
  DET.id, DET.numc, DET.fcre, DET.fori, 
  DET.nori, DET.saso, DET.tdoc, DET.remi, 
  DET.udep, DET.cont, DET.inst, DET.carc, 
  DET.nexp, DET.fech, DET.usua,
  EST.id AS idestado, EST.nomb AS estado, EST.obse AS desestado
FROM WKF_006_Documento AS DOC
  LEFT JOIN WKF_007_Documento_detalle AS DET ON DOC.id=DET.wfd
  LEFT JOIN WKF_003_Estado AS EST ON DOC.estado=EST.id
WHERE DOC.estado=1