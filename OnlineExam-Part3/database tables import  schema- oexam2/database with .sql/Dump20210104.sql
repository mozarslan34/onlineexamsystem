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
-- Table structure for table `attempts`
--

DROP TABLE IF EXISTS `attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attempts` (
  `id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` bigint(20) unsigned NOT NULL,
  `exam_id` bigint(20) unsigned NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attempts_student_id_foreign` (`student_id`),
  KEY `attempts_exam_id_foreign` (`exam_id`),
  CONSTRAINT `attempts_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  CONSTRAINT `attempts_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attempts`
--

LOCK TABLES `attempts` WRITE;
/*!40000 ALTER TABLE `attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `given_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_course_name_unique` (`course_name`),
  KEY `courses_given_by_foreign` (`given_by`),
  CONSTRAINT `courses_given_by_foreign` FOREIGN KEY (`given_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'CSE312',90005,NULL,NULL),(2,'SE301',90005,NULL,NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_students`
--

DROP TABLE IF EXISTS `courses_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_students` (
  `student_id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `courses_students_course_id_foreign` (`course_id`),
  CONSTRAINT `courses_students_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `courses_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_students`
--

LOCK TABLES `courses_students` WRITE;
/*!40000 ALTER TABLE `courses_students` DISABLE KEYS */;
INSERT INTO `courses_students` VALUES (20003,1,NULL,NULL);
/*!40000 ALTER TABLE `courses_students` ENABLE KEYS */;
UNLOCK TABLES;

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
  `total_grade` double(8,2) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (1,'midterm1','2020-12-20 09:00:00',120.00,70.00,2,NULL,90005,NULL,NULL,1),(3,'midterm1','2020-06-06 08:45:00',100.00,100.00,2,NULL,90005,NULL,NULL,2),(4,'midterm3','2020-06-06 09:00:00',60.00,100.00,1,NULL,90005,NULL,NULL,2),(5,'midterm4-2','2019-05-20 07:45:00',60.00,75.00,2,NULL,90005,NULL,NULL,2),(6,'midterm2','2020-06-15 08:45:00',65.00,100.00,1,NULL,90005,NULL,NULL,1),(8,'midterm4','2020-09-09 13:00:00',150.00,110.00,2,NULL,90005,NULL,NULL,1),(9,'quiz2','2021-05-10 10:00:00',20.00,50.00,1,NULL,90005,NULL,NULL,1),(10,'quiz1','2020-05-10 08:00:00',50.00,100.00,1,NULL,90005,NULL,NULL,1),(11,'quiz1','2020-10-10 07:15:00',50.00,80.00,2,NULL,90005,NULL,NULL,2),(12,'quiz2','2020-06-15 13:00:00',15.00,60.00,1,NULL,90005,NULL,NULL,2),(13,'exam3','2020-10-10 14:00:00',120.00,100.00,2,NULL,90005,NULL,NULL,2),(14,'exam4','2020-12-12 15:00:00',100.00,100.00,1,NULL,90005,NULL,NULL,2),(15,'quiz3','2020-12-10 07:15:00',30.00,30.00,2,NULL,90005,NULL,NULL,1),(16,'quiz5','2020-10-10 08:00:00',20.00,20.00,1,5,90005,'2021-01-02 14:24:35','2021-01-02 14:24:35',1);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sender` bigint(20) unsigned NOT NULL,
  `receiver` bigint(20) unsigned NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_sender_foreign` (`sender`),
  KEY `messages_receiver_foreign` (`receiver`),
  CONSTRAINT `messages_receiver_foreign` FOREIGN KEY (`receiver`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_12_29_172719_create_exams_table',1),(5,'2020_12_29_172851_create_courses_table',1),(6,'2020_12_29_173856_create_questions_table',1),(7,'2020_12_29_174441_create_multiple_choice_answers_table',1),(8,'2020_12_29_174838_create_text_submissions_table',1),(9,'2020_12_29_175340_create_multiple_choice_submissions_table',1),(10,'2020_12_29_175735_create_results_table',1),(11,'2020_12_29_180441_add_exams_courses_fk',1),(12,'2020_12_29_182551_create_attempts_table',1),(13,'2020_12_29_183146_create_courses_students_table',1),(14,'2020_12_29_183415_create_messages_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiple_choice_answers`
--

LOCK TABLES `multiple_choice_answers` WRITE;
/*!40000 ALTER TABLE `multiple_choice_answers` DISABLE KEYS */;
INSERT INTO `multiple_choice_answers` VALUES (1,'131',0,'A',22,90005,'2021-01-02 21:15:56','2021-01-03 00:33:30',NULL),(2,'155',0,'b',23,90005,'2021-01-02 21:16:40','2021-01-03 00:39:07','155'),(3,'100',0,'b',23,90005,'2021-01-02 21:32:39','2021-01-03 15:05:12',NULL),(4,'75',0,'c',23,90005,'2021-01-02 23:01:45','2021-01-03 00:34:10','155'),(5,'155',1,'d',23,90005,'2021-01-02 23:05:29','2021-01-02 23:05:29','155'),(6,'155',0,'e',23,90005,'2021-01-02 23:06:35','2021-01-03 00:11:25','155'),(9,'20',0,'b',24,90005,'2021-01-03 16:01:59','2021-01-03 16:04:19','25');
/*!40000 ALTER TABLE `multiple_choice_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiple_choice_submissions`
--

DROP TABLE IF EXISTS `multiple_choice_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiple_choice_submissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `answer_value` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `given_by` bigint(20) unsigned NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  `is_graded` tinyint(1) NOT NULL DEFAULT 0,
  `grade` double(8,2) NOT NULL,
  `answer_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `multiple_choice_submissions_given_by_foreign` (`given_by`),
  KEY `multiple_choice_submissions_question_id_foreign` (`question_id`),
  KEY `multiple_choice_submissions_answer_id_foreign` (`answer_id`),
  CONSTRAINT `multiple_choice_submissions_answer_id_foreign` FOREIGN KEY (`answer_id`) REFERENCES `multiple_choice_answers` (`id`),
  CONSTRAINT `multiple_choice_submissions_given_by_foreign` FOREIGN KEY (`given_by`) REFERENCES `users` (`id`),
  CONSTRAINT `multiple_choice_submissions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiple_choice_submissions`
--

LOCK TABLES `multiple_choice_submissions` WRITE;
/*!40000 ALTER TABLE `multiple_choice_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `multiple_choice_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `questions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `questions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (2,'alinin yaşı kaçtır?','Text',1,90005,40,'2021-01-02 17:20:02','2021-01-02 17:20:02',''),(3,'alinin yaşı kaçtır?','MultipleChoice',1,90005,40,'2021-01-02 18:33:26','2021-01-02 18:33:26',''),(4,'5+3','Text',1,90005,20,'2021-01-02 19:51:13','2021-01-02 19:51:13',''),(6,'5+7','Text',9,90005,10,'2021-01-02 19:59:51','2021-01-02 19:59:51',''),(7,'7+8','MultipleChoice',16,90005,10,'2021-01-02 20:12:50','2021-01-02 20:12:50','15'),(9,'5+5','MultipleChoice',16,90005,10,'2021-01-02 20:15:54','2021-01-02 20:15:54','10'),(10,'10+15','Text',15,90005,20,'2021-01-02 20:30:19','2021-01-02 20:30:19',NULL),(11,'10+15','Text',9,90005,15,'2021-01-02 20:31:30','2021-01-02 20:31:30',NULL),(12,'20+20','Text',15,90005,25,'2021-01-02 20:36:31','2021-01-02 20:36:31',NULL),(14,'35+40','MultipleChoice',9,90005,30,'2021-01-02 20:40:33','2021-01-02 20:40:33','75'),(15,'15+55','MultipleChoice',14,90005,45,'2021-01-02 20:42:46','2021-01-02 20:43:07','70'),(17,'100+150','MultipleChoice',4,90005,55,'2021-01-02 21:07:50','2021-01-02 21:07:50','250'),(19,'60+33','MultipleChoice',10,90005,53,'2021-01-02 21:11:02','2021-01-02 21:11:02','93'),(20,'90+10','MultipleChoice',15,90005,55,'2021-01-02 21:12:30','2021-01-02 21:12:30','100'),(21,'50+10/2','MultipleChoice',15,90005,15,'2021-01-02 21:14:36','2021-01-02 21:14:36','55'),(22,'43+88','MultipleChoice',12,90005,15,'2021-01-02 21:15:46','2021-01-02 21:15:46','131'),(23,'75+80','MultipleChoice',12,90005,25,'2021-01-02 21:16:35','2021-01-03 15:05:28','155'),(24,'10+15','MultipleChoice',8,90005,25,'2021-01-02 21:34:36','2021-01-03 17:07:10','25'),(25,'20+33','MultipleChoice',13,90005,20,'2021-01-02 21:35:20','2021-01-02 21:35:20','53'),(26,'20+25','MultipleChoice',10,90005,15,'2021-01-02 21:40:02','2021-01-02 21:40:02','45'),(27,'20+20','MultipleChoice',5,90005,15,'2021-01-02 21:41:14','2021-01-02 21:41:14','40'),(28,'100+100','MultipleChoice',15,90005,20,'2021-01-02 21:48:25','2021-01-02 21:48:25','200'),(29,'100+200','MultipleChoice',15,90005,50,'2021-01-02 21:50:37','2021-01-02 21:50:37','300'),(30,'60+30','MultipleChoice',12,90005,15,'2021-01-02 21:52:50','2021-01-02 21:52:50','90'),(31,'50x30','MultipleChoice',8,90005,35,'2021-01-02 22:11:21','2021-01-03 15:51:35','1500'),(33,'20+30','Text',1,90005,30,'2021-01-03 14:31:30','2021-01-03 14:31:39',NULL),(34,'15+30','Text',8,90005,30,'2021-01-03 15:54:24','2021-01-03 15:54:41',NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `total_grade` double(8,2) NOT NULL,
  `exam_id` bigint(20) unsigned NOT NULL,
  `evaluated_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `results_student_id_foreign` (`student_id`),
  KEY `results_exam_id_foreign` (`exam_id`),
  KEY `results_evaluated_by_foreign` (`evaluated_by`),
  CONSTRAINT `results_evaluated_by_foreign` FOREIGN KEY (`evaluated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  CONSTRAINT `results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_submissions`
--

DROP TABLE IF EXISTS `text_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `text_submissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `given_by` bigint(20) unsigned NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_graded` tinyint(1) NOT NULL DEFAULT 0,
  `grade` double(8,2) NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  `evaluated_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `text_submissions_given_by_foreign` (`given_by`),
  KEY `text_submissions_question_id_foreign` (`question_id`),
  KEY `text_submissions_evaluated_by_foreign` (`evaluated_by`),
  CONSTRAINT `text_submissions_evaluated_by_foreign` FOREIGN KEY (`evaluated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `text_submissions_given_by_foreign` FOREIGN KEY (`given_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `text_submissions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_submissions`
--

LOCK TABLES `text_submissions` WRITE;
/*!40000 ALTER TABLE `text_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Admin','Teacher','Assistant','Student') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `full_name` varchar(45) NOT NULL,
  `locality` varchar(45) NOT NULL,
  `department` varchar(45) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT 'default.jpg',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=90011 DEFAULT CHARSET=latin5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'AdminOExam','alparslangunay@gmail.com',NULL,'$2y$10$SFTXU8Eo4oTfEdn89t8zqe85xo0f8gPfuSw9RgC0HBzTLHdNoBDx2','Admin',NULL,NULL,NULL,'AlparslanGünay','Ataşehir','-','default.jpg'),(20001,'YasinOExam-S','mertyasin6@gmail.com',NULL,'$2y$10$oDvp6w1dEr65U9JyRPotX.reL2QS9ubeflS3cEG8bvEQzu4h/rdoq','Student',NULL,NULL,NULL,'Yasin Demir','Ümraniye','CS','default.jpg'),(20002,'EminOExam-S','eminoz@gmail.com',NULL,'$2y$10$Wn8NbS4A3JMW1ZVO8ZUpauVnafJFIF0e8ypzM1C4.x0XJ1v5qkLmS','Student',NULL,NULL,NULL,'Emin Özer','Şile','CS','default.jpg'),(20003,'MertcanOExam-S','mozarslan1434@gmail.com',NULL,'$2y$10$IjMx4G3KuLZv6ktXeiwIHOM1rzyGi/GJIr488t6/BWanLGbyRfTEG','Student',NULL,NULL,NULL,'Mertcan Özarslan','Çekmeköy','CS','default.jpg'),(20004,'TümerOExam-S','tümerkarakus@gmail.com',NULL,'$2y$10$s.vnKOLIWeQJLNjmtrL5l.bh6kXIeXrgimV6qbytsX65gOzAYLQwK','Student',NULL,NULL,NULL,'Tümer Karakuş','Şile','CS','default.jpg'),(20005,'BaranOExam-S','baran@gmail.com',NULL,'$2y$10$FiIzmvOTivU4xyD66gBWhuGw.ztVt0jtLc.qhvHR2r6yZZAGFZ772','Student',NULL,NULL,NULL,'Baran Hocaoğlu','Avcılar','CS','default.jpg'),(20006,'YaşarOExam-S','yasarc97@gmail.com',NULL,'$2y$10$rLfUrqRekLqUC5XcwYqYPOVvMEAugAkDkl/hqgt05ij4l5jNNbBz6','Student',NULL,NULL,NULL,'Yaşar Çalışkan','Başakşehir','CS','default.jpg'),(20007,'KemalOExam-S','kemal@gmail.com',NULL,'$2y$10$bjReTq0nVDRaa6R303t8xen1rtD8aKMI9kw4xPnXIqxKqnIn.id8K','Student',NULL,NULL,NULL,'Kemal Sözer','Bağcılar','CS','default.jpg'),(20008,'ServetOExam-S','servet@gmail.com',NULL,'$2y$10$yCvWq5n5lsUmCJSCHdp94OtB42OnNp8SYpb51ZDDyzTUfx7Lp1EfG','Student',NULL,NULL,NULL,'Servet Suman','Bahçelievler','CS','default.jpg'),(20009,'CemileOExam-S','cemile@gmail.com',NULL,'$2y$10$KKjdhRmc8WHt2ZxF4rrlj.dYnHUORWMQgIDjsInN4Ubz688n19U1W','Student',NULL,NULL,NULL,'Cemile Taşkesen','Bakırköy','CS','default.jpg'),(20010,'ElvanOExam-S','elvan@gmail.com',NULL,'$2y$10$39bohRT3UrErYCDyn54DGulOJprHNsM3MkwGCAJIi0rhy/WDeK3o.','Student',NULL,NULL,NULL,'Elvan Altınsoy','Başakşehir','CS','default.jpg'),(20011,'GülfidanOExam-S','gülfidan@gmail.com',NULL,'$2y$10$MCitMO4ZIw7SIim9jJZrlO/LnRVrd/7xxaW.Zi1DQG7jm7xhqxru6','Student',NULL,NULL,NULL,'Gülfidan Boz','Bayrampaşa','SE','default.jpg'),(20012,'AtahanOExam-S','atahan@gmail.com',NULL,'$2y$10$MlRD5akPTJ95clx5/43rZeEJlIi/8bXF6yZcnY8dx75/mSQ0eETnK','Student',NULL,NULL,NULL,'Atahan Evmez','Beşiktaş','SE','default.jpg'),(20013,'BuketOExam-S','buket@gmail.com',NULL,'$2y$10$w3Qyiu4I9nqBJpK1GIlxIOsuEQfo4LE1Py566eUuwkJWA/1xMberW','Student',NULL,NULL,NULL,'Buket Fakıoğlu','Beykoz','SE','default.jpg'),(20014,'AbdülkadirOExam-S','abdulkadir@gmail.com',NULL,'$2y$10$7uECMnVmVYx0rWwXttul.Ol4ejft/OcP5gU/p/OEX4ffhmwwwWPS2','Student',NULL,NULL,NULL,'Abdülkadir Güzeler','Beylikdüzü','SE','default.jpg'),(20015,'CansınOExam-S','cansin@gmail.com',NULL,'$2y$10$pLz7VVMgQ.cdTNq24dKk2OEdwRB412cmnNMTu9y91.YZ3KE7yMwLq','Student',NULL,NULL,NULL,'Cansın Akşit','Beyoğlu','SE','default.jpg'),(20016,'AhmetOExam-S','ahmet@gmail.com',NULL,'$2y$10$GH4z1eabZGkuh66yadG7GeFQJ6qcKyx0IBUfGv1uZqTmGPqDy81GC','Student',NULL,NULL,NULL,'Ahmet Aslan','Büyükçekmece','SE','default.jpg'),(20017,'DidemOExam-S','didem@gmail.com',NULL,'$2y$10$bHa4DjfsIvQtLQ70jgrnZ.7zlpMbDayju2N/RZJcGmZk3HLn8zihK','Student',NULL,NULL,NULL,'Didem Demirbağ','Çatalca','SE','default.jpg'),(20018,'FurkanOExam-S','furkan@gmail.com',NULL,'$2y$10$4/8uRMhZzdZABbk81CexP.dQub2eSBc9yY4zaWix.HdbuImAjvifi','Student',NULL,NULL,NULL,'Furkan Karaca','Çekmeköy','SE','default.jpg'),(20019,'DoğanOExam-S','dogan@gmail.com',NULL,'$2y$10$TrQZzl7o3TO9yYahKbyro.EV4.Ms4rv6qg5aZlAzB8mOfgcSvhRVC','Student',NULL,NULL,NULL,'Doğan Gürpınar','Esenler','SE','default.jpg'),(20020,'SezinOExam-S','sezin@gmail.com',NULL,'$2y$10$LJldhANm3JAwut2rmMfieOX8j1UM7ca5IG8/K5pqGf2nBeA5DFcgG','Student',NULL,NULL,NULL,'Sezin Bekmez','Esenyurt','SE','default.jpg'),(20021,'EyüpOExam-S','eyüp@gmail.com',NULL,'$2y$10$fSUv9ZG9opIXBDoz5t4NdOzW/UOiO0dQb9b7RMTvREOCVbN1Znl9S','Student',NULL,NULL,NULL,'Eyüp Adışen','Eyüpsultan','IE','default.jpg'),(20022,'Buket1OExam-S','buket1@gmail.com',NULL,'$2y$10$HX6x2EVzntqYLowTTJm.nOM3fMcvp6dwOfz9jongPu8.xXeyyp3GG','Student',NULL,NULL,NULL,'Buket Aydoğmuş','Fatih','IE','default.jpg'),(20023,'NarinOExam-S','narin@gmail.com',NULL,'$2y$10$9RKerQJfeUmxb6PvFtQ.Cu9o5ydtSXRYhM17qdysGgRyrTVhrk0we','Student',NULL,NULL,NULL,'Narin Fettahoğlu','Gaziosmanpaşa','IE','default.jpg'),(20024,'SelahattinOExam-S','selahattin@gmail.com',NULL,'$2y$10$mSPFwQOe1ufpBI4imuDLnuGEyP/DQRRBuG1npIAho81bGjUl9u3ku','Student',NULL,NULL,NULL,'Selahattin Eruğrul','Güngören','IE','default.jpg'),(20025,'BirtanOExam-S','birtan@gmail.com',NULL,'$2y$10$lXtJs4prQ1g83Qz79Noau.2S7/5usN1XaC0f7GYvHkFfxhOEd2Ifi','Student',NULL,NULL,NULL,'Birtan Kara','Kadıköy','IE','default.jpg'),(20026,'EmrahOExam-S','emrah@gmail.com',NULL,'$2y$10$HzPICIyC4e/r4hqHqcAaX.8apQjZnSGM1UU5GLO1JRjLTpYBFetcu','Student',NULL,NULL,NULL,'Emrah Pektaş','Kağıthane','IE','default.jpg'),(20027,'İzelOExam-S','izel@gmail.com',NULL,'$2y$10$lXGFXFG.3UV4wn6ET/qLwuurEZHUQUlqaVz.bSWivvNAxqT4kdUTG','Student',NULL,NULL,NULL,'İzel Çavak','Kartal','IE','default.jpg'),(20028,'UğurOExam-S','ugur@gmail.com',NULL,'$2y$10$443MyCwXTkB/JIwqZ8kU9ONdxisJXc2abC.CR4j2PnEL6yz90XnV.','Student',NULL,NULL,NULL,'Uğur Gokçe','Küçükçekmece','IE','default.jpg'),(20029,'DeryaOExam-S','derya@gmail.com',NULL,'$2y$10$bzWfAjXKVUs9B19T/E.hsOXdoE6i7irUTMHgyplhiLmKiVAtLMV4m','Student',NULL,NULL,NULL,'Derya Turgut','Maltepe','IE','default.jpg'),(20030,'SemaOExam-S','sema@gmail.com',NULL,'$2y$10$bHRg.aocwAy7oWZ3cAEc9.CO/ef1/UsmRaPHFNJrRkPLe5kRsMCvG','Student',NULL,NULL,NULL,'Sema Başyiğit','Pendik','IE','default.jpg'),(20031,'OrhanOExam-S','orhan@gmail.com',NULL,'$2y$10$/NV8abBggrEJ96TlshuQ9.yqRxaVlXVk4ItWJV..RS2HG59jZDGQK','Student',NULL,NULL,NULL,'Orhan Bulut','Sancaktepe','EE','default.jpg'),(20032,'SefaOExam-S','sefa@gmail.com',NULL,'$2y$10$Xhx8skVkw76kRY/QMBoFt.1OrtAhFB5GtCb4HIcv/u4Ey2BovGMqK','Student',NULL,NULL,NULL,'Sefa Erol','Sarıyer','EE','default.jpg'),(20033,'EgemenOExam-S','egemen@gmail.com',NULL,'$2y$10$OIsAzR9hLNhXXtI7mzKpceOnV9OPdIEY6XDxm8.67lbWgIk4daUdG','Student',NULL,NULL,NULL,'Egemen Aytar','Silivri','EE','default.jpg'),(20034,'MustafaOExam-S','mustafa@gmail.com',NULL,'$2y$10$X5FVARrfXtikVkUQSjpCLeIOAexK/dKlgTbEYFU8Rtxj87QyJg/JC','Student',NULL,NULL,NULL,'Mustafa Öztürk','Sultanbeyli','EE','default.jpg'),(20035,'AsımOExam-S','asım@gmail.com',NULL,'$2y$10$myJ4rLl0Kr6sYTWrH41nYOnbxdA481fXgg.EqIIAQ/jqSOOwxBSsu','Student',NULL,NULL,NULL,'Asım Sarıaslan','Sultangazi','EE','default.jpg'),(20036,'ÖnderOExam-S','önder@gmail.com',NULL,'$2y$10$.BGu6gf8PmkJls4DC9H0vuNgnxxjzZ/D5jQ8WwgNE30iJvZiyxR4y','Student',NULL,NULL,NULL,'Önder Aydıner','Şile','EE','default.jpg'),(20037,'GoncagülOExam-S','goncagul@gmail.com',NULL,'$2y$10$uSfhL8w0RXfDHjnStJMtLeoFKjkha5QXMhCuJCyxT7upftVdL0EiK','Student',NULL,NULL,NULL,'Goncagül OFlaz','Şişli','EE','default.jpg'),(20038,'BayramOExam-S','bayram@gmail.com',NULL,'$2y$10$6gkUGhOmmmV1mr0ptWe.Pus168jD6h5kyxr64giv47ojVnk6uZkY6','Student',NULL,NULL,NULL,'Bayram Bakır','Tuzla','EE','default.jpg'),(20039,'SudeOExam-S','sude@gmail.com',NULL,'$2y$10$JDvBj7ykRMiM0uYQussSIO5pFHxPrzbzFslZFUZaJ/eiAZfP0.yaS','Student',NULL,NULL,NULL,'Sude Biçici','Ümraniye','EE','default.jpg'),(20040,'SüheylOExam-S','süheyl@gmail.com',NULL,'$2y$10$wxQ5rsyhbt7bNqzqrt3BY.19EeqbJNR.pzAakRS.kCzYeXqBmMtRi','Student',NULL,NULL,NULL,'Süheyl Gören','Üsküdar','EE','default.jpg'),(20041,'BehzatOExam-S','behzat@gmail.com',NULL,'$2y$10$kvFiwDhvyXToIfzNo.vhQOLW4O/dZ3xu4tkbeNcEBZBSca1rdiBam','Student',NULL,NULL,NULL,'Behzat Çalışkan','Zeytinburnu','ME','default.jpg'),(20042,'MelisaOExam-S','melisa@gmail.com',NULL,'$2y$10$/3DqVUHufjJV7o2eJt0.peOEuo7cavVid/1poF0M.sczKAY6eIqYK','Student',NULL,NULL,NULL,'Melisa Susam','Adalar','ME','default.jpg'),(20043,'VeliOExam-S','veli@gmail.com',NULL,'$2y$10$S1GtHYaExsu99yAIYgldf.RAJWhtHuw0.U2yiLVk9ozoHAa276bOy','Student',NULL,NULL,NULL,'Veli Altunoğlu','Arnavutköy','ME','default.jpg'),(20044,'EnesOExam-S','enes@gmail.com',NULL,'$2y$10$gQ0dW9jvNxTyY.FzKRKT/OcaMCRFMWdjg.8AEZawLJLw0xj2IfuEa','Student',NULL,NULL,NULL,'Enes Kızıldağ','Ataşehir','ME','default.jpg'),(20045,'BakiOExam-S','baki@gmail.com',NULL,'$2y$10$hGcn1utsRY5pPF1iAFR.fefJJQjsVRNgZ4LrnocPX4RBdKBhadZgK','Student',NULL,NULL,NULL,'Baki Güngüneş','Avcılar','ME','default.jpg'),(20046,'HimmetOExam-S','himmet@gmail.com',NULL,'$2y$10$Pnj0UzckHl1guuo6CMzDZuZ2DAxgupdOSpbfvehNEdN7FzkL82pQ6','Student',NULL,NULL,NULL,'Himmet Kurtca','Bağcılar','ME','default.jpg'),(20047,'JosephOExam-S','joseph@gmail.com',NULL,'$2y$10$61NOvm9l79ZiG7JLl5uB3uu826QgaKvIf2PPPr4/S0Cb72JdSOope','Student',NULL,NULL,NULL,'Joseph William','Bahçelievler','ME','default.jpg'),(20048,'JacobOExam-S','jacob@gmail.com',NULL,'$2y$10$3we/i2Wb.Ulyd9QFvK3vROPaKqUhJBv0l/1VHRtnjI0rFhc/WMr2i','Student',NULL,NULL,NULL,'Jacob Smith','Bakırköy','ME','default.jpg'),(20049,'AlexandrOExam-S','alexandr@gmail.com',NULL,'$2y$10$5SzN2FjUYIqxlXB.yRk4jufO2YqA/E0vmKFvY0SZuQ2DTZQ8OU.wW','Student',NULL,NULL,NULL,'Alexandr Sophia','Başakşehir','ME','default.jpg'),(20050,'HakanOExam-S','hakan@gmail.com',NULL,'$2y$10$y.S85PxuOozGaaZeN21XXuXjbXuiBOKLIexsUR2GH7CXxmWOZUjHW','Student',NULL,NULL,NULL,'Hakan Erturan','Bayrampaşa','ME','default.jpg'),(20051,'HayriOExam-S','hayri@gmail.com',NULL,'$2y$10$QbAUvWgQV0b/sDcG9eAbYeQeZWFAbSdNfSaLOXAe0ODdE8WlMAWtW','Student',NULL,NULL,NULL,'Hayri Alparslan','Beşiktaş','CT','default.jpg'),(20052,'AdnanOExam-S','adnan@gmail.com',NULL,'$2y$10$l4eLvyMEEGpi6KMk1kSYuugMJSRpRO5jOEEmxm2gyRI5MtqcgVoY2','Student',NULL,NULL,NULL,'Adnan Şatıroğlu','Beykoz','CT','default.jpg'),(20053,'TunaOExam-S','tuna@gmail.com',NULL,'$2y$10$/s8VijZKhRjrBqEwzyqAxustDKw7TPraofu3xKX8kt5YjyT0ZDs9m','Student',NULL,NULL,NULL,'Tuna Konuralp','Beylikdüzü','CT','default.jpg'),(20054,'MakbuleOExam-S','makbule@gmail.com',NULL,'$2y$10$a0lqbRc6xM6BddQzCypCfOYgkFBYAh2SxhW8935xQQBSWynyBESZW','Student',NULL,NULL,NULL,'Makbule Koşucu','Beyoğlu','CT','default.jpg'),(20055,'SemihaOExam-S','semiha@gmail.com',NULL,'$2y$10$BmvfgHkWqUqPwp9KlL4eHOJKGaREpxCAXF5qL80M2Pt8KENXlYqeK','Student',NULL,NULL,NULL,'Semiha Kızılet','Büyükçekmece','CT','default.jpg'),(20056,'BilginOExam-S','bilgin@gmail.com',NULL,'$2y$10$sDLV6VUkTASvXQPXlF/5QeQhgBdaepvZ00Uj/CaB9b48StLo2ScWq','Student',NULL,NULL,NULL,'Bilgin Yeşilfidan','Çatalca','CT','default.jpg'),(20057,'İbrahimOExam-S','ibrahim@gmail.com',NULL,'$2y$10$Wh/07Fvs2qs45N9NcEqwLu0rmEU8ZbGbu07QGN4d/9na.RSda3KZG','Student',NULL,NULL,NULL,'İbrahim Piyade','Çekmeköy','CT','default.jpg'),(20058,'HulusiOExam-S','hulusi@gmail.com',NULL,'$2y$10$eKEPZVNRPIhlLnUiYYiI6eCLKP2QlDfDGLTp7WO1ehRXGiHRfqlGe','Student',NULL,NULL,NULL,'Hulusi Akdeniz','Esenler','CT','default.jpg'),(20059,'FuatOExam-S','fuat@gmail.com',NULL,'$2y$10$0XNCObNWwH6Yj54Uu5y3UupcqJdAfRuGVLSe8AIWzzCqyFFTRfN6y','Student',NULL,NULL,NULL,'Fuat Sezen','Esenyurt','CT','default.jpg'),(20060,'EmineOExam-S','emine@gmail.com',NULL,'$2y$10$TgTyH0ZoxaLTy3lWB4V5ruRXubLuFXfSypWWgiBBcIJcEeWv1DV3q','Student',NULL,NULL,NULL,'Emine Tuncay','Eyüpsultan','CT','default.jpg'),(20061,'EsinOExam-S','esin@gmail.com',NULL,'$2y$10$2BZkWs8HJ9/QaZCLFfvfO.Y4v4xRj8RaonPjhTBcH2N4pifFbPBiG','Student',NULL,NULL,NULL,'Esin Meriç','Fatih','LA','default.jpg'),(20062,'SerraOExam-S','serra@gmail.com',NULL,'$2y$10$/8i9ijBn/hvELYYtqTzzG.mOGfOdU21/60b6TamCpyzBaArynjuja','Student',NULL,NULL,NULL,'Serra Kalay','Gaziosmanpaşa','LA','default.jpg'),(20063,'MücahitOExam-S','mucahit@gmail.com',NULL,'$2y$10$lDW5mmv6F6nMr.cz9A9jU.Q3B5uaF.Cfh1gNiXtzO8MNNre3XeNvW','Student',NULL,NULL,NULL,'Mücahit Karakaya','Güngören','LA','default.jpg'),(20064,'CanberkOExam-S','canberk@gmail.com',NULL,'$2y$10$vDSRmhW3lfE076TUduLVQ.UIwrX9g2B.bIu.DJAR7Y8jrAZT8J9aW','Student',NULL,NULL,NULL,'Canberk Tohumoğlu','Kadıköy','LA','default.jpg'),(20065,'Mustafa1OExam-S','mustafa1@gmail.com',NULL,'$2y$10$BbfeyqxO1bmtxwhFYOQUFOVo2aYJrYQQKjMZ/oKoK2XqkD8ra9NG2','Student',NULL,NULL,NULL,'Mustafa Bıkmaz','Kağıthane','LA','default.jpg'),(20066,'MuratOExam-S','murat@gmail.com',NULL,'$2y$10$GY4Cr.67BggXsxfW.ffVp.jaNR/vRlggYtwMW92emoH7eeu6wiqpC','Student',NULL,NULL,NULL,'Murat Üresin','Kartal','LA','default.jpg'),(20067,'BerrinOExam-S','berrin@gmail.com',NULL,'$2y$10$OX7ELpWGBZ0D6/MHTFeBGecOorNMy2SVS4rOR.i6F5N4T3E8hbDw.','Student',NULL,NULL,NULL,'Berrin Yapar','Büyükçekmece','LA','default.jpg'),(20068,'EsmaOExam-S','esma@gmail.com',NULL,'$2y$10$nO0DQpd7Zr2KLGK.PMxOsuFROsWzHwRZeo3zyJWiwFygQMn4PiNO2','Student',NULL,NULL,NULL,'Esma Tanır','Maltepe','LA','default.jpg'),(20069,'ÖzlemOExam-S','ozlem@gmail.com',NULL,'$2y$10$LUz0gvYPjD/Js0sHS7Ps9OxGCMMMi/rbs86EO82y.gowt0PdWcw3u','Student',NULL,NULL,NULL,'Özlem Sümbül','Pendik','LA','default.jpg'),(20070,'TolgahanOExam-S','tolgahan@gmail.com',NULL,'$2y$10$irfso1iF/icBBxhvV03CH.7Uk1mqfDb78A93L1IHb/AIi0y.shDqi','Student',NULL,NULL,NULL,'Tolgahan Erkan','Sancaktepe','LA','default.jpg'),(20071,'BerkanOExam-S','berkan@gmail.com',NULL,'$2y$10$5YYjtJ5y8duyBcvPyUWT5Obu.eCcIFSFBwEsc3LtWBwTOuxOy2OV.','Student',NULL,NULL,NULL,'Berkan Karakoyun','Sarıyer','LA','default.jpg'),(20072,'Hakan1OExam-S','hakan1@gmail.com',NULL,'$2y$10$8Eig6DG6AFuQ/kXe6dQW2O7vE0n7R8UhifY/6hpdCsH8lp2NmBCQe','Student',NULL,NULL,NULL,'Hakan Zengindemir','Silivri','IR','default.jpg'),(20073,'AtılOExam-S','atil@gmail.com',NULL,'$2y$10$xTEUBwTOazuIuOcrGGNz8.WtAcKcrmiydhWamKU1MVfoyEY6jceGm','Student',NULL,NULL,NULL,'Atıl Nacaroğlu','Sultanbeyli','IR','default.jpg'),(20074,'PerverOExam-S','perver@gmail.com',NULL,'$2y$10$ON8ywap9V56ZxuVhDggRDu8IpkgFTyAkYrZ9J5P6e84JO/ktJ6WU.','Student',NULL,NULL,NULL,'Perver Koçak','Sultangazi','IR','default.jpg'),(20075,'NilüferOExam-S','nilufer@gmail.com',NULL,'$2y$10$aYTNYHPvJkM.0V8A.EJfnetlifAAhGKtW4ZFYpjunx3WHo7cYDrAG','Student',NULL,NULL,NULL,'Nilüfer Rençber','Şile','IR','default.jpg'),(20076,'EnverOExam-S','enver@gmail.com',NULL,'$2y$10$MhrQOZWk9n5TgUXvqpmHdehNxcHY4TNkLNZo2SqM45A2SdQjeNt3i','Student',NULL,NULL,NULL,'Enver Kırış','Şişli','IR','default.jpg'),(20077,'KenanOExam-S','kenan@gmail.com',NULL,'$2y$10$.v2z1aAfDm5r9fb3F3UEn.GkANj/Pfoe1f76DBpbOpyCmPchBBdje','Student',NULL,NULL,NULL,'Kenan Beldek','Tuzla','IR','default.jpg'),(20078,'MehmetOExam-S','mehmet@gmail.com',NULL,'$2y$10$h/AgRtpGRGJGVwCxiik90eQoI1gDOjewo/X.oZGGTnSz1y0o1sONW','Student',NULL,NULL,NULL,'Mehmet Konuk','Ümraniye','IR','default.jpg'),(20079,'HalukOExam-S','haluk@gmail.com',NULL,'$2y$10$QUEO8GRqREtQTa1jiMMFxuZPCbWLYyBKqKPcns.el5w1F6dPMeMqC','Student',NULL,NULL,NULL,'Haluk Bilginer ','Üsküdar','IR','default.jpg'),(20080,'VehbiOExam-S','vehbi@gmail.com',NULL,'$2y$10$48EGJKmG3XEiEOCnpbyEZ.WwS8l0ew7LltUsN6x5Jn1slrDU7fZvu','Student',NULL,NULL,NULL,'Vehbi Toker','Zeytinburnu','IR','default.jpg'),(20081,'DilekOExam-S','dilek@gmail.com',NULL,'$2y$10$1OGEqZ6B8G4W5W4BABoXW.pXPNInBrdTtdoEXhD2FX4E.PaPLM2gW','Student',NULL,NULL,NULL,'Dilek Anar','Adalar','IR','default.jpg'),(20082,'Murat1OExam-S','murat1@gmail.com',NULL,'$2y$10$vdyYKYO97t31Txdp/L0siuv92O33RT8TqkQJqOP9wxW0k2LdPUiCe','Student',NULL,NULL,NULL,'Murat Keklik','Arnavutköy','CE','default.jpg'),(20083,'RamazanOExam-S','ramazan@gmail.com',NULL,'$2y$10$WYlRnqua.Q/Zk4hgHMkfI.UJU4IVN2DhEHsmMGoi/rigjiCPSBybK','Student',NULL,NULL,NULL,'Ramazan Ökte','Ataşehir','CE','default.jpg'),(20084,'HasibeOExam-S','hasibe@gmail.com',NULL,'$2y$10$8oNI6CaZ.C6UQ7YM3tWHBOvCnzjAjmGR.uVb/CAM/0NcTbrXNG312','Student',NULL,NULL,NULL,'Hasibe Songür','Avcılar','CE','default.jpg'),(20085,'HasanOExam-S','hasan@gmail.com',NULL,'$2y$10$OK01ucjZOEbWYa/hRL62j.bMujRVSfwHtfRKwdCGmqGD2ql81Qooy','Student',NULL,NULL,NULL,'Hasan Çilek','Bağcılar','CE','default.jpg'),(20086,'YavuzOExam-S','yavuz@gmail.com',NULL,'$2y$10$vk7gzFtlgTgif.I.u2UcM.yGVY8THeEnImwh1q/QqLCXLeBPIQX.m','Student',NULL,NULL,NULL,'Yavuz Gedik','Bahçelievler','CE','default.jpg'),(20087,'ErgülOExam-S','ergül@gmail.com',NULL,'$2y$10$2HCebGGsTPL1NKUsjuCCLeoNhLMUWmXuxGY7hb2CZ9PjDLHcpekce','Student',NULL,NULL,NULL,'Ergül Boz','Bakırköy','CE','default.jpg'),(20088,'AtillaOExam-S','atilla@gmail.com',NULL,'$2y$10$iiYM2P8OmPb5notwEHI78OxMf3EWGdgYBRpE4gAmtYIMeUv5ZiRZ2','Student',NULL,NULL,NULL,'Atilla Şekerci','Başakşehir','CE','default.jpg'),(20089,'SeyitOExam-S','seyit@gmail.com',NULL,'$2y$10$V.Bn2CjqI12aXU0FeTg6yuti4.2nIVHEFIDR0juD5OHAN0CLsxpk.','Student',NULL,NULL,NULL,'Seyit Tanınmış','Bayrampaşa','CE','default.jpg'),(20090,'EsraOExam-S','esra@gmail.com',NULL,'$2y$10$/1cs2VP5FusRdjZqDXifFOJq8D4XHWi41ClXrRSaZRKG9nTo7tKWW','Student',NULL,NULL,NULL,'Esra Özçan','Beşiktaş','CE','default.jpg'),(20091,'AyşeOExam-S','ayse@gmail.com',NULL,'$2y$10$pxcdbkS4UXtzNNSgtHTHCeo165.xqOmY/Da7WzD4njouTrvK0Qk46','Student',NULL,NULL,NULL,'Ayşe Çakmak','Beykoz','CE','default.jpg'),(20092,'AliOExam-S','ali@gmail.com',NULL,'$2y$10$vA6yq1y5uWO9ds.RASn62eEtUQwPtMt9VQWhOp4IRTJ48dHSosBnC','Student',NULL,NULL,NULL,'Ali Alhaz','Beşiktaş','HS','default.jpg'),(20093,'BirgülOExam-S','birgül@gmail.com',NULL,'$2y$10$OjgSPk27kQ4YostxiQ5oZ.FHcikblM/wwS5bNIMOMG01MZorXGlBq','Student',NULL,NULL,NULL,'Birgül Mirza','Beylikdüzü','HS','default.jpg'),(20094,'ZeynepOExam-S','zeynep@gmail.com',NULL,'$2y$10$Nuv3Y3XMv.8lNrdIxCwhUuwPBbEMS7TSFsPGi/HbALWxYkEPWCHeK','Student',NULL,NULL,NULL,'Zeynep Dadalı','Çatalca','HS','default.jpg'),(20095,'GamzenurOExam-S','gamzenur@gmail.com',NULL,'$2y$10$uZCG1ckbQscPvBoXBzMOTukS9.irt6sp79MLMndzN5nFXKjHhB9sS','Student',NULL,NULL,NULL,'Gamzenur Menteş','Çekmeköy','HS','default.jpg'),(20096,'NevalOExam-S','neval@gmail.com',NULL,'$2y$10$NU5yOvrzkzXEILXl01VsCOyy0x0s4UIyZmWt31SEvR4YsBQE2LxsK','Student',NULL,NULL,NULL,'Neval Sebas','Kadıköy','HS','default.jpg'),(20097,'GirayOExam-S','giray@gmail.com',NULL,'$2y$10$HQoSnG7/KdpIGwUMewKJEu./xiSzLcnAPHRjEG2MWUesHGexdazDK','Student',NULL,NULL,NULL,'Giray Demirkol','Pendik','HS','default.jpg'),(20098,'CemOExam-S','cem@gmail.com',NULL,'$2y$10$5Xxwq8laqwy3yVQs6CRoB.eN/DufnLntFWnELrEHBfhwrfQ0nfg..','Student',NULL,NULL,NULL,'Cem Berksu','Ümraniye','HS','default.jpg'),(20099,'CevdetOExam-S','cevdet@gmail.com',NULL,'$2y$10$PonERG6vj66fIRR0RvDQteNbkGA6Y6A2vf8SQRtori.IB.5H0pjm2','Student',NULL,NULL,NULL,'Cevdet Kuşku','Ataşehir','HS','default.jpg'),(20100,'EsranurOExam-S','esranur@gmail.com',NULL,'$2y$10$6Ux8WW3t5IpaMstS1W2Ik.1m3N1jyYQs14klb9MzIl/dNkinAoSvK','Student',NULL,NULL,NULL,'Esranur Gürcüm','Beykoz','HS','default.jpg'),(20101,'CeyhanOExam-S','ceyhan@gmail.com',NULL,'$2y$10$VOfyJ92OaQ7JK/BUBmSGoOWF3uzyC.Vf2.S3Qrcwn1poxqZLMJMn6','Student',NULL,NULL,NULL,'Ceyhan Kaymaz','Esenyurt','HS','default.jpg'),(80002,'BarışOExam-A','bariserkoc@gmail.com',NULL,'$2y$10$HKbw8JG5MHS0nDY8nZ7pTOXEZyApQOz4okYmdO1rweO7SDT0odxtq','Assistant',NULL,NULL,NULL,'Barış Erkoç','Kadıköy','CE','default.jpg'),(80003,'EcenurOExam-A','ecenur902@gmail.com',NULL,'$2y$10$B/6fpW/MZ.i72bYlaMV3Ju.Yvfd7pthM0qH.SrxRftB6bV6bz/UQS','Assistant',NULL,NULL,NULL,'Ecenur Derin','Şile','IR','default.jpg'),(80004,'GözdeOExam-A','gozde214@gmail.com',NULL,'$2y$10$NYQ1S9R91dUN2i5SedRUzeUFP0ayIEhXcHrqaddsGaZgZRNfeqGpW','Assistant',NULL,NULL,NULL,'Gözde Demir','Çekmeköy','LA','default.jpg'),(80005,'YaseminOExam-A','yasemin96@gmail.com',NULL,'$2y$10$LGjDtVM58waXb3Wy3sYgNuu0LLZ/UQHUwnvh/HcNROQnXjPdW/P66','Assistant',NULL,NULL,NULL,'Yasemin Öztürk','Etiler','CT','default.jpg'),(80006,'ÖmerOExam-A','omer113@gmail.com',NULL,'$2y$10$A2/esemPTAduRwA7ehsgzOR8IK4FG0eEb4t2X3p.YlKCacrdKjmg6','Assistant',NULL,NULL,NULL,'Ömer Yaman','Bahçelievler','ME','default.jpg'),(80007,'İpekOExam-A','ipek98@gmail.com',NULL,'$2y$10$c9CVSdoVxY5RtumjGEmbyOKDfCcVlrR6m2nc9s2Y3hvW/g58TnS/u','Assistant',NULL,NULL,NULL,'İpek Yılmaz','Beylikdüzü','EE','default.jpg'),(80008,'MelisaOExam-A','melisa176@gmail.com',NULL,'$2y$10$3F4jW6v2iqW7xLXdwijNmOdYAY.XOu5mDRmOV0zSfg0f2jm4gE4Qe','Assistant',NULL,NULL,NULL,'Melisa Erdoğan','Ataşehir','IE','default.jpg'),(80009,'GülayOExam-A','gulay32@gmail.com',NULL,'$2y$10$nXiiZVbBEhhRrDlODRcTmO0m3JCODpMg.DbMfu5w4BK.3iUsIG8We','Assistant',NULL,NULL,NULL,'Gülay Görgülü','Ümraniye','CS','default.jpg'),(80010,'CemreOExam-A','cemre46@gmail.com',NULL,'$2y$10$g3v0WUXT13jLB8TULAepr.bmYl.L/Dsbd8NZ22FbWwzjdgA3.EHVO','Assistant',NULL,NULL,NULL,'Cemre Bayraktar','Beyoğlu','SE','default.jpg'),(90003,'GülsenOExam-T','gulsen121@gmail.com',NULL,'$2y$10$c1zkGAhRbbW7otVidvNF3OB6gh2SyNea4Le9myW20qvayEK1k.Ecm','Teacher',NULL,NULL,NULL,'Gülsen Hakkı','Esenyurt','HS','default.jpg'),(90004,'MustafaOExam-T','mustafa32@gmail.com',NULL,'$2y$10$ZrFLvqVLyRxB5/EWX/oGzOarCuAy.guyyTYOx9EqMVm71lAjqHT/a','Teacher',NULL,NULL,NULL,'Mustafa Biten','Güngören','CE','default.jpg'),(90005,'SefaOExam-T','sefa12@gmail.com',NULL,'$2y$10$YyVjienK/3IhI2TBEOK.Qu9oVCo8knCj2R3GlSw3QoIZsrd/6vNYG','Teacher',NULL,NULL,NULL,'Sefa Sarı','Kadıköy','IR','default.jpg'),(90006,'AydınOExam-T','aydin443@gmail.com',NULL,'$2y$10$xlratc740Xy87RJUo7uY3OY.JDEHdOtD2sGj8e03Ruot4geA9xuuu','Teacher',NULL,NULL,NULL,'Aydın Yurdagül','Pendik','LA','default.jpg'),(90007,'IşılOExam-T','isil534@gmail.com',NULL,'$2y$10$42S3LfdLnIFTPAtV0iA9K.eMJF6NQ9zh4wXtI6Vse7VQViYIXbG06','Teacher',NULL,NULL,NULL,'Işıl Fener','Avcılar','CT','default.jpg'),(90008,'MetehanOExam-T','metehan55@gmail.com',NULL,'$2y$10$pJkvfSxZ7mVKGrifDT7y9eT/W6JO1fb6G/A1eN5p/.AnKxghahxRC','Teacher',NULL,NULL,NULL,'Metehan Kaymaz','Fatih','ME','default.jpg'),(90009,'EmineOExam-T','emine96@gmail.com',NULL,'$2y$10$Tz8SOfjH1jZR4T8Ob6ZQUe1SOjcOqQjTwY760jGBQaDCrQZQIY73.','Teacher',NULL,NULL,NULL,'Emine Ekin','Şile','EE','default.jpg'),(90010,'YunusOExam-T','yunus148@gmail.com',NULL,'$2y$10$529amEtWIQ76EAD7.zVqeuTyP1ElfoaBtRFFL1nLIqqb7Yk0cynuG','Teacher',NULL,NULL,NULL,'Yunus Kaymaz','Çatalca','IE','default.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'oexam2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-04  0:03:53
