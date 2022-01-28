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
  `clientemail` varchar(45) DEFAULT NULL,
  `productname` varchar(45) DEFAULT NULL,
  `productsize` varchar(45) DEFAULT NULL,
  `productrequired` varchar(45) DEFAULT NULL,
  `totalproduct` varchar(45) DEFAULT NULL,
  `totalprice` varchar(45) DEFAULT NULL,
  `orderplaceddate` varchar(45) DEFAULT NULL,
  `orderplacedtime` varchar(45) DEFAULT NULL,
  `approveddate` varchar(45) DEFAULT NULL,
  `approvedtime` varchar(45) DEFAULT NULL,
  `orderstatus` varchar(45) DEFAULT NULL,
  `invoicestatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderthrededid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderthreded`
--

LOCK TABLES `orderthreded` WRITE;
/*!40000 ALTER TABLE `orderthreded` DISABLE KEYS */;
INSERT INTO `orderthreded` VALUES (32,69,1,'admin','admin','palash shah','address','palashshah345@gmail.com','TEE','2','270','250','13500','2022-1-28','18:36:41','2022-1-28','18:37:53','Approved','generated');
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

-- Dump completed on 2022-01-28 22:38:48
