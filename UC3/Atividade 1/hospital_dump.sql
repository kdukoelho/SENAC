-- MySQL dump 10.13  Distrib 5.7.39, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas` (
  `id_consulta` int(11) NOT NULL,
  `id_convenio` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `datahorario_realizacao` datetime DEFAULT NULL,
  `valor_consulta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `id_convenio` (`id_convenio`),
  KEY `id_medico` (`id_medico`),
  KEY `id_paciente` (`id_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `convenios`
--

DROP TABLE IF EXISTS `convenios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `convenios` (
  `id_convenio` int(11) NOT NULL,
  `nome` varchar(25) DEFAULT NULL,
  `cnpj` char(14) DEFAULT NULL,
  `tempo_carencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_convenio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicos` (
  `id_medico` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `tipo` varchar(13) DEFAULT NULL,
  `especializacao` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(40) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `rg` varchar(9) DEFAULT NULL,
  `id_convenio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `id_convenio` (`id_convenio`),
  CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_convenio`) REFERENCES `convenios` (`id_convenio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-30 12:01:00
