-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: maxisoft_db
-- ------------------------------------------------------
-- Server version	5.6.51-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hoja_de_produccion`
--

DROP TABLE IF EXISTS `hoja_de_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoja_de_produccion` (
  `id_hoja_produccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_receta` int(11) DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `fecha_hoja` varchar(50) DEFAULT NULL,
  `encargado` varchar(50) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `progreso` int(11) DEFAULT '0',
  `peso_recibido` int(11) DEFAULT '0',
  `embolsado` int(11) DEFAULT '0',
  PRIMARY KEY (`id_hoja_produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=90003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoja_de_produccion`
--

LOCK TABLES `hoja_de_produccion` WRITE;
/*!40000 ALTER TABLE `hoja_de_produccion` DISABLE KEYS */;
INSERT INTO `hoja_de_produccion` VALUES (90001,50008,20,'2023-02-03','PePe',NULL,20,0,0),(90002,50001,50,'2023-05-03','Gmch',NULL,0,0,0);
/*!40000 ALTER TABLE `hoja_de_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `id_insumo` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (10001,'harina','kilos',20000,3000),(10002,'levadura','kilos',1000,NULL),(10003,'azucar','kilos',10000,NULL),(10004,'manteca','kilos',500,NULL),(10005,'gluten','kilos',200,NULL),(10006,'antimoho','kilos',100,NULL),(10007,'lusopan','kilos',100,NULL),(10008,'leche','litros',50,NULL),(10009,'huevos','unidades',150,NULL);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumos_has_recetas`
--

DROP TABLE IF EXISTS `insumos_has_recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos_has_recetas` (
  `insumo_id_insumo` int(11) NOT NULL,
  `recetas_id_recetas` int(11) NOT NULL,
  PRIMARY KEY (`insumo_id_insumo`,`recetas_id_recetas`),
  KEY `fk_insumo_has_recetas_recetas1_idx` (`recetas_id_recetas`),
  CONSTRAINT `fk_insumo_has_recetas_insumo1` FOREIGN KEY (`insumo_id_insumo`) REFERENCES `insumo` (`id_insumo`),
  CONSTRAINT `fk_insumo_has_recetas_recetas1` FOREIGN KEY (`recetas_id_recetas`) REFERENCES `receta` (`id_receta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos_has_recetas`
--

LOCK TABLES `insumos_has_recetas` WRITE;
/*!40000 ALTER TABLE `insumos_has_recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumos_has_recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_insumo`
--

DROP TABLE IF EXISTS `inventario_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_insumo` (
  `id_inv_ins` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_insumo` int(11) DEFAULT NULL,
  `fecha_venc` date DEFAULT NULL,
  `cantidad_actual` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_inv_ins`)
) ENGINE=InnoDB AUTO_INCREMENT=60011 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_insumo`
--

LOCK TABLES `inventario_insumo` WRITE;
/*!40000 ALTER TABLE `inventario_insumo` DISABLE KEYS */;
INSERT INTO `inventario_insumo` VALUES (60001,10001,'2023-05-20',10),(60002,10002,'2023-06-15',200),(60003,10003,'2023-06-10',5),(60004,10004,'2023-06-04',20),(60005,10005,'2023-02-06',35),(60006,10006,'2023-03-10',27),(60007,10007,'2023-04-20',42),(60008,10001,'2023-05-10',-10),(60009,10001,'2023-09-10',150),(60010,10001,'2023-10-18',-50);
/*!40000 ALTER TABLE `inventario_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_producto`
--

DROP TABLE IF EXISTS `inventario_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_producto` (
  `id_inv_producto` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_prod` int(11) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `cantidad_actual` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_inv_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=50007 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_producto`
--

LOCK TABLES `inventario_producto` WRITE;
/*!40000 ALTER TABLE `inventario_producto` DISABLE KEYS */;
INSERT INTO `inventario_producto` VALUES (50001,20001,'2023-05-20',10),(50002,20002,'2023-05-25',70),(50003,20003,'2023-02-10',50),(50004,20004,'2023-03-15',30),(50005,20005,'2023-02-06',50),(50006,20001,'2023-12-10',100);
/*!40000 ALTER TABLE `inventario_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex_insumo`
--

DROP TABLE IF EXISTS `kardex_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kardex_insumo` (
  `id_det_insumo` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_entrada` varchar(40) DEFAULT NULL,
  `proveedor` varchar(45) DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `id_insumo` int(11) DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `fecha_vencimiento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_det_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=30009 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex_insumo`
--

LOCK TABLES `kardex_insumo` WRITE;
/*!40000 ALTER TABLE `kardex_insumo` DISABLE KEYS */;
INSERT INTO `kardex_insumo` VALUES (30001,'2023-05-24 ','DonJose',5,10001,'485','gonzalo','2023-05-10'),(30002,'2023-05-16','Pepe',20,10002,'12344','qwerrr','2023-02-12'),(30003,'2023-06-10','pepe',5,10003,NULL,'gonzalo','2023-06-10'),(30006,'2023-08-10','GmCh',150,10001,NULL,'gmch','2023-09-10'),(30008,'2023-10-09','GPMx',-50,10001,NULL,'GGMMCCHH','2023-10-18');
/*!40000 ALTER TABLE `kardex_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex_producto`
--

DROP TABLE IF EXISTS `kardex_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kardex_producto` (
  `id_det_producto` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_registro` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `encargado` varchar(45) DEFAULT NULL,
  `fecha_vencimiento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_det_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=40016 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex_producto`
--

LOCK TABLES `kardex_producto` WRITE;
/*!40000 ALTER TABLE `kardex_producto` DISABLE KEYS */;
INSERT INTO `kardex_producto` VALUES (40001,'2023-06-17',50,20001,'Gonzalo','2023-09-16'),(40002,'2023-05-15',20,20003,'Peper','2023-05-10'),(40014,'2023-10-02',20,20002,'Jose','2023-08-10'),(40015,'2023-11-10',100,20001,'qwer','2023-12-10');
/*!40000 ALTER TABLE `kardex_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion`
--

DROP TABLE IF EXISTS `produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion` (
  `id_produccion` int(11) NOT NULL,
  `id_hoja_produccion` int(11) DEFAULT NULL,
  `encargado` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha_produccion` date DEFAULT NULL,
  PRIMARY KEY (`id_produccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion`
--

LOCK TABLES `produccion` WRITE;
/*!40000 ALTER TABLE `produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `peso_receta` double DEFAULT NULL,
  `cantidad_bolsa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (20001,'Pan molde','receta de pan molde',45.75,84),(20002,'Sarnita','receta de pan sarnita ',58.2,140),(20003,'Hamburguesa','Hamburguesa con queso',59.2,140),(20004,'Molde Pizza','Molde Pizza',50.3,145),(20005,'Panchito','Panchito Extra largo',55.4,140);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `id_receta` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `id_insumo` int(11) DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  PRIMARY KEY (`id_receta`)
) ENGINE=InnoDB AUTO_INCREMENT=50020 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (50001,20001,10001,39),(50002,20001,10002,2),(50003,20001,10003,3),(50004,20001,10004,2),(50005,20001,10005,0.5),(50006,20001,10006,0.15),(50007,20001,10007,0.1),(50008,20002,10001,50),(50009,20002,10002,2),(50010,20002,10003,3),(50011,20002,10004,2),(50012,20002,10006,0.1),(50013,20002,10007,0.1),(50014,20003,10001,50),(50015,20003,10002,2),(50016,20003,10003,5),(50017,20003,10004,3),(50018,20003,10006,0.1),(50019,20003,10007,0.1);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ci_persona` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `tipo_usuario` int(11) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `numero_cell` int(11) DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fecha_registro` time DEFAULT NULL,
  PRIMARY KEY (`ci_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (123456,'Pepito','Grillo',1,'ya tu sabe',78852520,'masculino','pepitog','123456',NULL),(8442536,'Gonzalo','Cuevas',0,'4to centenario ',78865656,'masculino','gcuevash','123456','00:00:00');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-03 14:01:50
