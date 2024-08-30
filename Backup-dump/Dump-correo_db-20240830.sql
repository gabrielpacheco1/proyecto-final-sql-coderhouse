-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: correo_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `actualizacion_estado_pedido`
--

DROP TABLE IF EXISTS `actualizacion_estado_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actualizacion_estado_pedido` (
  `id_actualizacion` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `estado` enum('EN SUCURSAL ORIGEN','EN PREPARACIÓN','EN TRANSPORTE','EN SUCURSAL DESTINO','EN DISTRIBUCION','EN SUCURSAL DESTINO PARA SER RETIRADO','ENTREGADO') NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_actualizacion`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `actualizacion_estado_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actualizacion_estado_pedido`
--

LOCK TABLES `actualizacion_estado_pedido` WRITE;
/*!40000 ALTER TABLE `actualizacion_estado_pedido` DISABLE KEYS */;
INSERT INTO `actualizacion_estado_pedido` VALUES (1,1,'EN PREPARACIÓN','2024-07-30 23:32:47');
/*!40000 ALTER TABLE `actualizacion_estado_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcance`
--

DROP TABLE IF EXISTS `alcance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcance` (
  `id_alcance` int NOT NULL AUTO_INCREMENT,
  `descripcion_alcance` enum('LOCAL','REGIONAL','NACIONAL CORTA DIST','NACIONAL LARGA DIST') NOT NULL,
  PRIMARY KEY (`id_alcance`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcance`
--

LOCK TABLES `alcance` WRITE;
/*!40000 ALTER TABLE `alcance` DISABLE KEYS */;
INSERT INTO `alcance` VALUES (1,'LOCAL'),(2,'REGIONAL'),(3,'NACIONAL CORTA DIST'),(4,'NACIONAL LARGA DIST');
/*!40000 ALTER TABLE `alcance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadete`
--

DROP TABLE IF EXISTS `cadete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadete` (
  `dni_cadete` varchar(11) NOT NULL,
  `nombre_cadete` varchar(30) NOT NULL,
  `apellido_cadete` varchar(30) NOT NULL,
  `telefono_cliente` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`dni_cadete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadete`
--

LOCK TABLES `cadete` WRITE;
/*!40000 ALTER TABLE `cadete` DISABLE KEYS */;
INSERT INTO `cadete` VALUES ('20345678','Juan','Pérez','011-1234-5678'),('21345678','María','Gómez','011-2345-6789'),('22345678','Carlos','Fernández','011-3456-7890'),('23345678','Ana','Martínez','011-4567-8901'),('24345678','Luis','López','011-5678-9012'),('25345678','Marta','González','011-6789-0123'),('26345678','José','Rodríguez','011-7890-1234'),('27345678','Laura','Sánchez','011-8901-2345'),('28345678','Pedro','García','011-9012-3456'),('29345678','Sofía','Ramírez','011-0123-4567');
/*!40000 ALTER TABLE `cadete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `dni_cliente` varchar(11) NOT NULL,
  `nombre_cliente` varchar(30) NOT NULL,
  `apellido_cliente` varchar(30) NOT NULL,
  `email_cliente` varchar(60) DEFAULT NULL,
  `telefono_cliente` varchar(25) DEFAULT NULL,
  `direccion_cliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni_cliente`),
  UNIQUE KEY `email_cliente` (`email_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('30345678','Lucas','Pérez','lucas.perez@example.com','011-1234-5678','Calle Falsa 123'),('31345678','Martina','Gómez','martina.gomez@example.com','011-2345-6789','Avenida Siempre Viva 456'),('32345678','Javier','Fernández','javier.fernandez@example.com','011-3456-7890','Boulevard del Sol 789'),('33345678','Florencia','Martínez','florencia.martinez@example.com','011-4567-8901','Pasaje de las Flores 101'),('34345678','Diego','López','diego.lopez@example.com','011-5678-9012','Calle del Río 202'),('35345678','Camila','González','camila.gonzalez@example.com','011-6789-0123','Avenida Libertad 303'),('36345678','Rodrigo','Rodríguez','rodrigo.rodriguez@example.com','011-7890-1234','Calle de la Paz 404'),('37345678','Juliana','Sánchez','juliana.sanchez@example.com','011-8901-2345','Pasaje del Bosque 505'),('38345678','Emiliano','García','emiliano.garcia@example.com','011-9012-3456','Boulevard de los Sueños 606'),('39345678','Sabrina','Ramírez','sabrina.ramirez@example.com','011-0123-4567','Calle de los Pinos 707'),('40345678','Mateo','Molina','mateo.molina@example.com','011-1234-6789','Avenida de los Árboles 808'),('41345678','Valentina','Castro','valentina.castro@example.com','011-2345-7890','Calle del Lago 909'),('42345678','Tomás','Ríos','tomas.rios@example.com','011-3456-8901','Pasaje del Arroyo 1010'),('43345678','Milagros','Vega','milagros.vega@example.com','011-4567-9012','Avenida del Parque 1111'),('44345678','Santiago','Herrera','santiago.herrera@example.com','011-5678-0123','Calle del Campo 1212');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despacho`
--

DROP TABLE IF EXISTS `despacho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despacho` (
  `id_despacho` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `fecha_despacho` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_recepcion` timestamp NULL DEFAULT NULL,
  `encargado_transporte` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_despacho`),
  KEY `fk_despacho_pedido` (`id_pedido`),
  CONSTRAINT `fk_despacho_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los datos del despacho del pedido';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despacho`
--

LOCK TABLES `despacho` WRITE;
/*!40000 ALTER TABLE `despacho` DISABLE KEYS */;
INSERT INTO `despacho` VALUES (1,1,1,NULL,NULL,'Juan Pérez'),(2,2,2,NULL,NULL,'María Gómez'),(3,3,3,'2023-01-03 03:00:00',NULL,'Carlos Rodríguez'),(4,4,2,NULL,NULL,'Ana López'),(5,5,2,NULL,NULL,'Luis Fernández'),(6,6,4,'2023-01-06 03:00:00',NULL,'Pedro Martínez'),(7,7,4,'2023-01-07 03:00:00','2023-01-09 17:00:00','Laura García'),(8,8,5,'2023-01-08 03:00:00','2023-01-08 21:30:00','Jorge Ruiz'),(9,9,1,NULL,NULL,'Sofía Romero'),(10,10,2,NULL,NULL,'Mateo López'),(11,11,10,'2023-01-11 03:00:00',NULL,'Valentina Díaz'),(12,12,5,'2023-01-12 03:00:00','2023-01-12 23:15:00','Lucas Torres'),(13,13,2,NULL,NULL,'Catalina Morales'),(14,14,9,'2023-01-14 03:00:00','2023-01-15 00:45:00','Mariano Castro'),(15,15,1,'2023-01-15 03:00:00',NULL,'Fernanda Vega'),(16,16,2,NULL,NULL,'Gabriel Navarro'),(17,17,4,'2023-01-17 03:00:00',NULL,'Martina Fernández'),(18,18,6,'2023-01-18 03:00:00','2023-01-18 20:52:00','Leonardo Peña');
/*!40000 ALTER TABLE `despacho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinatario`
--

DROP TABLE IF EXISTS `destinatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinatario` (
  `id_destinatario` int NOT NULL AUTO_INCREMENT,
  `dni_destinatario` varchar(11) NOT NULL,
  `nombre_destinatario` varchar(30) NOT NULL,
  `apellido_destinatario` varchar(30) NOT NULL,
  `telefono_destinatario` varchar(25) DEFAULT NULL,
  `direccion_destinatario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_destinatario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinatario`
--

LOCK TABLES `destinatario` WRITE;
/*!40000 ALTER TABLE `destinatario` DISABLE KEYS */;
INSERT INTO `destinatario` VALUES (1,'35123456','Luis','Pérez','011-1234-5678','Calle Falsa 123'),(2,'35123457','Ana','Gómez','011-2345-6789','Avenida Siempre Viva 234'),(3,'35123458','Carlos','Fernández','011-3456-7890','Boulevard del Sol 345'),(4,'35123459','María','Martínez','011-4567-8901','Pasaje de las Flores 456'),(5,'35123460','Jorge','López','011-5678-9012','Calle del Río 567'),(6,'35123461','Laura','González','011-6789-0123','Avenida Libertad 678'),(7,'35123462','Ricardo','Rodríguez','011-7890-1234','Calle de la Paz 789'),(8,'35123463','Marta','Sánchez','011-8901-2345','Pasaje del Bosque 890'),(9,'35123464','Emilio','García','011-9012-3456','Boulevard de los Sueños 901'),(10,'35123465','Claudia','Ramírez','011-0123-4567','Calle de los Pinos 012'),(11,'35123466','Miguel','Molina','011-1234-6789','Avenida de los Árboles 123'),(12,'35123467','Rosa','Castro','011-2345-7890','Calle del Lago 234'),(13,'35123468','Fernando','Ríos','011-3456-8901','Pasaje del Arroyo 345'),(14,'35123469','Patricia','Vega','011-4567-9012','Avenida del Parque 456'),(15,'35123470','Santiago','Herrera','011-5678-0123','Calle del Campo 567');
/*!40000 ALTER TABLE `destinatario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribucion`
--

DROP TABLE IF EXISTS `distribucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribucion` (
  `id_distribucion` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `dni_cadete` varchar(11) DEFAULT NULL,
  `fecha_entrega` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_distribucion`),
  KEY `fk_distribucion_cadete` (`dni_cadete`),
  KEY `fk_distribucion_pedido` (`id_pedido`),
  CONSTRAINT `fk_distribucion_cadete` FOREIGN KEY (`dni_cadete`) REFERENCES `cadete` (`dni_cadete`),
  CONSTRAINT `fk_distribucion_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribucion`
--

LOCK TABLES `distribucion` WRITE;
/*!40000 ALTER TABLE `distribucion` DISABLE KEYS */;
INSERT INTO `distribucion` VALUES (5,8,'20345678','2023-01-09 03:00:00'),(6,12,'23345678','2023-01-13 03:00:00'),(7,14,'29345678','2023-01-17 03:00:00'),(8,18,'25345678','2023-01-19 03:00:00'),(9,7,'28345678',NULL),(10,17,'22345678',NULL);
/*!40000 ALTER TABLE `distribucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacion` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_forma_pago` int NOT NULL,
  `fecha_facturacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `monto_total` double DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `fk_facturacion_pedido` (`id_pedido`),
  KEY `fk_facturacion_forma_pago` (`id_forma_pago`),
  CONSTRAINT `fk_facturacion_forma_pago` FOREIGN KEY (`id_forma_pago`) REFERENCES `forma_pago` (`id_forma_pago`),
  CONSTRAINT `fk_facturacion_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacion`
--

LOCK TABLES `facturacion` WRITE;
/*!40000 ALTER TABLE `facturacion` DISABLE KEYS */;
INSERT INTO `facturacion` VALUES (1,1,1,'2023-01-01 03:00:00',100),(2,2,2,'2023-01-02 03:00:00',200),(3,3,3,'2023-01-03 03:00:00',300),(4,4,1,'2023-01-04 03:00:00',150),(5,5,2,'2023-01-05 03:00:00',250),(6,6,3,'2023-01-06 03:00:00',350),(7,7,1,'2023-01-07 03:00:00',400),(8,8,2,'2023-01-08 03:00:00',500),(9,9,3,'2023-01-09 03:00:00',450),(10,10,1,'2023-01-10 03:00:00',600),(11,11,2,'2023-01-11 03:00:00',700),(12,12,3,'2023-01-12 03:00:00',800),(13,13,1,'2023-01-13 03:00:00',550),(14,14,2,'2023-01-14 03:00:00',900),(15,15,3,'2023-01-15 03:00:00',1000),(16,16,1,'2023-01-16 03:00:00',1100),(17,17,2,'2023-01-17 03:00:00',1200),(18,18,3,'2023-01-18 03:00:00',1300);
/*!40000 ALTER TABLE `facturacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago` (
  `id_forma_pago` int NOT NULL AUTO_INCREMENT,
  `descripcion_forma_pago` varchar(30) NOT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'Efectivo'),(2,'Tarjeta de Crédito'),(3,'Tarjeta de Débito'),(4,'Transferencia Bancaria');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete` (
  `id_paquete` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_tarifa` int NOT NULL,
  PRIMARY KEY (`id_paquete`),
  KEY `fk_paquete_pedido` (`id_pedido`),
  KEY `fk_paquete_tarifa` (`id_tarifa`),
  CONSTRAINT `fk_paquete_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `fk_paquete_tarifa` FOREIGN KEY (`id_tarifa`) REFERENCES `tarifa` (`id_tarifa`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,1),(5,5,2),(6,6,3),(7,7,1),(8,8,2),(9,9,3),(10,10,1),(11,11,2),(12,12,3),(13,13,1),(14,14,2),(15,15,3),(16,16,1),(17,17,2),(18,18,3);
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `estado` enum('EN SUCURSAL ORIGEN','EN PREPARACIÓN','EN TRANSPORTE','EN SUCURSAL DESTINO','EN DISTRIBUCION','EN SUCURSAL DESTINO PARA SER RETIRADO','ENTREGADO') NOT NULL DEFAULT 'EN PREPARACIÓN',
  `cantidad_paquetes` int NOT NULL,
  `dni_cliente` varchar(11) NOT NULL,
  `id_destinatario` int NOT NULL,
  `id_sucursal_origen` int NOT NULL,
  `id_sucursal_destino` int NOT NULL,
  `id_alcance` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_cliente` (`dni_cliente`),
  KEY `fk_pedido_destinatario` (`id_destinatario`),
  KEY `fk_pedido_sucursal_origen` (`id_sucursal_origen`),
  KEY `fk_pedido_sucursal_destino` (`id_sucursal_destino`),
  KEY `fk_pedido_alcance` (`id_alcance`),
  CONSTRAINT `fk_pedido_alcance` FOREIGN KEY (`id_alcance`) REFERENCES `alcance` (`id_alcance`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`dni_cliente`) REFERENCES `cliente` (`dni_cliente`),
  CONSTRAINT `fk_pedido_destinatario` FOREIGN KEY (`id_destinatario`) REFERENCES `destinatario` (`id_destinatario`),
  CONSTRAINT `fk_pedido_sucursal_destino` FOREIGN KEY (`id_sucursal_destino`) REFERENCES `sucursal` (`id_sucursal`),
  CONSTRAINT `fk_pedido_sucursal_origen` FOREIGN KEY (`id_sucursal_origen`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los datos del despacho del pedido';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'EN PREPARACIÓN',1,'30345678',1,1,2,2),(2,'EN PREPARACIÓN',2,'31345678',2,2,2,1),(3,'EN TRANSPORTE',3,'32345678',3,3,4,3),(4,'EN PREPARACIÓN',2,'39345678',1,2,1,2),(5,'EN SUCURSAL ORIGEN',1,'31345678',10,2,3,2),(6,'EN TRANSPORTE',3,'35345678',11,4,3,3),(7,'EN DISTRIBUCION',4,'43345678',4,4,5,3),(8,'ENTREGADO',5,'41345678',5,5,6,2),(9,'EN PREPARACIÓN',2,'39345678',14,1,2,2),(10,'EN SUCURSAL ORIGEN',1,'31345678',12,2,9,3),(11,'EN TRANSPORTE',3,'35345678',8,10,3,2),(12,'ENTREGADO',5,'41345678',11,6,5,2),(13,'EN SUCURSAL ORIGEN',1,'31345678',7,2,6,3),(14,'ENTREGADO',5,'41345678',12,9,8,2),(15,'EN TRANSPORTE',3,'35345678',1,1,1,1),(16,'EN PREPARACIÓN',2,'39345678',6,2,1,2),(17,'EN DISTRIBUCION',4,'43345678',9,4,8,2),(18,'ENTREGADO',5,'43345678',15,6,9,3);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` varchar(30) NOT NULL,
  `direccion_sucursal` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Sucursal Buenos Aires Centro','Avenida Corrientes 1234, Buenos Aires'),(2,'Sucursal Córdoba Centro','Calle 27 de Abril 567, Córdoba'),(3,'Sucursal Rosario','Avenida Pellegrini 891, Rosario'),(4,'Sucursal Mendoza','Calle San Martín 456, Mendoza'),(5,'Sucursal Tucumán','Avenida Mate de Luna 789, San Miguel de Tucumán'),(6,'Sucursal Salta','Calle Buenos Aires 321, Salta'),(7,'Sucursal La Plata','Avenida 7 456, La Plata'),(8,'Sucursal San Juan','Calle Rivadavia 654, San Juan'),(9,'Sucursal Neuquén','Avenida Argentina 987, Neuquén'),(10,'Sucursal Bahía Blanca','Calle Donado 123, Bahía Blanca');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifa`
--

DROP TABLE IF EXISTS `tarifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifa` (
  `id_tarifa` int NOT NULL AUTO_INCREMENT,
  `descripcion_tarifa` enum('CHICO','MEDIANO','GRANDE') NOT NULL,
  `peso_max` int NOT NULL,
  `dimensiones` varchar(30) NOT NULL,
  `costo` float DEFAULT NULL,
  PRIMARY KEY (`id_tarifa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra el costo del envio del paquete dependiendo de sus dimensiones y peso';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifa`
--

LOCK TABLES `tarifa` WRITE;
/*!40000 ALTER TABLE `tarifa` DISABLE KEYS */;
INSERT INTO `tarifa` VALUES (1,'CHICO',1,'30x30x30 cm',100),(2,'MEDIANO',5,'50x50x50 cm',250),(3,'GRANDE',10,'70x70x70 cm',400);
/*!40000 ALTER TABLE `tarifa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_detalle_pedido`
--

DROP TABLE IF EXISTS `vista_detalle_pedido`;
/*!50001 DROP VIEW IF EXISTS `vista_detalle_pedido`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalle_pedido` AS SELECT 
 1 AS `id_pedido`,
 1 AS `estado_pedido`,
 1 AS `fecha_despacho`,
 1 AS `fecha_recepcion`,
 1 AS `fecha_entrega`,
 1 AS `dni_cadete`,
 1 AS `nombre_cadete`,
 1 AS `apellido_cadete`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_facturacion_tipo_pago`
--

DROP TABLE IF EXISTS `vista_facturacion_tipo_pago`;
/*!50001 DROP VIEW IF EXISTS `vista_facturacion_tipo_pago`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_facturacion_tipo_pago` AS SELECT 
 1 AS `tipo_facturacion`,
 1 AS `cantidad_pedidos`,
 1 AS `monto_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pedidos_destinados_a_sucursal`
--

DROP TABLE IF EXISTS `vista_pedidos_destinados_a_sucursal`;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_destinados_a_sucursal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pedidos_destinados_a_sucursal` AS SELECT 
 1 AS `id_sucursal`,
 1 AS `Sucursal destino`,
 1 AS `cantidad_pedidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pedidos_por_sucursal`
--

DROP TABLE IF EXISTS `vista_pedidos_por_sucursal`;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_por_sucursal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pedidos_por_sucursal` AS SELECT 
 1 AS `Sucursal despacho`,
 1 AS `cantidad_pedidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'correo_db'
--

--
-- Dumping routines for database 'correo_db'
--
/*!50003 DROP FUNCTION IF EXISTS `TotalFacturado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalFacturado`(start_date DATE, end_date DATE) RETURNS double
    DETERMINISTIC
BEGIN
    DECLARE total_facturado DOUBLE;
    SELECT SUM(monto_total)
    INTO total_facturado
    FROM facturacion
    WHERE fecha_facturacion BETWEEN start_date AND end_date;
    RETURN total_facturado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TotalPedidosPorCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalPedidosPorCliente`(dni_cliente_in VARCHAR(11)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_pedidos INT;
    SELECT COUNT(*)
    INTO total_pedidos
    FROM pedido
    WHERE pedido.dni_cliente = dni_cliente_in;
    RETURN total_pedidos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarEstadoPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarEstadoPedido`(
    IN p_id_pedido INT,
    IN p_nuevo_estado ENUM('EN SUCURSAL ORIGEN', 'EN PREPARACIÓN', 'EN TRANSPORTE', 'EN SUCURSAL DESTINO', 'EN DISTRIBUCION', 'EN SUCURSAL DESTINO PARA SER RETIRADO', 'ENTREGADO')
)
BEGIN
    -- Actualizar el estado del pedido
    UPDATE pedido
    SET estado = p_nuevo_estado
    WHERE id_pedido = p_id_pedido;

    -- Registrar la fecha de actualización
    INSERT INTO actualizacion_estado_pedido (id_pedido, estado, fecha_actualizacion)
    VALUES (p_id_pedido, p_nuevo_estado, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerDetallePedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerDetallePedido`(
    IN p_id_pedido INT
)
BEGIN
    SELECT 
        pedido.id_pedido,
        pedido.estado,
        cliente.nombre_cliente,
        cliente.apellido_cliente,
        cliente.email_cliente,
        cliente.telefono_cliente,
        destinatario.nombre_destinatario,
        destinatario.apellido_destinatario,
        destinatario.telefono_destinatario,
        destinatario.direccion_destinatario,
        s_o.nombre_sucursal AS sucursal_origen,
        despacho.fecha_despacho,
		s_d.nombre_sucursal AS sucursal_destino,
        despacho.fecha_recepcion
    FROM 
        pedido
    LEFT JOIN cliente ON pedido.dni_cliente = cliente.dni_cliente
    LEFT JOIN destinatario ON pedido.id_destinatario = destinatario.id_destinatario
    LEFT JOIN sucursal s_o ON pedido.id_sucursal_origen = s_o.id_sucursal
    LEFT JOIN sucursal s_d ON pedido.id_sucursal_destino = s_d.id_sucursal
    LEFT JOIN despacho ON pedido.id_pedido = despacho.id_pedido
    WHERE 
        pedido.id_pedido = p_id_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_detalle_pedido`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalle_pedido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalle_pedido` AS select `p`.`id_pedido` AS `id_pedido`,`p`.`estado` AS `estado_pedido`,`d`.`fecha_despacho` AS `fecha_despacho`,`d`.`fecha_recepcion` AS `fecha_recepcion`,`dist`.`fecha_entrega` AS `fecha_entrega`,`c`.`dni_cadete` AS `dni_cadete`,`c`.`nombre_cadete` AS `nombre_cadete`,`c`.`apellido_cadete` AS `apellido_cadete` from (((`pedido` `p` left join `despacho` `d` on((`p`.`id_pedido` = `d`.`id_pedido`))) left join `distribucion` `dist` on((`p`.`id_pedido` = `dist`.`id_pedido`))) left join `cadete` `c` on((`dist`.`dni_cadete` = `c`.`dni_cadete`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_facturacion_tipo_pago`
--

/*!50001 DROP VIEW IF EXISTS `vista_facturacion_tipo_pago`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_facturacion_tipo_pago` AS select `fp`.`descripcion_forma_pago` AS `tipo_facturacion`,count(`f`.`id_factura`) AS `cantidad_pedidos`,sum(`f`.`monto_total`) AS `monto_total` from (`facturacion` `f` join `forma_pago` `fp` on((`f`.`id_forma_pago` = `fp`.`id_forma_pago`))) group by `fp`.`descripcion_forma_pago` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pedidos_destinados_a_sucursal`
--

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_destinados_a_sucursal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pedidos_destinados_a_sucursal` AS select `s`.`id_sucursal` AS `id_sucursal`,`s`.`nombre_sucursal` AS `Sucursal destino`,count(`p`.`id_pedido`) AS `cantidad_pedidos` from (`pedido` `p` join `sucursal` `s` on((`p`.`id_sucursal_destino` = `s`.`id_sucursal`))) group by `s`.`id_sucursal`,`s`.`nombre_sucursal` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pedidos_por_sucursal`
--

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_por_sucursal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pedidos_por_sucursal` AS select `s`.`nombre_sucursal` AS `Sucursal despacho`,count(`p`.`id_pedido`) AS `cantidad_pedidos` from (`pedido` `p` join `sucursal` `s` on((`p`.`id_sucursal_origen` = `s`.`id_sucursal`))) group by `s`.`id_sucursal`,`s`.`nombre_sucursal` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 18:30:30
