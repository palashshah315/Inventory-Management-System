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
-- Table structure for table `groovedfitting`
--

DROP TABLE IF EXISTS `groovedfitting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groovedfitting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `noofproduct` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groovedfitting`
--

LOCK TABLES `groovedfitting` WRITE;
/*!40000 ALTER TABLE `groovedfitting` DISABLE KEYS */;
INSERT INTO `groovedfitting` VALUES (1,'xyz','xyz','9'),(2,'abc','1','0'),(3,'pqr','1212','9');
/*!40000 ALTER TABLE `groovedfitting` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `thrededfitting`
--

DROP TABLE IF EXISTS `thrededfitting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thrededfitting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `noofproduct` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thrededfitting`
--

LOCK TABLES `thrededfitting` WRITE;
/*!40000 ALTER TABLE `thrededfitting` DISABLE KEYS */;
INSERT INTO `thrededfitting` VALUES (1,'90NF','1/8\"','73'),(2,'90NF','1/4\"','100'),(3,'90Nf','3/8\"','100'),(4,'90NF','1/2\"','100'),(5,'90NF','3/4\"','98'),(6,'90NF','1\"','88'),(7,'90NF','11/4\"','100'),(8,'90NF','11/2\"','100'),(9,'90NF','2\"','100'),(10,'90NF','21/2\"','100'),(11,'90NF','3\"','100'),(12,'90NF','4\"','100'),(13,'90','1/8\"','150'),(14,'90','1/4\"','100'),(15,'90 ','3/8\"','150'),(16,'90','1/2\"','150'),(17,'90','3/4\"','150'),(18,'90','1\"','150'),(19,'90','11/4\"','150'),(20,'90','11/2\"','150'),(21,'90','2\"','150'),(22,'90','21/2\"','150'),(23,'90','3\"','150'),(24,'90','4\"','150'),(25,'45','1/8\"','175'),(26,'45','1/4','175'),(27,'45','3/8','175'),(28,'45','1/2\"','175'),(29,'45','3/4\"','175'),(30,'45','1\"','175'),(31,'45','11/4\"','175'),(32,'45','11/2\"','175'),(33,'45','2\"','175'),(34,'45','21/2\"','175'),(35,'45','3\"','75'),(36,'45','4\"','175'),(37,'SLB','1/8\"','200'),(38,'SLB','1/4','200'),(39,'SLB','3/8','200'),(40,'SLB','1/2\"','200'),(41,'SLB','3/4\"','200'),(42,'SLB','1\"','200'),(43,'SLB','11/4\"','200'),(44,'SLB','11/2\"','200'),(45,'SLB','2\"','200'),(46,'SLB','21/2\"','200'),(47,'SLB','3\"','200'),(48,'SLB','4\"','200'),(49,'TEE NF','1/8\"','225'),(50,'TEE NF','1/4','225'),(51,'TEE NF','3/8','225'),(52,'TEE NF','1/2\"','225'),(53,'TEE NF','3/4\"','225'),(54,'TEE NF','1\"','225'),(55,'TEE NF','11/4\"','225'),(56,'TEE NF','11/2\"','225'),(57,'TEE NF','2\"','225'),(58,'TEE NF','21/2\"','225'),(59,'TEE NF','3\"','225'),(60,'TEE NF','4\"','225'),(61,'TEE','1/8\"','250'),(62,'TEE','1/4\"','250'),(63,'TEE','3/8\"','250'),(64,'TEE','1/2\"','250'),(65,'TEE','3/4\"','250'),(66,'TEE','1\"','250'),(67,'TEE','11/4\"','250'),(68,'TEE','11/2\"','250'),(69,'TEE','2\"','250'),(70,'TEE','21/2\"','250'),(71,'TEE','3\"','250'),(72,'TEE','4\"','250'),(73,'CROSS','1/8\"','275'),(74,'CROSS','1/4\"','275'),(75,'CROSS','3/8\"','275'),(76,'CROSS','1/2\"','275'),(77,'CROSS','3/4\"','275'),(78,'CROSS','1\"','275'),(79,'CROSS','11/4\"','275'),(80,'CROSS','11/2\"','275'),(81,'CROSS','2\"','275'),(82,'CROSS','21/2\"','275'),(83,'CROSS','3\"','275'),(84,'CROSS','4\"','275'),(85,'RD CAP','1/8\"','300'),(86,'RD CAP','1/4\"','300'),(87,'RD CAP','3/8\"','300'),(88,'RD CAP','1/2\"','300'),(89,'RD CAP','3/4\"','300'),(90,'RD CAP','1\"','300'),(91,'RD CAP','11/4\"','300'),(92,'RD CAP','11/2\"','300'),(93,'RD CAP','2\"','300'),(94,'RD CAP','21/2\"','300'),(95,'RD CAP','3\"','300'),(96,'RD CAP','4\"','300'),(97,'HEX CAP','1/8\"','325'),(98,'HEX CAP','1/4\"','325'),(99,'HEX CAP','3/8\"','325'),(100,'HEX CAP','1/2\"','325'),(101,'HEX CAP','3/4\"','325'),(102,'HEX CAP','1\"','325'),(103,'HEX CAP','11/4\"','325'),(104,'HEX CAP','11/2\"','325'),(105,'HEX CAP','2\"','325'),(106,'HEX CAP','21/2\"','325'),(107,'HEX CAP','3\"','325'),(108,'HEX CAP','4\"','325'),(109,'HEX NUT','1/8\"','350'),(110,'HEX NUT','1/4\"','350'),(111,'HEX NUT','3/8\"','350'),(112,'HEX NUT','1/2\"','350'),(113,'HEX NUT','3/4\"','350'),(114,'HEX NUT','1\"','350'),(115,'HEX NUT','11/4\"','350'),(116,'HEX NUT','11/2\"','350'),(117,'HEX NUT','2\"','350'),(118,'HEX NUT','21/2\"','350'),(119,'HEX NUT','3\"','350'),(120,'HEX NUT','4\"','350'),(121,'HEX NIPPLE','1/8\"','375'),(122,'HEX NIPPLE','1/4\"','375'),(123,'HEX NIPPLE','3/8\"','375'),(124,'HEX NIPPLE','1/2\"','375'),(125,'HEX NIPPLE','3/4\"','375'),(126,'HEX NIPPLE','1\"','375'),(127,'HEX NIPPLE','11/4\"','375'),(128,'HEX NIPPLE','11/2\"','375'),(129,'HEX NIPPLE','2\"','375'),(130,'HEX NIPPLE','21/2\"','375'),(131,'HEX NIPPLE','3\"','375'),(132,'HEX NIPPLE','4\"','375'),(133,'HEX PLUG','1/8\"','400'),(134,'HEX PLUG','1/4\"','400'),(135,'HEX PLUG','3/8\"','400'),(136,'HEX PLUG','1/2\"','400'),(137,'HEX PLUG','3/4\"','400'),(138,'HEX PLUG','1\"','400'),(139,'HEX PLUG','11/4\"','400'),(140,'HEX PLUG','11/2\"','400'),(141,'HEX PLUG','2\"','400'),(142,'HEX PLUG','21/2\"','400'),(143,'HEX PLUG','3\"','400'),(144,'HEX PLUG','4\"','400'),(145,'SQ PLUG','1/8\"','425'),(146,'SQ PLUG','1/4\"','425'),(147,'SQ PLUG','3/8\"','425'),(148,'SQ PLUG','1/2\"','425'),(149,'SQ PLUG','3/4\"','425'),(150,'SQ PLUG','1\"','425'),(151,'SQ PLUG','11/4\"','425'),(152,'SQ PLUG','11/2\"','425'),(153,'SQ PLUG','2\"','425'),(154,'SQ PLUG','21/2\"','425'),(155,'SQ PLUG','3\"','425'),(156,'SQ PLUG','4\"','425'),(157,'HOSE NIPPLE','1/8\"','500'),(158,'HOSE NIPPLE','1/4\"','500'),(159,'HOSE NIPPLE','3/8\"','500'),(160,'HOSE NIPPLE','1/2\"','500'),(161,'HOSE NIPPLE','3/4\"','500'),(162,'HOSE NIPPLE','1\"','500'),(163,'HOSE NIPPLE','11/4\"','500'),(164,'HOSE NIPPLE','11/2\"','500'),(165,'HOSE NIPPLE','2\"','500'),(166,'HOSE NIPPLE','21/2\"','500'),(167,'HOSE NIPPLE','3\"','500'),(168,'HOSE NIPPLE','4\"','500'),(169,'COUPLING','1/8\"','525'),(170,'COUPLING','1/4\"','525'),(171,'COUPLING','3/8\"','525'),(172,'COUPLING','1/2\"','525'),(173,'COUPLING','3/4\"','525'),(174,'COUPLING','1\"','525'),(175,'COUPLING','11/4\"','525'),(176,'COUPLING','11/2\"','525'),(177,'COUPLING','2\"','525'),(178,'COUPLING','21/2\"','525'),(179,'COUPLING','3\"','525'),(180,'COUPLING','4\"','525'),(181,'SOCKET NF','1/8\"','550'),(182,'SOCKET NF','1/4\"','550'),(183,'SOCKET NF','3/8\"','550'),(184,'SOCKET NF','1/2\"','550'),(185,'SOCKET NF','3/4\"','550'),(186,'SOCKET NF','1\"','550'),(187,'SOCKET NF','11/4\"','550'),(188,'SOCKET NF','11/2\"','550'),(189,'SOCKET NF','2\"','550'),(190,'SOCKET NF','21/2\"','550'),(191,'SOCKET NF','3\"','550'),(192,'SOCKET NF','4\"','550'),(193,'SOCKET','1/8\"','575'),(194,'SOCKET','1/4\"','575'),(195,'SOCKET','3/8\"','575'),(196,'SOCKET','1/2\"','575'),(197,'SOCKET','3/4\"','575'),(198,'SOCKET','1\"','575'),(199,'SOCKET','11/4\"','575'),(200,'SOCKET','11/2\"','575'),(201,'SOCKET','2\"','575'),(202,'SOCKET','21/2\"','575'),(203,'SOCKET','3\"','575'),(204,'SOCKET','4\"','575'),(205,'UNION','1/8\"','600'),(206,'UNION','1/4\"','600'),(207,'UNION','3/8\"','600'),(208,'UNION','1/2\"','600'),(209,'UNION','3/4\"','600'),(210,'UNION','1\"','600'),(211,'UNION','11/4\"','600'),(212,'UNION','11/2\"','600'),(213,'UNION','2\"','600'),(214,'UNION','21/2\"','600'),(215,'UNION','3\"','600'),(216,'UNION','4\"','600');
/*!40000 ALTER TABLE `thrededfitting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_firstname` varchar(100) DEFAULT NULL,
  `user_lastname` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phoneno` varchar(100) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `user_position` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `password_UNIQUE` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','admin@123','123456789','address','Admin','admin','admin'),(2,'Palash','Shah','palashshah345@gmail.com','+919913595735','9,divine park science city road behind jbr arcade','Employee','123','123'),(3,'Palash','Shah','palashshah.18.it@iite.indusuni.ac.in','+919913595735','9,divine park science city road behind jbr arcade','Employee',NULL,NULL),(4,'abc','xyz','asfn@ohio','0789798709','9,divine park science city road behind jbr arcade','iygi',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-07 12:42:17
