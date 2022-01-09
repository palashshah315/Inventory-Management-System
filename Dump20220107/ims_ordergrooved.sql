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
-- Table structure for table `ordergrooved`
--

DROP TABLE IF EXISTS `ordergrooved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordergrooved` (
  `ordergrooveid` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`ordergrooveid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordergrooved`
--

LOCK TABLES `ordergrooved` WRITE;
/*!40000 ALTER TABLE `ordergrooved` DISABLE KEYS */;
INSERT INTO `ordergrooved` VALUES (13,1,1,'admin','admin',NULL,NULL,'xyz','xyz','12',NULL,NULL,NULL,NULL,NULL,'pending'),(14,2,2,'Palash','Shah','gagi','vdfvzdfvdc','abc','1','2','10',NULL,NULL,NULL,NULL,'pending'),(15,1,2,'Palash','Shah','33sfr','dfdfvzdfvcvz','xyz','xyz','22','12',NULL,NULL,NULL,NULL,'pending'),(16,1,2,'Palash','Shah','undefined','undefined','xyz','xyz','undefined','12',NULL,NULL,NULL,NULL,'pending'),(17,3,2,'Palash','Shah','sdsgfs','fdzfbvdfvb','pqr','1212','4','12',NULL,NULL,NULL,NULL,'pending'),(18,3,2,'Palash','Shah','dfzdfbzdbf','vbxcv bxcb','pqr','1212','10','12',NULL,NULL,NULL,NULL,'pending'),(19,1,2,'Palash','Shah','dfdfbv','jhjgjhb,jh','xyz','xyz','10','2',NULL,NULL,NULL,NULL,'pending'),(20,1,2,'Palash','Shah','cvnzdfjkzd','mbvj,hjyv','xyz','xyz','10','2',NULL,NULL,NULL,NULL,'pending'),(21,2,2,'Palash','Shah','vdkvbjhdv','fbdzffvbsfdbsfg','abc','1','3','7',NULL,NULL,NULL,NULL,'pending'),(22,2,2,'Palash','Shah','dksdnv','xvxcbk jnxvk','abc','1','10','10',NULL,NULL,NULL,NULL,'pending'),(23,2,2,'Palash','Shah','zmvns','kjfbvdsv','abc','1','6','4',NULL,NULL,'2022-1-5','17:36:13','Approved'),(24,3,2,'Palash','Shah','ffnvnfd','jdfnbkjd','pqr','1212','1','9','2021-12-30','10:55:46','2022-1-5','17:35:25','Approved');
/*!40000 ALTER TABLE `ordergrooved` ENABLE KEYS */;
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
