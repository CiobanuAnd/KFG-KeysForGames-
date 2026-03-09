-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appSite_game`
--

DROP TABLE IF EXISTS `appSite_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appSite_game` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appSite_game`
--

LOCK TABLES `appSite_game` WRITE;
/*!40000 ALTER TABLE `appSite_game` DISABLE KEYS */;
INSERT INTO `appSite_game` VALUES (1,'Cyberpunk2077',25.00),(2,'The Witcher 3',50.00),(3,'Dota 2',0.00),(4,'Hollow Knight',15.00),(5,'Counter Strike 2',0.00);
/*!40000 ALTER TABLE `appSite_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appSite_purchase`
--

DROP TABLE IF EXISTS `appSite_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appSite_purchase` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `purchase_date` datetime(6) NOT NULL,
  `game_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appSite_purchase_game_id_5cf77078_fk_appSite_game_id` (`game_id`),
  KEY `appSite_purchase_user_id_6a24d619_fk_appSite_user_id` (`user_id`),
  CONSTRAINT `appSite_purchase_game_id_5cf77078_fk_appSite_game_id` FOREIGN KEY (`game_id`) REFERENCES `appSite_game` (`id`),
  CONSTRAINT `appSite_purchase_user_id_6a24d619_fk_appSite_user_id` FOREIGN KEY (`user_id`) REFERENCES `appSite_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appSite_purchase`
--

LOCK TABLES `appSite_purchase` WRITE;
/*!40000 ALTER TABLE `appSite_purchase` DISABLE KEYS */;
INSERT INTO `appSite_purchase` VALUES (1,'2026-03-09 09:30:14.908793',1,2),(2,'2026-03-09 09:53:45.082033',3,2),(3,'2026-03-09 09:54:17.605951',4,2);
/*!40000 ALTER TABLE `appSite_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appSite_review`
--

DROP TABLE IF EXISTS `appSite_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appSite_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `nota` int unsigned NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appSite_review_user_id_5ecf8eaa_fk_appSite_user_id` (`user_id`),
  CONSTRAINT `appSite_review_user_id_5ecf8eaa_fk_appSite_user_id` FOREIGN KEY (`user_id`) REFERENCES `appSite_user` (`id`),
  CONSTRAINT `appSite_review_chk_1` CHECK ((`nota` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appSite_review`
--

LOCK TABLES `appSite_review` WRITE;
/*!40000 ALTER TABLE `appSite_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `appSite_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appSite_user`
--

DROP TABLE IF EXISTS `appSite_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appSite_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appSite_user`
--

LOCK TABLES `appSite_user` WRITE;
/*!40000 ALTER TABLE `appSite_user` DISABLE KEYS */;
INSERT INTO `appSite_user` VALUES (1,'Daniel','daniel@vreauacasa.com',100.00),(2,'Andrei','andrei@gmail.com',250.00),(3,'admin','admin@gmail.com',0.00);
/*!40000 ALTER TABLE `appSite_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appSite_user_library`
--

DROP TABLE IF EXISTS `appSite_user_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appSite_user_library` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `game_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appSite_user_library_user_id_game_id_8d4c5b9f_uniq` (`user_id`,`game_id`),
  KEY `appSite_user_library_game_id_acded50c_fk_appSite_game_id` (`game_id`),
  CONSTRAINT `appSite_user_library_game_id_acded50c_fk_appSite_game_id` FOREIGN KEY (`game_id`) REFERENCES `appSite_game` (`id`),
  CONSTRAINT `appSite_user_library_user_id_ca469e0b_fk_appSite_user_id` FOREIGN KEY (`user_id`) REFERENCES `appSite_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appSite_user_library`
--

LOCK TABLES `appSite_user_library` WRITE;
/*!40000 ALTER TABLE `appSite_user_library` DISABLE KEYS */;
INSERT INTO `appSite_user_library` VALUES (1,2,1),(2,2,3),(3,2,4);
/*!40000 ALTER TABLE `appSite_user_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',8,'add_user'),(26,'Can change user',8,'change_user'),(27,'Can delete user',8,'delete_user'),(28,'Can view user',8,'view_user'),(29,'Can add game',7,'add_game'),(30,'Can change game',7,'change_game'),(31,'Can delete game',7,'delete_game'),(32,'Can view game',7,'view_game'),(33,'Can add review',9,'add_review'),(34,'Can change review',9,'change_review'),(35,'Can delete review',9,'delete_review'),(36,'Can view review',9,'view_review'),(37,'Can add purchase',10,'add_purchase'),(38,'Can change purchase',10,'change_purchase'),(39,'Can delete purchase',10,'delete_purchase'),(40,'Can view purchase',10,'view_purchase');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1200000$SpWAXkMB9lnDYWzcYeIrSY$qzsdJR6/NcPp61ufx6A58jNA961fwAXC6LpvTz2cY/Q=','2026-03-09 09:51:08.502970',1,'admin','','','admin@gmail.com',1,1,'2026-03-03 10:53:18.452338'),(2,'pbkdf2_sha256$1200000$qkXkC1cJ9whn32uFpevDyW$Qps3U4i3eEkG5GY4/bwXLjOoiJLebV2hRD/pEUhwv5k=','2026-03-09 09:52:45.754154',0,'Andrei','','','',0,1,'2026-03-09 08:03:49.494308');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-03-03 10:59:01.473226','1','Daniel',1,'[{\"added\": {}}]',8,1),(2,'2026-03-03 10:59:04.163889','1','Cyberpunk2077',1,'[{\"added\": {}}]',7,1),(3,'2026-03-03 11:06:11.281219','2','The Witcher 3',1,'[{\"added\": {}}]',7,1),(4,'2026-03-09 09:51:26.243357','3','Dota 2',1,'[{\"added\": {}}]',7,1),(5,'2026-03-09 09:51:51.117429','4','Hollow Knight',1,'[{\"added\": {}}]',7,1),(6,'2026-03-09 09:52:10.765900','5','Counter Strike 2',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'appSite','game'),(10,'appSite','purchase'),(9,'appSite','review'),(8,'appSite','user'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-03 08:37:50.008441'),(2,'auth','0001_initial','2026-03-03 08:37:52.371746'),(3,'admin','0001_initial','2026-03-03 08:37:52.933217'),(4,'admin','0002_logentry_remove_auto_add','2026-03-03 08:37:52.963209'),(5,'admin','0003_logentry_add_action_flag_choices','2026-03-03 08:37:52.991367'),(6,'contenttypes','0002_remove_content_type_name','2026-03-03 08:37:53.366522'),(7,'auth','0002_alter_permission_name_max_length','2026-03-03 08:37:53.609631'),(8,'auth','0003_alter_user_email_max_length','2026-03-03 08:37:53.685093'),(9,'auth','0004_alter_user_username_opts','2026-03-03 08:37:53.709809'),(10,'auth','0005_alter_user_last_login_null','2026-03-03 08:37:53.899970'),(11,'auth','0006_require_contenttypes_0002','2026-03-03 08:37:53.909447'),(12,'auth','0007_alter_validators_add_error_messages','2026-03-03 08:37:53.942010'),(13,'auth','0008_alter_user_username_max_length','2026-03-03 08:37:54.174989'),(14,'auth','0009_alter_user_last_name_max_length','2026-03-03 08:37:54.422417'),(15,'auth','0010_alter_group_name_max_length','2026-03-03 08:37:54.498973'),(16,'auth','0011_update_proxy_permissions','2026-03-03 08:37:54.528330'),(17,'auth','0012_alter_user_first_name_max_length','2026-03-03 08:37:54.773085'),(18,'sessions','0001_initial','2026-03-03 08:37:54.907151'),(19,'appSite','0001_initial','2026-03-03 10:43:22.077247'),(20,'appSite','0002_alter_game_buyer','2026-03-05 09:24:40.740046'),(21,'appSite','0003_review','2026-03-05 09:24:41.005376'),(22,'appSite','0004_user_library_alter_game_buyer','2026-03-05 09:55:18.498303'),(23,'appSite','0005_remove_game_buyer_remove_game_purchase_date','2026-03-09 07:49:20.125553'),(24,'appSite','0006_purchase','2026-03-09 07:49:20.678615');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('h0qvxghm3e2znnl7sn5t5ksgu2636rar','.eJxVjDsOwjAQBe_iGlmb9S-mpM8ZrLV3wQGUSHFSIe4OkVJA-2bmvVSiba1pa7KkkdVZoTr9bpnKQ6Yd8J2m26zLPK3LmPWu6IM2Pcwsz8vh_h1UavVbBw8xX4F67wiDESulZGsYwIeADCxopTNItjBEE8F13ggK99ZFFKfeH9QYNzg:1vzXI5:ia_O2rx01OjX9bmg1Xz-KE_6e-vVsA1TXKTP-_Bu1Rc','2026-03-23 09:52:45.765582');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-09 11:57:56
