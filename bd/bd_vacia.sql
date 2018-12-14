-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: my_route
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Camino`
--

DROP TABLE IF EXISTS `Camino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Camino` (
  `idCamino` int(10) NOT NULL AUTO_INCREMENT,
  `origen` int(10) NOT NULL,
  `destino` int(10) NOT NULL,
  PRIMARY KEY (`idCamino`),
  KEY `origen` (`origen`),
  KEY `destino` (`destino`),
  CONSTRAINT `Camino_ibfk_1` FOREIGN KEY (`origen`) REFERENCES `Lugar` (`idLugar`),
  CONSTRAINT `Camino_ibfk_2` FOREIGN KEY (`destino`) REFERENCES `Lugar` (`idLugar`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camino`
--

LOCK TABLES `Camino` WRITE;
/*!40000 ALTER TABLE `Camino` DISABLE KEYS */;
/*!40000 ALTER TABLE `Camino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Imagen`
--

DROP TABLE IF EXISTS `Imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Imagen` (
  `idImagen` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idImagen`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Imagen`
--

LOCK TABLES `Imagen` WRITE;
/*!40000 ALTER TABLE `Imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `Imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Imagen_Lugar`
--

DROP TABLE IF EXISTS `Imagen_Lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Imagen_Lugar` (
  `idLugar` int(10) NOT NULL,
  `idImagen` int(10) NOT NULL,
  PRIMARY KEY (`idImagen`) USING BTREE,
  KEY `idLugar` (`idLugar`),
  CONSTRAINT `Imagen_Lugar_ibfk_1` FOREIGN KEY (`idImagen`) REFERENCES `Imagen` (`idImagen`),
  CONSTRAINT `Imagen_Lugar_ibfk_2` FOREIGN KEY (`idLugar`) REFERENCES `Lugar` (`idLugar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Imagen_Lugar`
--

LOCK TABLES `Imagen_Lugar` WRITE;
/*!40000 ALTER TABLE `Imagen_Lugar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Imagen_Lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Imagen_Ruta`
--

DROP TABLE IF EXISTS `Imagen_Ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Imagen_Ruta` (
  `idRuta` int(10) NOT NULL,
  `idImagen` int(10) NOT NULL,
  PRIMARY KEY (`idImagen`),
  KEY `idRuta` (`idRuta`),
  CONSTRAINT `Imagen_Ruta_ibfk_1` FOREIGN KEY (`idImagen`) REFERENCES `Imagen` (`idImagen`),
  CONSTRAINT `Imagen_Ruta_ibfk_2` FOREIGN KEY (`idRuta`) REFERENCES `Ruta` (`idRuta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Imagen_Ruta`
--

LOCK TABLES `Imagen_Ruta` WRITE;
/*!40000 ALTER TABLE `Imagen_Ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Imagen_Ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Imagen_Usuario`
--

DROP TABLE IF EXISTS `Imagen_Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Imagen_Usuario` (
  `idUsuario` int(10) NOT NULL,
  `idImagen` int(10) NOT NULL,
  PRIMARY KEY (`idImagen`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `Imagen_Usuario_ibfk_1` FOREIGN KEY (`idImagen`) REFERENCES `Imagen` (`idImagen`),
  CONSTRAINT `Imagen_Usuario_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario_registrado` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Imagen_Usuario`
--

LOCK TABLES `Imagen_Usuario` WRITE;
/*!40000 ALTER TABLE `Imagen_Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Imagen_Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lugar`
--

DROP TABLE IF EXISTS `Lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lugar` (
  `idLugar` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `coordenadas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idLugar`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lugar`
--

LOCK TABLES `Lugar` WRITE;
/*!40000 ALTER TABLE `Lugar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ruta`
--

DROP TABLE IF EXISTS `Ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ruta` (
  `idRuta` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`idRuta`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ruta`
--

LOCK TABLES `Ruta` WRITE;
/*!40000 ALTER TABLE `Ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_registrado`
--

DROP TABLE IF EXISTS `Usuario_registrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario_registrado` (
  `idUsuario` int(10) NOT NULL AUTO_INCREMENT,
  `correo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_usuario` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `año_nacimiento` int(5) DEFAULT NULL,
  `lugar_nacimiento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_registrado`
--

LOCK TABLES `Usuario_registrado` WRITE;
/*!40000 ALTER TABLE `Usuario_registrado` DISABLE KEYS */;
INSERT INTO `Usuario_registrado` VALUES (1,'usuario@correo.com','usuario','usuario','sakdjksad		','registrado',1997,'granada'),(2,'usuario2@correo.com		','usuario2','usuario2','dasdsaj	','registrado',1997,'jaen'),(3,'nuevo@correo.com','nuevo','$2b$12$6Wk60xEH8P2f/Ci9Xd50XugTwIZS6s8ajeMgwCCbWHyWaJC/Z4gtC',NULL,'registrado',NULL,NULL),(4,'nuevo2@correo.com','nuevo2','$2b$12$WZAxMYyg/9sSDtI5de5i4em6O/hv2f8sOI6xbVKjYaafr3RlbeBxC',NULL,'registrado',NULL,NULL);
/*!40000 ALTER TABLE `Usuario_registrado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_sigue`
--

DROP TABLE IF EXISTS `Usuario_sigue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario_sigue` (
  `idSigue` int(10) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(10) NOT NULL,
  `idRuta` int(10) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idSigue`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idRuta` (`idRuta`),
  CONSTRAINT `Usuario_sigue_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario_registrado` (`idUsuario`),
  CONSTRAINT `Usuario_sigue_ibfk_2` FOREIGN KEY (`idRuta`) REFERENCES `Ruta` (`idRuta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_sigue`
--

LOCK TABLES `Usuario_sigue` WRITE;
/*!40000 ALTER TABLE `Usuario_sigue` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_sigue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_visita`
--

DROP TABLE IF EXISTS `Usuario_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario_visita` (
  `idVisita` int(10) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(10) NOT NULL,
  `idLugar` int(10) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idVisita`),
  KEY `idLugar` (`idLugar`),
  KEY `idUsuario` (`idUsuario`) USING BTREE,
  CONSTRAINT `Usuario_visita_ibfk_1` FOREIGN KEY (`idLugar`) REFERENCES `Lugar` (`idLugar`),
  CONSTRAINT `Usuario_visita_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario_registrado` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_visita`
--

LOCK TABLES `Usuario_visita` WRITE;
/*!40000 ALTER TABLE `Usuario_visita` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Valoracion`
--

DROP TABLE IF EXISTS `Valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Valoracion` (
  `idValoracion` int(10) NOT NULL AUTO_INCREMENT,
  `Valoracion` int(2) NOT NULL,
  `Comentario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LIkes_comentario` int(10) NOT NULL,
  `Visible` tinyint(1) NOT NULL,
  `Num_reportes` int(10) NOT NULL,
  PRIMARY KEY (`idValoracion`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Valoracion`
--

LOCK TABLES `Valoracion` WRITE;
/*!40000 ALTER TABLE `Valoracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Valoracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Valoracion_lugar`
--

DROP TABLE IF EXISTS `Valoracion_lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Valoracion_lugar` (
  `idUsuario` int(10) NOT NULL,
  `idLugar` int(10) NOT NULL,
  `idValoracion` int(10) NOT NULL,
  PRIMARY KEY (`idValoracion`),
  KEY `idLugar` (`idLugar`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `Valoracion_lugar_ibfk_1` FOREIGN KEY (`idValoracion`) REFERENCES `Valoracion` (`idValoracion`),
  CONSTRAINT `Valoracion_lugar_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario_visita` (`idUsuario`),
  CONSTRAINT `Valoracion_lugar_ibfk_3` FOREIGN KEY (`idLugar`) REFERENCES `Usuario_visita` (`idLugar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Valoracion_lugar`
--

LOCK TABLES `Valoracion_lugar` WRITE;
/*!40000 ALTER TABLE `Valoracion_lugar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Valoracion_lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Valoracion_ruta`
--

DROP TABLE IF EXISTS `Valoracion_ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Valoracion_ruta` (
  `idUsuario` int(10) NOT NULL,
  `idRuta` int(10) NOT NULL,
  `idValoracion` int(10) NOT NULL,
  PRIMARY KEY (`idValoracion`),
  KEY `idRuta` (`idRuta`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `Valoracion_ruta_ibfk_1` FOREIGN KEY (`idValoracion`) REFERENCES `Valoracion` (`idValoracion`),
  CONSTRAINT `Valoracion_ruta_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario_sigue` (`idUsuario`),
  CONSTRAINT `Valoracion_ruta_ibfk_3` FOREIGN KEY (`idRuta`) REFERENCES `Usuario_sigue` (`idRuta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Valoracion_ruta`
--

LOCK TABLES `Valoracion_ruta` WRITE;
/*!40000 ALTER TABLE `Valoracion_ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Valoracion_ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta_lugar`
--

DROP TABLE IF EXISTS `ruta_lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruta_lugar` (
  `ruta_id` int(10) NOT NULL,
  `lugar_id` int(10) NOT NULL,
  `num_orden` int(10) NOT NULL,
  `idRuta_lugar` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idRuta_lugar`),
  KEY `ruta_id` (`ruta_id`),
  KEY `lugar_id` (`lugar_id`),
  CONSTRAINT `ruta_lugar_ibfk_1` FOREIGN KEY (`lugar_id`) REFERENCES `Lugar` (`idLugar`),
  CONSTRAINT `ruta_lugar_ibfk_2` FOREIGN KEY (`ruta_id`) REFERENCES `Ruta` (`idRuta`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta_lugar`
--

LOCK TABLES `ruta_lugar` WRITE;
/*!40000 ALTER TABLE `ruta_lugar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruta_lugar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-14 12:14:52
