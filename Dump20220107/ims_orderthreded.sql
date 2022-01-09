-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: ims
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `orderthreded`
--

DROP TABLE IF EXISTS `orderthreded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderthreded` (
  `orderthrededid` int NOT NULL AUTO_INCREMENT,
  `productid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `userfirstname` varchar(45) DEFAULT NULL,
  `userlastname` varchar(45) DEFAULT NULL,
  `clientname` varchar(45) DEFAULT NULL,
  `clientaddress` varchar(45) DEFAULT NULL,
  `productname` varchar(45) DEFAULT NULL,
  `productsize` varchar(45) DEFAULT NULL,
  `productrequired` varchar(45) DEFAULT NULL,
  `totalproduct` varchar(45) DEFAULT NULL,
  `orderplaceddate` varchar(45) DEFAULT NULL,
  `orderplacedtime` varchar(45) DEFAULT NULL,
  `approveddate` varchar(45) DEFAULT NULL,
  `approvedtime` varchar(45) DEFAULT NULL,
  `orderstatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderthrededid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderthreded`
--

LOCK TABLES `orderthreded` WRITE;
/*!40000 ALTER TABLE `orderthreded` DISABLE KEYS */;
INSERT INTO `orderthreded` VALUES (1,1,2,'Palash','Shah',NULL,NULL,'b','1','10',NULL,NULL,NULL,NULL,NULL,NULL),(2,1,2,'Palash','Shah',NULL,NULL,'b','1','10',NULL,NULL,NULL,NULL,NULL,NULL),(3,1,2,'Palash','Shah',NULL,NULL,'b','1','50',NULL,NULL,NULL,NULL,NULL,NULL),(4,1,2,'Palash','Shah',NULL,NULL,'b','1','100',NULL,NULL,NULL,NULL,NULL,NULL),(5,1,2,'Palash','Shah',NULL,NULL,'b','1','35',NULL,NULL,NULL,NULL,NULL,NULL),(6,3,1,'admin','admin',NULL,NULL,'90Nf','3/8','90',NULL,NULL,NULL,NULL,NULL,NULL),(7,13,2,'Palash','Shah',NULL,NULL,'90','1/8','100',NULL,NULL,NULL,NULL,NULL,NULL),(8,1,2,'Palash','Shah',NULL,NULL,'90NF','1/8','100',NULL,NULL,NULL,NULL,NULL,NULL),(9,1,2,'Palash','Shah',NULL,NULL,'90NF','1/8','50',NULL,NULL,NULL,NULL,NULL,NULL),(10,2,1,'admin','admin',NULL,NULL,'90NF','1/4','40',NULL,NULL,NULL,NULL,NULL,NULL),(11,15,2,'Palash','Shah',NULL,NULL,'90 ','3/8','100',NULL,NULL,NULL,NULL,NULL,NULL),(12,1,2,'Palash','Shah',NULL,NULL,'90NF','1/8','100',NULL,NULL,NULL,NULL,NULL,NULL),(13,5,2,'Palash','Shah','hkbh','jhbgjyh','90NF','3/4','2','98',NULL,NULL,NULL,NULL,'pending'),(14,1,2,'Palash','Shah','xyz','none','90NF','1/8','12','88',NULL,NULL,NULL,NULL,'pending'),(15,14,2,'Palash','Shah','palash shah','address','90','1/4','50','100','2021-12-30','10:47:21','2022-1-5','17:35:7','Approved'),(16,35,1,'admin','admin','palash shah','address','45','3','100','75','2022-1-5','17:53:49','2022-1-5','18:7:2','Approved'),(17,1,2,'Palash','Shah','Harshika','add','90NF','1/8','2','73','2022-1-5','18:39:42',NULL,NULL,'pending');
/*!40000 ALTER TABLE `orderthreded` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-07 12:41:45
