-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: maxisoft_db
-- ------------------------------------------------------
-- Server version	8.0.29

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
  `id_hoja_de_produccion` int NOT NULL,
  `id_receta` int DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `fecha_hoja` date DEFAULT NULL,
  `encargado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_hoja_de_produccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoja_de_produccion`
--

LOCK TABLES `hoja_de_produccion` WRITE;
/*!40000 ALTER TABLE `hoja_de_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoja_de_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `id_insumo` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1001,'harina','kilos'),(1002,'levadura','kilos'),(1003,'azucar','kilos'),(1004,'ejemplo','kilos'),(1005,'ejemplo','si '),(1006,'ejemplo 2 ','qwer'),(1007,'wqerreqw','asdffdas'),(1008,'asdf','asdf'),(1009,'asdd','qwerr');
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_insumo`
--

DROP TABLE IF EXISTS `inventario_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_insumo` (
  `id_inv_ins` int NOT NULL,
  `tipo_insumo` int DEFAULT NULL,
  `fecha_venc` timestamp NULL DEFAULT NULL,
  `cantidad_actual` int DEFAULT NULL,
  PRIMARY KEY (`id_inv_ins`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_insumo`
--

LOCK TABLES `inventario_insumo` WRITE;
/*!40000 ALTER TABLE `inventario_insumo` DISABLE KEYS */;
INSERT INTO `inventario_insumo` VALUES (20001,1001,'2023-05-20 04:00:00',100),(20002,1002,'2023-06-15 04:00:00',200);
/*!40000 ALTER TABLE `inventario_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_producto`
--

DROP TABLE IF EXISTS `inventario_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_producto` (
  `id_inv_producto` int NOT NULL,
  `tipo_prod` int DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `cantidad_actual` int DEFAULT NULL,
  PRIMARY KEY (`id_inv_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_producto`
--

LOCK TABLES `inventario_producto` WRITE;
/*!40000 ALTER TABLE `inventario_producto` DISABLE KEYS */;
INSERT INTO `inventario_producto` VALUES (50001,30001,'2023-05-20',150),(50002,30002,'2023-05-25',250);
/*!40000 ALTER TABLE `inventario_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex_insumo`
--

DROP TABLE IF EXISTS `kardex_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kardex_insumo` (
  `id_det_insumo` int NOT NULL,
  `fecha_entrada` timestamp NULL DEFAULT NULL,
  `proveedor` varchar(45) DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `id_insumo` int DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_det_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex_insumo`
--

LOCK TABLES `kardex_insumo` WRITE;
/*!40000 ALTER TABLE `kardex_insumo` DISABLE KEYS */;
INSERT INTO `kardex_insumo` VALUES (70001,'2023-05-24 04:00:00','DonJose',5,1001,'485','gonzalo'),(70002,'2023-05-16 04:00:00','qwerrr',123444,1234,'12344','qwerrr');
/*!40000 ALTER TABLE `kardex_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex_producto`
--

DROP TABLE IF EXISTS `kardex_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kardex_producto` (
  `id_det_producto` int NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `encargado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_det_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex_producto`
--

LOCK TABLES `kardex_producto` WRITE;
/*!40000 ALTER TABLE `kardex_producto` DISABLE KEYS */;
INSERT INTO `kardex_producto` VALUES (90001,'2023-06-18 04:00:00',50,30001,'Gonzalo'),(90002,'2023-05-10 04:00:00',123444,123444,'qwerrr');
/*!40000 ALTER TABLE `kardex_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion`
--

DROP TABLE IF EXISTS `produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion` (
  `id_produccion` int NOT NULL,
  `id_hoja_produccion` int DEFAULT NULL,
  `encargado` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha_produccion` date DEFAULT NULL,
  PRIMARY KEY (`id_produccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id_producto` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (30001,'pan molde','receta de pan molde'),(30002,'sarnita','receta de pan sarnita ');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id_recetas` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `id_insumo` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_recetas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (8442536,'Gonzalo','Cuevas',0,'4to centenario ',78865656,'masculino','gcuevash','123456','00:00:00');
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

-- Dump completed on 2023-01-08 17:04:35
