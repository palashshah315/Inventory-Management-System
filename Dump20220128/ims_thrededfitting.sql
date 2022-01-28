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
  `unitprice` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thrededfitting`
--

LOCK TABLES `thrededfitting` WRITE;
/*!40000 ALTER TABLE `thrededfitting` DISABLE KEYS */;
INSERT INTO `thrededfitting` VALUES (1,'90NF','1/8','100','50'),(2,'90NF','1/4','100','50'),(3,'90Nf','3/8','100','50'),(4,'90NF','1/2','90','50'),(5,'90NF','3/4','98','50'),(6,'90NF','1','88','50'),(7,'90NF','11/4','100','50'),(8,'90NF','11/2','100','50'),(9,'90NF','2','100','50'),(10,'90NF','21/2','100','50'),(11,'90NF','3','100','50'),(12,'90NF','4','100','50'),(13,'90','1/8','150','50'),(14,'90','1/4','100','50'),(15,'90 ','3/8','150','50'),(16,'90','1/2','130','50'),(17,'90','3/4','150','50'),(18,'90','1','150','50'),(19,'90','11/4','150','50'),(20,'90','11/2','150','50'),(21,'90','2','150','50'),(22,'90','21/2','150','50'),(23,'90','3','150','50'),(24,'90','4','150','50'),(25,'45','1/8','175','50'),(26,'45','1/4','175','50'),(27,'45','3/8','175','50'),(28,'45','1/2','175','50'),(29,'45','3/4','175','50'),(30,'45','1','175','50'),(31,'45','11/4','175','50'),(32,'45','11/2','175','50'),(33,'45','2','175','50'),(34,'45','21/2','175','50'),(35,'45','3','75','50'),(36,'45','4','175','50'),(37,'SLB','1/8','200','50'),(38,'SLB','1/4','200','50'),(39,'SLB','3/8','200','50'),(40,'SLB','1/2','200','50'),(41,'SLB','3/4','200','50'),(42,'SLB','1','200','50'),(43,'SLB','11/4','200','50'),(44,'SLB','11/2','200','50'),(45,'SLB','2','200','50'),(46,'SLB','21/2','200','50'),(47,'SLB','3','200','50'),(48,'SLB','4','200','50'),(49,'TEE NF','1/8','225','50'),(50,'TEE NF','1/4','225','50'),(51,'TEE NF','3/8','225','50'),(52,'TEE NF','1/2','225','50'),(53,'TEE NF','3/4','225','50'),(54,'TEE NF','1','225','50'),(55,'TEE NF','11/4','225','50'),(56,'TEE NF','11/2','225','50'),(57,'TEE NF','2','225','50'),(58,'TEE NF','21/2','225','50'),(59,'TEE NF','3','225','50'),(60,'TEE NF','4','225','50'),(61,'TEE','1/8','250','50'),(62,'TEE','1/4','250','50'),(63,'TEE','3/8','250','50'),(64,'TEE','1/2','250','50'),(65,'TEE','3/4','250','50'),(66,'TEE','1','250','50'),(67,'TEE','11/4','250','50'),(68,'TEE','11/2','250','50'),(69,'TEE','2','250','50'),(70,'TEE','21/2','250','50'),(71,'TEE','3','250','50'),(72,'TEE','4','250','50'),(73,'CROSS','1/8','275','50'),(74,'CROSS','1/4','275','50'),(75,'CROSS','3/8','275','50'),(76,'CROSS','1/2','275','50'),(77,'CROSS','3/4','275','50'),(78,'CROSS','1','275','50'),(79,'CROSS','11/4','275','50'),(80,'CROSS','11/2','275','50'),(81,'CROSS','2','275','50'),(82,'CROSS','21/2','275','50'),(83,'CROSS','3','275','50'),(84,'CROSS','4','275','50'),(85,'RD CAP','1/8','300','50'),(86,'RD CAP','1/4','300','50'),(87,'RD CAP','3/8','300','50'),(88,'RD CAP','1/2','300','50'),(89,'RD CAP','3/4','300','50'),(90,'RD CAP','1','300','50'),(91,'RD CAP','11/4','300','50'),(92,'RD CAP','11/2','300','50'),(93,'RD CAP','2','300','50'),(94,'RD CAP','21/2','300','50'),(95,'RD CAP','3','300','50'),(96,'RD CAP','4','300','50'),(97,'HEX CAP','1/8','325','50'),(98,'HEX CAP','1/4','325','50'),(99,'HEX CAP','3/8','325','50'),(100,'HEX CAP','1/2','325','50'),(101,'HEX CAP','3/4','325','50'),(102,'HEX CAP','1','325','50'),(103,'HEX CAP','11/4','325','50'),(104,'HEX CAP','11/2','325','50'),(105,'HEX CAP','2','325','50'),(106,'HEX CAP','21/2','325','50'),(107,'HEX CAP','3','325','50'),(108,'HEX CAP','4','325','50'),(109,'HEX NUT','1/8','350','50'),(110,'HEX NUT','1/4','350','50'),(111,'HEX NUT','3/8','350','50'),(112,'HEX NUT','1/2','350','50'),(113,'HEX NUT','3/4','350','50'),(114,'HEX NUT','1','350','50'),(115,'HEX NUT','11/4','350','50'),(116,'HEX NUT','11/2','350','50'),(117,'HEX NUT','2','350','50'),(118,'HEX NUT','21/2','350','50'),(119,'HEX NUT','3','350','50'),(120,'HEX NUT','4','350','50'),(121,'HEX NIPPLE','1/8','375','50'),(122,'HEX NIPPLE','1/4','375','50'),(123,'HEX NIPPLE','3/8','375','50'),(124,'HEX NIPPLE','1/2','375','50'),(125,'HEX NIPPLE','3/4','375','50'),(126,'HEX NIPPLE','1','375','50'),(127,'HEX NIPPLE','11/4','375','50'),(128,'HEX NIPPLE','11/2','375','50'),(129,'HEX NIPPLE','2','375','50'),(130,'HEX NIPPLE','21/2','375','50'),(131,'HEX NIPPLE','3','375','50'),(132,'HEX NIPPLE','4','375','50'),(133,'HEX PLUG','1/8','400','50'),(134,'HEX PLUG','1/4','400','50'),(135,'HEX PLUG','3/8','400','50'),(136,'HEX PLUG','1/2','400','50'),(137,'HEX PLUG','3/4','400','50'),(138,'HEX PLUG','1','400','50'),(139,'HEX PLUG','11/4','400','50'),(140,'HEX PLUG','11/2','400','50'),(141,'HEX PLUG','2','400','50'),(142,'HEX PLUG','21/2','400','50'),(143,'HEX PLUG','3','400','50'),(144,'HEX PLUG','4','400','50'),(145,'SQ PLUG','1/8','425','50'),(146,'SQ PLUG','1/4','425','50'),(147,'SQ PLUG','3/8','425','50'),(148,'SQ PLUG','1/2','425','50'),(149,'SQ PLUG','3/4','425','50'),(150,'SQ PLUG','1','425','50'),(151,'SQ PLUG','11/4','425','50'),(152,'SQ PLUG','11/2','425','50'),(153,'SQ PLUG','2','425','50'),(154,'SQ PLUG','21/2','425','50'),(155,'SQ PLUG','3','425','50'),(156,'SQ PLUG','4','425','50'),(157,'HOSE NIPPLE','1/8','500','50'),(158,'HOSE NIPPLE','1/4','500','50'),(159,'HOSE NIPPLE','3/8','500','50'),(160,'HOSE NIPPLE','1/2','500','50'),(161,'HOSE NIPPLE','3/4','500','50'),(162,'HOSE NIPPLE','1','500','50'),(163,'HOSE NIPPLE','11/4','500','50'),(164,'HOSE NIPPLE','11/2','500','50'),(165,'HOSE NIPPLE','2','500','50'),(166,'HOSE NIPPLE','21/2','500','50'),(167,'HOSE NIPPLE','3','500','50'),(168,'HOSE NIPPLE','4','500','50'),(169,'COUPLING','1/8','525','50'),(170,'COUPLING','1/4','525','50'),(171,'COUPLING','3/8','525','50'),(172,'COUPLING','1/2','525','50'),(173,'COUPLING','3/4','525','50'),(174,'COUPLING','1','525','50'),(175,'COUPLING','11/4','525','50'),(176,'COUPLING','11/2','525','50'),(177,'COUPLING','2','525','50'),(178,'COUPLING','21/2','525','50'),(179,'COUPLING','3','525','50'),(180,'COUPLING','4','525','50'),(181,'SOCKET NF','1/8','550','50'),(182,'SOCKET NF','1/4','550','50'),(183,'SOCKET NF','3/8','550','50'),(184,'SOCKET NF','1/2','550','50'),(185,'SOCKET NF','3/4','550','50'),(186,'SOCKET NF','1','550','50'),(187,'SOCKET NF','11/4','550','50'),(188,'SOCKET NF','11/2','550','50'),(189,'SOCKET NF','2','550','50'),(190,'SOCKET NF','21/2','550','50'),(191,'SOCKET NF','3','550','50'),(192,'SOCKET NF','4','550','50'),(193,'SOCKET','1/8','575','50'),(194,'SOCKET','1/4','575','50'),(195,'SOCKET','3/8','575','50'),(196,'SOCKET','1/2','575','50'),(197,'SOCKET','3/4','575','50'),(198,'SOCKET','1','575','50'),(199,'SOCKET','11/4','575','50'),(200,'SOCKET','11/2','575','50'),(201,'SOCKET','2','575','50'),(202,'SOCKET','21/2','575','50'),(203,'SOCKET','3','575','50'),(204,'SOCKET','4','575','50'),(205,'UNION','1/8','600','50'),(206,'UNION','1/4','600','50'),(207,'UNION','3/8','600','50'),(208,'UNION','1/2','600','50'),(209,'UNION','3/4','600','50'),(210,'UNION','1','600','50'),(211,'UNION','11/4','600','50'),(212,'UNION','11/2','600','50'),(213,'UNION','2','600','50'),(214,'UNION','21/2','600','50'),(215,'UNION','3','600','50'),(216,'UNION','4','600','50');
/*!40000 ALTER TABLE `thrededfitting` ENABLE KEYS */;
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
