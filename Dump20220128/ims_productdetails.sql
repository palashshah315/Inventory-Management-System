-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: ims
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `productdetails`
--

DROP TABLE IF EXISTS `productdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `noofproduct` varchar(100) DEFAULT NULL,
  `unitprice` varchar(45) DEFAULT NULL,
  `producttype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetails`
--

LOCK TABLES `productdetails` WRITE;
/*!40000 ALTER TABLE `productdetails` DISABLE KEYS */;
INSERT INTO `productdetails` VALUES (1,'90NF','1/8','100','50',NULL),(2,'90NF','1/4','100','50',NULL),(3,'90Nf','3/8','100','50',NULL),(4,'90NF','1/2','90','50',NULL),(5,'90NF','3/4','98','50',NULL),(6,'90NF','1','88','50',NULL),(7,'90NF','11/4','100','50',NULL),(8,'90NF','11/2','100','50',NULL),(9,'90NF','2','100','50',NULL),(10,'90NF','21/2','100','50',NULL),(11,'90NF','3','100','50',NULL),(12,'90NF','4','100','50',NULL),(13,'90','1/8','150','50',NULL),(14,'90','1/4','100','50',NULL),(15,'90 ','3/8','150','50',NULL),(16,'90','1/2','130','50',NULL),(17,'90','3/4','150','50',NULL),(18,'90','1','150','50',NULL),(19,'90','11/4','150','50',NULL),(20,'90','11/2','150','50',NULL),(21,'90','2','150','50',NULL),(22,'90','21/2','150','50',NULL),(23,'90','3','150','50',NULL),(24,'90','4','150','50',NULL),(25,'45','1/8','175','50',NULL),(26,'45','1/4','175','50',NULL),(27,'45','3/8','175','50',NULL),(28,'45','1/2','175','50',NULL),(29,'45','3/4','175','50',NULL),(30,'45','1','175','50',NULL),(31,'45','11/4','175','50',NULL),(32,'45','11/2','175','50',NULL),(33,'45','2','175','50',NULL),(34,'45','21/2','175','50',NULL),(35,'45','3','75','50',NULL),(36,'45','4','175','50',NULL),(37,'SLB','1/8','200','50',NULL),(38,'SLB','1/4','200','50',NULL),(39,'SLB','3/8','200','50',NULL),(40,'SLB','1/2','200','50',NULL),(41,'SLB','3/4','200','50',NULL),(42,'SLB','1','200','50',NULL),(43,'SLB','11/4','200','50',NULL),(44,'SLB','11/2','200','50',NULL),(45,'SLB','2','200','50',NULL),(46,'SLB','21/2','200','50',NULL),(47,'SLB','3','200','50',NULL),(48,'SLB','4','200','50',NULL),(49,'TEE NF','1/8','225','50',NULL),(50,'TEE NF','1/4','225','50',NULL),(51,'TEE NF','3/8','225','50',NULL),(52,'TEE NF','1/2','225','50',NULL),(53,'TEE NF','3/4','225','50',NULL),(54,'TEE NF','1','225','50',NULL),(55,'TEE NF','11/4','225','50',NULL),(56,'TEE NF','11/2','225','50',NULL),(57,'TEE NF','2','225','50',NULL),(58,'TEE NF','21/2','225','50',NULL),(59,'TEE NF','3','225','50',NULL),(60,'TEE NF','4','225','50',NULL),(61,'TEE','1/8','250','50',NULL),(62,'TEE','1/4','250','50',NULL),(63,'TEE','3/8','250','50',NULL),(64,'TEE','1/2','250','50',NULL),(65,'TEE','3/4','250','50',NULL),(66,'TEE','1','250','50',NULL),(67,'TEE','11/4','250','50',NULL),(68,'TEE','11/2','250','50',NULL),(69,'TEE','2','250','50',NULL),(70,'TEE','21/2','250','50',NULL),(71,'TEE','3','250','50',NULL),(72,'TEE','4','250','50',NULL),(73,'CROSS','1/8','275','50',NULL),(74,'CROSS','1/4','275','50',NULL),(75,'CROSS','3/8','275','50',NULL),(76,'CROSS','1/2','275','50',NULL),(77,'CROSS','3/4','275','50',NULL),(78,'CROSS','1','275','50',NULL),(79,'CROSS','11/4','275','50',NULL),(80,'CROSS','11/2','275','50',NULL),(81,'CROSS','2','275','50',NULL),(82,'CROSS','21/2','275','50',NULL),(83,'CROSS','3','275','50',NULL),(84,'CROSS','4','275','50',NULL),(85,'RD CAP','1/8','300','50',NULL),(86,'RD CAP','1/4','300','50',NULL),(87,'RD CAP','3/8','300','50',NULL),(88,'RD CAP','1/2','300','50',NULL),(89,'RD CAP','3/4','300','50',NULL),(90,'RD CAP','1','300','50',NULL),(91,'RD CAP','11/4','300','50',NULL),(92,'RD CAP','11/2','300','50',NULL),(93,'RD CAP','2','300','50',NULL),(94,'RD CAP','21/2','300','50',NULL),(95,'RD CAP','3','300','50',NULL),(96,'RD CAP','4','300','50',NULL),(97,'HEX CAP','1/8','325','50',NULL),(98,'HEX CAP','1/4','325','50',NULL),(99,'HEX CAP','3/8','325','50',NULL),(100,'HEX CAP','1/2','325','50',NULL),(101,'HEX CAP','3/4','325','50',NULL),(102,'HEX CAP','1','325','50',NULL),(103,'HEX CAP','11/4','325','50',NULL),(104,'HEX CAP','11/2','325','50',NULL),(105,'HEX CAP','2','325','50',NULL),(106,'HEX CAP','21/2','325','50',NULL),(107,'HEX CAP','3','325','50',NULL),(108,'HEX CAP','4','325','50',NULL),(109,'HEX NUT','1/8','350','50',NULL),(110,'HEX NUT','1/4','350','50',NULL),(111,'HEX NUT','3/8','350','50',NULL),(112,'HEX NUT','1/2','350','50',NULL),(113,'HEX NUT','3/4','350','50',NULL),(114,'HEX NUT','1','350','50',NULL),(115,'HEX NUT','11/4','350','50',NULL),(116,'HEX NUT','11/2','350','50',NULL),(117,'HEX NUT','2','350','50',NULL),(118,'HEX NUT','21/2','350','50',NULL),(119,'HEX NUT','3','350','50',NULL),(120,'HEX NUT','4','350','50',NULL),(121,'HEX NIPPLE','1/8','375','50',NULL),(122,'HEX NIPPLE','1/4','375','50',NULL),(123,'HEX NIPPLE','3/8','375','50',NULL),(124,'HEX NIPPLE','1/2','375','50',NULL),(125,'HEX NIPPLE','3/4','375','50',NULL),(126,'HEX NIPPLE','1','375','50',NULL),(127,'HEX NIPPLE','11/4','375','50',NULL),(128,'HEX NIPPLE','11/2','375','50',NULL),(129,'HEX NIPPLE','2','375','50',NULL),(130,'HEX NIPPLE','21/2','375','50',NULL),(131,'HEX NIPPLE','3','375','50',NULL),(132,'HEX NIPPLE','4','375','50',NULL),(133,'HEX PLUG','1/8','400','50',NULL),(134,'HEX PLUG','1/4','400','50',NULL),(135,'HEX PLUG','3/8','400','50',NULL),(136,'HEX PLUG','1/2','400','50',NULL),(137,'HEX PLUG','3/4','400','50',NULL),(138,'HEX PLUG','1','400','50',NULL),(139,'HEX PLUG','11/4','400','50',NULL),(140,'HEX PLUG','11/2','400','50',NULL),(141,'HEX PLUG','2','400','50',NULL),(142,'HEX PLUG','21/2','400','50',NULL),(143,'HEX PLUG','3','400','50',NULL),(144,'HEX PLUG','4','400','50',NULL),(145,'SQ PLUG','1/8','425','50',NULL),(146,'SQ PLUG','1/4','425','50',NULL),(147,'SQ PLUG','3/8','425','50',NULL),(148,'SQ PLUG','1/2','425','50',NULL),(149,'SQ PLUG','3/4','425','50',NULL),(150,'SQ PLUG','1','425','50',NULL),(151,'SQ PLUG','11/4','425','50',NULL),(152,'SQ PLUG','11/2','425','50',NULL),(153,'SQ PLUG','2','425','50',NULL),(154,'SQ PLUG','21/2','425','50',NULL),(155,'SQ PLUG','3','425','50',NULL),(156,'SQ PLUG','4','425','50',NULL),(157,'HOSE NIPPLE','1/8','500','50',NULL),(158,'HOSE NIPPLE','1/4','500','50',NULL),(159,'HOSE NIPPLE','3/8','500','50',NULL),(160,'HOSE NIPPLE','1/2','500','50',NULL),(161,'HOSE NIPPLE','3/4','500','50',NULL),(162,'HOSE NIPPLE','1','500','50',NULL),(163,'HOSE NIPPLE','11/4','500','50',NULL),(164,'HOSE NIPPLE','11/2','500','50',NULL),(165,'HOSE NIPPLE','2','500','50',NULL),(166,'HOSE NIPPLE','21/2','500','50',NULL),(167,'HOSE NIPPLE','3','500','50',NULL),(168,'HOSE NIPPLE','4','500','50',NULL),(169,'COUPLING','1/8','525','50',NULL),(170,'COUPLING','1/4','525','50',NULL),(171,'COUPLING','3/8','525','50',NULL),(172,'COUPLING','1/2','525','50',NULL),(173,'COUPLING','3/4','525','50',NULL),(174,'COUPLING','1','525','50',NULL),(175,'COUPLING','11/4','525','50',NULL),(176,'COUPLING','11/2','525','50',NULL),(177,'COUPLING','2','525','50',NULL),(178,'COUPLING','21/2','525','50',NULL),(179,'COUPLING','3','525','50',NULL),(180,'COUPLING','4','525','50',NULL),(181,'SOCKET NF','1/8','550','50',NULL),(182,'SOCKET NF','1/4','550','50',NULL),(183,'SOCKET NF','3/8','550','50',NULL),(184,'SOCKET NF','1/2','550','50',NULL),(185,'SOCKET NF','3/4','550','50',NULL),(186,'SOCKET NF','1','550','50',NULL),(187,'SOCKET NF','11/4','550','50',NULL),(188,'SOCKET NF','11/2','550','50',NULL),(189,'SOCKET NF','2','550','50',NULL),(190,'SOCKET NF','21/2','550','50',NULL),(191,'SOCKET NF','3','550','50',NULL),(192,'SOCKET NF','4','550','50',NULL),(193,'SOCKET','1/8','575','50',NULL),(194,'SOCKET','1/4','575','50',NULL),(195,'SOCKET','3/8','575','50',NULL),(196,'SOCKET','1/2','575','50',NULL),(197,'SOCKET','3/4','575','50',NULL),(198,'SOCKET','1','575','50',NULL),(199,'SOCKET','11/4','575','50',NULL),(200,'SOCKET','11/2','575','50',NULL),(201,'SOCKET','2','575','50',NULL),(202,'SOCKET','21/2','575','50',NULL),(203,'SOCKET','3','575','50',NULL),(204,'SOCKET','4','575','50',NULL),(205,'UNION','1/8','600','50',NULL),(206,'UNION','1/4','600','50',NULL),(207,'UNION','3/8','600','50',NULL),(208,'UNION','1/2','600','50',NULL),(209,'UNION','3/4','600','50',NULL),(210,'UNION','1','600','50',NULL),(211,'UNION','11/4','600','50',NULL),(212,'UNION','11/2','600','50',NULL),(213,'UNION','2','600','50',NULL),(214,'UNION','21/2','600','50',NULL),(215,'UNION','3','600','50',NULL),(216,'UNION','4','600','50',NULL);
/*!40000 ALTER TABLE `productdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-02 19:59:03
