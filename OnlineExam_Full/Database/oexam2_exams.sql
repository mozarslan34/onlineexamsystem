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
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `duration` double(8,2) NOT NULL,
  `total_grade` double(8,2) DEFAULT NULL,
  `attempts_allowed` int(11) NOT NULL DEFAULT 1,
  `weight` int(11) DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_created_by_foreign` (`created_by`),
  KEY `exams_course_id_foreign` (`course_id`),
  CONSTRAINT `exams_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `exams_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (25,'cse312-midterm1','2021-01-10 18:50:00',110.00,100.00,2,20,90005,'2021-01-10 15:49:58','2021-01-10 15:49:58',1),(27,'se301-Midterm1','2021-01-10 19:15:00',110.00,100.00,2,25,90005,'2021-01-10 16:17:10','2021-02-02 18:19:12',2),(29,'se-301-MIDTERM2','2021-01-10 19:38:00',100.00,100.00,2,20,90005,'2021-01-10 16:38:11','2021-02-03 13:34:53',2),(30,'cse312-midterm2','2021-01-10 19:42:00',100.00,100.00,1,25,90005,'2021-01-10 16:42:31','2021-02-03 10:26:53',1),(31,'cse-312-MIDTERM3','2021-01-10 19:55:00',100.00,50.00,1,20,90005,'2021-01-10 16:54:26','2021-02-03 10:26:43',1),(32,'se301-midterm3','2021-01-10 20:30:00',100.00,60.00,1,20,90005,'2021-01-10 17:31:10','2021-02-02 13:23:52',2),(33,'Midterm4','2021-01-10 20:40:00',100.00,50.00,1,20,90005,'2021-01-10 17:38:38','2021-02-03 10:26:48',1),(34,'midterm-5','2021-01-11 16:10:00',100.00,100.00,1,20,90005,'2021-01-11 13:03:49','2021-02-03 09:50:05',1),(35,'midterm4','2021-01-30 22:58:00',100.00,100.00,2,25,90005,'2021-01-30 19:58:34','2021-01-30 19:58:34',2),(50,'midterm5','2021-02-01 02:38:00',100.00,100.00,1,20,90005,'2021-01-31 21:58:30','2021-01-31 21:58:30',2),(51,'midterm6','2021-02-01 04:00:00',100.00,15.00,1,20,90005,'2021-01-31 23:55:28','2021-01-31 23:55:28',2),(52,'midterm7','2021-02-02 16:21:00',120.00,120.00,1,25,90005,'2021-02-02 11:19:37','2021-02-02 12:51:42',2),(54,'m8','2021-02-02 16:10:00',10.00,100.00,1,10,90005,'2021-02-02 13:09:22','2021-02-02 13:20:01',2),(59,'quiz6','2021-02-02 16:48:00',200.00,50.00,50,10,90005,'2021-02-02 13:47:56','2021-02-02 17:08:40',2),(61,'mid6','2021-02-02 19:18:00',20.00,50.00,2,20,90005,'2021-02-02 16:17:46','2021-02-02 17:08:49',1),(62,'midterm5','2021-02-02 21:56:00',7.00,80.00,1,20,90005,'2021-02-02 17:09:09','2021-02-02 19:03:28',1),(66,'y77','2021-02-02 21:33:00',7.00,0.00,1,10,90005,'2021-02-02 18:31:45','2021-02-02 20:44:23',2),(75,'ut89','2021-02-02 22:48:00',100.00,0.00,1,10,90005,'2021-02-02 19:45:19','2021-02-02 19:48:09',1),(76,'asjfh4','2021-02-02 22:51:00',100.00,165.00,2,NULL,90005,'2021-02-02 19:50:31','2021-02-02 21:04:49',1),(77,'midtem333','2021-02-03 00:56:00',10.00,80.00,2,NULL,90005,'2021-02-02 21:54:54','2021-02-03 16:25:53',1),(78,'tt777','2021-02-03 12:53:00',100.00,120.00,2,NULL,90005,'2021-02-03 09:51:28','2021-02-03 11:35:59',1),(79,'midterm1','2021-02-03 14:38:00',200.00,145.00,2,NULL,90005,'2021-02-03 11:36:31','2021-02-03 13:34:49',4),(80,'midterm2','2021-02-03 16:05:00',70.00,50.00,2,NULL,90005,'2021-02-03 13:03:50','2021-02-03 14:09:02',4),(81,'yu97','2021-02-03 17:22:00',5.00,100.00,2,NULL,90005,'2021-02-03 14:20:49','2021-02-03 16:15:52',4),(83,'midterm3','2021-02-03 19:50:00',10.00,75.00,1,NULL,90005,'2021-02-03 16:48:41','2021-02-03 17:06:47',4),(85,'midterm5','2021-02-03 20:18:00',5.00,80.00,2,NULL,90005,'2021-02-03 17:16:13','2021-02-03 17:19:31',4);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 20:28:38