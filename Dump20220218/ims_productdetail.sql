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
-- Table structure for table `productdetail`
--

DROP TABLE IF EXISTS `productdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `noofproduct` varchar(100) DEFAULT NULL,
  `unitprice` varchar(45) DEFAULT NULL,
  `producttype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetail`
--

LOCK TABLES `productdetail` WRITE;
/*!40000 ALTER TABLE `productdetail` DISABLE KEYS */;
INSERT INTO `productdetail` VALUES (1,'90NF','1/8','100','50','Threded Fitting'),(2,'90NF','1/4','100','50','Threded Fitting'),(3,'90Nf','3/8','100','50','Threded Fitting'),(4,'90NF','1/2','90','50','Threded Fitting'),(5,'90NF','3/4','98','50','Threded Fitting'),(6,'90NF','1','88','50','Threded Fitting'),(7,'90NF','11/4','100','50','Threded Fitting'),(8,'90NF','11/2','100','50','Threded Fitting'),(9,'90NF','2','100','50','Threded Fitting'),(10,'90NF','21/2','100','50','Threded Fitting'),(11,'90NF','3','100','50','Threded Fitting'),(12,'90NF','4','100','50','Threded Fitting'),(13,'90','1/8','150','50','Threded Fitting'),(14,'90','1/4','100','50','Threded Fitting'),(15,'90 ','3/8','150','50','Threded Fitting'),(16,'90','1/2','130','50','Threded Fitting'),(17,'90','3/4','150','50','Threded Fitting'),(18,'90','1','150','50','Threded Fitting'),(19,'90','11/4','150','50','Threded Fitting'),(20,'90','11/2','150','50','Threded Fitting'),(21,'90','2','150','50','Threded Fitting'),(22,'90','21/2','150','50','Threded Fitting'),(23,'90','3','150','50','Threded Fitting'),(24,'90','4','150','50','Threded Fitting'),(25,'45','1/8','175','50','Threded Fitting'),(26,'45','1/4','175','50','Grooved Fitting'),(27,'45','3/8','175','50','Grooved Fitting'),(28,'45','1/2','175','50','Grooved Fitting'),(29,'45','3/4','175','50','Grooved Fitting'),(30,'45','1','175','50','Grooved Fitting'),(31,'45','11/4','175','50','Grooved Fitting'),(32,'45','11/2','175','50','Grooved Fitting'),(33,'45','2','175','50','Grooved Fitting'),(34,'45','21/2','175','50','Grooved Fitting'),(35,'45','3','75','50','Grooved Fitting'),(36,'45','4','175','50','Grooved Fitting'),(37,'SLB','1/8','200','50','Grooved Fitting'),(38,'SLB','1/4','200','50','Grooved Fitting'),(39,'SLB','3/8','200','50','Grooved Fitting'),(40,'SLB','1/2','200','50','Grooved Fitting'),(41,'SLB','3/4','200','50','Grooved Fitting'),(42,'SLB','1','200','50','Grooved Fitting'),(43,'SLB','11/4','200','50','Grooved Fitting'),(44,'SLB','11/2','200','50','Grooved Fitting'),(45,'SLB','2','200','50','Grooved Fitting'),(46,'SLB','21/2','200','50','Grooved Fitting'),(47,'SLB','3','200','50','Grooved Fitting'),(48,'SLB','4','200','50','Grooved Fitting'),(49,'TEE NF','1/8','225','50','Grooved Fitting'),(50,'TEE NF','1/4','225','50','Grooved Fitting'),(288,'demoproduct','1/5','190','100','Threded Fitting'),(289,'demogroovedproduct','1/6','300','50','Grooved Fitting'),(290,'productname1','1/6','100','70','Grooved Fitting');
/*!40000 ALTER TABLE `productdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-18 17:46:16
