-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: mysql-3b5d1ac9-estudante-6967.h.aivencloud.com    Database: hp
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
f36a4465-4ef7-11f1-bb93-9adca175be54:1-152';

--
-- Table structure for table `Consultas`
--

DROP TABLE IF EXISTS `Consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Consultas` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `id_medico` int NOT NULL,
  `data_consulta` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `Consultas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `Pacientes` (`id_paciente`),
  CONSTRAINT `Consultas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `Medicos` (`id_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consultas`
--

/*!40000 ALTER TABLE `Consultas` DISABLE KEYS */;
INSERT INTO `Consultas` VALUES (1,1,1,'2026-01-10',150.00),(2,1,1,'2026-02-15',200.00),(3,2,1,'2026-01-12',120.00),(4,3,2,'2026-03-01',350.00),(5,2,1,'2026-03-05',120.00),(6,4,1,'2026-04-18',250.00),(7,1,1,'2026-05-20',180.00),(8,3,3,'2026-05-21',150.00);
/*!40000 ALTER TABLE `Consultas` ENABLE KEYS */;

--
-- Table structure for table `Especialidades`
--

DROP TABLE IF EXISTS `Especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Especialidades` (
  `id_especialidade` int NOT NULL AUTO_INCREMENT,
  `nome_especialidade` varchar(100) NOT NULL,
  PRIMARY KEY (`id_especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Especialidades`
--

/*!40000 ALTER TABLE `Especialidades` DISABLE KEYS */;
INSERT INTO `Especialidades` VALUES (1,'Cardiologia'),(2,'Pediatria'),(3,'Clínica Geral');
/*!40000 ALTER TABLE `Especialidades` ENABLE KEYS */;

--
-- Table structure for table `Medicos`
--

DROP TABLE IF EXISTS `Medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medicos` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(50) NOT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicos`
--

/*!40000 ALTER TABLE `Medicos` DISABLE KEYS */;
INSERT INTO `Medicos` VALUES (1,'Dr. Silva','Cardiologia'),(2,'Dra. Maria','Pediatria'),(3,'Dr. Roberto','Clínica Geral');
/*!40000 ALTER TABLE `Medicos` ENABLE KEYS */;

--
-- Table structure for table `Pacientes`
--

DROP TABLE IF EXISTS `Pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pacientes` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pacientes`
--

/*!40000 ALTER TABLE `Pacientes` DISABLE KEYS */;
INSERT INTO `Pacientes` VALUES (1,'Carlos Souza','1985-05-12'),(2,'Ana Costa','1990-08-22'),(3,'Bruno Lima','2015-03-10'),(4,'Mariana Dias','1978-11-04');
/*!40000 ALTER TABLE `Pacientes` ENABLE KEYS */;

--
-- Dumping routines for database 'hp'
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

-- Dump completed on 2026-06-08 15:59:36
