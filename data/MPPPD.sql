

-- Manejo de Documentos Varios
DROP TABLE IF EXISTS mppd.MD_001_Proyecto;
CREATE TABLE IF NOT EXISTS mppd.MD_001_Proyecto (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomb` varchar(128)  NOT NULL COMMENT 'Nombre',
  `tipo` varchar(128) NOT NULL COMMENT 'Tipo de Proyecto',
  `sarm` varchar(128) NOT NULL COMMENT 'Sistema de Armas',
  `esta` varchar(128) NOT NULL COMMENT 'Estatus',
  `jefe` varchar(128) NOT NULL COMMENT 'Jefe de Proyecto',
  `jtel` varchar(128) NOT NULL COMMENT 'Telefo Jefe de Proyecto',
  `ente` varchar(128) NOT NULL COMMENT 'Ente Contratante',
  `empr` varchar(128) NOT NULL COMMENT ' Numero de Origen',
  `pais` varchar(128) NOT NULL COMMENT 'Pais de Empresa Ejecutante',
  `fuen` varchar(256) NOT NULL COMMENT 'Fuente de Financiamiento',
  `otro` varchar(128) NOT NULL COMMENT 'Otros',
  `ufin` varchar(256) NOT NULL COMMENT 'Usuario Final',
  `sist` varchar(128) NOT NULL COMMENT 'Sistema',
  `fdes` DATE COMMENT 'Fecha Desde',
  `fhas` DATE COMMENT 'Fecha Hasta',
  `ncon` varchar(128) NOT NULL COMMENT 'Numero de Contrato',
  `obje` TEXT NOT NULL COMMENT 'Objetivo',
  `obse` TEXT NOT NULL COMMENT 'Observaciones',
  `fori` DATE COMMENT 'Fecha Origen',
  `mone` varchar(4) COMMENT 'Tipo de moneda',
  `tota` numeric(15,4)  COMMENT 'Monto total',
  `paga` numeric(15,4)  COMMENT 'Monto pagado',
  `deud` numeric(15,4)  COMMENT 'Deuda Pendiente',
  `fech` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  `usua` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
);


-- Avances fisicos del Proyecto
DROP TABLE IF EXISTS mppd.MD_001_Avances;
CREATE TABLE mppd.MD_001_Avances (
  id INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
  idpr int(11) NOT NULL COMMENT 'Id Proyecto',
  fech timestamp NOT NULL COMMENT 'Fecha de Registro',
  mont numeric(15,4)  COMMENT 'Monto pagado',
  ejec numeric(15,4)  COMMENT 'Monto Ejecucion',
  arch varchar(128)  NOT NULL,
  obse text,
  KEY (idpr)
);

-- Avances fisicos del Proyecto Detalles Adjuntos
DROP TABLE IF EXISTS mppd.MD_001_Avances_Adjunto;
CREATE TABLE mppd.MD_001_Avances_Adjunto (
  id INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
  arch varchar(128)  NOT NULL
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




-- Configuracion de Documentos
DROP TABLE IF EXISTS `MD_004_SistemasArmas`;
CREATE TABLE IF NOT EXISTS `MD_004_SistemasArmas` (
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



-- Consulta General de Busqueda Avanzada
DROP TABLE IF EXISTS `MD_000_CGenral`;
CREATE TABLE MD_000_CGenral (
  id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
  clas varchar(32)  NOT NULL,
  skey varchar(64) NOT NULL,
  titu VARCHAR(256) ,
  subt VARCHAR(256) ,
  fech TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creacion',
  vige DATE,
  simb VARCHAR(256) NOT NULL,
  meta VARCHAR(256) NOT NULL,
  ranking numeric(15,4)  NOT NULL,
  tipo varchar(1)  NOT NULL,
  resu text,
  ubic text,
  cont text,
  FULLTEXT (skey, ubic, cont, resu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



INSERT INTO MD_000_CGenral ( clas, ranking, titu, skey, subt, simb, tipo, ubic, cont,resu, meta, vige, fech) 
SELECT '', 0, nombres_apellidos, cedula, cuenta_oficio, 'de', 'E', 'Doc. de Entrada', 
 CONCAT(xdigital, ' ', xacto, ' ', xentrada, ' ', ' ', xresolucion, ' ', ' ', xurl, ' ', xdatos),  xasunto,
 '{"ref": ["skey", "subt"]}', xfecha, NOW()
  FROM ( 
  SELECT 
    db.nombres_apellidos, 
    IFNULL(db.cedula, '') AS cedula , 
    ed.cuenta_oficio,
    IF(ed.fecha_entrada='0000-00-00','1986-07-22',ed.fecha_entrada) AS xfecha,
    CONCAT ( ed.cuenta_oficio, ' ',  ed.digital ) AS xdigital, 
    IFNULL( ac.des_acto, '' ) as xacto,   
    IFNULL( te.des_tipo_entrada, '' ) as xentrada,
    CONCAT (ed.numero_resol, ' ', ed.fecha_resol, ' ', ed.asunto ) AS xasunto, 
    IFNULL( er.des_estado_resol, '' ) as xresolucion,
    CONCAT ( ed.responsable, ' ',  ed.numero_carpeta, ' ', ed.observacion ) AS xresponsable, 
    IFNULL( ce.url, '' ) as xurl,  
    CONCAT( ed.fecha_registro, ' ',  
    db.nombres_apellidos,' ', 
    ct.nombre_categoria,' ',  ct.nombre_corto, ' ', 
    cm.nombre_componente, ' ', cm.nombre_corto,' ', 
    gr.nombres_grado, ' ', gr.nombre_corto,' ', 
    cl.des_clasificacion, ' ', cl.des_corto_clas, ' ', ed.fecha_entrada ) AS xdatos
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
  -- WHERE db.cedula != '' AND ed.cuenta_oficio != ''
  ORDER BY xfecha DESC
  ) 
AS Ax;


INSERT INTO MD_000_CGenral ( clas, ranking, titu, skey, subt, simb, tipo, ubic, cont,resu, meta, vige, fech) 
SELECT '', 0, nombres_apellidos, cedula, subtitulo, 'dr', 'R', 'Doc. en Resolución', 
        xcontenido,  xasunto,'{"ref": ["skey", "subt"]}', xfecha, NOW()
  FROM ( 
  SELECT  
    db.nombres_apellidos, 
    IFNULL(db.cedula, '') AS cedula , 
    CONCAT( dr.numero_resol , ' - ',  tr.des_resol ) AS subtitulo,
    dr.asunto AS xasunto, 
    IF(dr.fecha_resol='0000-00-00','1986-07-22',dr.fecha_resol) AS xfecha,
    CONCAT( dr.numero_resol,' - ', tr.des_resol, ' ',  db.nombres_apellidos, ' ',  
    ct.nombre_categoria,' ',  ct.nombre_corto, ' ', 
    cm.nombre_componente, ' ', cm.nombre_corto,' ', 
    gr.nombres_grado, ' ', gr.nombre_corto,' ', 
    cl.des_clasificacion, ' ', cl.des_corto_clas, ' ',  dr.asunto, ' ', dr.fecha_resol) AS xcontenido
  FROM `resoluciones_mppd` AS dr
  LEFT JOIN tipo_resoluciones AS tr ON dr.cod_tipo_resol=tr.cod_tipo_resol
	LEFT JOIN datos_basicos AS db ON dr.cedula_resol=db.cedula
	LEFT JOIN categoria AS ct ON db.cod_categoria=ct.cod_categoria
	LEFT JOIN componente AS cm ON db.cod_componente=cm.cod_componente 
  LEFT JOIN grado AS gr ON db.cod_grado=gr.cod_grado
  LEFT JOIN clasificacion AS cl ON db.cod_clasificacion=cl.cod_clasificacion 
  --WHERE db.cedula = '10352682'
  ORDER BY xfecha DESC
 -- WHERE db.cedula != '' AND ed.cuenta_oficio != ''
  ) 
AS Ax;








SELECT 
  MATCH (skey, ubic, cont, resu) AGAINST ('$0' IN BOOLEAN MODE), 
  resu, skey, resu,titu, subt, cont, fech, vige, ubic, 
  (SELECT  COUNT(*) FROM 
      MD_000_CGenral 
    WHERE MATCH (skey, ubic, cont, resu) AGAINST ('$0' IN BOOLEAN MODE)
  ) AS cantidad
FROM 
MD_000_CGenral 
WHERE 
  MATCH (skey, ubic, cont, resu) AGAINST ('$0' IN BOOLEAN MODE)
LIMIT 0,50


-- SELECT 
--   DET.id, DET.numc, DET.fcre, DET.fori, 
--   DET.nori, DET.saso, DET.tdoc, DET.remi, 
--   DET.udep, DET.cont, DET.inst, DET.carc, 
--   DET.nexp, DET.fech, DET.usua,
--   EST.id AS idestado, EST.nomb AS estado, EST.obse AS desestado
-- FROM WKF_006_Documento AS DOC
--   LEFT JOIN WKF_007_Documento_detalle AS DET ON DOC.id=DET.wfd
--   LEFT JOIN WKF_003_Estado AS EST ON DOC.estado=EST.id
-- WHERE DOC.estado=1


-- 

-- MPPD_CDatosBasicos
SELECT cedula,nombres_apellidos, cod_categoria AS categoria, cod_grado AS grado, 
	cod_componente AS componente, cod_clasificacion AS clasificacion, 
	cod_tipo_resol AS resolucion, cod_solicitud AS solicitud, 
    cod_reserva AS reserva, fecha_resol AS fecha, 
    fecha_promocion AS promosion, sexo,
	ED.edocs AS entradas, DRES.rdocs AS resoluciones
FROM `datos_basicos` AS DB
LEFT JOIN (
	SELECT cedula_entrada, 
        JSON_ARRAYAGG(
            JSON_OBJECT ( 
                "cuenta_oficio",cuenta_oficio,  
                "fecha_entrada",fecha_entrada,
                "digital",digital,
                "cod_acto",cod_acto,
                "cod_tipo_entrada",cod_tipo_entrada,
                "numero_resol",numero_resol,
                "fecha_resol",fecha_resol,
                "asunto",asunto,
                "estatus",estatus,
                "responsable",responsable,
                "numero_carpeta",numero_carpeta,
                "observacion",observacion,
                "cod_carpeta",cod_carpeta,
                "fecha_registro",fecha_registro,
                "registrado",registrado,
                "modificado",modificado,
                "f_modificado",f_modificado
            ) 
        ) AS edocs 
    FROM entrada_documentos
    WHERE cedula_entrada = '$0'
    GROUP BY cedula_entrada
) AS ED ON ED.cedula_entrada=DB.cedula

LEFT JOIN (
  SELECT  
    IFNULL(dr.cedula_resol, '') AS rcedula,
    JSON_ARRAYAGG(
          JSON_OBJECT ( 
            "id", dr.id,
            "titulo",  dr.numero_resol , 
            "tipo", dr.cod_tipo_resol,
            "tipo_descripcion",  tr.des_resol,
            "asunto", dr.asunto,
            "fecha", dr.fecha_resol
          ) 
      ) AS rdocs 
  FROM `resoluciones_mppd` AS dr
  LEFT JOIN tipo_resoluciones AS tr ON dr.cod_tipo_resol=tr.cod_tipo_resol
	LEFT JOIN datos_basicos AS db ON dr.cedula_resol=db.cedula
	LEFT JOIN categoria AS ct ON db.cod_categoria=ct.cod_categoria
	LEFT JOIN componente AS cm ON db.cod_componente=cm.cod_componente 
  LEFT JOIN grado AS gr ON db.cod_grado=gr.cod_grado
  LEFT JOIN clasificacion AS cl ON db.cod_clasificacion=cl.cod_clasificacion 
  WHERE dr.cedula_resol = '$0'
  GROUP BY dr.cedula_resol
) AS DRES ON DRES.rcedula=DB.cedula

WHERE DB.cedula = '$0'





         
  