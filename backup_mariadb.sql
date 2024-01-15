-- MariaDB dump 10.19-11.2.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mademoiselle_borges
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `BestSellersEmployee`
--

DROP TABLE IF EXISTS `BestSellersEmployee`;
/*!50001 DROP VIEW IF EXISTS `BestSellersEmployee`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `BestSellersEmployee` AS SELECT
 1 AS `EventID`,
  1 AS `EmployeeID`,
  1 AS `Quantity` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `DailySales`
--

DROP TABLE IF EXISTS `DailySales`;
/*!50001 DROP VIEW IF EXISTS `DailySales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `DailySales` AS SELECT
 1 AS `DateOfSale`,
  1 AS `TotalValue`,
  1 AS `TotalQuantity` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EmployeeID` varchar(10) NOT NULL,
  `EmployeeName` varchar(75) NOT NULL,
  `EmployeeVAT` varchar(9) NOT NULL,
  `EmployeeBirthDate` date NOT NULL,
  `Street` varchar(50) NOT NULL,
  `Locale` varchar(30) NOT NULL,
  `PostalCode` varchar(15) NOT NULL,
  `EmployeeID_e` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeeVAT` (`EmployeeVAT`),
  KEY `EmployeeID_e` (`EmployeeID_e`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`EmployeeID_e`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES
('ADMIN00001','Henrique Borges','382923812','1968-12-24','Rua do blah','Eventopolis','1111-111',NULL),
('ADMIN00002','Maria Ivanovna Ivanova','129293919','1999-04-13','Rua do blah','Eventopolis','1111-111',NULL),
('ADMIN00003','Herr Otto Mustermann','198263843','2002-07-19','Rua do blah','Eventopolis','1111-111',NULL),
('JANIT00001','Jacinto Ivanovich','192382742','1979-04-13','Rua do blah','Eventopolis','1111-111',NULL),
('JANIT00002','Jacinto Ivanovich Sr','192382743','1959-04-13','Rua do blah','Eventopolis','1111-111','JANIT00001'),
('JANIT00003','Jacinto Ivanovich Jr','192382744','1999-04-13','Rua do blah','Eventopolis','1111-111','JANIT00001'),
('JANIT00004','Aknostr Grust Hings','666666666','1996-01-29','Trilho da Bananeira','Hsombra','1169-111','JANIT00001'),
('MARKT00001','Miguel Mata Migalhas','999999999','1974-04-25','Avenida dos Vampiros','Eventopolis','5555-555',NULL),
('MARKT00002','Ruis Luis','444444444','2004-04-04','Rua da Praça Proibida','Lon Gedaki','4444-444','MARKT00001'),
('MARKT00003','Bernardo Fernado Ferrari','888888888','1988-08-15','Rua da Boa Corrida','Eventopolis','8888-111','MARKT00001'),
('MARKT00004','Yuppi May Catrindottir Alavason','101010101','2000-11-11','Rua Doutor Felis Felizardo Felisberto','Eventopolis','1010-101','MARKT00001'),
('SALES00001','Artur Doffensmirtz','333333333','1979-03-03','Rua do Ornitorrinco','Eventopolis','1111-132','MARKT00002'),
('SALES00002','Benilde Portas de Madeira','222222222','1970-02-22','Rua do Centro nº1, 5B','Eventopolis','1111-221','SALES00001'),
('SALES00003','Ines Luis Grust Hings','666666661','1996-01-11','TRilho da Bananeira','Hsombra','1169-111','SALES00001'),
('SECUR00001','José Carlos Malandro','111111111','2000-11-11','Rua do Centro nº1, 5A','Eventopolis','1111-221',NULL),
('SECUR00002','Alice Grande Pequena','777777777','1968-07-21','Travessa da Lua','Ham Strong City','7777-221','SECUR00001');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeEmail`
--

DROP TABLE IF EXISTS `EmployeeEmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmployeeEmail` (
  `EmployeeID_eem` varchar(10) NOT NULL,
  `Email` varchar(75) NOT NULL,
  PRIMARY KEY (`EmployeeID_eem`),
  UNIQUE KEY `Email` (`Email`),
  CONSTRAINT `EmployeeEmail_ibfk_1` FOREIGN KEY (`EmployeeID_eem`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeEmail`
--

LOCK TABLES `EmployeeEmail` WRITE;
/*!40000 ALTER TABLE `EmployeeEmail` DISABLE KEYS */;
INSERT INTO `EmployeeEmail` VALUES
('JANIT00004','agh@jacinto.et'),
('SECUR00002','agp@secur.et'),
('MARKT00003','bff@mar.et'),
('SALES00002','bpm@sal.et'),
('SALES00001','doff@krr.et'),
('ADMIN00001','henriquinho@borges.et'),
('ADMIN00003','herr@motto.et'),
('SALES00003','ilu@sal.et'),
('SECUR00001','jcm@secur.et'),
('JANIT00003','jr@jacinto.et'),
('MARKT00001','mimami@mar.et'),
('ADMIN00002','miva2@iva.et'),
('JANIT00001','orig@jacinto.et'),
('JANIT00002','sen@jacinto.et'),
('MARKT00002','uiui@mar.et'),
('MARKT00004','ymca@mar.et');
/*!40000 ALTER TABLE `EmployeeEmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeePhone`
--

DROP TABLE IF EXISTS `EmployeePhone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmployeePhone` (
  `EmployeeID_ep` varchar(10) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  PRIMARY KEY (`EmployeeID_ep`),
  UNIQUE KEY `Phone` (`Phone`),
  CONSTRAINT `EmployeePhone_ibfk_1` FOREIGN KEY (`EmployeeID_ep`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeePhone`
--

LOCK TABLES `EmployeePhone` WRITE;
/*!40000 ALTER TABLE `EmployeePhone` DISABLE KEYS */;
INSERT INTO `EmployeePhone` VALUES
('SALES00002','+10101101010'),
('ADMIN00001','+1111111111'),
('SECUR00001','+20202022020'),
('ADMIN00002','+2222222222'),
('JANIT00004','+303033030303'),
('ADMIN00003','+33333333333'),
('SECUR00002','+40404044404'),
('JANIT00001','+4444444444'),
('MARKT00003','+5050505050'),
('JANIT00002','+555553555'),
('SALES00003','+6060660606'),
('JANIT00003','+6666666666'),
('MARKT00004','+707707700707'),
('MARKT00001','+7777777777'),
('MARKT00002','+8888888888'),
('SALES00001','+9999999999');
/*!40000 ALTER TABLE `EmployeePhone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `EmployeeSales`
--

DROP TABLE IF EXISTS `EmployeeSales`;
/*!50001 DROP VIEW IF EXISTS `EmployeeSales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `EmployeeSales` AS SELECT
 1 AS `EmployeeID_s`,
  1 AS `ReceiptNO` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `EventCal`
--

DROP TABLE IF EXISTS `EventCal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventCal` (
  `EventID` int(11) NOT NULL AUTO_INCREMENT,
  `EventName` varchar(75) NOT NULL,
  `EventDescription` text NOT NULL,
  `EventStart` datetime NOT NULL,
  `EventEnd` datetime NOT NULL,
  `Capacity` int(11) NOT NULL,
  PRIMARY KEY (`EventID`),
  UNIQUE KEY `EventName` (`EventName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventCal`
--

LOCK TABLES `EventCal` WRITE;
/*!40000 ALTER TABLE `EventCal` DISABLE KEYS */;
INSERT INTO `EventCal` VALUES
(1,'Christmas Booksale - Mademoiselle Borges','Discover a world of literary wonders at our Christmas Booksale, in honor of the memory of Lady Borges','2023-12-19 15:30:00','2024-01-02 01:59:59',0),
(2,'Sueca Tournament','Tournament of a famous card game called \'Sueca\'','2024-02-02 21:30:00','2024-02-04 15:00:00',50),
(3,'Theater Piece: \'The Hidden Madame\'','Attend a lively and entertainign theater performance about the Trust Issues of a certain Madame','2023-12-15 18:30:00','2023-12-15 20:30:00',150),
(4,'Festive Procession de Sao Celestino de Rabo de Peixe','Religious Festivity','2024-02-05 15:00:00','2024-02-06 19:30:00',150),
(5,'Puppet Show: \'Red Ridding Hood\'','Delight in a colourful puppet performance that will captivate both children and adults alike, bringing imaginative stories to life','2024-02-07 13:30:00','2024-02-07 20:30:00',40),
(6,'Arts and Crafts Fair','Explore local arts and crafts, where families can discover unique handmade creations and participate in creative workshops','2024-02-08 13:00:00','2024-02-09 20:30:00',80);
/*!40000 ALTER TABLE `EventCal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventEmployee`
--

DROP TABLE IF EXISTS `EventEmployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventEmployee` (
  `EventID_ee` int(11) NOT NULL,
  `EmployeeID_ee` varchar(10) NOT NULL,
  PRIMARY KEY (`EventID_ee`,`EmployeeID_ee`),
  KEY `EmployeeID_ee` (`EmployeeID_ee`),
  CONSTRAINT `EventEmployee_ibfk_1` FOREIGN KEY (`EventID_ee`) REFERENCES `EventCal` (`EventID`),
  CONSTRAINT `EventEmployee_ibfk_2` FOREIGN KEY (`EmployeeID_ee`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventEmployee`
--

LOCK TABLES `EventEmployee` WRITE;
/*!40000 ALTER TABLE `EventEmployee` DISABLE KEYS */;
INSERT INTO `EventEmployee` VALUES
(1,'JANIT00001'),
(2,'JANIT00001'),
(3,'JANIT00001'),
(4,'JANIT00001'),
(5,'JANIT00001'),
(6,'JANIT00001'),
(1,'JANIT00002'),
(2,'JANIT00002'),
(3,'JANIT00002'),
(4,'JANIT00002'),
(5,'JANIT00002'),
(6,'JANIT00002'),
(1,'JANIT00003'),
(2,'JANIT00003'),
(3,'JANIT00003'),
(4,'JANIT00003'),
(5,'JANIT00003'),
(6,'JANIT00003'),
(1,'JANIT00004'),
(2,'JANIT00004'),
(3,'JANIT00004'),
(4,'JANIT00004'),
(5,'JANIT00004'),
(6,'JANIT00004'),
(1,'MARKT00001'),
(2,'MARKT00001'),
(3,'MARKT00001'),
(4,'MARKT00001'),
(5,'MARKT00001'),
(6,'MARKT00001'),
(1,'MARKT00002'),
(2,'MARKT00002'),
(3,'MARKT00002'),
(4,'MARKT00002'),
(5,'MARKT00002'),
(6,'MARKT00002'),
(1,'MARKT00003'),
(2,'MARKT00003'),
(3,'MARKT00003'),
(4,'MARKT00003'),
(5,'MARKT00003'),
(6,'MARKT00003'),
(1,'MARKT00004'),
(2,'MARKT00004'),
(3,'MARKT00004'),
(4,'MARKT00004'),
(5,'MARKT00004'),
(6,'MARKT00004'),
(1,'SALES00001'),
(2,'SALES00001'),
(3,'SALES00001'),
(4,'SALES00001'),
(5,'SALES00001'),
(6,'SALES00001'),
(1,'SALES00002'),
(2,'SALES00002'),
(3,'SALES00002'),
(4,'SALES00002'),
(5,'SALES00002'),
(6,'SALES00002'),
(1,'SALES00003'),
(2,'SALES00003'),
(3,'SALES00003'),
(4,'SALES00003'),
(5,'SALES00003'),
(6,'SALES00003'),
(1,'SECUR00001'),
(2,'SECUR00001'),
(3,'SECUR00001'),
(4,'SECUR00001'),
(5,'SECUR00001'),
(6,'SECUR00001'),
(1,'SECUR00002'),
(2,'SECUR00002'),
(3,'SECUR00002'),
(4,'SECUR00002'),
(5,'SECUR00002'),
(6,'SECUR00002');
/*!40000 ALTER TABLE `EventEmployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `EventsParticipated`
--

DROP TABLE IF EXISTS `EventsParticipated`;
/*!50001 DROP VIEW IF EXISTS `EventsParticipated`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `EventsParticipated` AS SELECT
 1 AS `ParticipantID`,
  1 AS `EventIDName` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Participant`
--

DROP TABLE IF EXISTS `Participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Participant` (
  `ParticipantID` int(11) NOT NULL AUTO_INCREMENT,
  `ParticipantName` varchar(75) NOT NULL,
  `ParticipantVAT` varchar(9) DEFAULT NULL,
  `ParticipantBirthDate` date NOT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `Locale` varchar(30) DEFAULT NULL,
  `Postal` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ParticipantID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participant`
--

LOCK TABLES `Participant` WRITE;
/*!40000 ALTER TABLE `Participant` DISABLE KEYS */;
INSERT INTO `Participant` VALUES
(1,'Ana Alves Aves',NULL,'2000-10-03','Rua Antonio Malheiro','Atchim','4406-333'),
(2,'Beto Bartolomeu Broa','500402204','1960-01-03','Sitio do Pica-pau','Amarelo','5504-999'),
(3,'Pavel Nguissa','330209763','2004-02-29','Avenida da Gritaria','Onda','1039-586'),
(4,'Eduardo Ernesto','667438290','2003-08-30','Travessa Entre-Riachos','Puarto','7777-431'),
(5,'Jasper Lindkrug','110097832','1936-05-23','Rua Mas Marias','Gotland','6000-256'),
(6,'Carlos Coentrao Cavaco',NULL,'1970-05-04','Rua do Palhaco Mudo','Palhaca','1566-839'),
(7,'Diofantina Duarte Dias','295839290','1990-11-11','Avenida da Real Virtualidade','Mato da Beira','0119-703'),
(8,'Jay Okocha','069411194','2016-07-10','Travessa Costa Dourada','Praia de Matosinhos','7732-410'),
(9,'Fhatima Alkhashour',NULL,'2013-12-25','Bairro do Gato Maltes','Pianno Valletta','4403-752'),
(10,'Gilberto Gloria Gomes Galhardo','555444333','2010-03-02','Praca of Alliances','En-Guardinton','6659-330'),
(11,'Yang Lee-sang','559302119','2174-10-31','Bairro Tia Ying-Yang','Principado de Qin','5094-333'),
(12,'Blake Edwards','448395907','1994-09-22','Rua Pantera Cor-de-Rosa','Panan-Panan','3302-544'),
(13,'Ivo Ilhas','200019776','1000-01-01','Rua do Ivo','Ilhotas do Ivo','1111-000'),
(14,'Mizutsuki Yamatora',NULL,'1953-04-16','Baia de Oda','Wan Pice','6039-777'),
(15,'Anatoliyy Curie','559430210','2007-11-07','Rua da Menina do Polonio','Eurehka','5077-496'),
(16,'Hector Hernandez','604449622','2001-09-10','Ruelha de la Pas','Bolicau','3019-301');
/*!40000 ALTER TABLE `Participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParticipantEmail`
--

DROP TABLE IF EXISTS `ParticipantEmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParticipantEmail` (
  `ParticipantID_pem` int(11) NOT NULL,
  `Email` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`ParticipantID_pem`),
  UNIQUE KEY `Email` (`Email`),
  CONSTRAINT `ParticipantEmail_ibfk_1` FOREIGN KEY (`ParticipantID_pem`) REFERENCES `Participant` (`ParticipantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParticipantEmail`
--

LOCK TABLES `ParticipantEmail` WRITE;
/*!40000 ALTER TABLE `ParticipantEmail` DISABLE KEYS */;
INSERT INTO `ParticipantEmail` VALUES
(1,'aaa@machadinha.et'),
(15,'ak47@boom.cs'),
(2,'bbb@tvi.et'),
(6,'ccc@cerpente.et'),
(7,'ddd@nutmax.yp'),
(4,'ee@hehe.he'),
(9,'fhaal@tapoporto.uz'),
(10,'gegegege@togeee.ge'),
(12,'hhh@aaaaa.tchin'),
(16,'hhplus1@aaaaa.tchin'),
(13,'iilhas@dunas.dv'),
(5,'jaspenkrug@ger.sw'),
(8,'jjayokoctha@psg.fr'),
(3,'sigmat@golo.afk'),
(14,'WEAREONTHECRUISEEE@onepiece.oda'),
(11,'ylsneg@soc.pts');
/*!40000 ALTER TABLE `ParticipantEmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ParticipantFull`
--

DROP TABLE IF EXISTS `ParticipantFull`;
/*!50001 DROP VIEW IF EXISTS `ParticipantFull`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ParticipantFull` AS SELECT
 1 AS `ParticipantID`,
  1 AS `ParticipantName`,
  1 AS `ParticipantVAT`,
  1 AS `ParticipantBirthDate`,
  1 AS `Street`,
  1 AS `Locale`,
  1 AS `Postal`,
  1 AS `Contacts` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ParticipantPhone`
--

DROP TABLE IF EXISTS `ParticipantPhone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParticipantPhone` (
  `ParticipantID_pp` int(11) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  PRIMARY KEY (`ParticipantID_pp`),
  UNIQUE KEY `Phone` (`Phone`),
  CONSTRAINT `ParticipantPhone_ibfk_1` FOREIGN KEY (`ParticipantID_pp`) REFERENCES `Participant` (`ParticipantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParticipantPhone`
--

LOCK TABLES `ParticipantPhone` WRITE;
/*!40000 ALTER TABLE `ParticipantPhone` DISABLE KEYS */;
INSERT INTO `ParticipantPhone` VALUES
(15,'+24199504421'),
(16,'+24199504422'),
(3,'+24199504423'),
(8,'+24199504424'),
(5,'+24199504425'),
(11,'+24199504426'),
(14,'+24199504427'),
(1,'+351101092200'),
(2,'+351101092201'),
(6,'+351101092202'),
(7,'+351101092203'),
(4,'+351101092204'),
(9,'+351101092205'),
(10,'+351101092206'),
(12,'+351101092207'),
(13,'+351101092208');
/*!40000 ALTER TABLE `ParticipantPhone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ParticipantsEvent`
--

DROP TABLE IF EXISTS `ParticipantsEvent`;
/*!50001 DROP VIEW IF EXISTS `ParticipantsEvent`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ParticipantsEvent` AS SELECT
 1 AS `EventID`,
  1 AS `ParticipantIDs` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(75) NOT NULL,
  `ProductDescription` text NOT NULL,
  `BasePrice` decimal(5,2) NOT NULL,
  `QuantityInStock` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ProductName` (`ProductName`),
  CONSTRAINT `Stock` CHECK (`QuantityInStock` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES
(1,'Christmas Booksale - Mademoiselle Borges','Christmas Booksale Ticket',5.20,94967291),
(2,'Sueca Tournament','Ticket for the Tournament',3.00,47),
(3,'Theater Piece: \'The Hidden Madame\'','The Madame\'s Ticket',4.50,148),
(4,'Festive Procession de Sao Celestino de Rabo de Peixe','The Religious Ticket',1.00,147),
(5,'Puppet Show: \'Red Ridding Hood\'','The Puppet Ticket',2.00,37),
(6,'Arts and Crafts Fair','The Artiste Ticket',8.00,78),
(7,'Pacote Caneta Azul Bic','Pacote de 10 Canetas da Marca Bic, cor azul',3.89,0),
(8,'Borracha Branca','2 Borrachas MAPPED',1.10,0),
(9,'Pacote Caneta Vermelha Bic','Pacote de 10 Canetas da Marca Bic, cor vermelha',3.89,1),
(10,'Lápis de Cor Faber-Castell','Caixa com 36 lápis de cor vibrantes',29.99,0),
(11,'Livro para Colorir','Livro com imagens de locais e eventos importantes de Eventopolis para colorir ',6.00,0),
(12,'Livro \'Historia de Eventopolis, do século XV até modernidade\'','Livro do autor Benedito Leão, onde ele escreve sobre vários eventos históricos da antiga cidade de Eventopolis',30.00,0),
(13,'Assinatura Mensal de Livros Locais','Receba mensalmente um livro de um autor local ou com temática da cidade',10.99,1),
(14,'Caderno Pautado','Caderno com 100 folhas pautadas',1.50,0),
(15,'Caderno Quadriculado','Caderno com 100 folhas quadriculadas',1.50,1),
(16,'Caneca \'I LOVE Eventopolis\'','Caneca de ceramica com o slogan da cidade',7.50,0),
(17,'Jogo de Tabuleiro \'Descubra Eventopolis\'','Jogo interativo para explorar a história e geografia de Eventopolis',24.55,0),
(18,'Livro de Receitas \'Sabores de Eventopolis\'','Receitas locais e tradicionais da região copiladas pelo enigmatico chefe Roy Mustang',49.95,0),
(19,'Agenda Anual Gatos 2024','Agenda com páginas para cada dia do ano com imagens de vários felinos',12.99,1),
(20,'Conjunto de Postais de Eventopolis','Pacote com 10 postais ilustrados de vários monumentos da cidade, incluido a famosa estufa construida por Carlos Valente no inicio do seculo XX',9.99,0),
(21,'Guia Turístico de Eventopolis','Livro informativo com destinos, atrações e lendas da cidade',11.50,0),
(22,'T-shirt \'I LOVE EVENTOPOLIS\'','Uma t-shirt de tamanho S com o famoso logo\'',10.00,1),
(23,'Bloco de Notas de Couro','Bloco de notas elegante com capa de couro sintético',9.75,0),
(24,'Livro \'A vida secreta de Carlos Valente\'','Uma Biografia escrita por Maria Alves, acerca da escandalosa vida do mais importante arquiteto de Eventopolis',35.00,0),
(25,'Bloco de Desenho A4','Bloco de papel para desenho tamanho A4, 50 folhas',12.95,0);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ProductFutureSuppliers`
--

DROP TABLE IF EXISTS `ProductFutureSuppliers`;
/*!50001 DROP VIEW IF EXISTS `ProductFutureSuppliers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ProductFutureSuppliers` AS SELECT
 1 AS `ProductID`,
  1 AS `Suppliers` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ProductPastSuppliers`
--

DROP TABLE IF EXISTS `ProductPastSuppliers`;
/*!50001 DROP VIEW IF EXISTS `ProductPastSuppliers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ProductPastSuppliers` AS SELECT
 1 AS `ProductID`,
  1 AS `SupplierIDs` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ProductSupplierFuture`
--

DROP TABLE IF EXISTS `ProductSupplierFuture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductSupplierFuture` (
  `ProductID_psf` int(11) NOT NULL,
  `SupplierID_psf` int(11) NOT NULL,
  `DateOfReservation` datetime NOT NULL,
  `DateOfSchedule` datetime NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`ProductID_psf`,`SupplierID_psf`,`DateOfReservation`,`DateOfSchedule`),
  KEY `SupplierID_psf` (`SupplierID_psf`),
  CONSTRAINT `ProductSupplierFuture_ibfk_1` FOREIGN KEY (`ProductID_psf`) REFERENCES `Product` (`ProductID`),
  CONSTRAINT `ProductSupplierFuture_ibfk_2` FOREIGN KEY (`SupplierID_psf`) REFERENCES `Supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductSupplierFuture`
--

LOCK TABLES `ProductSupplierFuture` WRITE;
/*!40000 ALTER TABLE `ProductSupplierFuture` DISABLE KEYS */;
INSERT INTO `ProductSupplierFuture` VALUES
(7,3,'2023-10-30 09:00:00','2023-11-30 13:00:00',35),
(8,3,'2023-10-30 09:00:00','2023-11-30 13:00:00',21),
(9,3,'2023-10-30 09:00:00','2023-11-30 13:00:00',30),
(10,3,'2023-10-30 09:00:00','2023-11-30 13:00:00',13),
(11,1,'2023-11-10 19:00:00','2023-12-10 08:30:00',7),
(12,1,'2023-11-10 19:00:00','2023-12-10 08:30:00',6),
(13,1,'2023-11-10 19:00:00','2023-12-10 08:30:00',22),
(14,9,'2023-12-25 10:00:00','2024-01-25 16:00:00',30),
(15,9,'2023-12-25 10:00:00','2024-01-25 16:00:00',30),
(16,2,'2023-10-30 17:00:00','2023-11-30 14:45:00',20),
(17,11,'2023-11-10 11:11:11','2023-12-10 13:00:00',5),
(18,10,'2023-11-10 15:00:00','2023-12-10 00:00:48',4),
(19,4,'2024-02-18 14:00:00','2024-03-18 09:30:00',100),
(20,5,'2023-11-10 12:45:00','2023-12-10 13:00:00',23),
(21,8,'2023-11-10 12:45:00','2023-12-10 13:00:00',10),
(22,2,'2023-11-16 10:00:00','2024-03-20 11:00:00',30),
(23,7,'2023-11-16 19:45:00','2024-03-20 08:00:00',12),
(24,1,'2023-11-10 19:00:00','2024-03-19 08:30:00',9),
(25,9,'2023-12-25 10:00:00','2024-03-19 16:00:00',19);
/*!40000 ALTER TABLE `ProductSupplierFuture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductSupplierPast`
--

DROP TABLE IF EXISTS `ProductSupplierPast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductSupplierPast` (
  `ProductID_psp` int(11) NOT NULL,
  `SupplierID_psp` int(11) NOT NULL,
  `DateOfDelivery` datetime NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`ProductID_psp`,`SupplierID_psp`,`DateOfDelivery`),
  KEY `SupplierID_psp` (`SupplierID_psp`),
  CONSTRAINT `ProductSupplierPast_ibfk_1` FOREIGN KEY (`ProductID_psp`) REFERENCES `Product` (`ProductID`),
  CONSTRAINT `ProductSupplierPast_ibfk_2` FOREIGN KEY (`SupplierID_psp`) REFERENCES `Supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductSupplierPast`
--

LOCK TABLES `ProductSupplierPast` WRITE;
/*!40000 ALTER TABLE `ProductSupplierPast` DISABLE KEYS */;
INSERT INTO `ProductSupplierPast` VALUES
(7,3,'2023-11-30 13:00:00',1),
(8,3,'2023-11-30 13:00:00',1),
(9,3,'2023-11-30 13:00:00',1),
(10,3,'2023-11-30 13:00:00',1),
(11,1,'2023-12-10 08:30:00',1),
(12,1,'2023-12-10 08:30:00',1),
(13,1,'2023-12-10 08:30:00',1),
(14,9,'2024-01-25 16:00:00',1),
(15,9,'2024-01-25 16:00:00',1),
(16,2,'2023-11-30 14:45:00',1),
(17,11,'2023-12-10 13:00:00',1),
(18,10,'2023-12-10 00:00:48',1),
(19,4,'2024-03-18 09:30:00',1),
(20,5,'2023-12-10 13:00:00',1),
(21,8,'2023-12-10 13:00:00',1),
(22,2,'2024-03-20 11:00:00',1),
(23,7,'2024-03-20 08:00:00',1),
(24,1,'2024-03-19 08:30:00',1),
(25,1,'2024-03-19 16:00:00',1);
/*!40000 ALTER TABLE `ProductSupplierPast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ProductSuppliers`
--

DROP TABLE IF EXISTS `ProductSuppliers`;
/*!50001 DROP VIEW IF EXISTS `ProductSuppliers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ProductSuppliers` AS SELECT
 1 AS `ProductID`,
  1 AS `SupplierIDs` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ProductsInSale`
--

DROP TABLE IF EXISTS `ProductsInSale`;
/*!50001 DROP VIEW IF EXISTS `ProductsInSale`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ProductsInSale` AS SELECT
 1 AS `ReceiptNO`,
  1 AS `ProductIDs` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Sale`
--

DROP TABLE IF EXISTS `Sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sale` (
  `ReceiptNO` int(11) NOT NULL AUTO_INCREMENT,
  `TotalValue` decimal(5,2) NOT NULL,
  `TotalQuantity` int(11) NOT NULL,
  `DateOfSale` datetime DEFAULT NULL,
  `EmployeeID_s` varchar(10) NOT NULL,
  `ParticipantID_s` int(11) NOT NULL,
  PRIMARY KEY (`ReceiptNO`),
  KEY `EmployeeID_s` (`EmployeeID_s`),
  KEY `ParticipantID_s` (`ParticipantID_s`),
  CONSTRAINT `Sale_ibfk_1` FOREIGN KEY (`EmployeeID_s`) REFERENCES `Employee` (`EmployeeID`),
  CONSTRAINT `Sale_ibfk_2` FOREIGN KEY (`ParticipantID_s`) REFERENCES `Participant` (`ParticipantID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sale`
--

LOCK TABLES `Sale` WRITE;
/*!40000 ALTER TABLE `Sale` DISABLE KEYS */;
INSERT INTO `Sale` VALUES
(1,5.20,1,'2023-12-19 15:30:00','SALES00001',1),
(2,5.20,1,'2023-12-19 15:31:00','SALES00001',2),
(3,5.20,1,'2023-12-19 15:32:00','SALES00002',3),
(4,4.50,1,'2023-12-15 18:30:00','SALES00002',4),
(5,4.50,1,'2023-12-15 18:31:00','SALES00003',5),
(6,3.00,1,'2024-02-02 21:30:00','SALES00001',6),
(7,3.00,1,'2024-02-02 21:31:00','SALES00002',7),
(8,3.00,1,'2024-02-02 21:32:00','SALES00003',8),
(9,1.00,1,'2024-02-05 15:00:00','SALES00002',9),
(10,1.00,1,'2024-02-05 15:01:00','SALES00003',10),
(11,1.00,1,'2024-02-05 15:02:00','SALES00002',11),
(12,2.00,1,'2024-02-07 13:30:00','SALES00003',12),
(13,2.00,1,'2024-02-07 13:31:00','SALES00003',13),
(14,2.00,1,'2024-02-07 13:32:00','SALES00001',14),
(15,8.00,1,'2024-02-08 13:00:00','SALES00003',15),
(16,8.00,1,'2024-02-08 13:01:00','SALES00003',16),
(17,66.49,3,'2023-12-19 15:33:00','SALES00001',1),
(18,15.75,2,'2023-12-19 15:34:00','SALES00002',3),
(19,59.54,4,'2023-12-15 18:40:00','SALES00003',5),
(20,7.50,1,'2024-02-02 21:40:00','SALES00001',7),
(21,34.44,3,'2024-02-05 15:10:00','SALES00003',9),
(22,49.95,1,'2024-02-05 15:12:00','SALES00002',11);
/*!40000 ALTER TABLE `Sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `SaleNoValue`
--

DROP TABLE IF EXISTS `SaleNoValue`;
/*!50001 DROP VIEW IF EXISTS `SaleNoValue`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SaleNoValue` AS SELECT
 1 AS `ReceiptNO`,
  1 AS `TotalQuantity`,
  1 AS `DateOfSale`,
  1 AS `EmployeeID`,
  1 AS `ParticipantID` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SaleProduct`
--

DROP TABLE IF EXISTS `SaleProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SaleProduct` (
  `ReceiptNO_sp` int(11) NOT NULL,
  `ProductID_sp` int(11) NOT NULL,
  `CurrentValue` decimal(5,2) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`ReceiptNO_sp`,`ProductID_sp`),
  KEY `ProductID_sp` (`ProductID_sp`),
  CONSTRAINT `SaleProduct_ibfk_1` FOREIGN KEY (`ReceiptNO_sp`) REFERENCES `Sale` (`ReceiptNO`),
  CONSTRAINT `SaleProduct_ibfk_2` FOREIGN KEY (`ProductID_sp`) REFERENCES `Product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SaleProduct`
--

LOCK TABLES `SaleProduct` WRITE;
/*!40000 ALTER TABLE `SaleProduct` DISABLE KEYS */;
INSERT INTO `SaleProduct` VALUES
(1,1,5.20,1),
(2,1,5.20,1),
(3,1,5.20,1),
(4,3,4.50,1),
(5,3,4.50,1),
(6,2,3.00,1),
(7,2,3.00,1),
(8,2,3.00,1),
(9,4,1.00,1),
(10,4,1.00,1),
(11,4,1.00,1),
(12,5,2.00,1),
(13,5,2.00,1),
(14,5,2.00,1),
(15,6,8.00,1),
(16,6,8.00,1),
(17,10,29.99,1),
(17,14,1.50,1),
(17,24,35.00,1),
(18,11,6.00,1),
(18,23,9.75,1),
(19,7,3.89,1),
(19,8,1.10,1),
(19,12,30.00,1),
(19,17,24.55,1),
(20,16,7.50,1),
(21,20,9.99,1),
(21,21,11.50,1),
(21,25,12.95,1),
(22,18,49.95,1);
/*!40000 ALTER TABLE `SaleProduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `SalesParticipant`
--

DROP TABLE IF EXISTS `SalesParticipant`;
/*!50001 DROP VIEW IF EXISTS `SalesParticipant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SalesParticipant` AS SELECT
 1 AS `ParticipantID`,
  1 AS `GROUP_CONCAT(S.ReceiptNO)` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(75) NOT NULL,
  `IBAN` varchar(50) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `Locale` varchar(30) NOT NULL,
  `Postal` varchar(15) NOT NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE KEY `SupplierName` (`SupplierName`),
  UNIQUE KEY `IBAN` (`IBAN`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES
(1,'World of Books','ET493958654897440','Paper Valley, nº234','Calecornia','2710-008-ZZZ'),
(2,'Lorbeer und Lorbeer Materials Lda','GE905440777332294','Teller von Lachen, nº91, Piso 3','Inglostadt','4000-003'),
(3,'Badhiya Kapaas','IND66979302668492','Traayamph Skvaayar, nº124','Goa','4485-4432'),
(4,'AltaPelle Distributore','IT40330399569611111','Via Carlos Vallente, nº27','Piza','3-55-88895'),
(5,'Edital Impressao','PT96797397339295','Alameda da Vitoria, n234','Guimarães','4800-234'),
(6,'Diavges Sympan Lda','GR775588994433225566','Leoforos tou Mikrolameira, n123','Tebas','500-692-4'),
(7,'Kreativnyye Resheniya Importer','RU0020105889044430','Arkticheskiy prospekt, n94','Ufa','38948-222-01'),
(8,'InovaPrint Solucciones Graficas','ES6854920492946841','Rua dela dama del dia, n20, Oficina I ','Mirallá','9000-009-AAA'),
(9,'Sangbeoggyuoppa Mungujeom','SCOR6695593388200060','jong-ijib geoli, n234','Jeju','2750-008'),
(10,'Páginas Vivas Publicações Inc.','BR99900299294958811','Rua Anita Carlota, n111','Curitiba','4740-081'),
(11,'Himno ng Kagalakan Ltda.','FP22294939205R8687853','pinggan ng mga bulaklak, n001','Manila','747484-444');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SupplierEmail`
--

DROP TABLE IF EXISTS `SupplierEmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SupplierEmail` (
  `SupplierID_sem` int(11) NOT NULL,
  `Email` varchar(75) NOT NULL,
  PRIMARY KEY (`SupplierID_sem`),
  UNIQUE KEY `Email` (`Email`),
  CONSTRAINT `SupplierEmail_ibfk_1` FOREIGN KEY (`SupplierID_sem`) REFERENCES `Supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SupplierEmail`
--

LOCK TABLES `SupplierEmail` WRITE;
/*!40000 ALTER TABLE `SupplierEmail` DISABLE KEYS */;
INSERT INTO `SupplierEmail` VALUES
(4,'altpe@dist.it'),
(6,'diasymp@ludico.gr'),
(5,'editalimp@edital.pt'),
(3,'fashionkapaas@badkap.in'),
(11,'him@ltda.fp'),
(8,'inovaprint@inova.es'),
(7,'kreat@imprt.ru'),
(2,'materialslul@matino.ge'),
(9,'mungsbeog@psg.sc'),
(10,'paginasvivas@vivas.br'),
(1,'world-books@mdl.et');
/*!40000 ALTER TABLE `SupplierEmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `SupplierFull`
--

DROP TABLE IF EXISTS `SupplierFull`;
/*!50001 DROP VIEW IF EXISTS `SupplierFull`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SupplierFull` AS SELECT
 1 AS `SupplierID`,
  1 AS `SupplierName`,
  1 AS `IBAN`,
  1 AS `Street`,
  1 AS `Locale`,
  1 AS `Postal`,
  1 AS `Contacts` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SupplierPhone`
--

DROP TABLE IF EXISTS `SupplierPhone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SupplierPhone` (
  `SupplierID_sp` int(11) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  PRIMARY KEY (`SupplierID_sp`),
  UNIQUE KEY `Phone` (`Phone`),
  CONSTRAINT `SupplierPhone_ibfk_1` FOREIGN KEY (`SupplierID_sp`) REFERENCES `Supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SupplierPhone`
--

LOCK TABLES `SupplierPhone` WRITE;
/*!40000 ALTER TABLE `SupplierPhone` DISABLE KEYS */;
INSERT INTO `SupplierPhone` VALUES
(3,'+222543296584-3'),
(9,'+25839443922204'),
(10,'+33335434890250-111'),
(6,'+34002-995-033-869'),
(11,'+3512521111121'),
(5,'+351252111116'),
(4,'+444-8599339-2111'),
(8,'+583920007-90'),
(1,'+631854-677219'),
(7,'+643333020-4-3111'),
(2,'+68349-333-10102');
/*!40000 ALTER TABLE `SupplierPhone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `employee_full`
--

DROP TABLE IF EXISTS `employee_full`;
/*!50001 DROP VIEW IF EXISTS `employee_full`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `employee_full` AS SELECT
 1 AS `EmployeeID`,
  1 AS `EmployeeName`,
  1 AS `EmployeeVAT`,
  1 AS `EmployeeBirthDate`,
  1 AS `Street`,
  1 AS `Locale`,
  1 AS `PostalCode`,
  1 AS `EmployeeID_e`,
  1 AS `Contacts` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `employee_sales`
--

DROP TABLE IF EXISTS `employee_sales`;
/*!50001 DROP VIEW IF EXISTS `employee_sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `employee_sales` AS SELECT
 1 AS `EmployeeID`,
  1 AS `EmployeeName`,
  1 AS `TotalValue` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `event_volume`
--

DROP TABLE IF EXISTS `event_volume`;
/*!50001 DROP VIEW IF EXISTS `event_volume`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `event_volume` AS SELECT
 1 AS `EventID`,
  1 AS `TotalQuantity` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `failed_reservations`
--

DROP TABLE IF EXISTS `failed_reservations`;
/*!50001 DROP VIEW IF EXISTS `failed_reservations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `failed_reservations` AS SELECT
 1 AS `ProductID` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `manager_employees`
--

DROP TABLE IF EXISTS `manager_employees`;
/*!50001 DROP VIEW IF EXISTS `manager_employees`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `manager_employees` AS SELECT
 1 AS `ManagerEmployeeID`,
  1 AS `ManagedEmployeeIDs` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `participant_sales`
--

DROP TABLE IF EXISTS `participant_sales`;
/*!50001 DROP VIEW IF EXISTS `participant_sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `participant_sales` AS SELECT
 1 AS `ParticipantID`,
  1 AS `TotalSales` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `product_supplier`
--

DROP TABLE IF EXISTS `product_supplier`;
/*!50001 DROP VIEW IF EXISTS `product_supplier`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `product_supplier` AS SELECT
 1 AS `ProductID`,
  1 AS `PastSupplierID`,
  1 AS `FutureSupplierID` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `purchase_history`
--

DROP TABLE IF EXISTS `purchase_history`;
/*!50001 DROP VIEW IF EXISTS `purchase_history`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `purchase_history` AS SELECT
 1 AS `ParticipantID`,
  1 AS `ReceiptNO`,
  1 AS `PurchaseDate` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `total_event_sale_value`
--

DROP TABLE IF EXISTS `total_event_sale_value`;
/*!50001 DROP VIEW IF EXISTS `total_event_sale_value`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `total_event_sale_value` AS SELECT
 1 AS `EventID`,
  1 AS `TotalValue` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `BestSellersEmployee`
--

/*!50001 DROP VIEW IF EXISTS `BestSellersEmployee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `BestSellersEmployee` AS select `EV`.`EventID` AS `EventID`,`S`.`EmployeeID_s` AS `EmployeeID`,sum(`SP`.`Quantity`) AS `Quantity` from (((((`EventCal` `EV` join `EventEmployee` `EE` on(`EV`.`EventID` = `EE`.`EventID_ee`)) join `Employee` `E` on(`EE`.`EmployeeID_ee` = `E`.`EmployeeID`)) join `Sale` `S` on(`E`.`EmployeeID` = `S`.`EmployeeID_s`)) join `SaleProduct` `SP` on(`S`.`ReceiptNO` = `SP`.`ReceiptNO_sp`)) join `Product` `P` on(`P`.`ProductName` = `EV`.`EventName`)) group by `EV`.`EventID`,`S`.`EmployeeID_s` order by sum(`SP`.`Quantity`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DailySales`
--

/*!50001 DROP VIEW IF EXISTS `DailySales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DailySales` AS select `S`.`DateOfSale` AS `DateOfSale`,sum(`S`.`TotalValue`) AS `TotalValue`,sum(`S`.`TotalQuantity`) AS `TotalQuantity` from `Sale` `S` group by `S`.`DateOfSale` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `EmployeeSales`
--

/*!50001 DROP VIEW IF EXISTS `EmployeeSales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `EmployeeSales` AS select `S`.`EmployeeID_s` AS `EmployeeID_s`,group_concat(`S`.`ReceiptNO` separator ',') AS `ReceiptNO` from `Sale` `S` group by `S`.`EmployeeID_s` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `EventsParticipated`
--

/*!50001 DROP VIEW IF EXISTS `EventsParticipated`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `EventsParticipated` AS select `S`.`ParticipantID_s` AS `ParticipantID`,group_concat(`EV`.`EventID`,`EV`.`EventName` separator ',') AS `EventIDName` from (((`Sale` `S` join `SaleProduct` `SP` on(`S`.`ReceiptNO` = `SP`.`ReceiptNO_sp`)) join `Product` `P` on(`SP`.`ProductID_sp` = `P`.`ProductID`)) join `EventCal` `EV` on(`P`.`ProductName` = `EV`.`EventName`)) group by `S`.`ParticipantID_s` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ParticipantFull`
--

/*!50001 DROP VIEW IF EXISTS `ParticipantFull`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ParticipantFull` AS select `P`.`ParticipantID` AS `ParticipantID`,`P`.`ParticipantName` AS `ParticipantName`,`P`.`ParticipantVAT` AS `ParticipantVAT`,`P`.`ParticipantBirthDate` AS `ParticipantBirthDate`,`P`.`Street` AS `Street`,`P`.`Locale` AS `Locale`,`P`.`Postal` AS `Postal`,group_concat(`Email`.`Email`,`Phone`.`Phone` separator ',') AS `Contacts` from ((`Participant` `P` left join `ParticipantPhone` `Phone` on(`P`.`ParticipantID` = `Phone`.`ParticipantID_pp`)) left join `ParticipantEmail` `Email` on(`P`.`ParticipantID` = `Email`.`ParticipantID_pem`)) group by `P`.`ParticipantID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ParticipantsEvent`
--

/*!50001 DROP VIEW IF EXISTS `ParticipantsEvent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ParticipantsEvent` AS select `EV`.`EventID` AS `EventID`,group_concat(`PA`.`ParticipantID` separator ',') AS `ParticipantIDs` from ((((`EventCal` `EV` join `Sale` `S` on(`S`.`DateOfSale` between `EV`.`EventStart` and `EV`.`EventEnd`)) join `Participant` `PA` on(`PA`.`ParticipantID` = `S`.`ParticipantID_s`)) join `SaleProduct` `SP` on(`S`.`ReceiptNO` = `SP`.`ReceiptNO_sp`)) join `Product` `PR` on(`PR`.`ProductID` = `SP`.`ProductID_sp` and `EV`.`EventName` = `PR`.`ProductName`)) group by `EV`.`EventID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ProductFutureSuppliers`
--

/*!50001 DROP VIEW IF EXISTS `ProductFutureSuppliers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ProductFutureSuppliers` AS select `PSF`.`ProductID_psf` AS `ProductID`,`PSF`.`SupplierID_psf` AS `Suppliers` from `ProductSupplierFuture` `PSF` group by `PSF`.`ProductID_psf` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ProductPastSuppliers`
--

/*!50001 DROP VIEW IF EXISTS `ProductPastSuppliers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ProductPastSuppliers` AS select `PSP`.`ProductID_psp` AS `ProductID`,group_concat(`PSP`.`SupplierID_psp` separator ',') AS `SupplierIDs` from `ProductSupplierPast` `PSP` group by `PSP`.`ProductID_psp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ProductSuppliers`
--

/*!50001 DROP VIEW IF EXISTS `ProductSuppliers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ProductSuppliers` AS select `PSP`.`ProductID_psp` AS `ProductID`,group_concat(`PSP`.`SupplierID_psp` separator ',') AS `SupplierIDs` from (`ProductSupplierPast` `PSP` join `ProductSupplierFuture` `PSF` on(`PSP`.`ProductID_psp` = `PSF`.`ProductID_psf`)) group by `PSP`.`ProductID_psp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ProductsInSale`
--

/*!50001 DROP VIEW IF EXISTS `ProductsInSale`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ProductsInSale` AS select `SaleProduct`.`ReceiptNO_sp` AS `ReceiptNO`,group_concat(`SaleProduct`.`ProductID_sp` separator ',') AS `ProductIDs` from `SaleProduct` group by `SaleProduct`.`ReceiptNO_sp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SaleNoValue`
--

/*!50001 DROP VIEW IF EXISTS `SaleNoValue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SaleNoValue` AS select `S`.`ReceiptNO` AS `ReceiptNO`,`S`.`TotalQuantity` AS `TotalQuantity`,`S`.`DateOfSale` AS `DateOfSale`,`S`.`EmployeeID_s` AS `EmployeeID`,`S`.`ParticipantID_s` AS `ParticipantID` from `Sale` `S` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SalesParticipant`
--

/*!50001 DROP VIEW IF EXISTS `SalesParticipant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SalesParticipant` AS select `S`.`ParticipantID_s` AS `ParticipantID`,group_concat(`S`.`ReceiptNO` separator ',') AS `GROUP_CONCAT(S.ReceiptNO)` from `Sale` `S` group by `S`.`ParticipantID_s` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SupplierFull`
--

/*!50001 DROP VIEW IF EXISTS `SupplierFull`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SupplierFull` AS select `S`.`SupplierID` AS `SupplierID`,`S`.`SupplierName` AS `SupplierName`,`S`.`IBAN` AS `IBAN`,`S`.`Street` AS `Street`,`S`.`Locale` AS `Locale`,`S`.`Postal` AS `Postal`,group_concat(`Email`.`Email`,`Phone`.`Phone` separator ',') AS `Contacts` from ((`Supplier` `S` left join `SupplierEmail` `Email` on(`S`.`SupplierID` = `Email`.`SupplierID_sem`)) left join `SupplierPhone` `Phone` on(`S`.`SupplierID` = `Phone`.`SupplierID_sp`)) group by `S`.`SupplierID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_full`
--

/*!50001 DROP VIEW IF EXISTS `employee_full`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_full` AS select `E`.`EmployeeID` AS `EmployeeID`,`E`.`EmployeeName` AS `EmployeeName`,`E`.`EmployeeVAT` AS `EmployeeVAT`,`E`.`EmployeeBirthDate` AS `EmployeeBirthDate`,`E`.`Street` AS `Street`,`E`.`Locale` AS `Locale`,`E`.`PostalCode` AS `PostalCode`,`E`.`EmployeeID_e` AS `EmployeeID_e`,group_concat(`Email`.`Email`,`Phone`.`Phone` separator ',') AS `Contacts` from ((`Employee` `E` left join `EmployeeEmail` `Email` on(`E`.`EmployeeID` = `Email`.`EmployeeID_eem`)) left join `EmployeePhone` `Phone` on(`E`.`EmployeeID` = `Phone`.`EmployeeID_ep`)) group by `E`.`EmployeeID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_sales`
--

/*!50001 DROP VIEW IF EXISTS `employee_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_sales` AS select `E`.`EmployeeID` AS `EmployeeID`,`E`.`EmployeeName` AS `EmployeeName`,sum(`S`.`TotalValue`) AS `TotalValue` from (`Employee` `E` join `Sale` `S` on(`E`.`EmployeeID` = `S`.`EmployeeID_s`)) group by `E`.`EmployeeID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `event_volume`
--

/*!50001 DROP VIEW IF EXISTS `event_volume`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `event_volume` AS select `EC`.`EventID` AS `EventID`,sum(`S`.`TotalQuantity`) AS `TotalQuantity` from (`EventCal` `EC` join `Sale` `S` on(`S`.`DateOfSale` between `EC`.`EventStart` and `EC`.`EventEnd`)) group by `EC`.`EventID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `failed_reservations`
--

/*!50001 DROP VIEW IF EXISTS `failed_reservations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `failed_reservations` AS select `PSP`.`ProductID_psp` AS `ProductID` from (`ProductSupplierPast` `PSP` join `ProductSupplierFuture` `PSF` on(`PSF`.`ProductID_psf` <> `PSF`.`ProductID_psf`)) where `PSF`.`DateOfSchedule` < curdate() */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manager_employees`
--

/*!50001 DROP VIEW IF EXISTS `manager_employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manager_employees` AS select `E`.`EmployeeID` AS `ManagerEmployeeID`,group_concat(`Ei`.`EmployeeID` separator ',') AS `ManagedEmployeeIDs` from (`Employee` `E` left join `Employee` `Ei` on(`Ei`.`EmployeeID_e` = `E`.`EmployeeID`)) where `Ei`.`EmployeeID` is not null group by `E`.`EmployeeID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `participant_sales`
--

/*!50001 DROP VIEW IF EXISTS `participant_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `participant_sales` AS select `P`.`ParticipantID` AS `ParticipantID`,sum(`S`.`TotalValue`) AS `TotalSales` from (`Participant` `P` join `Sale` `S` on(`P`.`ParticipantID` = `S`.`ParticipantID_s`)) group by `P`.`ParticipantID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_supplier`
--

/*!50001 DROP VIEW IF EXISTS `product_supplier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_supplier` AS select `P`.`ProductID` AS `ProductID`,`PSP`.`SupplierID_psp` AS `PastSupplierID`,`PSF`.`SupplierID_psf` AS `FutureSupplierID` from ((`Product` `P` join `ProductSupplierPast` `PSP` on(`P`.`ProductID` = `PSP`.`ProductID_psp`)) join `ProductSupplierFuture` `PSF` on(`P`.`ProductID` = `PSF`.`ProductID_psf`)) group by `P`.`ProductID`,`PSP`.`SupplierID_psp`,`PSF`.`SupplierID_psf` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `purchase_history`
--

/*!50001 DROP VIEW IF EXISTS `purchase_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `purchase_history` AS select `P`.`ParticipantID` AS `ParticipantID`,`S`.`ReceiptNO` AS `ReceiptNO`,`S`.`DateOfSale` AS `PurchaseDate` from (`Sale` `S` join `Participant` `P` on(`S`.`ParticipantID_s` = `P`.`ParticipantID`)) group by `P`.`ParticipantID`,`S`.`ReceiptNO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_event_sale_value`
--

/*!50001 DROP VIEW IF EXISTS `total_event_sale_value`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_event_sale_value` AS select `EV`.`EventID` AS `EventID`,sum(`S`.`TotalValue`) AS `TotalValue` from (`EventCal` `EV` join `Sale` `S` on(`S`.`DateOfSale` between `EV`.`EventStart` and `EV`.`EventEnd`)) group by `EV`.`EventID` */;
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

-- Dump completed on 2024-01-15 13:12:19
