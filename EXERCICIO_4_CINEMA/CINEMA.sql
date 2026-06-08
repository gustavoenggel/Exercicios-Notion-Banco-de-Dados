-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: mysql-3b5d1ac9-estudante-6967.h.aivencloud.com    Database: CINEMA
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '463d605f-4975-11f1-8c2f-4a8fe49bcad8:1-22,
50a92288-3e7c-11f1-8f51-12c8edea3e45:1-81,
8aba6b95-43f7-11f1-b623-c27412d3c505:1-86,
f36a4465-4ef7-11f1-bb93-9adca175be54:1-147';

--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIA` (
  `ID_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `DESCRISAO_CAT` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA`
--

/*!40000 ALTER TABLE `CATEGORIA` DISABLE KEYS */;
INSERT INTO `CATEGORIA` VALUES (1,'Ação'),(2,'Comédia'),(3,'Ficção Científica'),(4,'Terror'),(5,'Animação'),(6,'Ação'),(7,'Comédia'),(8,'Ficção Científica'),(9,'Terror'),(10,'Animação'),(11,'Ação'),(12,'Comédia'),(13,'Ficção Científica'),(14,'Terror'),(15,'Animação');
/*!40000 ALTER TABLE `CATEGORIA` ENABLE KEYS */;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTE` (
  `ID_CLIENTE` int NOT NULL AUTO_INCREMENT,
  `NOME_CLIENTE` varchar(100) NOT NULL,
  `CPF_CLIENTE` varchar(15) NOT NULL,
  `EMAIL_CLIENTE` varchar(30) NOT NULL,
  `STATUS_CLIENTE` enum('ATIVO','INATIVO') DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  UNIQUE KEY `CPF_CLIENTE` (`CPF_CLIENTE`),
  UNIQUE KEY `EMAIL_CLIENTE` (`EMAIL_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
INSERT INTO `CLIENTE` VALUES (1,'Ana Souza','11122233344','ana.souza@email.com','ATIVO'),(2,'Carlos Pereira','55566677788','carlos.p@email.com','ATIVO'),(3,'Mariana Lima','99988877766','mari.lima@email.com','INATIVO'),(4,'Roberto Alves','44433322211','roberto.a@email.com','ATIVO');
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;

--
-- Table structure for table `FILME`
--

DROP TABLE IF EXISTS `FILME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FILME` (
  `ID_FILME` int NOT NULL AUTO_INCREMENT,
  `NOME_FILME` varchar(100) NOT NULL,
  `FAIXA_ETARIA` int DEFAULT NULL,
  `DURACAO_FILME` int NOT NULL,
  `STATUS_FILME` enum('EM CARTAZ','FORA CARTAZ') DEFAULT NULL,
  `ID_CATEGORIA_FILME` int NOT NULL,
  PRIMARY KEY (`ID_FILME`),
  KEY `ID_CATEGORIA_FILME` (`ID_CATEGORIA_FILME`),
  CONSTRAINT `FILME_ibfk_1` FOREIGN KEY (`ID_CATEGORIA_FILME`) REFERENCES `CATEGORIA` (`ID_CATEGORIA`),
  CONSTRAINT `FILME_chk_1` CHECK ((`FAIXA_ETARIA` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILME`
--

/*!40000 ALTER TABLE `FILME` DISABLE KEYS */;
INSERT INTO `FILME` VALUES (1,'O Resgate Galáctico',12,135,'EM CARTAZ',3),(2,'Risadas Perigosas',14,105,'EM CARTAZ',2),(3,'A Entidade Obscura',16,120,'FORA CARTAZ',4),(4,'Heróis de Aço',10,150,'EM CARTAZ',1),(5,'Aventuras do Cachorrinho',0,95,'EM CARTAZ',5);
/*!40000 ALTER TABLE `FILME` ENABLE KEYS */;

--
-- Table structure for table `INGRESSO`
--

DROP TABLE IF EXISTS `INGRESSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INGRESSO` (
  `ID_INGRESSO` int NOT NULL AUTO_INCREMENT,
  `ID_PEDIDO` int NOT NULL,
  `ID_SESSAO` int NOT NULL,
  `ID_TIPO_INGRESSO` int NOT NULL,
  `VALOR_PAGO` decimal(5,2) NOT NULL,
  `STATUS_INGRESSO` enum('RESERVADO','PAGO','CANCELADO') DEFAULT 'RESERVADO',
  PRIMARY KEY (`ID_INGRESSO`),
  KEY `ID_PEDIDO` (`ID_PEDIDO`),
  KEY `ID_SESSAO` (`ID_SESSAO`),
  KEY `ID_TIPO_INGRESSO` (`ID_TIPO_INGRESSO`),
  CONSTRAINT `INGRESSO_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `PEDIDO` (`id_pedido`),
  CONSTRAINT `INGRESSO_ibfk_2` FOREIGN KEY (`ID_SESSAO`) REFERENCES `SESSAO` (`ID_SESSAO`),
  CONSTRAINT `INGRESSO_ibfk_3` FOREIGN KEY (`ID_TIPO_INGRESSO`) REFERENCES `TIPO_INGRESSO` (`ID_TIPO_INGRESSO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INGRESSO`
--

/*!40000 ALTER TABLE `INGRESSO` DISABLE KEYS */;
INSERT INTO `INGRESSO` VALUES (1,1,2,5,70.00,'PAGO'),(2,1,2,5,70.00,'PAGO'),(3,2,1,4,24.00,'RESERVADO'),(4,2,1,3,48.00,'RESERVADO'),(5,3,4,1,40.00,'PAGO');
/*!40000 ALTER TABLE `INGRESSO` ENABLE KEYS */;

--
-- Table structure for table `PEDIDO`
--

DROP TABLE IF EXISTS `PEDIDO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PEDIDO` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `data_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `ID_CLIENTE` int DEFAULT NULL,
  `status_pedido` enum('aberto','pago','cancelado') DEFAULT 'aberto',
  PRIMARY KEY (`id_pedido`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`),
  CONSTRAINT `PEDIDO_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `CLIENTE` (`ID_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEDIDO`
--

/*!40000 ALTER TABLE `PEDIDO` DISABLE KEYS */;
INSERT INTO `PEDIDO` VALUES (1,'2026-05-08 10:15:00',1,'pago'),(2,'2026-05-09 14:20:00',2,'aberto'),(3,'2026-03-30 19:45:00',4,'pago');
/*!40000 ALTER TABLE `PEDIDO` ENABLE KEYS */;

--
-- Table structure for table `SALA`
--

DROP TABLE IF EXISTS `SALA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALA` (
  `ID_SALA` int NOT NULL AUTO_INCREMENT,
  `DESCRISAO_SALA` text NOT NULL,
  `TIPO_SALA` enum('2D','3D','IMAX') DEFAULT '2D',
  `CAPACIDADE_SALA` int NOT NULL,
  `VIP_SALA` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_SALA`),
  CONSTRAINT `SALA_chk_1` CHECK ((`CAPACIDADE_SALA` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALA`
--

/*!40000 ALTER TABLE `SALA` DISABLE KEYS */;
INSERT INTO `SALA` VALUES (1,'Sala 1 - Standard','2D',120,0),(2,'Sala 2 - Família','3D',100,0),(3,'Sala 3 - Premium','IMAX',80,1),(4,'Sala 4 - Standard','2D',150,0);
/*!40000 ALTER TABLE `SALA` ENABLE KEYS */;

--
-- Table structure for table `SESSAO`
--

DROP TABLE IF EXISTS `SESSAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SESSAO` (
  `ID_SESSAO` int NOT NULL AUTO_INCREMENT,
  `DATA_HORA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_SALA` int NOT NULL,
  `ID_FILME` int NOT NULL,
  `STATUS_SESSAO` enum('ABERTA','ENCERRADA','CANCELADA') DEFAULT 'ABERTA',
  PRIMARY KEY (`ID_SESSAO`),
  UNIQUE KEY `DATA_HORA` (`DATA_HORA`,`ID_SALA`),
  KEY `ID_SALA` (`ID_SALA`),
  KEY `ID_FILME` (`ID_FILME`),
  CONSTRAINT `SESSAO_ibfk_1` FOREIGN KEY (`ID_SALA`) REFERENCES `SALA` (`ID_SALA`),
  CONSTRAINT `SESSAO_ibfk_2` FOREIGN KEY (`ID_FILME`) REFERENCES `FILME` (`ID_FILME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SESSAO`
--

/*!40000 ALTER TABLE `SESSAO` DISABLE KEYS */;
INSERT INTO `SESSAO` VALUES (1,'2026-05-10 14:00:00',2,5,'ABERTA'),(2,'2026-05-10 18:30:00',3,1,'ABERTA'),(3,'2026-05-10 21:00:00',1,4,'ABERTA'),(4,'2026-04-01 20:00:00',4,3,'ENCERRADA');
/*!40000 ALTER TABLE `SESSAO` ENABLE KEYS */;

--
-- Table structure for table `TIPO_INGRESSO`
--

DROP TABLE IF EXISTS `TIPO_INGRESSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TIPO_INGRESSO` (
  `ID_TIPO_INGRESSO` int NOT NULL AUTO_INCREMENT,
  `DESCRISAO_INGRESSO` varchar(50) NOT NULL,
  `valor_ingresso` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ID_TIPO_INGRESSO`),
  CONSTRAINT `TIPO_INGRESSO_chk_1` CHECK ((`valor_ingresso` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPO_INGRESSO`
--

/*!40000 ALTER TABLE `TIPO_INGRESSO` DISABLE KEYS */;
INSERT INTO `TIPO_INGRESSO` VALUES (1,'Inteira - 2D',40.00),(2,'Meia - 2D',20.00),(3,'Inteira - 3D',48.00),(4,'Meia - 3D',24.00),(5,'Inteira - IMAX VIP',70.00);
/*!40000 ALTER TABLE `TIPO_INGRESSO` ENABLE KEYS */;

--
-- Dumping routines for database 'CINEMA'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-08 15:15:45
