

DROP TABLE IF EXISTS `hoja_de_produccion`;

CREATE TABLE `hoja_de_produccion` (
  `id_hoja_produccion` int NOT NULL,
  `id_receta` int DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `fecha_hoja` varchar(50) DEFAULT NULL,
  `encargado` varchar(50) DEFAULT NULL,
  `estado` int DEFAULT NULL,
  `progreso` int DEFAULT '0',
  `peso_recibido` int DEFAULT '0',
  `embolsado` int DEFAULT '0',
  PRIMARY KEY (`id_hoja_produccion`)
);


LOCK TABLES `hoja_de_produccion` WRITE;

INSERT INTO `hoja_de_produccion` VALUES (9019,50001,10,'2023-05-19','jhtf',NULL,70,40,86),(90001,50014,3,'2023-05-16','Gonzalo',1,100,120,20);

UNLOCK TABLES;



DROP TABLE IF EXISTS `insumo`;

CREATE TABLE `insumo` (
  `id_insumo` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
);


LOCK TABLES `insumo` WRITE;

INSERT INTO `insumo` VALUES (10001,'harina','kilos'),(10002,'levadura','kilos'),(10003,'azucar','kilos'),(10004,'manteca','kilos'),(10005,'gluten','kilos'),(10006,'antimoho','kilos'),(10007,'lusopan','kilos');

UNLOCK TABLES;


DROP TABLE IF EXISTS `insumos_has_recetas`;

CREATE TABLE `insumos_has_recetas` (
  `insumo_id_insumo` int NOT NULL,
  `recetas_id_recetas` int NOT NULL,
  PRIMARY KEY (`insumo_id_insumo`,`recetas_id_recetas`),
  KEY `fk_insumo_has_recetas_recetas1_idx` (`recetas_id_recetas`),
  CONSTRAINT `fk_insumo_has_recetas_insumo1` FOREIGN KEY (`insumo_id_insumo`) REFERENCES `insumo` (`id_insumo`),
  CONSTRAINT `fk_insumo_has_recetas_recetas1` FOREIGN KEY (`recetas_id_recetas`) REFERENCES `receta` (`id_receta`)
);


LOCK TABLES `insumos_has_recetas` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `inventario_insumo`;

CREATE TABLE `inventario_insumo` (
  `id_inv_ins` int NOT NULL,
  `tipo_insumo` int DEFAULT NULL,
  `fecha_venc` date DEFAULT NULL,
  `cantidad_actual` int DEFAULT NULL,
  PRIMARY KEY (`id_inv_ins`)
);

LOCK TABLES `inventario_insumo` WRITE;

INSERT INTO `inventario_insumo` VALUES (60001,10001,'2023-05-20',10),(60002,10002,'2023-06-15',200),(60003,10003,'2023-06-10',5),(60004,10004,'2023-06-04',20),(60005,10005,'2023-02-06',35),(60006,10006,'2023-03-10',27),(60007,10007,'2023-04-20',42);

UNLOCK TABLES;

DROP TABLE IF EXISTS `inventario_producto`;

CREATE TABLE `inventario_producto` (
  `id_inv_producto` int NOT NULL AUTO_INCREMENT,
  `tipo_prod` int DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `cantidad_actual` int DEFAULT NULL,
  PRIMARY KEY (`id_inv_producto`)
);


LOCK TABLES `inventario_producto` WRITE;

INSERT INTO `inventario_producto` VALUES (50001,20001,'2023-05-20',10),(50002,20002,'2023-05-25',70),(50003,20003,'2023-02-10',50),(50004,20004,'2023-03-15',30),(50005,20005,'2023-02-06',50);

UNLOCK TABLES;


DROP TABLE IF EXISTS `kardex_insumo`;

CREATE TABLE `kardex_insumo` (
  `id_det_insumo` int NOT NULL AUTO_INCREMENT,
  `fecha_entrada` varchar(40) DEFAULT NULL,
  `proveedor` varchar(45) DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `id_insumo` int DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `fecha_vencimiento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_det_insumo`)
);

LOCK TABLES `kardex_insumo` WRITE;

INSERT INTO `kardex_insumo` VALUES (30001,'2023-05-24 ','DonJose',5,10001,'485','gonzalo','2023-05-10'),(30002,'2023-05-16','Pepe',20,10002,'12344','qwerrr','2023-02-12'),(30003,'2023-06-10','pepe',5,10003,NULL,'gonzalo','2023-06-10');

UNLOCK TABLES;



DROP TABLE IF EXISTS `kardex_producto`;

CREATE TABLE `kardex_producto` (
  `id_det_producto` int NOT NULL AUTO_INCREMENT,
  `fecha_registro` varchar(45) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `encargado` varchar(45) DEFAULT NULL,
  `fecha_vencimiento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_det_producto`)
);

LOCK TABLES `kardex_producto` WRITE;

INSERT INTO `kardex_producto` VALUES (40001,'2023-06-17',50,20001,'Gonzalo','2023-09-16'),(40002,'2023-05-15',20,20003,'Peper','2023-05-10'),(40014,'2023-10-02',20,20002,'Jose',NULL);

UNLOCK TABLES;

DROP TABLE IF EXISTS `produccion`;

CREATE TABLE `produccion` (
  `id_produccion` int NOT NULL,
  `id_hoja_produccion` int DEFAULT NULL,
  `encargado` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha_produccion` date DEFAULT NULL,
  PRIMARY KEY (`id_produccion`)
);

LOCK TABLES `produccion` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `peso_receta` double DEFAULT NULL,
  `cantidad_bolsa` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ;

LOCK TABLES `producto` WRITE;

INSERT INTO `producto` VALUES (20001,'Pan molde','receta de pan molde',45.75,84),(20002,'Sarnita','receta de pan sarnita ',58.2,140),(20003,'Hamburguesa','Hamburguesa con queso',59.2,140),(20004,'Molde Pizza','Molde Pizza',50.3,145),(20005,'Panchito','Panchito Extra largo',55.4,140);

UNLOCK TABLES;

DROP TABLE IF EXISTS `receta`;

CREATE TABLE `receta` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `id_insumo` int DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  PRIMARY KEY (`id_receta`)
);

LOCK TABLES `receta` WRITE;

INSERT INTO `receta` VALUES (50001,20001,10001,39),(50002,20001,10002,2),(50003,20001,10003,3),(50004,20001,10004,2),(50005,20001,10005,0.5),(50006,20001,10006,0.15),(50007,20001,10007,0.1),(50008,20002,10001,50),(50009,20002,10002,2),(50010,20002,10003,3),(50011,20002,10004,2),(50012,20002,10006,0.1),(50013,20002,10007,0.1),(50014,20003,10001,50),(50015,20003,10002,2),(50016,20003,10003,5),(50017,20003,10004,3),(50018,20003,10006,0.1),(50019,20003,10007,0.1);

UNLOCK TABLES;



DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `ci_persona` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `tipo_usuario` int DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `numero_cell` int DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fecha_registro` time DEFAULT NULL,
  PRIMARY KEY (`ci_persona`)
) ;

LOCK TABLES `usuario` WRITE;

INSERT INTO `usuario` VALUES (123456,'Pepito','Grillo',1,'ya tu sabe',78852520,'masculino','pepitog','123456',NULL),(8442536,'Gonzalo','Cuevas',0,'4to centenario ',78865656,'masculino','gcuevash','123456','00:00:00');

UNLOCK TABLES;
