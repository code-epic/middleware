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
  `numc` varchar(32)  NOT NULL, -- Numero de Control
  `freg` timestamp NOT NULL, -- Fecha de Registro
  `fori` timestamp NOT NULL, -- Fecha de Origen
  `nori` varchar(32) NOT NULL, --  Numero de Origen
  `saso` varchar(256) NOT NULL, -- Salida Asociada
  `tdoc` varchar(256) NOT NULL, -- Tipo de Documento
  `remi` varchar(256) NOT NULL, -- Remitente 
  `udep` varchar(256) NOT NULL, -- Unidad o Dependencia 
  `cont` TEXT NOT NULL, -- Contenido 
  `inst` TEXT NOT NULL, -- Instrucciones 
  `carc` varchar(32) NOT NULL, -- Codigo de Archivo 
  `nexp` varchar(32) NOT NULL, -- Numero de Expediente 
  `fech` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usua` varchar(256) NOT NULL,
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
