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
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consultas`
--

create database if not exists hospital;

use hospital;

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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
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
  `tempo_carencia` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_convenio`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidades` (
  `id_especialidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome_especialidade` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
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
  `telefone` varchar(12) DEFAULT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
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
  `endereco` varchar(60) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `rg` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `id_convenio` (`id_convenio`),
  CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_convenio`) REFERENCES `convenios` (`id_convenio`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-18 16:36:44

use hospital;

insert into tipo_quarto values
('1', 'apartamento', '400'),
('2', 'quarto duplo', '200'),
('3', 'enfermaria', '500');

insert into convenios values
('1', 'Premiere', '34754566000120', '30 dias'),
('2', 'Portal', '75594567000132', '30 dias'),
('3', 'Lux', '34267202000116', '70 dias'),
('4', 'Genuíno', '63343672000110', '60 dias'),
('5', 'São Francisco', '86525836000125', '85 dias');

insert into especialidades values 
('1', 'pediatria'), ('2', 'gastroenterologia'), ('3', 'dermatologia'),
('4', 'clinica geral'), ('5', 'proctologia'), ('6', 'otorinolaringologia'), 
('7', 'endocrinologia');

use hospital;

insert into medicos values
(null, 'Carlos Figueiredo', '763254', 'RJ', 'residente', '1991-03-25', '2498114119', 'Rua Santa Maria, N 538, Industrial'),
(null, 'Veronica Silva', '543632', 'BA', 'especialista', '1980-05-08', '6024571274', 'Rua Treze, N 475, Bela Vista'),
(null, 'Juliana Sorbonne', '862957', 'RJ', 'especialista', '1990-08-22', '2174544119', 'Rua das Flores, N 109, Vila Nova'),
(null, 'Julio Castanha', '879546', 'DF', 'especialista', '1987-06-25', '6145216589', 'Rua Santos Dumont, N 875, São Francisco'),
(null, 'Tyron Henrique', '543678', 'RJ', 'especialista', '1988-05-24', '6185493265', 'Rua Pereira Estéfano, N 40, Vila da Saúde'),
(null, 'Fernando Ricardo', '587965', 'AM', 'especialista', '1990-07-20', '6215485236', 'Rua Cristiano Olsen, N 244, Jardim Sumaré'),
(null, 'Marcia Conceição', '543632', 'BA', 'especialista', '1988-07-18', '5047856953', 'Avenida São João, N 160, Vila Joana'),
(null, 'Gustavo Watson', '879524', 'DF', 'especialista', '1982-05-12', '6145234587', 'Rua Raposo Tavares, N 15, Centro'),
(null, 'Marco Antonio', '458637', 'RJ', 'generalista', '1960-08-07', '2458793265', 'Rua Arlindo Nogueira, N 64, Lageadinho'),
(null, 'Yan Toledo', '485789', 'RJ', 'generalista', '1985-08-24', '2487956324', 'Rua Pereira Estéfano, N 70, Aldeota');

insert into medico_has_especialidade values
('1', '1'), ('2', '1'), ('3', '5'), ('4', '2'), ('5', '6'), ('6', '4'), ('7', '7'), ('8', '3');

insert into pacientes values
(null,	'3', 'Tereza Laís das Neves', '1968-02-25', 'Rua P, N°773, Setor São Sebastião', '62994989341', 'tereza_dasneves@maxilajes.com.br', '03103696060', '149151500'),
(null,	'3', 'Nina Sophie Renata Galvão', '1995-05-17',	'Rua B, N°571, Zona de Expansão (Aruana)',	'79995646520',	'nina_galvao@bodyfast.com.br',	'18561986930', '368031263'),
(null,	'5', 'José Geraldo João Rodrigues', '1946-08-20', 'Rua Farol de Natal, N°406, Mãe Luiza', '84981548568', 'jose-rodrigues91@teravida.com.br', '83566578223', '375629294'),
(null,	'3', 'Raquel Sarah Ferreira', '1942-07-10',	'Rua Girassol, N°436, Mapim', '65998331011', 'raquel-ferreira77@tafeta.com.br',	'46635853880', '320862513'),
(null,	'5', 'Clara Luna Analu Pereira', '1967-10-13', 'Travessa Somália, N°206, Serraria',	'11991983878', 'clara.luna.pereira@metroquali.com.br', '93033701809', '453592065'),
(null,	'2','Roberto Anderson Melo', '1979-04-19',' Alameda dos Girassóis, N°723, Pricumã',	'95998176015', 'roberto_anderson_melo@mailinator.com', '22399059050', '390285158'),
(null,	'2', 'Juliana Pietra Mariana Pires', '1972-08-12', 'Rua Água Marinha, N°810, Fragoso', '81986485902', 'juliana_pietra_pires@candello.abv.br', '22940792216', '346729725'),
(null,	'3', 'Aurora Silvana Nascimento', '1963-06-16', 'Rua Francisco Edvaldo de Lima, N°961, Santo Antônio', '84993132550', 'aurorasilvananascimento@hubersuhner.com', '22337023362', '299337455'),
(null,	'4', 'Alícia Teresinha Almada', '1952-03-23', 'Alameda Padre Braz Lourenço, N°560, Alphaville Jacuhy', '27994992765', 'alicia-almada75@lonza.com', '57825350839', '384050967'),
(null,	'5', 'Roberto Igor Martins', '1952-09-27', 'Rua W4, N°734, Setor Itatiaia', '63989866644', 'roberto.igor.martins@otimatransportes.com', '55258832287', '368300675'),
(null,	'3', 'Isabelle Cecília da Silva','1968-07-15', 'Rua Adálio Lavinski, N°179, Loteamento Florais da Amazônia', '66999939888', 'isabellececiliadasilva@nelsoncosta.com.br', '29566275030', '354789508'),
(null,	'4', 'Jorge Murilo Santos', '1964-06-25', 'Rua Uruvalheira, N°931, Novo Mundo', '65986981295', 'jorge-santos90@daou.com.br', '01433458934', '348235008'),
(null,	'3', 'Roberto Igor Martins', '1952-09-27', 'Rua W4, N°734, Setor Itatiaia', '63989866644', 'roberto.igor.martins@otimatransportes.com', '55258832287', '368300675'),
(null,	'5', 'Ian Antonio Teixeira', '1990-04-25', 'Rua Manoel Tenório Cavalcante, N°339, Clima Bom', '82986947616', 'ian-teixeira71@termaqui.com.br', '76137127109', '239431595'),
(null, '5','Daniel Caio Guilherme Teixeira', '1999-05-05', 'Avenida dos Arrecifes 1571, N°487, Centro', '84997872855', 'daniel.caio.teixeira@equipavmineracao.com.br', '86858825916', '347845125');

insert into consultas values
(null, '6', '8', '3', '2', '2015-01-01 15:30:00', '450'),
(null, '3', '4', '2', '5', '2018-05-04 09:30:00', '500'),
(null, '7', '2', '1', '2', '2019-07-16 07:40:00', '300'),
(null, '12', '3', '5', '4', '2017-12-23 17:20:00', '400'),
(null, '11', '8', '3', '3', '2020-10-13 14:50:00', '350'),
(null, '9', '5', '6', '4', '2021-03-27 11:00:00', '480'),
(null, '8', '10', '3', '3', '2022-01-01 14:00:00', '540'),
(null, '2', '9', '2', '3', '2021-07-16 15:30:00', '600'),
(null, '4', '7', '7', '3', '2019-09-25 17:00:00', '780'),
(null, '10', '3', '5', '5', '2016-02-04 16:30:00', '400'),
(null, '14', '2', '1', '5', '2021-11-12 14:20:00', '380'),
(null, '1', '4', '2', '3', '2019-03-04 13:00:00', '800'),
(null, '5', '5', '6', '5', '2018-04-24 10:30:00', '720'),
(null, '15', '7', '7', '5', '2017-07-21 09:20:00', '440'),
(null, '13', '6', '4', '3', '2015-08-14 08:30:00', '600'),
(null, '12', '4', '2', '4', '2016-07-13 09:00:00', '740'),
(null, '5', '7', '7', '5', '2019-06-11 13:30:00', '750'),
(null, '3', '10', '5', '5', '2020-07-17 14:20:00', '900'),
(null, '12', '2', '1', '4', '2021-08-04 17:40:00', '880'),
(null, '4', '8', '3', '3', '2016-07-22 13:50:00', '500');

insert into receitas values
(null, '2', 'alprazolam - alprostadil', '0,25mg - 500μg/mL', ''),
(null, '5', 'aminofilina - amoxicilina', '24 mg/ml - 400mg/5ml', ''),
(null, '6', 'anastrozol - apixabana', '1mg - 5mg', ''),
(null, '8', 'bortezomibe - bilastina', '1mg - 20mg', ''),
(null, '1', 'estradiol - nimesulida', '1mg - 50mg/mL', ''),
(null, '9', 'oxamniquina - codeína ', '25mg - 3mg/mL', ''),
(null, '4', 'droperidol - ebastina', '2,5mg/mL - 1mg/mL', ''),
(null, '13', 'paracetamol - permetrina', '10 mg/mL - 10mg/g', ''),
(null, '11', 'policresuleno - ramelteona', '18mg/g - 8mg', ''),
(null, '15', 'risperidona - danazol', '3,0mg - 200mg', ''),
(null, '7', 'clobazam - clozapina', '10mg - 100mg', '');

insert into quartos values
('1', '1', '101'),
('2', '1', '102'),
('3', '2', '103'),
('4', '3', '104');

insert into enfermeiros values
(null, 'Vitória Isabela Nina Nascimento', '59942822518', '584965'),
(null, 'Rodrigo Marcos Marcos Vinicius da Mata', '56605582756', '245784'),
(null, 'Leonardo Luiz Novaes', '09277043075', '256327'),
(null, 'Simone Ana Rezende', '23059434409', '297586'),
(null, 'Gabrielly Milena Rocha', '61126902179', '635487'),
(null, 'Cecília Adriana Aline Moura', '61379568307', '619876'),
(null, 'Bárbara Natália Galvão', '86730799773', '364198'),
(null, 'Fernando Ryan Nicolas da Cunha', '88783129839', '782458'),
(null, 'Cauê Gael Davi da Cruz', '24821627426', '329865'),
(null, 'Cláudia Heloisa Viana', '19689174037', '201457');

insert into internacao values
(null, '5', '1', '4', '2020-05-01', '2020-06-1', '2020-05-25', ''),
(null, '7', '2', '4', '2020-12-22', '2021-01-29', '2021-02-02', ''),
(null, '5', '4', '5', '2019-07-18', '2019-09-18', '2019-09-20', ''),
(null, '9', '3', '5', '2015-01-25', '2015-02-20', '2015-02-10', ''),
(null, '10', '2', '15', '2021-12-13', '2022-01-01', '2021-12-25', ''),
(null, '3', '2', '11', '2017-08-15', '2017-09-15', '2017-09-15', ''),
(null, '8', '4', '9', '2016-07-01', '2016-08-01', '2016-07-25', '');

insert into internacao_has_enfermeiros values
('1', '1'), ('1', '4'),
('2', '3'), ('2', '5'),
('3', '5'), ('3', '6'),
('4', '7'), ('4', '2'),
('5', '10'), ('5', '3'),
('6', '2'), ('6', '5'),
('7', '4'), ('7', '6');

use hospital;
alter table medicos
add column isAtivo_bool tinyint after id_medico;

update medicos
set isAtivo_bool = 1  where id_medico > 0;

update medicos
set isAtivo_bool = 0 where id_medico < 9 and id_medico > 2;

use hospital;

update internacao
set data_alta = (date_add(data_alta, interval 3 day)) 
where id_quarto_ocupado = (select id_quarto from quartos where id_tipo_quarto = 3);

use hospital;

set foreign_key_checks = 0;

delete from consultas
where id_convenio = (select max(id_convenio) from convenios);

delete from convenios
where id_convenio = (select idc from (select max(id_convenio) as idc from convenios) as c);

set foreign_key_checks = 1;