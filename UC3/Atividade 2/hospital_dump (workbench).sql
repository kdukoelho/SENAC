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
  `id_consulta` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_especialidade` int(11) NOT NULL,
  `id_convenio` int(11) NOT NULL,
  `datahorario_realizacao` datetime DEFAULT NULL,
  `valor_consulta` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medico` (`id_medico`),
  KEY `id_especialidade` (`id_especialidade`),
  KEY `id_convenio` (`id_convenio`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  CONSTRAINT `consultas_ibfk_3` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidades` (`id_especialidade`),
  CONSTRAINT `consultas_ibfk_4` FOREIGN KEY (`id_convenio`) REFERENCES `convenios` (`id_convenio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `convenios`
--

DROP TABLE IF EXISTS `convenios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `convenios` (
  `id_convenio` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cnpj` char(14) DEFAULT NULL,
  `tempo_carencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_convenio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enfermeiros`
--

DROP TABLE IF EXISTS `enfermeiros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermeiros` (
  `id_enfermeiro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `cre` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id_enfermeiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidades` (
  `id_especialidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome_especialide` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `internacao`
--

DROP TABLE IF EXISTS `internacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internacao` (
  `id_internacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_medico` int(11) NOT NULL,
  `id_quarto_ocupado` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `data_entrada` datetime DEFAULT NULL,
  `data_prev_alta` datetime DEFAULT NULL,
  `data_alta` datetime DEFAULT NULL,
  `procedimento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_internacao`),
  KEY `id_medico` (`id_medico`),
  KEY `id_quarto_ocupado` (`id_quarto_ocupado`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `internacao_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  CONSTRAINT `internacao_ibfk_2` FOREIGN KEY (`id_quarto_ocupado`) REFERENCES `quartos` (`id_quarto`),
  CONSTRAINT `internacao_ibfk_3` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `internacao_has_enfermeiros`
--

DROP TABLE IF EXISTS `internacao_has_enfermeiros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internacao_has_enfermeiros` (
  `id_internacao` int(11) NOT NULL,
  `id_enfermeiro` int(11) NOT NULL,
  KEY `id_internacao` (`id_internacao`),
  KEY `id_enfermeiro` (`id_enfermeiro`),
  CONSTRAINT `internacao_has_enfermeiros_ibfk_1` FOREIGN KEY (`id_internacao`) REFERENCES `internacao` (`id_internacao`),
  CONSTRAINT `internacao_has_enfermeiros_ibfk_2` FOREIGN KEY (`id_enfermeiro`) REFERENCES `enfermeiros` (`id_enfermeiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medico_has_especialidade`
--

DROP TABLE IF EXISTS `medico_has_especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico_has_especialidade` (
  `id_medico` int(11) NOT NULL,
  `id_especialidade` int(11) NOT NULL,
  KEY `id_medico` (`id_medico`),
  KEY `id_especialidade` (`id_especialidade`),
  CONSTRAINT `medico_has_especialidade_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  CONSTRAINT `medico_has_especialidade_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidades` (`id_especialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicos` (
  `id_medico` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `crm` varchar(6) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `tipo` varchar(25) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(30) DEFAULT NULL,
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
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `id_convenio` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `rg` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `id_convenio` (`id_convenio`),
  CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_convenio`) REFERENCES `convenios` (`id_convenio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quartos`
--

DROP TABLE IF EXISTS `quartos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartos` (
  `id_quarto` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_quarto` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_quarto`),
  KEY `id_tipo_quarto` (`id_tipo_quarto`),
  CONSTRAINT `quartos_ibfk_1` FOREIGN KEY (`id_tipo_quarto`) REFERENCES `tipo_quarto` (`id_tipo_quarto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `receitas`
--

DROP TABLE IF EXISTS `receitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receitas` (
  `id_receita` int(11) NOT NULL AUTO_INCREMENT,
  `id_consulta` int(11) NOT NULL,
  `medicamentos` varchar(30) DEFAULT NULL,
  `quatidade` varchar(30) DEFAULT NULL,
  `instrucoes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_receita`),
  KEY `id_consulta` (`id_consulta`),
  CONSTRAINT `receitas_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id_consulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_quarto`
--

DROP TABLE IF EXISTS `tipo_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_quarto` (
  `id_tipo_quarto` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `valor_diaria` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_quarto`)
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

-- Dump completed on 2022-10-10 12:35:50
