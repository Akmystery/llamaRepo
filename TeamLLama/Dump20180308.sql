-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: llama
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `nric` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `nric_UNIQUE` (`nric`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'patient','GW','S999E','lala','lala@gmail.com','NTU',NULL),(2,'doctor','QJ','S666F','hoho','hoho@gmail.com','NTU',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `time` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `taken` tinyint(4) NOT NULL DEFAULT '0',
  `comments` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `accountIdd_idx` (`account_id`),
  KEY `facilityID_idx` (`facility_id`),
  KEY `departmentID_idx` (`department_id`),
  CONSTRAINT `accountID` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `departmentID` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `facilityID` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,1,1,'3.30','2018-03-05',1,NULL),(2,1,1,2,'4.20','2018-03-05',0,NULL),(3,1,1,3,'5.30','2018-03-07',0,NULL),(6,1,1,2,'10.30','2018-04-10',0,NULL),(8,1,1,1,'11.30','2018-04-11',0,NULL),(10,1,1,1,'6.30','2018-03-15',0,NULL),(11,1,1,1,'12.30','2018-04-01',0,NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) NOT NULL,
  `facility_id` int(11) NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `facilityId_idx` (`facility_id`),
  KEY `facilityIdd_idx` (`facility_id`),
  CONSTRAINT `facilityIdd` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'ER',1),(2,'Neuro',1),(3,'X Ray',1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_appointment`
--

DROP TABLE IF EXISTS `doctor_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_appointment` (
  `account_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_appointment`
--

LOCK TABLES `doctor_appointment` WRITE;
/*!40000 ALTER TABLE `doctor_appointment` DISABLE KEYS */;
INSERT INTO `doctor_appointment` VALUES (2,1);
/*!40000 ALTER TABLE `doctor_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `facility_id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_type` varchar(45) NOT NULL,
  `facility_name` varchar(100) NOT NULL,
  `generalInfo` varchar(200) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `openingHrs` varchar(45) NOT NULL,
  `closingHrs` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'HOSPITAL','JURONG COMMUNITY HOSPITAL','test',67162000,'test','test','1 JURONG EAST STREET 21\nSINGAPORE 609606','Jurong East',NULL),(2,'HOSPITAL','NG TENG FONG GENERAL HOSPITAL','test',67162000,'test','test','1 JURONG EAST STREET 21\nSINGAPORE 609606','Jurong East',NULL),(3,'HOSPITAL','WEST POINT HOSPITAL','test',62625858,'test','test','235 CORPORATION DRIVE\nSINGAPORE 619771','Jurong East',NULL),(4,'HOSPITAL','ST. LUKE\'S HOSPITAL','test',65632281,'test','test','2 BUKIT BATOK STREET 11\nSINGAPORE 659674','Bukit Batok',NULL),(5,'HOSPITAL','NATIONAL UNIVERSITY HOSPITAL','test',67795555,'test','test','5 LOWER KENT RIDGE ROAD\nSINGAPORE 119074','Clementi',NULL),(6,'HOSPITAL','NUH WARD @ SENJA','test',68879885,'test','test','21 SENJA ROAD, LEVEL 5\nPACIFIC HEALTHCARE NURSING HOME II\nSINGAPORE 677736','Bukit Panjang',NULL),(7,'HOSPITAL','GLENEAGLES HOSPITAL','test',64737222,'test','test','6A NAPIER ROAD\nSINGAPORE 258500','Holland',NULL),(8,'HOSPITAL','ALEXANDRA HOSPITAL','test',64722000,'test','test','378 ALEXANDRA ROAD\nSINGAPORE 159964','Bukit Merah',NULL),(9,'HOSPITAL','NATIONAL HEART CENTRE OF SINGAPORE','test',67048000,'test','test','5 HOSPITAL DRIVE\nSINGAPORE 169609','Bukit Merah',NULL),(10,'HOSPITAL','NUH WARD 2 AND WARD 3 @ ALEXANDRA','test',63793030,'test','test','378 ALEXANDRA ROAD\nALEXANDRA HOSPITAL\nSINGAPORE 159964','Bukit Merah',NULL),(11,'HOSPITAL','SINGAPORE GENERAL HOSPITAL','test',62223322,'test','test','- OUTRAM ROAD\nSINGAPORE 169608','Bukit Merah',NULL),(12,'HOSPITAL','RAFFLES HOSPITAL','test',63111111,'test','test','585 NORTH BRIDGE ROAD\nSINGAPORE 188770','Central',NULL),(13,'HOSPITAL','KK WOMEN\'S AND CHILDREN\'S HOSPITAL','test',62934044,'test','test','100 BUKIT TIMAH ROAD\nSINGAPORE 229899','Orchard',NULL),(14,'HOSPITAL','MOUNT ELIZABETH HOSPITAL','test',67372666,'test','test','3 MOUNT ELIZABETH\nSINGAPORE 228510','Orchard',NULL),(15,'HOSPITAL','CONCORD INTERNATIONAL HOSPITAL','test',69333733,'test','test','19 ADAM ROAD\nSINGAPORE 289891','Novena',NULL),(16,'HOSPITAL','MOUNT ELIZABETH NOVENA HOSPITAL','test',69330000,'test','test','38 IRRAWADDY ROAD\nSINGAPORE 329563','Novena',NULL),(17,'HOSPITAL','REN CI COMMUNITY HOSPITAL','test',63580777,'test','test','71 IRRAWADDY ROAD\nSINGAPORE 329562','Novena',NULL),(18,'HOSPITAL','TAN TOCK SENG HOSPITAL','test',62566011,'test','test','11 JALAN TAN TOCK SENG\nSINGAPORE 308433','Novena',NULL),(19,'HOSPITAL','TAN TOCK SENG HOSPITAL SUBACUTE WARDS','test',62566011,'test','test','71 IRRAWADDY ROAD\nREN CI COMMUNITY HOSPITAL (WARDS 6-10)\nSINGAPORE 329562','Novena',NULL),(20,'HOSPITAL','THOMSON MEDICAL CENTRE','test',62569494,'test','test','339 THOMSON ROAD\nSINGAPORE 307677','Novena',NULL),(21,'HOSPITAL','KHOO TECK PUAT HOSPITAL','test',65558000,'test','test','90 YISHUN CENTRAL\nSINGAPORE 768828','Yishun',NULL),(22,'HOSPITAL','ANG MO KIO - THYE HUA KWAN HOSPITAL','test',64538033,'test','test','17 ANG MO KIO AVE 9\nSINGAPORE 569766','Ang Mo Kio',NULL),(23,'HOSPITAL','TAN TOCK SENG HOSPITAL REHABILITATION CENTRE','test',64506228,'test','test','17 ANG MO KIO AVENUE 9\nANG MO KIO THYE HUA KWAN HOSPITAL\nSINGAPORE 569766','Ang Mo Kio',NULL),(24,'HOSPITAL','MOUNT ALVERNIA HOSPITAL','test',63476688,'test','test','820 THOMSON ROAD\nSINGAPORE 574623','Bishan',NULL),(25,'HOSPITAL','PARKWAY EAST HOSPITAL','test',63447588,'test','test','321 JOO CHIAT PLACE\nPARKWAY EAST HOSPITAL\nSINGAPORE 427990','Marina Parade',NULL),(26,'HOSPITAL','FARRER PARK HOSPITAL','test',63633737,'test','test','1 FARRER PARK STATION ROAD,\nCONNEXION (TO REFER TO LICENCE FOR UNIT NOS.)\nSINGAPORE 217562','Serangoon',NULL),(27,'HOSPITAL','BRIGHT VISION HOSPITAL','test',62485755,'test','test','5 LORONG NAPIRI\nSINGAPORE 547530','Sengkang/ Punggol',NULL),(28,'HOSPITAL','SINGAPORE GENERAL HOSPITAL REHABILITATION MEDICINE','test',62485755,'test','test','5 LORONG NAPIRI\nBRIGHT VISION HOSPITAL (LEVEL 2)\nSINGAPORE 547530','Sengkang/ Punggol',NULL),(29,'HOSPITAL','INSTITUTE OF MENTAL HEALTH / WOODBRIDGE HOSPITAL','test',63892000,'test','test','10 BUANGKOK VIEW\nSINGAPORE 539747','Hougang',NULL),(30,'HOSPITAL','CHANGI GENERAL HOSPITAL','test',67888833,'test','test','2 SIMEI STREET 3\nSINGAPORE 529889','Tampines',NULL),(31,'HOSPITAL','ST ANDREW\'S COMMUNITY HOSPITAL','test',65861000,'test','test','8 SIMEI STREET 3\nSINGAPORE 529895','Tampines',NULL),(32,'HOSPITAL','COMPLEX MEDICAL CENTRE','test',65467392,'test','test','982 UPPER CHANGI ROAD NORTH\nSINGAPORE 507709','Changi',NULL);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility_staff`
--

DROP TABLE IF EXISTS `facility_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility_staff` (
  `account_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility_staff`
--

LOCK TABLES `facility_staff` WRITE;
/*!40000 ALTER TABLE `facility_staff` DISABLE KEYS */;
INSERT INTO `facility_staff` VALUES (2,1);
/*!40000 ALTER TABLE `facility_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `account_id_idx` (`account_id`),
  KEY `facility_id_idx` (`facility_id`),
  CONSTRAINT `account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `facility_id` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08 22:22:25
