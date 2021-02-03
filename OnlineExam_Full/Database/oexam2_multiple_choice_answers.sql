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
-- Table structure for table `multiple_choice_answers`
--

DROP TABLE IF EXISTS `multiple_choice_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiple_choice_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_true` tinyint(1) NOT NULL DEFAULT 0,
  `value` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `correct_answer` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `multiple_choice_answers_question_id_foreign` (`question_id`),
  KEY `multiple_choice_answers_created_by_foreign` (`created_by`),
  CONSTRAINT `multiple_choice_answers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `multiple_choice_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiple_choice_answers`
--

LOCK TABLES `multiple_choice_answers` WRITE;
/*!40000 ALTER TABLE `multiple_choice_answers` DISABLE KEYS */;
INSERT INTO `multiple_choice_answers` VALUES (35,'20',0,'a)',49,90005,'2021-01-10 15:50:22','2021-01-10 15:50:22','25'),(36,'25',1,'b)',49,90005,'2021-01-10 15:50:32','2021-01-10 15:50:32','25'),(37,'30',0,'c)',49,90005,'2021-01-10 15:50:39','2021-01-10 15:50:39','25'),(38,'45',0,'a)',51,90005,'2021-01-10 15:51:30','2021-01-10 15:51:30','40'),(39,'40',1,'b)',51,90005,'2021-01-10 15:51:40','2021-01-10 15:51:40','40'),(42,'50',0,'a',55,90005,'2021-01-10 16:17:54','2021-01-10 16:17:54','100'),(43,'100',1,'b',55,90005,'2021-01-10 16:18:00','2021-01-10 16:18:00','100'),(47,'100',1,'a',59,90005,'2021-01-10 16:38:46','2021-01-10 16:38:46','100'),(48,'50',0,'b',59,90005,'2021-01-10 16:38:54','2021-01-10 16:38:54','100'),(49,'55',0,'a',61,90005,'2021-01-10 16:43:08','2021-01-10 16:43:08','110'),(50,'110',1,'b',61,90005,'2021-01-10 16:43:16','2021-01-10 16:43:16','110'),(51,'25',0,'a',63,90005,'2021-01-10 17:31:38','2021-01-10 17:31:38','50'),(52,'50',1,'b',63,90005,'2021-01-10 17:31:47','2021-01-10 17:31:47','50'),(53,'75',0,'c',63,90005,'2021-01-10 17:31:56','2021-01-10 17:31:56','50'),(54,'8',1,'a',64,90005,'2021-01-10 17:32:40','2021-01-10 17:32:40','8'),(55,'15',0,'b',64,90005,'2021-01-10 17:32:51','2021-01-10 17:32:51','8'),(56,'30',0,'a',68,90005,'2021-01-11 13:05:54','2021-01-11 13:05:54','45'),(57,'45',1,'b',68,90005,'2021-01-11 13:06:01','2021-01-11 13:06:01','45'),(58,'35',0,'a',69,90005,'2021-01-30 19:59:50','2021-01-30 19:59:50','25'),(59,'25',1,'b',69,90005,'2021-01-30 19:59:57','2021-01-30 19:59:57','25'),(60,'10',0,'a',77,90005,'2021-01-31 23:33:15','2021-01-31 23:33:15','13'),(61,'25',1,'c',82,90005,'2021-02-02 12:18:28','2021-02-02 12:24:30','25'),(62,'10',0,'a',82,90005,'2021-02-02 12:24:57','2021-02-02 12:26:31','25'),(63,'30',0,'a)',97,90005,'2021-02-02 17:09:45','2021-02-02 17:09:45','53'),(64,'53',1,'b)',97,90005,'2021-02-02 17:09:56','2021-02-02 17:09:56','53'),(65,'40',0,'a',100,90005,'2021-02-02 19:51:18','2021-02-02 19:51:18','50'),(66,'50',1,'b',100,90005,'2021-02-02 19:51:26','2021-02-02 19:51:59','50'),(67,'30',0,'c',100,90005,'2021-02-02 19:51:32','2021-02-02 19:52:07','50'),(68,'20',0,'a',103,90005,'2021-02-02 21:55:17','2021-02-02 21:55:17','13'),(69,'13',1,'b',103,90005,'2021-02-02 21:55:26','2021-02-02 21:55:26','13'),(72,'30',0,'a',106,90005,'2021-02-03 09:52:48','2021-02-03 09:52:48','80'),(73,'20',0,'b',106,90005,'2021-02-03 09:52:51','2021-02-03 09:52:51','80'),(74,'80',1,'c',106,90005,'2021-02-03 10:40:18','2021-02-03 10:40:18','80'),(76,'20',0,'b',108,90005,'2021-02-03 10:54:19','2021-02-03 10:54:19','13'),(79,'30',0,'c',108,90005,'2021-02-03 11:27:37','2021-02-03 11:27:37','13'),(81,'13',1,'a',108,90005,'2021-02-03 11:35:54','2021-02-03 11:35:54','13'),(82,'20',0,'b',109,90005,'2021-02-03 11:37:11','2021-02-03 11:37:11','13'),(83,'50',0,'a',109,90005,'2021-02-03 11:59:33','2021-02-03 11:59:33','13'),(84,'13',1,'c',109,90005,'2021-02-03 11:59:42','2021-02-03 11:59:42','13'),(95,'15',1,'a',110,90005,'2021-02-03 12:19:05','2021-02-03 12:19:05','15'),(96,'20',0,'b',110,90005,'2021-02-03 12:26:13','2021-02-03 12:26:13','15'),(111,'15',0,'a',112,90005,'2021-02-03 13:00:28','2021-02-03 13:00:39','60'),(112,'20',0,'b',112,90005,'2021-02-03 13:00:35','2021-02-03 13:00:35','60'),(115,'20',0,'a',113,90005,'2021-02-03 13:07:24','2021-02-03 13:07:24','30'),(116,'30',1,'b',113,90005,'2021-02-03 14:07:17','2021-02-03 14:07:17','30'),(117,'15',0,'c',113,90005,'2021-02-03 14:07:24','2021-02-03 14:07:24','30'),(118,'9',0,'a',115,90005,'2021-02-03 14:21:26','2021-02-03 14:21:26','18'),(119,'16',0,'b',115,90005,'2021-02-03 14:21:36','2021-02-03 14:21:36','18'),(120,'18',1,'d',115,90005,'2021-02-03 14:23:26','2021-02-03 14:23:26','18'),(121,'35',0,'a',118,90005,'2021-02-03 16:50:03','2021-02-03 16:50:03','30'),(122,'30',1,'b',118,90005,'2021-02-03 16:50:08','2021-02-03 16:50:08','30'),(125,'20',0,'a',122,90005,'2021-02-03 17:16:57','2021-02-03 17:16:57','40'),(126,'40',1,'b',122,90005,'2021-02-03 17:17:04','2021-02-03 17:17:04','40');
/*!40000 ALTER TABLE `multiple_choice_answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 20:28:39
