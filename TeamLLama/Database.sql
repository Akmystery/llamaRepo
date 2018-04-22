-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: llama
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (4,'admin','Ak','Admin','admin','admin@mail.com','NTU',NULL),(24,'patient','Arkar Min','G123456N','arkar','arkar@gmail.com','Choa Chu Kang','flip.jpg'),(25,'Doctor','Doctor','Doctor','doctor','doctor@email.com','NTU',NULL),(26,'patient','Power Ranger','A123','A','arkar@gmail.com','NTU','flip.jpg'),(27,'Doctor','Doctor Doggy','D1234','d','doggy@dogmail.com','NTU',NULL),(29,'Doctor','Doctor Doggy','D12345','dog','doggy@dogmail.com','NTU','flip.jpg'),(31,'Doctor','Doctor Llama','G123','dog','doggy@dogmail.com','NTU','flip.jpg'),(33,'Doctor','Arkar Min','123','1','doggy@dogmail.com','NTU','flip.jpg');
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
  `time` time NOT NULL,
  `date` date NOT NULL,
  `taken` tinyint(4) NOT NULL DEFAULT '0',
  `comments` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (58,28,1,1,'21:00:00','2018-04-20',0,'Nil'),(60,30,1,1,'21:00:00','2018-04-20',0,'Nil'),(61,26,1,1,'09:00:00','2018-04-20',0,'Referral - Back pain issue'),(63,32,1,1,'21:00:00','2018-04-20',0,'Nil'),(64,24,1,1,'09:00:00','2018-04-20',0,'Referral - back pain');
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'ER',1),(2,'Neuro',1),(3,'X Ray',1),(14,'Anaesthesiology',35),(15,'Cardiology',35),(16,'Colorectal',35),(17,'Dermatology',35),(18,'Neuro',35),(19,'Orthopaedic',35),(20,'Psychiatry',35),(21,'Urology',35),(22,'X Ray',35),(33,'Anaesthesiology',37),(34,'Colorectal',37),(35,'Dermatology',37),(36,'ER',37),(37,'Neuro',37),(38,'Orthopaedic',37),(39,'Psychiatry',37),(40,'Urology',37),(41,'X Ray',37);
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
  `openingHrs` time NOT NULL,
  `closingHrs` time NOT NULL,
  `address` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `x` decimal(15,10) DEFAULT NULL,
  `y` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'Government Hospital','JURONG COMMUNITY HOSPITAL','The Jurong Community Hospital is a 400-bed community hospital in Jurong East, Singapore.',67162000,'08:00:00','22:00:00','1 JURONG EAST STREET 21\nSINGAPORE 609606','Jurong East','Jurong_Community_Hospital.jpg',18353.0128118899,34978.8672476765),(2,'Government Hospital','NG TENG FONG GENERAL HOSPITAL','Ng Teng Fong General Hospital is a 700-bed hospital located in Jurong East, Singapore.',67162000,'08:00:00','22:00:00','1 JURONG EAST STREET 21\nSINGAPORE 609606','Jurong East','NTFGHJCHoverview.jpg',18351.6424289271,34987.5133274924),(3,'Government Hospital','WEST POINT HOSPITAL','West Point Hospital is a private hospital in Singapore.',62625858,'08:00:00','22:00:00','235 CORPORATION DRIVE\nSINGAPORE 619771','Jurong East','west-point-hospital-1338453484-300x207.jpg',15723.3542679707,34809.0880128741),(4,'Government Hospital','ST. LUKE\'S HOSPITAL','St Luke\'s Hospital is a community hospital in Singapore that provides professional healthcare services.',65632281,'08:00:00','22:00:00','2 BUKIT BATOK STREET 11\nSINGAPORE 659674','Bukit Batok','large_St-Lukes-Medical-Center-Global-City.jpg',17857.5527661396,36857.6626226231),(5,'Government Hospital','NATIONAL UNIVERSITY HOSPITAL','The National University Hospital was established in 1985 and it serves as a tertiary hospital',67795555,'08:00:00','22:00:00','5 LOWER KENT RIDGE ROAD\nSINGAPORE 119074','Clementi','nuh.jpg',22436.1329117399,30913.3535496667),(6,'HOSPITAL','NUH WARD @ SENJA','test',68879885,'08:00:00','22:00:00','21 SENJA ROAD, LEVEL 5\nPACIFIC HEALTHCARE NURSING HOME II\nSINGAPORE 677736','Bukit Panjang',NULL,19913.8984688325,40525.4263810758),(7,'HOSPITAL','GLENEAGLES HOSPITAL','test',64737222,'08:00:00','22:00:00','6A NAPIER ROAD\nSINGAPORE 258500','Holland',NULL,26473.8079344062,32194.2601453476),(8,'HOSPITAL','ALEXANDRA HOSPITAL','test',64722000,'08:00:00','22:00:00','378 ALEXANDRA ROAD\nSINGAPORE 159964','Bukit Merah',NULL,24230.1388260433,30059.5536596086),(9,'HOSPITAL','NATIONAL HEART CENTRE OF SINGAPORE','test',67048000,'08:00:00','22:00:00','5 HOSPITAL DRIVE\nSINGAPORE 169609','Bukit Merah',NULL,28311.7143506855,29004.4666230790),(11,'HOSPITAL','SINGAPORE GENERAL HOSPITAL','test',62223322,'08:00:00','22:00:00','- OUTRAM ROAD\nSINGAPORE 169608','Bukit Merah',NULL,28247.4225502228,29122.0344940089),(12,'HOSPITAL','RAFFLES HOSPITAL','test',63111111,'08:00:00','22:00:00','585 NORTH BRIDGE ROAD\nSINGAPORE 188770','Central',NULL,30687.3347061081,31503.5739352554),(13,'HOSPITAL','KK WOMEN\'S AND CHILDREN\'S HOSPITAL','test',62934044,'08:00:00','22:00:00','100 BUKIT TIMAH ROAD\nSINGAPORE 229899','Orchard',NULL,29499.5317927133,32531.4363127593),(14,'HOSPITAL','MOUNT ELIZABETH HOSPITAL','test',67372666,'08:00:00','22:00:00','3 MOUNT ELIZABETH\nSINGAPORE 228510','Orchard',NULL,28236.0209034365,31944.0563655663),(15,'HOSPITAL','CONCORD INTERNATIONAL HOSPITAL','test',69333733,'08:00:00','22:00:00','19 ADAM ROAD\nSINGAPORE 289891','Novena',NULL,25774.1583452234,34336.6009127442),(16,'HOSPITAL','MOUNT ELIZABETH NOVENA HOSPITAL','test',69330000,'08:00:00','22:00:00','38 IRRAWADDY ROAD\nSINGAPORE 329563','Novena',NULL,29213.9156221645,33821.7679953557),(17,'HOSPITAL','REN CI COMMUNITY HOSPITAL','test',63580777,'08:00:00','22:00:00','71 IRRAWADDY ROAD\nSINGAPORE 329562','Novena',NULL,29409.4670159910,33903.9875528421),(18,'HOSPITAL','TAN TOCK SENG HOSPITAL','test',62566011,'08:00:00','22:00:00','11 JALAN TAN TOCK SENG\nSINGAPORE 308433','Novena',NULL,29378.7663514465,33736.2725945283),(19,'HOSPITAL','TAN TOCK SENG HOSPITAL SUBACUTE WARDS','test',62566011,'08:00:00','22:00:00','71 IRRAWADDY ROAD\nREN CI COMMUNITY HOSPITAL (WARDS 6-10)\nSINGAPORE 329562','Novena',NULL,29409.4670159910,33903.9875528421),(20,'HOSPITAL','THOMSON MEDICAL CENTRE','test',62569494,'08:00:00','22:00:00','339 THOMSON ROAD\nSINGAPORE 307677','Novena',NULL,28905.8288939884,34177.1645506583),(21,'HOSPITAL','KHOO TECK PUAT HOSPITAL','test',65558000,'08:00:00','22:00:00','90 YISHUN CENTRAL\nSINGAPORE 768828','Yishun',NULL,28585.3954012338,45093.1608724836),(22,'HOSPITAL','ANG MO KIO - THYE HUA KWAN HOSPITAL','test',64538033,'08:00:00','22:00:00','17 ANG MO KIO AVE 9\nSINGAPORE 569766','Ang Mo Kio',NULL,28783.2767033754,40664.7969768401),(23,'HOSPITAL','TAN TOCK SENG HOSPITAL REHABILITATION CENTRE','test',64506228,'08:00:00','22:00:00','17 ANG MO KIO AVENUE 9\nANG MO KIO THYE HUA KWAN HOSPITAL\nSINGAPORE 569766','Ang Mo Kio',NULL,28783.2767033754,40664.7969768401),(24,'HOSPITAL','MOUNT ALVERNIA HOSPITAL','test',63476688,'08:00:00','22:00:00','820 THOMSON ROAD\nSINGAPORE 574623','Bishan',NULL,28476.6902078120,35997.4666535873),(25,'HOSPITAL','PARKWAY EAST HOSPITAL','test',63447588,'08:00:00','22:00:00','321 JOO CHIAT PLACE\nPARKWAY EAST HOSPITAL\nSINGAPORE 427990','Marina Parade',NULL,36395.5561393853,33041.4194516540),(26,'HOSPITAL','FARRER PARK HOSPITAL','test',63633737,'08:00:00','22:00:00','1 FARRER PARK STATION ROAD,\nCONNEXION (TO REFER TO LICENCE FOR UNIT NOS.)\nSINGAPORE 217562','Serangoon',NULL,30284.0821379144,32783.4910100140),(27,'HOSPITAL','BRIGHT VISION HOSPITAL','test',62485755,'08:00:00','22:00:00','5 LORONG NAPIRI\nSINGAPORE 547530','Sengkang/ Punggol',NULL,32975.9633326605,39338.4436997715),(28,'HOSPITAL','SINGAPORE GENERAL HOSPITAL REHABILITATION MEDICINE','test',62485755,'08:00:00','22:00:00','5 LORONG NAPIRI\nBRIGHT VISION HOSPITAL (LEVEL 2)\nSINGAPORE 547530','Sengkang/ Punggol',NULL,32975.9633326605,39338.4436997715),(29,'HOSPITAL','INSTITUTE OF MENTAL HEALTH / WOODBRIDGE HOSPITAL','test',63892000,'08:00:00','22:00:00','10 BUANGKOK VIEW\nSINGAPORE 539747','Hougang',NULL,33894.9019819004,40406.6864430122),(30,'HOSPITAL','CHANGI GENERAL HOSPITAL','test',67888833,'08:00:00','22:00:00','2 SIMEI STREET 3\nSINGAPORE 529889','Tampines',NULL,40925.9058268676,35887.5367570072),(31,'HOSPITAL','ST ANDREW\'S COMMUNITY HOSPITAL','test',65861000,'08:00:00','22:00:00','8 SIMEI STREET 3\nSINGAPORE 529895','Tampines',NULL,40851.7805941235,35982.6963618211),(32,'HOSPITAL','COMPLEX MEDICAL CENTRE','test',65467392,'08:00:00','22:00:00','982 UPPER CHANGI ROAD NORTH\nSINGAPORE 507709','Changi',NULL,43351.9541565627,37904.0259419587),(33,'Government Hospital','NANYANG TECHNOLOGICAL UNIVERSITY','test',999,'23:30:00','01:30:00','71 NANYANG CRESCENT NANYANG TECHNOLOGICAL UNIVERSITY SINGAPORE 637035','Jurong','genimage.jpg',11987.8813326228,37375.6961976811),(35,'Government Hospital','SINGAPORE GENERAL HOSPITAL (BLK 6)','This is a hospital',123455,'05:30:00','21:00:00','1 HOSPITAL DRIVE SINGAPORE GENERAL HOSPITAL (BLK 6) SINGAPORE 169608','Kent Ridge','Hospital.jpg',28164.9011604041,29171.5993767250),(37,'Government Hospital','YISHUN COMMUNITY HOSPITAL','This is hospital',34234,'00:00:00','00:00:00','2 YISHUN CENTRAL 2 YISHUN COMMUNITY HOSPITAL SINGAPORE 768024','Yishun','Hospital.jpg',28436.6428504316,45058.4885339197);
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
INSERT INTO `facility_staff` VALUES (6,1),(8,1),(11,1),(13,1),(15,1),(18,1),(23,1),(25,1),(27,1),(29,1),(31,1),(33,1);
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
  KEY `facility_id_idx` (`facility_id`),
  CONSTRAINT `facility_id` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,4,'This is a very good hospital',3,4),(2,5,'This is a good place',3,33),(4,4,'A',7,2),(5,5,'Very Good',7,2),(6,5,'The best hospital ever',7,2),(7,5,'The best of the best',7,3),(8,4,'Great! Dog like it',9,1),(9,5,'Excellent',0,1),(10,5,'Excellent!!!!!!!!',0,1),(11,5,'EXCELlente!',0,1),(12,5,'WOoof',0,1),(13,4,'sdf',17,1),(14,5,'HI',1,1),(15,1,'TRASH',20,1),(16,5,'AAsds',0,1),(17,5,'AAA',21,1),(18,5,'Hi!!!!!!!!!',22,1),(19,5,'Best',28,1),(20,5,'five star',30,1),(21,5,'Best Hospital EVer!',32,1);
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

-- Dump completed on 2018-04-22 17:03:56
