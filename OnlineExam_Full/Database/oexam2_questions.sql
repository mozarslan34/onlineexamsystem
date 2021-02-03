-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: oexam2
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.17-MariaDB

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
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_type` enum('Text','MultipleChoice') COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `evaluation_grade` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `correct_answer` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_exam_id_foreign` (`exam_id`),
  KEY `questions_created_by_foreign` (`created_by`),
  CONSTRAINT `questions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `questions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (49,'10+15','MultipleChoice',25,90005,35,'2021-01-10 15:50:14','2021-01-10 15:51:04','25'),(50,'100+100','Text',25,90005,35,'2021-01-10 15:50:57','2021-01-10 15:50:59',NULL),(51,'20+20','MultipleChoice',25,90005,30,'2021-01-10 15:51:23','2021-01-10 15:51:43','40'),(54,'20+30','Text',27,90005,50,'2021-01-10 16:17:22','2021-01-10 16:17:24',NULL),(55,'50+50','MultipleChoice',27,90005,50,'2021-01-10 16:17:37','2021-01-10 16:18:02','100'),(58,'30+20','Text',29,90005,50,'2021-01-10 16:38:21','2021-01-10 16:38:24',NULL),(59,'50+50','MultipleChoice',29,90005,50,'2021-01-10 16:38:37','2021-01-10 16:38:56','100'),(60,'40+30','Text',30,90005,50,'2021-01-10 16:42:42','2021-01-10 16:42:45',NULL),(61,'60+50','MultipleChoice',30,90005,50,'2021-01-10 16:43:01','2021-01-10 16:43:19','110'),(62,'30+50','Text',31,90005,50,'2021-01-10 16:54:40','2021-01-10 16:55:03',NULL),(63,'25+25','MultipleChoice',32,90005,30,'2021-01-10 17:31:28','2021-01-10 17:32:00','50'),(64,'3+5','MultipleChoice',32,90005,30,'2021-01-10 17:32:31','2021-01-10 17:32:54','8'),(65,'5+3','Text',33,90005,20,'2021-01-10 17:38:50','2021-01-10 17:38:52',NULL),(66,'10+3','Text',33,90005,30,'2021-01-10 17:39:05','2021-01-10 17:39:06',NULL),(67,'10+15','Text',34,90005,50,'2021-01-11 13:05:09','2021-01-11 13:05:11',NULL),(68,'20+25','MultipleChoice',34,90005,50,'2021-01-11 13:05:44','2021-01-11 13:07:53','45'),(69,'10+15','MultipleChoice',35,90005,50,'2021-01-30 19:59:37','2021-01-30 20:00:00','25'),(77,'10+3','MultipleChoice',50,90005,20,'2021-01-31 23:30:57','2021-01-31 23:30:57','13'),(78,'4+5','Text',51,90005,15,'2021-02-01 00:30:04','2021-02-01 00:30:06',NULL),(80,'10+5','Text',52,90005,20,'2021-02-02 11:20:15','2021-02-02 11:20:17',NULL),(81,'10+5','Text',52,90005,20,'2021-02-02 11:34:03','2021-02-02 11:34:06',NULL),(82,'20+5','MultipleChoice',52,90005,30,'2021-02-02 11:35:54','2021-02-02 12:27:11','25'),(83,'10+4','Text',52,90005,15,'2021-02-02 11:49:52','2021-02-02 11:50:57',NULL),(84,'10+5','Text',52,90005,10,'2021-02-02 11:58:26','2021-02-02 11:58:28',NULL),(85,'5+5','Text',52,90005,15,'2021-02-02 12:06:27','2021-02-02 12:06:29',NULL),(86,'10+10','Text',52,90005,10,'2021-02-02 12:07:26','2021-02-02 12:07:28',NULL),(88,'10+3','Text',54,90005,50,'2021-02-02 13:09:33','2021-02-02 13:09:35',NULL),(89,'20+3','Text',54,90005,50,'2021-02-02 13:09:51','2021-02-02 13:09:53',NULL),(94,'20+3','Text',59,90005,50,'2021-02-02 13:48:04','2021-02-02 13:48:05',NULL),(95,'20+3','Text',61,90005,50,'2021-02-02 16:18:03','2021-02-02 16:18:05',NULL),(96,'10+5','Text',62,90005,30,'2021-02-02 17:09:25','2021-02-02 17:09:27',NULL),(97,'50+3','MultipleChoice',62,90005,50,'2021-02-02 17:09:38','2021-02-02 17:09:59','53'),(99,'10+30','Text',76,90005,50,'2021-02-02 19:50:45','2021-02-02 19:50:47',NULL),(100,'20+30','MultipleChoice',76,90005,50,'2021-02-02 19:51:03','2021-02-02 19:52:38','50'),(101,'10+3','Text',76,90005,35,'2021-02-02 20:18:53','2021-02-02 20:18:54',NULL),(102,'10+5','MultipleChoice',76,90005,30,'2021-02-02 20:46:17','2021-02-02 20:46:17','15'),(103,'10+3','MultipleChoice',77,90005,30,'2021-02-02 21:55:12','2021-02-02 21:55:28','13'),(104,'20+30','Text',77,90005,50,'2021-02-02 21:55:42','2021-02-02 21:55:44',NULL),(106,'50+30','MultipleChoice',78,90005,50,'2021-02-03 09:52:43','2021-02-03 10:40:20','80'),(107,'10+3','Text',78,90005,40,'2021-02-03 10:09:01','2021-02-03 10:09:03',NULL),(108,'10+3','MultipleChoice',78,90005,30,'2021-02-03 10:31:54','2021-02-03 11:35:59','13'),(109,'10+3','MultipleChoice',79,90005,50,'2021-02-03 11:36:49','2021-02-03 12:51:28','13'),(110,'10+5','MultipleChoice',79,90005,50,'2021-02-03 12:10:41','2021-02-03 12:51:33','15'),(112,'30+30','MultipleChoice',79,90005,45,'2021-02-03 12:40:55','2021-02-03 12:51:09','60'),(113,'10+20','MultipleChoice',80,90005,50,'2021-02-03 13:04:17','2021-02-03 14:07:26','30'),(114,'10+5','Text',81,90005,50,'2021-02-03 14:21:02','2021-02-03 14:21:04',NULL),(115,'10+8','MultipleChoice',81,90005,50,'2021-02-03 14:21:18','2021-02-03 14:23:31','18'),(117,'10+28','Text',83,90005,35,'2021-02-03 16:49:01','2021-02-03 16:52:56',NULL),(118,'10+20','MultipleChoice',83,90005,40,'2021-02-03 16:49:52','2021-02-03 16:52:48','30'),(121,'20+20','Text',85,90005,40,'2021-02-03 17:16:26','2021-02-03 17:16:33',NULL),(122,'10+30','MultipleChoice',85,90005,40,'2021-02-03 17:16:50','2021-02-03 17:17:11','40');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 20:28:37