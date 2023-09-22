-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: awseb-e-29uuvx3mz5-stack-awsebrdsdatabase-japksccabu8t.cleu4grfvxuc.me-south-1.rds.amazonaws.com    Database: ebdb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `post_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint unsigned NOT NULL,
  `lang` decimal(10,7) NOT NULL,
  `lat` decimal(10,7) NOT NULL,
  `special_instructions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_city_id_foreign` (`city_id`),
  KEY `addresses_user_id_index` (`user_id`),
  CONSTRAINT `addresses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,8,0,'aaa','aaa',1,1.0000000,1.0000000,'aaa','2023-09-19 13:47:45','2023-09-19 13:47:45'),(2,7,0,'1','aaa',1,1.0000000,1.0000000,'aaa','2023-09-20 18:04:37','2023-09-20 18:04:37');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_id` bigint unsigned NOT NULL,
  `attribute_type` tinyint NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attributes_service_id_index` (`service_id`),
  CONSTRAINT `attributes_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'aaa','TEXT','2023-09-20 10:37:09','2023-09-20 10:37:09',37,1,''),(3,'Material','TEXT','2023-09-22 15:14:02','2023-09-22 15:14:02',174,1,''),(4,'Manufatural','TEXT','2023-09-22 15:14:33','2023-09-22 15:14:33',174,2,''),(5,'Style','TEXT','2023-09-22 15:14:52','2023-09-22 15:14:52',174,1,''),(6,'Cost Level','TEXT','2023-09-22 15:15:18','2023-09-22 15:15:18',174,1,''),(7,'Color','TEXT','2023-09-22 15:15:54','2023-09-22 15:15:54',174,3,''),(8,'Location','TEXT','2023-09-22 15:16:15','2023-09-22 15:16:15',174,1,''),(9,'Size','TEXT','2023-09-22 15:16:34','2023-09-22 15:16:34',174,2,''),(10,'Mohammed Elattar','TEXT','2023-09-22 16:24:00','2023-09-22 16:24:00',180,2,''),(11,'Right now','TEXT','2023-09-22 16:35:42','2023-09-22 16:35:42',180,2,'');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint unsigned NOT NULL,
  `lang` decimal(10,7) NOT NULL,
  `lat` decimal(10,7) NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branches_email_unique` (`email`),
  UNIQUE KEY `branches_phone_unique` (`phone`),
  KEY `branches_city_id_foreign` (`city_id`),
  KEY `branches_user_id_index` (`user_id`),
  CONSTRAINT `branches_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `branches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (3,'Aspen Holcomb','noxehyky@mailinator.com','11',1,1.0000000,1.0000000,8,'2023-09-20 18:16:24','2023-09-20 18:16:24');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_user_details`
--

DROP TABLE IF EXISTS `business_user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_user_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_of_experience` int NOT NULL,
  `number_of_employees` int NOT NULL,
  `volume_of_work` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_range` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint unsigned NOT NULL,
  `lang` decimal(10,7) NOT NULL,
  `lat` decimal(10,7) NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `package_id` bigint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `business_user_details_business_email_unique` (`business_email`),
  UNIQUE KEY `business_user_details_phone_unique` (`phone`),
  KEY `business_user_details_city_id_foreign` (`city_id`),
  KEY `business_user_details_user_id_index` (`user_id`),
  KEY `business_user_details_package_id_foreign` (`package_id`),
  CONSTRAINT `business_user_details_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_user_details_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_user_details`
--

LOCK TABLES `business_user_details` WRITE;
/*!40000 ALTER TABLE `business_user_details` DISABLE KEYS */;
INSERT INTO `business_user_details` VALUES (4,'Mohammed Said','dilam92368@ipnuc.com','01099620659',20,2,'10','$','0','0',1,123.0000000,123.0000000,5,'2023-09-17 18:17:00','2023-09-17 18:17:00',2),(6,'Test GmbH','test100@test.com','1234567890',10,1,'10','$$','public/images/b1wiY3ZaDWl3J0UrheydGvTCaBRrSHgqDfgV3g0i.jpg','public/images/akwfYQiQknptiFGc66uNaCGJC1HmKlMQN5tDCnYm.jpg',1,1.5678000,1.5670000,8,'2023-09-18 19:49:38','2023-09-20 17:52:22',2),(8,'Swar','Swar@gmial.com','01097910630',10,2,'4','$$$','https://craftscene.s3.us-east-2.amazonaws.com/public/images/oUWxNeYazr0uS399TrNP5wZhgkYxFdW790Y8Qxig.jpg','https://craftscene.s3.us-east-2.amazonaws.com/public/images/DZvEOEuAqMcQZHqrW5gRZIt7YtRvPuR3cZuXCrHD.jpg',1,20.0000000,20.0000000,9,'2023-09-19 09:15:12','2023-09-20 19:21:07',4);
/*!40000 ALTER TABLE `business_user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_user_employees`
--

DROP TABLE IF EXISTS `business_user_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_user_employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `business_user_detail_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_user_employees_user_id_foreign` (`user_id`),
  KEY `business_user_employees_business_user_detail_id_foreign` (`business_user_detail_id`),
  CONSTRAINT `business_user_employees_business_user_detail_id_foreign` FOREIGN KEY (`business_user_detail_id`) REFERENCES `business_user_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_user_employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_user_employees`
--

LOCK TABLES `business_user_employees` WRITE;
/*!40000 ALTER TABLE `business_user_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_user_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_type` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_alias_unique` (`alias`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (18,NULL,'الخرسانة','Concrete',2,'2023-09-18 10:11:21','2023-09-18 10:11:21',NULL),(19,NULL,'الخرسانة','Concrete',1,'2023-09-18 10:11:55','2023-09-18 10:11:55',NULL),(20,19,'صيانة الخرسانة المصبوبة في مكانها','Maintenance of Cast-in-Place Concrete',1,'2023-09-18 10:15:15','2023-09-18 10:15:15',NULL),(21,18,'صيانة الخرسانة المصبوبة في مكانها','Maintenance of Cast-in-Place Concrete',2,'2023-09-18 10:15:47','2023-09-18 10:15:47',NULL),(22,19,'نتائج العمل المشتركة للخرسانة','Common Work Results for Concrete',1,'2023-09-18 10:16:56','2023-09-18 10:16:56',NULL),(23,18,'نتائج العمل المشتركة للخرسانة','Common Work Results for Concrete',2,'2023-09-18 10:17:23','2023-09-18 10:17:23',NULL),(24,19,'مادة مضافة للون الخرسانة','Concrete Color Additive',1,'2023-09-18 10:18:18','2023-09-18 10:18:18',NULL),(25,18,'مادة مضافة للون الخرسانة','Concrete Color Additive',2,'2023-09-18 10:18:42','2023-09-18 10:18:42',NULL),(27,19,'الصبغات الخرسانية','Concrete Pigments',1,'2023-09-18 10:20:13','2023-09-18 10:20:13',NULL),(28,18,'الصبغات الخرسانية','Concrete Pigments',2,'2023-09-18 10:20:35','2023-09-18 10:20:35',NULL),(29,19,'الجداول الزمنية للخرسانة','Schedules for Concrete',1,'2023-09-18 10:21:06','2023-09-18 10:21:06',NULL),(30,18,'الجداول الزمنية للخرسانة','Schedules for Concrete',2,'2023-09-18 10:21:20','2023-09-18 10:21:20',NULL),(32,19,'صب الخرسانة المعمارية في المكان','Architectural Cast-in Place Concrete Forming',1,'2023-09-18 10:22:50','2023-09-18 10:22:50',NULL),(33,18,'صب الخرسانة المعمارية في المكان','Architectural Cast-in Place Concrete Forming',2,'2023-09-18 10:23:17','2023-09-18 10:23:17',NULL),(34,18,'تعزيز الألياف','Fibrous Reinforcing',2,'2023-09-18 10:24:11','2023-09-18 10:24:11',NULL),(35,19,'تعزيز الألياف','Fibrous Reinforcing',1,'2023-09-18 10:24:30','2023-09-18 10:24:30',NULL),(36,18,'خرسانة إنشائية خفيفة الوزن','Lightweight Structural Concrete',2,'2023-09-18 10:25:10','2023-09-18 10:25:10',NULL),(37,19,'خرسانة إنشائية خفيفة الوزن','Lightweight Structural Concrete',1,'2023-09-18 10:25:33','2023-09-18 10:25:33',NULL),(38,18,'تشطيب خرسانة','Concrete Finishing',2,'2023-09-18 10:26:12','2023-09-18 10:26:12',NULL),(39,19,'تشطيب خرسانة','Concrete Finishing',1,'2023-09-18 10:26:30','2023-09-18 10:26:30',NULL),(40,18,'تشطيب الأرضيات الخرسانية شديدة التحمل','Heavy-Duty Concrete Floor Finishing',2,'2023-09-18 10:27:12','2023-09-18 10:27:12',NULL),(41,19,'تشطيب الأرضيات الخرسانية شديدة التحمل','Heavy-Duty Concrete Floor Finishing',1,'2023-09-18 10:27:34','2023-09-18 10:27:34',NULL),(42,18,'تشطيب خرسانة مختومة','Stamped Concrete Finishing',2,'2023-09-18 10:28:11','2023-09-18 10:28:11',NULL),(43,19,'تشطيب خرسانة مختومة','Stamped Concrete Finishing',1,'2023-09-18 10:28:32','2023-09-18 10:28:32',NULL),(44,18,'تشطيب خرساني مصقول','Polished Concrete Finishing',2,'2023-09-18 10:29:01','2023-09-18 10:29:01',NULL),(45,19,'تشطيب خرساني مصقول','Polished Concrete Finishing',1,'2023-09-18 10:29:24','2023-09-18 10:29:24',NULL),(46,18,'الخرسانة المعمارية مسبقة الصنع','Precast Architectural Concrete',2,'2023-09-18 10:30:25','2023-09-18 10:30:25',NULL),(47,19,'الخرسانة المعمارية مسبقة الصنع','Precast Architectural Concrete',1,'2023-09-18 10:30:42','2023-09-18 10:30:42',NULL),(48,18,'تخصصات الخرسانة الجاهزة','Precast Concrete Specialties',2,'2023-09-18 10:31:18','2023-09-18 10:31:18',NULL),(49,19,'تخصصات الخرسانة الجاهزة','Precast Concrete Specialties',1,'2023-09-18 10:31:40','2023-09-18 10:31:40',NULL),(50,18,'الخرسانة المسلحة بالألياف الزجاجية','Glass-Fiber-Reinforced Concrete',2,'2023-09-18 10:32:12','2023-09-18 10:32:12',NULL),(51,19,'الخرسانة المسلحة بالألياف الزجاجية','Glass-Fiber-Reinforced Concrete',1,'2023-09-18 10:32:35','2023-09-18 10:32:35',NULL),(52,18,'الطبقة الخرسانية','Concrete Topping',2,'2023-09-18 10:33:04','2023-09-18 10:33:04',NULL),(53,19,'الطبقة الخرسانية','Concrete Topping',1,'2023-09-18 10:33:22','2023-09-18 10:33:22',NULL),(54,18,'الطبقة السفلية المصبوبة','Cast Underlayment',2,'2023-09-18 10:33:59','2023-09-18 10:33:59',NULL),(55,19,'الطبقة السفلية المصبوبة','Cast Underlayment',1,'2023-09-18 10:34:14','2023-09-18 10:34:14',NULL),(56,18,'الطبقة السفلية الأسمنتية الهيدروليكية','Hydraulic Cement Underlayment',2,'2023-09-18 10:34:43','2023-09-18 10:34:43',NULL),(57,19,'الطبقة السفلية الأسمنتية الهيدروليكية','Hydraulic Cement Underlayment',1,'2023-09-18 10:35:13','2023-09-18 10:35:13',NULL),(58,18,'الحشو الغير القابل للانكماش','Non-Shrink Grouting',2,'2023-09-18 10:36:07','2023-09-18 10:36:07',NULL),(59,19,'الحشو الغير القابل للانكماش','Non-Shrink Grouting',1,'2023-09-18 10:36:34','2023-09-18 10:36:34',NULL),(60,NULL,'البناء','Masonry',2,'2023-09-18 10:39:00','2023-09-18 10:39:00',NULL),(61,NULL,'البناء','Masonry',1,'2023-09-18 10:39:26','2023-09-18 10:39:26',NULL),(62,60,'صيانة البناء','Maintenance of Masonry',2,'2023-09-18 10:40:14','2023-09-18 10:40:14',NULL),(63,61,'صيانة البناء','Maintenance of Masonry',1,'2023-09-18 10:40:35','2023-09-18 10:40:35',NULL),(64,60,'هاون البناء','Masonry Mortaring',2,'2023-09-18 10:42:11','2023-09-18 10:42:11',NULL),(65,61,'هاون البناء','Masonry Mortaring',1,'2023-09-18 10:42:38','2023-09-18 10:42:38',NULL),(66,60,'وحدة الطين البناء','Clay Unit Masonry',2,'2023-09-18 10:43:35','2023-09-18 10:43:35',NULL),(67,61,'وحدة الطين البناء','Clay Unit Masonry',1,'2023-09-18 10:43:56','2023-09-18 10:43:56',NULL),(68,60,'طوب البناء','Brick Masonry',2,'2023-09-18 10:44:36','2023-09-18 10:44:36',NULL),(69,61,'طوب البناء','Brick Masonry',1,'2023-09-18 10:44:58','2023-09-18 10:44:58',NULL),(70,60,'قشرة البناء','Masonry Veneer',2,'2023-09-18 10:45:58','2023-09-18 10:45:58',NULL),(71,61,'قشرة البناء','Masonry Veneer',1,'2023-09-18 10:46:40','2023-09-18 10:46:40',NULL),(72,60,'البناء بالحجر المصبوب','Cast Stone Masonry',2,'2023-09-18 10:47:31','2023-09-18 10:47:31',NULL),(73,61,'البناء بالحجر المصبوب','Cast Stone Masonry',1,'2023-09-18 10:47:56','2023-09-18 10:47:56',NULL),(74,60,'صناعة الحجر الحجري','Manufactured Stone Masonry',2,'2023-09-18 10:48:45','2023-09-18 10:48:45',NULL),(75,61,'صناعة الحجر الحجري','Manufactured Stone Masonry',1,'2023-09-18 10:49:31','2023-09-18 10:49:31',NULL),(76,NULL,'الخشب والبلاستيك والمواد المركبة','WOOD, PLASTICS, AND COMPOSITES',2,'2023-09-18 11:30:11','2023-09-18 11:30:11',NULL),(77,NULL,'الخشب والبلاستيك والمواد المركبة','WOOD, PLASTICS, AND COMPOSITES',1,'2023-09-18 11:30:35','2023-09-18 11:30:35',NULL),(78,NULL,'التشطيبات','Finishes',1,'2023-09-19 07:03:32','2023-09-19 07:03:32',NULL),(79,78,'صيانة الطلاء والطلاء','Maintenance of Painting and Coating',1,'2023-09-19 07:04:01','2023-09-19 07:04:01',NULL),(80,78,'نتائج العمل المشتركة لتحضير الأرضيات','common Work Results for Flooring Preparation',1,'2023-09-19 07:04:43','2023-09-19 07:04:43',NULL),(81,78,'الطبقة السفلية الصوتية','Acoustic Underlayment',1,'2023-09-19 07:06:40','2023-09-19 07:06:40',NULL),(82,78,'الجبس والجبس بورد','plaster and Gypsum Board',1,'2023-09-19 07:07:29','2023-09-19 07:07:29',NULL),(83,78,'دعم الجبس وألواح الجبس','Supports for Plaster and Gypsum Board',1,'2023-09-19 07:08:26','2023-09-19 07:08:26',NULL),(84,78,'تأطير المعادن غير الهيكلية','Non-Structural Metal Framing',1,'2023-09-19 07:09:10','2023-09-19 07:09:10',NULL),(85,78,'اللوح','Lath',1,'2023-09-19 07:09:45','2023-09-19 07:09:45',NULL),(86,78,'تبليط','Tiling',1,'2023-09-19 07:10:39','2023-09-19 07:10:39',NULL),(87,NULL,'تشطيبات','Finishes',2,'2023-09-19 07:10:54','2023-09-19 07:10:54',NULL),(88,78,'السقوف','Ceilings',1,'2023-09-19 07:11:53','2023-09-19 07:11:53',NULL),(89,78,'الأرضيات الزجاجية الهيكلية','Structural Glass Flooring',1,'2023-09-19 07:12:26','2023-09-19 07:12:26',NULL),(90,78,'أرضيات الرقص الخشبية','Wood Dance Flooring',1,'2023-09-19 07:13:00','2023-09-19 07:13:00',NULL),(91,78,'أرضيات البلاط المرنة','Resilient Tile Flooring',1,'2023-09-19 07:13:49','2023-09-19 07:13:49',NULL),(92,78,'سجاد','Carpeting',1,'2023-09-19 07:14:20','2023-09-19 07:14:20',NULL),(93,87,'صيانة الطلاء','Maintenance of Painting and Coating',2,'2023-09-19 07:15:11','2023-09-19 07:15:11',NULL),(94,78,'تشطيبات الجدران','Wall Finishes',1,'2023-09-19 07:15:15','2023-09-19 07:15:15',NULL),(95,78,'الدهانات والطلاءات','Paints and Coatings',1,'2023-09-19 07:15:47','2023-09-19 07:15:47',NULL),(96,87,'نتائج أعمال تحضير الأرضيات','ommon Work Results for Flooring Preparation',2,'2023-09-19 07:17:48','2023-09-19 07:17:48',NULL),(97,87,'الطبقة السفلية الصوتية','Acoustic Underlayment',2,'2023-09-19 07:31:53','2023-09-19 07:31:53',NULL),(98,87,'لاستر وألواح الجبس','laster and Gypsum Board',2,'2023-09-19 07:33:55','2023-09-19 07:33:55',NULL),(99,87,'دعم الجبس وألواح الجبس','Supports for Plaster and Gypsum Board',2,'2023-09-19 07:37:44','2023-09-19 07:37:44',NULL),(100,87,'الإطارات المعدنية غير الهيكلية','Non-Structural Metal Framing',2,'2023-09-19 07:38:56','2023-09-19 07:38:56',NULL),(101,87,'مجموعة شرائح خشبية','Lath',2,'2023-09-19 07:40:46','2023-09-19 07:40:46',NULL),(102,87,'التبليط','Tiling',2,'2023-09-19 07:42:02','2023-09-19 07:42:02',NULL),(103,87,'السقوف','Ceilings',2,'2023-09-19 07:43:07','2023-09-19 07:43:07',NULL),(104,87,'الأرضيات الزجاجية الهيكلية','Structural Glass Flooring',2,'2023-09-19 07:44:19','2023-09-19 07:44:19',NULL),(105,87,'أرضيات الرقص الخشبية','Wooden dance floors',2,'2023-09-19 07:46:29','2023-09-19 07:46:29',NULL),(106,87,'أرضيات بلاط مرنة','Resilient Tile Flooring',2,'2023-09-19 07:47:17','2023-09-19 07:47:17',NULL),(107,87,'السجاد','Carpeting',2,'2023-09-19 07:48:25','2023-09-19 07:48:25',NULL),(108,87,'تشطيبات الجدران','Wall Finishes',2,'2023-09-19 07:50:29','2023-09-19 07:50:29',NULL),(109,87,'الدهانات والطلاء','Paints and Coatings',2,'2023-09-19 07:51:35','2023-09-19 07:51:35',NULL),(111,NULL,'الحديد','Metals',2,'2023-09-19 08:03:20','2023-09-19 08:03:20',NULL),(112,NULL,'المعادن','Metals',1,'2023-09-19 08:09:53','2023-09-19 08:09:53',NULL),(113,112,'الطلاءات التطبيقية للمعادن في المتاجر','Shop-Applied Coatings for Metal',1,'2023-09-19 08:10:36','2023-09-19 08:10:36',NULL),(114,112,'أعمدة فولاذية مقاومة للحريق','Fabricated Fireproofed Steel Columns',1,'2023-09-19 08:11:31','2023-09-19 08:11:31',NULL),(115,111,'الطلاءات المطبقة على المعادن','Shop-Applied Coatings for Metal',2,'2023-09-19 08:21:35','2023-09-19 08:21:35',NULL),(116,112,'جمعيات حبل الأسلاك الفولاذية','Steel Wire Rope Assemblies',1,'2023-09-19 08:22:41','2023-09-19 08:22:41',NULL),(117,111,'أعمدة فولاذية مقاومة للحريق','Fabricated Fireproofed Steel Columns',2,'2023-09-19 08:23:11','2023-09-19 08:23:11',NULL),(118,112,'جمعيات القضبان الهيكلية','Structural Rod Assemblies',1,'2023-09-19 08:23:15','2023-09-19 08:23:15',NULL),(119,112,'تأطير الرافعة الفولاذية','Steel Joist Framing',1,'2023-09-19 08:24:38','2023-09-19 08:24:38',NULL),(120,112,'التزيين الفولاذي','Steel Decking',1,'2023-09-19 08:25:11','2023-09-19 08:25:11',NULL),(121,111,'حبل أسلاك الفولاذ','Steel Wire Rope Assemblies',2,'2023-09-19 08:25:11','2023-09-19 08:25:11',NULL),(122,112,'التزيين بالأرضيات الفولاذية','Steel Floor Decking',1,'2023-09-19 08:25:51','2023-09-19 08:25:51',NULL),(123,112,'سطح السقف الصلب','Steel Roof Decking',1,'2023-09-19 08:26:40','2023-09-19 08:26:40',NULL),(124,112,'إطار معدني مشكل على البارد','Cold-Formed Metal Framing',1,'2023-09-19 08:27:13','2023-09-19 08:27:13',NULL),(125,112,'جمعيات الدعم المعدنية','Metal Support Assemblies',1,'2023-09-19 08:27:50','2023-09-19 08:27:50',NULL),(126,112,'صناعات معدنية','Metal Fabrications',1,'2023-09-19 08:28:31','2023-09-19 08:28:31',NULL),(127,111,'مجموعة الأعمدة الهيكلية','Structural Rod Assemblies',2,'2023-09-19 08:28:49','2023-09-19 08:28:49',NULL),(130,111,'تأطير رافدة الصلب','Steel Joist Framing',2,'2023-09-19 08:30:01','2023-09-19 08:30:01',NULL),(131,112,'سلالم معدنية','Metal Stairs',1,'2023-09-19 08:30:33','2023-09-19 08:30:33',NULL),(132,112,'منحدرات الألمنيوم المعيارية','Modular Aluminum Ramps',1,'2023-09-19 08:31:35','2023-09-19 08:31:35',NULL),(133,112,'سلالم معدنية','Metal Ladders',1,'2023-09-19 08:32:00','2023-09-19 08:32:00',NULL),(134,112,'الممرات المعدنية','Metal Walkways',1,'2023-09-19 08:32:31','2023-09-19 08:32:31',NULL),(135,111,'اكسسوارات الصلب','Steel Decking',2,'2023-09-19 08:32:33','2023-09-19 08:32:33',NULL),(136,112,'درابزين معدني','Metal Railings',1,'2023-09-19 08:32:57','2023-09-19 08:32:57',NULL),(137,112,'درابزين الأنابيب والأنابيب','Pipe and Tube Railings',1,'2023-09-19 08:33:59','2023-09-19 08:33:59',NULL),(138,112,'الحماية من السقوط على السطح','Rooftop Fall Protection',1,'2023-09-19 08:34:33','2023-09-19 08:34:33',NULL),(139,111,'تزيين الأرضيات الفولاذية','Steel Floor Decking',2,'2023-09-19 08:34:33','2023-09-19 08:34:33',NULL),(140,112,'معالجة الدرج المعدني والحواف','Metal Stair Treads and Nosings',1,'2023-09-19 08:36:10','2023-09-19 08:36:10',NULL),(141,111,'تزيين الأسقف الصللبة','Steel Roof Decking',2,'2023-09-19 08:36:46','2023-09-19 08:36:46',NULL),(144,111,'إطار معدني مشكل على البارد','Cold-Formed Metal Framing',2,'2023-09-19 08:37:37','2023-09-19 08:37:37',NULL),(145,111,'تدعيم الحديد','Metal Support Assemblies',2,'2023-09-19 08:39:50','2023-09-19 08:39:50',NULL),(146,112,'حواف الدرج المعدنية','Metal Stair Nosings',1,'2023-09-19 08:39:55','2023-09-19 08:39:55',NULL),(147,112,'تشكيلات معدنية','Formed Metal Fabrications',1,'2023-09-19 08:40:22','2023-09-19 08:40:22',NULL),(148,112,'أغطية الأعمدة','Column Covers',1,'2023-09-19 08:40:49','2023-09-19 08:40:49',NULL),(149,111,')تصنيع الحديد (الصلب','Metal Fabrications',2,'2023-09-19 08:41:20','2023-09-19 08:41:20',NULL),(150,112,'المعادن الزخرفية','Decorative Metal',1,'2023-09-19 08:41:24','2023-09-19 08:41:24',NULL),(151,112,'سلالم لولبية مصنعة','Fabricated Spiral Stairs',1,'2023-09-19 08:42:17','2023-09-19 08:42:17',NULL),(152,111,'سلالم حديدية','Metal Stairs',2,'2023-09-19 08:42:32','2023-09-19 08:42:32',NULL),(155,111,'سلالم ذات وحدات الألومنيوم','Modular Aluminum Ramps',2,'2023-09-19 08:44:04','2023-09-19 08:44:04',NULL),(156,112,'درابزين معدني مزخرف','Decorative Metal Railings',1,'2023-09-19 08:45:10','2023-09-19 08:45:10',NULL),(157,111,'سلالم معدنية','Metal Ladders',2,'2023-09-19 08:45:25','2023-09-19 08:45:25',NULL),(158,112,'درابزين مزخرف من الفولاذ المقاوم للصدأ','Decorative Stainless Steel Railings',1,'2023-09-19 08:45:38','2023-09-19 08:45:38',NULL),(159,112,'سلك حبل درابزين معدني مزخرف','Wire Rope Decorative Metal Railings',1,'2023-09-19 08:46:15','2023-09-19 08:46:15',NULL),(160,111,'الممرات صلبة','Metal Walkways',2,'2023-09-19 08:46:51','2023-09-19 08:46:51',NULL),(161,111,'درابزين صلب','Metal Railings',2,'2023-09-19 08:48:22','2023-09-19 08:48:22',NULL),(162,111,'سياج الأنابيب','Pipe and Tube Railings',2,'2023-09-19 08:49:55','2023-09-19 08:49:55',NULL),(163,111,'الحماية السقوط من السطح','Rooftop Fall Protection',2,'2023-09-19 08:51:57','2023-09-19 08:51:57',NULL),(166,111,'معالجة الدرج المعدني والحواف','Metal Stair Treads and Nosings',2,'2023-09-19 08:59:19','2023-09-19 08:59:19',NULL),(167,111,'حواف الدرج المعدنية','Metal Stair Nosings',2,'2023-09-19 09:00:08','2023-09-19 09:00:08',NULL),(168,111,'تصنيع المعادن المشكلة','Formed Metal Fabrications',2,'2023-09-19 09:03:04','2023-09-19 09:03:04',NULL),(169,111,'أغلفة الأعمدة','Column Covers',2,'2023-09-19 09:05:37','2023-09-19 09:05:37',NULL),(170,111,'المعادن الزخرفية','Decorative Metal',2,'2023-09-19 09:06:50','2023-09-19 09:06:50',NULL),(171,111,'السلالم الحلزونية المصنعة','Fabricated Spiral Stairs',2,'2023-09-19 09:07:52','2023-09-19 09:07:52',NULL),(173,111,'درابزين من الفولاذ المقاوم للصدأ','Decorative Stainless Steel Railings',2,'2023-09-19 09:09:15','2023-09-19 09:09:15',NULL),(174,111,'أسلاك السور المعدني الزخرفية','Wire Rope Decorative Metal Railings',2,'2023-09-19 09:10:30','2023-09-19 09:10:30',NULL),(175,111,'الأسوار المعدنية الزخرفية','Decorative Metal Railings',2,'2023-09-19 09:12:23','2023-09-19 09:12:23',NULL),(176,22,'خلطة تخفيض بخار الرطوبة في الخرسانة','Concrete Moisture Vapor Reduction Admixture',1,'2023-09-19 09:17:46','2023-09-19 09:17:46',NULL),(177,22,'خلطات العزل المائي المتكاملة المقاومة للماء','Integral Hydrophobic Waterproofing Admixtures',1,'2023-09-19 09:19:13','2023-09-19 09:19:13',NULL),(178,23,'خليط تقليل بخار رطوبة الخرسانة','Concrete Moisture Vapor Reduction Admixture',2,'2023-09-19 09:19:40','2023-09-19 09:19:40',NULL),(179,22,'العزل المائي المتكامل للخرسانة','Integral Waterproofing of Concrete',1,'2023-09-19 09:19:59','2023-09-19 09:19:59',NULL),(180,23,'خلطات العزل المائي المتكاملة الكارهة للماء','Integral Hydrophobic Waterproofing Admixtures',2,'2023-09-19 09:20:38','2023-09-19 09:20:38',NULL),(181,24,'خليط عزل المياه الخرساني','Concrete Water Proofing Admixture',1,'2023-09-19 09:20:59','2023-09-19 09:20:59',NULL),(182,23,'العزل المائي المتكامل للخرسانة','Integral Waterproofing of Concrete',2,'2023-09-19 09:21:40','2023-09-19 09:21:40',NULL),(183,29,'الخلطات الخرسانية','Concrete Admixtures',1,'2023-09-19 09:21:49','2023-09-19 09:21:49',NULL),(184,32,'نماذج معمارية','Architectural Formliners',1,'2023-09-19 09:22:23','2023-09-19 09:22:23',NULL),(185,25,'خليط عزل المياه الخرساني','Concrete Water Proofing Admixture',2,'2023-09-19 09:22:53','2023-09-19 09:22:53',NULL),(186,32,'فورملاينرز للخرسانة المعمارية','Formliners For Architectural Concrete',1,'2023-09-19 09:23:26','2023-09-19 09:23:26',NULL),(187,30,'الخلطات الخرسانية','Concrete Admixtures',2,'2023-09-19 09:24:17','2023-09-19 09:24:17',NULL),(188,33,'نماذج معمارية','Architectural Formliners',2,'2023-09-19 09:25:19','2023-09-19 09:25:19',NULL),(189,35,'تعزيز الألياف للخرسانة','Fiber-Reinforcement for Concrete',1,'2023-09-19 09:25:23','2023-09-19 09:25:23',NULL),(190,33,'فورملاينر للخرسانة المعمارية','Formliners For Architectural Concrete',2,'2023-09-19 09:26:38','2023-09-19 09:26:38',NULL),(191,39,'التشطيبات الخرسانية','CONCRETE FINISHES',1,'2023-09-19 09:27:24','2023-09-19 09:27:24',NULL),(192,34,'تقوية الألياف للخرسانة','Fiber-Reinforcement for Concrete',2,'2023-09-19 09:27:39','2023-09-19 09:27:39',NULL),(193,39,'التشطيبات الخرسانية، الخلطات، الإضافات، الركام وعوامل التلوين','Concrete Finishing, Admixtures, Additives, Aggregate and Coloring Agents',1,'2023-09-19 09:28:05','2023-09-19 09:28:05',NULL),(194,38,'التشطيبات الخرسانية','CONCRETE FINISHES',2,'2023-09-19 09:28:29','2023-09-19 09:28:29',NULL),(195,49,'معالجات السلالم الخرسانية مسبقة الصب','Precast Concrete Stair Treads',1,'2023-09-19 09:28:56','2023-09-19 09:28:56',NULL),(196,38,'تشطيب الخرسانة ، المضافات ، المواد المضافة ، عوامل الركام والتلوين','Concrete Finishing, Admixtures, Additives, Aggregate and Coloring Agents',2,'2023-09-19 09:30:14','2023-09-19 09:30:14',NULL),(197,51,'تصنيع الخرسانة المسلحة بالألياف الزجاجية','GFRC FABRICATIONS',1,'2023-09-19 09:30:16','2023-09-19 09:30:16',NULL),(198,53,'طبقة خرسانية مصقولة ذاتية التسوية','SELF-LEVELING POLISHED CONCRETE TOPPING',1,'2023-09-19 09:30:51','2023-09-19 09:30:51',NULL),(199,55,'الطبقة السفلية للأرضية','Floor Underlayment',1,'2023-09-19 09:31:27','2023-09-19 09:31:27',NULL),(200,48,'معالجات السلالم الخرسانية مسبقة الصب','Precast Concrete Stair Treads',2,'2023-09-19 09:31:42','2023-09-19 09:31:42',NULL),(201,55,'طبقات الصب ذاتية التسوية','SELF-LEVELING CAST UNDERLAYMENTS',1,'2023-09-19 09:31:54','2023-09-19 09:31:54',NULL),(202,59,'الحشو غير المعدني غير القابل للانكماش','NON-METALLIC NON-SHRINK GROUTING',1,'2023-09-19 09:32:33','2023-09-19 09:32:33',NULL),(203,50,'تصنيع جي إف آر سي','GFRC FABRICATIONS',2,'2023-09-19 09:32:42','2023-09-19 09:32:42',NULL),(204,52,'طبقة خرسانية مصقولة ذاتية التسوية','SELF-LEVELING POLISHED CONCRETE TOPPING',2,'2023-09-19 09:34:22','2023-09-19 09:34:22',NULL),(205,54,'الطبقة السفلية للأرضية','Floor Underlayment',2,'2023-09-19 09:35:21','2023-09-19 09:35:21',NULL),(206,54,'طبقات الصب ذاتية التسوية','SELF-LEVELING CAST UNDERLAYMENTS',2,'2023-09-19 09:36:15','2023-09-19 09:36:15',NULL),(207,58,'الحشو غير المعدني الغير قابل للانكماش','NON-METALLIC NON-SHRINK GROUTING',2,'2023-09-19 09:37:51','2023-09-19 09:37:51',NULL),(208,62,'أعمال البناء والحشو وصيانة البناء والحجر','Masonry Mortaring, Grouting, and Maintenance of Masonry and Stone',2,'2023-09-20 08:47:19','2023-09-20 08:47:19',NULL),(210,23,'تست','test',1,'2023-09-20 21:37:36','2023-09-20 21:37:36','T');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_services`
--

DROP TABLE IF EXISTS `category_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_services_category_id_foreign` (`category_id`),
  KEY `category_services_service_id_foreign` (`service_id`),
  CONSTRAINT `category_services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_services`
--

LOCK TABLES `category_services` WRITE;
/*!40000 ALTER TABLE `category_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_country_id_foreign` (`country_id`),
  CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'aaa','aaa',1,'2023-09-05 19:46:07','2023-09-05 19:46:07');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'aaaa','aaaa','aaa','2023-09-05 19:46:07','2023-09-05 19:46:07');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `follower_user_id` bigint unsigned NOT NULL,
  `following_user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `followers_follower_user_id_index` (`follower_user_id`),
  KEY `followers_following_user_id_index` (`following_user_id`),
  CONSTRAINT `followers_follower_user_id_foreign` FOREIGN KEY (`follower_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `followers_following_user_id_foreign` FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_search`
--

DROP TABLE IF EXISTS `google_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_search` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `place_id` varchar(27) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `google_search_user_id_foreign` (`user_id`),
  CONSTRAINT `google_search_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_search`
--

LOCK TABLES `google_search` WRITE;
/*!40000 ALTER TABLE `google_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `google_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` bigint unsigned NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (2,'aaa','aa','aa','public/images/ivTVHiK3oOJgo1L0BWKhLnfyHjwLfLle6EI5v6d5.jpg',1,'App\\Models\\Product','2023-09-20 10:40:57','2023-09-20 10:40:57'),(6,'title 1','3333','caption1','public/images/W25F1OFnwaTTTAWDiEqcCdScqF4trc6DcBZS1wWC.jpg',2,'App\\Models\\Product','2023-09-21 07:03:22','2023-09-21 07:03:22');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'default','{\"uuid\":\"11935e2e-6a01-4eca-81bb-5887b94b3c66\",\"displayName\":\"App\\\\Jobs\\\\SendEmailVerificationCodesJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailVerificationCodesJob\",\"command\":\"O:38:\\\"App\\\\Jobs\\\\SendEmailVerificationCodesJob\\\":2:{s:50:\\\"\\u0000App\\\\Jobs\\\\SendEmailVerificationCodesJob\\u0000email_code\\\";s:6:\\\"267839\\\";s:45:\\\"\\u0000App\\\\Jobs\\\\SendEmailVerificationCodesJob\\u0000email\\\";s:20:\\\"mseel3ttar@gmail.com\\\";}\"},\"sentry_baggage_data\":\"sentry-trace_id=b61ba19b276e4e92b86afeff988e4861,sentry-sample_rate=1,sentry-transaction=%2Fapi%2Fauth%2Fsend-forget-password-code,sentry-public_key=df8930d8aececa88e40fb603f8e83b1e,sentry-environment=local,sentry-sampled=true\",\"sentry_trace_parent_data\":\"b61ba19b276e4e92b86afeff988e4861-a2a359f7d17848e4-1\"}',0,NULL,1694031028,1694031028),(2,'default','{\"uuid\":\"84825c1d-31a7-40fc-8f50-b79fc3858101\",\"displayName\":\"App\\\\Jobs\\\\SendEmailVerificationCodesJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailVerificationCodesJob\",\"command\":\"O:38:\\\"App\\\\Jobs\\\\SendEmailVerificationCodesJob\\\":2:{s:50:\\\"\\u0000App\\\\Jobs\\\\SendEmailVerificationCodesJob\\u0000email_code\\\";s:6:\\\"172493\\\";s:45:\\\"\\u0000App\\\\Jobs\\\\SendEmailVerificationCodesJob\\u0000email\\\";s:33:\\\"service.account@craftsceneapp.com\\\";}\"},\"sentry_baggage_data\":\"sentry-trace_id=a2c660cc5b58461d9d90140db1aa74f7,sentry-sample_rate=1,sentry-transaction=%2Fapi%2Fauth%2Fsend-forget-password-code,sentry-public_key=df8930d8aececa88e40fb603f8e83b1e,sentry-environment=local,sentry-sampled=true\",\"sentry_trace_parent_data\":\"a2c660cc5b58461d9d90140db1aa74f7-73315677971a4bb1-1\"}',0,NULL,1694252810,1694252810);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `experience_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_city_id_foreign` (`city_id`),
  CONSTRAINT `leads_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_100000_create_password_reset_tokens_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2023_07_15_074906_create_packages_table',1),(11,'2023_07_16_181309_create_countries_table',1),(12,'2023_07_16_181327_create_cities_table',1),(13,'2023_07_17_124455_create_job_batches_table',1),(14,'2023_07_17_125424_create_jobs_table',1),(15,'2023_07_17_181327_create_users_table',1),(16,'2023_07_23_084659_create_addresses_table',1),(17,'2023_07_23_110441_create_leads_table',1),(18,'2023_07_24_041113_create_branches_table',1),(19,'2023_07_24_120909_create_categories_table',1),(20,'2023_07_24_132839_create_services_table',1),(21,'2023_07_24_145223_create_category_services_table',1),(22,'2023_07_25_175054_create_user_services_table',1),(23,'2023_07_25_191906_create_user_ideas_table',1),(24,'2023_07_27_115437_create_user_interests_table',1),(25,'2023_08_05_190859_create_business_user_details_table',1),(26,'2023_08_09_212436_create_images_table',1),(27,'2023_08_11_064702_create_attributes_table',1),(28,'2023_08_11_070729_create_values_table',1),(29,'2023_08_14_135309_create_google_search_table',1),(30,'2023_08_28_112148_create_user_categories_table',1),(31,'2023_09_02_101144_create_products_table',1),(32,'2023_09_03_235013_create_variants_table',1),(33,'2023_10_16_105635_create_verification_codes_table',1),(34,'2023_10_17_181132_create_user_tokens_table',1),(35,'2023_09_10_100239_add_service_i_d_to_attributes',2),(36,'2023_09_11_220713_create_followers_table',3),(37,'2023_09_12_041709_add_package_id_to_business_user_details_table',3),(38,'2023_09_12_041723_remove_package_id_from_users_table',3),(40,'2023_09_12_091210_remove_alias_field_from_categories_table',4),(41,'2023_09_12_091319_change_alias_field_in_categories_table',5),(42,'2023_09_13_005603_create_notifications_table',6),(43,'2023_09_14_093108_create_wallets_table',6),(44,'2023_09_14_095349_create_referrals_table',6),(45,'2023_09_17_064651_update_attributes_table',6),(46,'2023_09_17_084026_update_business_user_details_table',6),(47,'2023_09_17_100427_create_business_user_employees_table',6),(48,'2023_09_17_072401_update_attributes_table',7),(49,'2023_09_17_073147_update_packages_table',7),(50,'2023_09_17_073804_update_products_table',7),(51,'2023_09_17_075745_update_user_ideas_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `recipient_user_id` bigint unsigned NOT NULL,
  `notification_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifications_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifications_recipient_user_id_foreign` (`recipient_user_id`),
  CONSTRAINT `notifications_recipient_user_id_foreign` FOREIGN KEY (`recipient_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('01c5cff54a46098537bcfc3d7b3663c790ac883474cd3cd480200e33bdd8ddab4b27c4acc0c7d1ed',1,148,'password','[]',0,'2023-09-20 18:47:43','2023-09-20 18:47:43','2024-03-20 18:47:43'),('03cae8c6035f05dd6a281e08fadd5b9d8f4e2c2d12b75056b9c6e579c40d502abbed6beee4583947',1,181,'password','[]',0,'2023-09-22 20:03:30','2023-09-22 20:03:30','2024-03-22 20:03:30'),('03d21f2ae3152416b4da15201aaed4290e1ad86c60fe7170e2fed6b0092b211972a859e8382b9bf4',1,97,'password','[]',0,'2023-09-18 11:50:51','2023-09-18 11:50:51','2024-03-18 11:50:51'),('0ac514d035f59492628238d5907c9935cd0c10087e334ae377cf5ea4a0f17cfaff76c171eb5478b3',1,49,'password','[]',0,'2023-09-12 13:16:17','2023-09-12 13:16:17','2024-03-12 13:16:17'),('0b65b280f140358e7b7a4a84cc23887152414bd31b3611cfea6c01d666d32de9e8c670ff7c8c551a',1,61,'password','[]',0,'2023-09-14 20:28:19','2023-09-14 20:28:19','2024-03-14 20:28:19'),('1277f3af72ad6e1e70962b11bb8614611f513f320fa8b391d1521363e268dbe0f920fd8e82bf6891',1,103,'password','[]',0,'2023-09-19 10:49:43','2023-09-19 10:49:43','2024-03-19 10:49:43'),('13c9833c2e153814c01b8f8e4f669aa536debce23fdef3d0f44cc677f2465403c8969f4c17127e27',3,10,'test@gmail.com','[]',0,'2023-09-07 22:01:43','2023-09-07 22:01:43','2024-03-07 22:01:43'),('14945f5b24007a36fbf53546c6f4ecee021dc7c441cd2601613e922bfe5e5b34e8e72d3e69f272bd',1,103,'password','[]',0,'2023-09-19 10:37:33','2023-09-19 10:37:33','2024-03-19 10:37:33'),('1596e44816a73e76aa8f47ee5a1a28779fcf137c7ab1728f5a71ba234f9ea289364243c4af75e217',1,40,'password','[]',0,'2023-09-09 20:45:12','2023-09-09 20:45:12','2024-03-09 20:45:12'),('17291ec11472e38072634a16c474d65ed27162526e6c42b43a2992df436aa8b5be2d0953ed1a1ec8',8,97,'test100@test.com','[]',0,'2023-09-18 19:24:47','2023-09-18 19:24:47','2024-03-18 19:24:47'),('194e309d1f5b27db9d31a4a1d2d0655b5d5fc13949a300ecb6756bebb1b939c7a271ca145629ed62',1,40,'password','[]',0,'2023-09-10 10:54:29','2023-09-10 10:54:29','2024-03-10 10:54:29'),('1d4a6995394c38c276634d08da41f2e0fdd7d3ee7e906a78185046c3582483bd0f52c2a1e7f59414',1,154,'password','[]',0,'2023-09-21 19:36:54','2023-09-21 19:36:54','2024-03-21 19:36:54'),('1f88ca5b3ff5078287d6d7da157b23390b5ce933a597e84fc1a8c8a4ff4f678c40e4841a6e690644',1,88,'password','[]',0,'2023-09-16 11:33:38','2023-09-16 11:33:38','2024-03-16 11:33:38'),('22b06e61cdeef97a8cbc136d034935fee4b62fa039e1104571d7ba6e90c06d11393aef506da8906b',1,43,'password','[]',1,'2023-09-10 18:57:34','2023-09-10 18:57:34','2024-03-10 18:57:34'),('238c66993e5ce96dc9a915c639316bfe5fa02985bb8840df628fa6fc826a800181de14bf25fe4d46',1,103,'password','[]',0,'2023-09-19 10:59:41','2023-09-19 10:59:41','2024-03-19 10:59:41'),('24b4bf8db926d6de389003f273b9dd0fcc4793053a801f18972f0f757f8bdba9b62fa2e64e4730e5',1,49,'password','[]',0,'2023-09-13 09:20:07','2023-09-13 09:20:07','2024-03-13 09:20:07'),('2588b17deffc318097d718ec7318e85a5bd31353004950bba28195198f22ac0f5614800f174add74',1,148,'password','[]',0,'2023-09-21 06:44:29','2023-09-21 06:44:29','2024-03-21 06:44:29'),('26eae9e9a61f12eb36da1b25f9f15c248dc399e2926662f433cd91460593a1f6e428d80c4ee4e8f9',1,61,'password','[]',0,'2023-09-14 16:02:07','2023-09-14 16:02:07','2024-03-14 16:02:07'),('27f45f6a6978278a12b6c3b0393dcbfc2dc0d646782e7122346f4fbc38fa9463515d0b719638e6be',1,148,'password','[]',0,'2023-09-20 19:20:45','2023-09-20 19:20:45','2024-03-20 19:20:45'),('29242f94ae13c4ac375bbcedabdce20e87ff6f288ee307b3e02a88b536a478b93a18a74b283065d7',1,106,'password','[]',0,'2023-09-19 13:40:37','2023-09-19 13:40:37','2024-03-19 13:40:37'),('2a8e97e3c4ee43bc2436893d047c314745f84c7bcd805c3cd5aad71d6c874cbb94f9bf9d7dd34537',1,49,'password','[]',0,'2023-09-12 13:29:26','2023-09-12 13:29:26','2024-03-12 13:29:26'),('2b8cce870ea6ed055ec634834ab9a4dbc3a24bc8a5cad14b0f277504c23e84e209d133d8a4f0e8b9',1,10,'password','[]',1,'2023-09-05 20:13:30','2023-09-05 20:13:30','2024-03-05 20:13:30'),('2ce9371b05eb9d7038bf7542f192fb23dc885e0f8437ee17f5f88a74a659d589f8a4c93edf5f6412',1,49,'password','[]',0,'2023-09-12 13:39:17','2023-09-12 13:39:17','2024-03-12 13:39:17'),('2e993fa9df244f7ba4d6066692708e4d3cf840a53a118ddc6efc08e457fe350674323cb5b64b3c7c',1,43,'password','[]',0,'2023-09-12 08:18:12','2023-09-12 08:18:12','2024-03-12 08:18:12'),('316c61e337a12e5186848dc1ea71203c6c3da7b91e3a6e863e10b787821c8d123b4931faaade7c2c',1,61,'password','[]',0,'2023-09-14 12:13:02','2023-09-14 12:13:02','2024-03-14 12:13:02'),('35dd47bb9d07ee5df8bf9d785d302298bf39f819a65a6fdca8ea855900a0f5563096a39e96881430',1,49,'password','[]',1,'2023-09-12 13:39:41','2023-09-12 13:39:41','2024-03-12 13:39:41'),('398920c23855742e691bedf6833d5d4374fc4d129e612fff977868394455a7287da0dba3d2d9b9c6',1,43,'password','[]',0,'2023-09-10 18:58:25','2023-09-10 18:58:25','2024-03-10 18:58:25'),('3bd34bd43f38b6ef8ac1c24e92cbfb6618a741a52ca36669adbda0c8aa210c1f9365d510d1812b96',10,145,'gucaxaf@mailinator.com','[]',0,'2023-09-20 17:50:19','2023-09-20 17:50:19','2024-03-20 17:50:19'),('3d1c131ddd53add00c1fe9b3eb66daf65d9043f231de589f152ca3b9108d8342bfb6de4165e965d1',1,154,'password','[]',0,'2023-09-21 16:28:11','2023-09-21 16:28:11','2024-03-21 16:28:11'),('3e0ff85219d31f9d054a44095550de85a0e24a48f1244b4ca1ca15ee1c8265dcb613c4bebc1079e3',1,37,'password','[]',0,'2023-09-09 10:01:51','2023-09-09 10:01:51','2024-03-09 10:01:51'),('43154d797e71f6dd0c071cd9f8975f2d5c6ef93d711fcf145d54f36238a1c238dd6032c1ebf638ad',1,58,'password','[]',0,'2023-09-13 09:53:45','2023-09-13 09:53:45','2024-03-13 09:53:45'),('47e08f74fe3b46e77097febfb737b64d292ad711d46bf508b732a90fc531518ecc1d3ebcac94b6c4',4,40,'yousef@gmail.com','[]',0,'2023-09-09 21:53:25','2023-09-09 21:53:25','2024-03-09 21:53:25'),('4b1613a3726ed944cc778743d754b78f935032f24288dd4a4b0cd2da74f5b18139f99a5b1a8632f7',1,97,'password','[]',0,'2023-09-19 07:00:29','2023-09-19 07:00:29','2024-03-19 07:00:29'),('4d111db5dbe20fe96f6509403ffcc2eab40bfbbd175e3990a0ac8a749aa9ad5a5981cc06c6bcdc64',1,43,'password','[]',0,'2023-09-11 21:22:21','2023-09-11 21:22:21','2024-03-11 21:22:21'),('50bc650dd713cb65ebd09a1dbbff1d4b7807fd093d58abd2bccc35be885d001893d9e441acd10284',1,40,'password','[]',0,'2023-09-10 08:25:29','2023-09-10 08:25:29','2024-03-10 08:25:29'),('50eb158c8b80c2f6cb56a2ebf60f28f3b0f72257d7f925a030d7b71237f6f54372567206d338cbca',1,10,'password','[]',0,'2023-09-05 20:11:47','2023-09-05 20:11:47','2024-03-05 20:11:47'),('523ee079ed6a4acfe5dc94d1a54852e876a41bfc83148d7353ec7990ab433cceb29579ee01a090d0',1,4,'password','[]',0,'2023-09-05 19:48:29','2023-09-05 19:48:29','2024-03-05 19:48:29'),('524d99bd6272b92669d5d41b4590b0e563ed837265a3c78a0b282af4ebf837738f06ea504b59bd68',1,61,'password','[]',0,'2023-09-13 10:16:26','2023-09-13 10:16:26','2024-03-13 10:16:26'),('572bcc61a2842bba25de18b3a696a9eabf48d47bc2ffc0985b990e19c8920fe7a3d4bb454444b759',1,61,'password','[]',0,'2023-09-13 10:10:05','2023-09-13 10:10:05','2024-03-13 10:10:05'),('5a54c47af4e8a032e3c7feac86d6ec4f2c007709cacb7b60d88e2525ef0e3017d4d6a52aebac5d29',1,10,'password','[]',0,'2023-09-07 11:06:04','2023-09-07 11:06:04','2024-03-07 11:06:04'),('5b8fbccc0d9c42b1659b8486e46b8108df8abe7c38a58f9d268e17d67af6dad3334fe3b162e19eaf',1,49,'password','[]',0,'2023-09-13 09:08:20','2023-09-13 09:08:20','2024-03-13 09:08:20'),('5c2802c16488ff2eca69a0b77990a0dc3b0cb18b17947349dc3b505bec0060d51e3264d7e8c1a350',1,184,'password','[]',0,'2023-09-22 21:20:37','2023-09-22 21:20:37','2024-03-22 21:20:37'),('5c3ae4fc42a97fa61a2526c6c1dd18943eeaf59300cfd9d7f34f69b6f8b6b261e726617ef106c011',1,181,'password','[]',0,'2023-09-22 20:18:35','2023-09-22 20:18:35','2024-03-22 20:18:35'),('5ca197cf3b0bd4d31ea3df3449078853d61e12f762d989ea30ce23ef00398905fb52dfc4f6289d21',1,43,'password','[]',0,'2023-09-10 18:58:14','2023-09-10 18:58:14','2024-03-10 18:58:14'),('5e8bdd06806468eaf99c90e7d375aa01d9e0814610333c93e3da2bf8b947470ffec8c4b6febdd980',1,40,'password','[]',0,'2023-09-09 23:24:16','2023-09-09 23:24:16','2024-03-09 23:24:16'),('5f0decded3c43e3f4f0834ab2d3b22a55ace7d0e7b1cc088314237796a35da8f1970380c929166fb',1,154,'password','[]',0,'2023-09-21 16:36:21','2023-09-21 16:36:21','2024-03-21 16:36:21'),('5fce0f64964b63b2a282a9822dad701157ac79bd064a3add6d40c03344594f3f9dfc3da59803ac8f',1,154,'password','[]',0,'2023-09-22 17:45:02','2023-09-22 17:45:02','2024-03-22 17:45:02'),('6278287d602723cb23e2b1be5f416b3e29bbf85f02b6dc30f63addda597d128dd4c4682ea17c59fb',1,43,'password','[]',0,'2023-09-10 23:39:13','2023-09-10 23:39:13','2024-03-10 23:39:13'),('649d0290bdab0d7a8bcfd6269c6665f70b9c450d122f3dd5a2751a6a18c40a7f3b266176b3908db7',1,154,'password','[]',0,'2023-09-22 16:23:44','2023-09-22 16:23:44','2024-03-22 16:23:44'),('65c3b217b2ab76a9eb58593206887dd4f1d1573e860691b16d16220fb6bf44cebb835d59d849b117',1,10,'password','[]',0,'2023-09-07 11:13:58','2023-09-07 11:13:58','2024-03-07 11:13:58'),('65caa5de7f78e210e055f10e6462b630e99bddcb7b69d9c916833c619ffdaf88ca5f3745593b6250',1,97,'password','[]',0,'2023-09-18 20:13:45','2023-09-18 20:13:45','2024-03-18 20:13:45'),('661235520a165aec103b5e1aa86cc9c93fe86e1e83ac5d15d800014c1595e38a475eeac247899ea0',1,40,'password','[]',0,'2023-09-10 10:52:33','2023-09-10 10:52:33','2024-03-10 10:52:33'),('66fc673c3e81e3be59f118a01827d61986bfcc4ff19344c2d85f7e6ffdfdd15ac8432e67d725ebdf',1,139,'password','[]',0,'2023-09-20 07:06:53','2023-09-20 07:06:53','2024-03-20 07:06:53'),('6716dd576795b809ceca1d15e6fef33bf04bc567f24a756f285132f5a5cfb989599ed65b9319a00b',1,43,'password','[]',0,'2023-09-10 20:21:59','2023-09-10 20:21:59','2024-03-10 20:21:59'),('6956b0fe2421583c1d71b985d12a0aba083863671a6636502af7835a7cd077ca4ee736929d3b3a67',1,103,'password','[]',0,'2023-09-19 10:18:07','2023-09-19 10:18:07','2024-03-19 10:18:07'),('6b802536e6e117e08a7de0aace83d6bb2835aba389900ba66536d5f1ef04be747fa40fd805406b27',1,43,'password','[]',0,'2023-09-11 10:55:17','2023-09-11 10:55:17','2024-03-11 10:55:17'),('6c8dff3e9d187c3d38e268c4d5840c0e2d9adbf595de0168eafaab0559691020988a3205b0a8b81b',1,97,'password','[]',0,'2023-09-18 12:20:47','2023-09-18 12:20:47','2024-03-18 12:20:47'),('6dcdf1c0a88f5ff63273c2188e23213354de691bff42456f0c06324a8f6ca8b4e4c370113cff9181',1,148,'password','[]',0,'2023-09-20 19:42:41','2023-09-20 19:42:41','2024-03-20 19:42:41'),('7573e821420e908055e7ad3da4cdfda1554f2c222453c7e3b34474d239a953d60905c9dbc1acd5bb',1,97,'password','[]',0,'2023-09-18 19:50:00','2023-09-18 19:50:00','2024-03-18 19:50:00'),('761b3a6e8863554a5461479bd1d3af01a31d52ccf899065e5049d7b1008d654a9e04c6fe0b424f2b',1,10,'password','[]',0,'2023-09-07 17:22:58','2023-09-07 17:22:58','2024-03-07 17:22:58'),('7657f5bee26ab832a10f3cd2b9ce5f105e9059d90219102d261fb3b1263d6fc4326cdb74dc0094f6',1,148,'password','[]',0,'2023-09-20 20:12:04','2023-09-20 20:12:04','2024-03-20 20:12:04'),('79af2226d908477d6f8f7eed30d71ed73d35487a7fe0dffe8241c116bf6af4b4a5570cfd2b6a8f52',1,154,'password','[]',0,'2023-09-21 16:29:04','2023-09-21 16:29:04','2024-03-21 16:29:04'),('7fd955fe44b9f5d4e9c376f9ed92b883a5ab044dd55facfb90a261d9ce93c86f42c5b6a7640f4abb',1,43,'password','[]',0,'2023-09-10 19:49:55','2023-09-10 19:49:55','2024-03-10 19:49:55'),('803988fe2440223f8918a4283f530ed0c0d8bce4279fe316748fb7b99eb1d86f9fb127cbab489c0c',1,58,'password','[]',0,'2023-09-13 09:53:35','2023-09-13 09:53:35','2024-03-13 09:53:35'),('809538bb56dc367eab3df5e982a84d3f9a4ef934e9d816c6ce6861cd9c982fe874a029e5548cb457',1,154,'password','[]',0,'2023-09-21 17:13:15','2023-09-21 17:13:15','2024-03-21 17:13:15'),('80d32aa19e7044e6c370f5ce925ccb244c0ce7df8afc6600eebc71ebec6c8e695e17a59787d947cf',1,10,'password','[]',0,'2023-09-07 17:17:12','2023-09-07 17:17:12','2024-03-07 17:17:12'),('81a23a5613a9d22b094848104223c70a4655a635e6ccad0098b77a5e8bca114dd16108bc2fc890cc',1,148,'password','[]',0,'2023-09-20 21:31:32','2023-09-20 21:31:32','2024-03-20 21:31:32'),('828de1c8fb06026a1431372a57d3043e55ff41cb63222840921361a4e4c93ff459a9137926f745e8',1,97,'password','[]',0,'2023-09-18 19:23:58','2023-09-18 19:23:58','2024-03-18 19:23:58'),('82c25b52864c1ed12e9b6c0757e0b58b61c3dbfe5a28814f1587a40299b60a214090a0bf89fabd11',1,148,'password','[]',0,'2023-09-21 12:58:01','2023-09-21 12:58:01','2024-03-21 12:58:01'),('866cf04ff0ca947efd77e003c7e8602486fb79fe950354044f36a72a16c10c7eb6f1ab0d0edb33e0',1,55,'password','[]',0,'2023-09-13 09:47:19','2023-09-13 09:47:19','2024-03-13 09:47:19'),('88468387c55c73af2eca15ea9313c9f7eb056a7e265fcaf02024bea9fff39f42ea9518fff768cabd',1,154,'password','[]',0,'2023-09-22 14:50:01','2023-09-22 14:50:01','2024-03-22 14:50:01'),('892588d1dd03f112096b4e49ead6c1b7a3d470d82a70fce8c2678977671a77363eda4307e49f65a9',1,154,'password','[]',0,'2023-09-21 19:05:08','2023-09-21 19:05:08','2024-03-21 19:05:08'),('896ae1c70974b687183306c6a5e72fa9237527d89d39898a396a14a74efffbb2c278ea22e6e9f7cf',1,10,'password','[]',1,'2023-09-06 19:31:37','2023-09-06 19:31:37','2024-03-06 19:31:37'),('8baeb5ebce241b2ac0a6ce8d313fab04f99a7c9cb4e327bb6b6f01d913aa2e5eb08df13865caeb98',1,97,'password','[]',0,'2023-09-18 19:42:01','2023-09-18 19:42:01','2024-03-18 19:42:01'),('8c123d6647e4816b055cee05db5fee4b39dac9d62505666277c4b002393b2a9a9781bcf100104667',1,10,'password','[]',0,'2023-09-08 16:10:38','2023-09-08 16:10:38','2024-03-08 16:10:38'),('8d8c00cf824bc704d0333324bf7cf5307bc3e5f50a1d941816fe269679e887b2791ebfa07e99d064',1,43,'password','[]',0,'2023-09-11 19:27:21','2023-09-11 19:27:21','2024-03-11 19:27:21'),('9ed4b7cae8622f28a3e345b350c9ef4766d7666cfa147d08b496f0628429a35159f7c8a519cf4c82',1,97,'password','[]',0,'2023-09-18 10:10:55','2023-09-18 10:10:55','2024-03-18 10:10:55'),('a00b28306b55bd46f44eccbe483b6fd148a963bde9b5824ce88f65509809b1629b4f6c1197bfb114',1,148,'password','[]',0,'2023-09-20 21:31:40','2023-09-20 21:31:40','2024-03-20 21:31:40'),('a672f8d5033d0a6cb7a819e8fb74a1beff644e22a8269173137bab5dc11f2342a7bbaa6a661c7d7a',1,43,'password','[]',0,'2023-09-12 06:25:10','2023-09-12 06:25:10','2024-03-12 06:25:10'),('a97d2ba64d30932b68140c2c9de14e3e38d143d42a31ec97f83cf62c460c786c8689636621696336',7,97,'info@room108.nl','[]',0,'2023-09-18 12:10:27','2023-09-18 12:10:27','2024-03-18 12:10:27'),('a9b35c0dd35e2a3cc9c87d4fc160d118a80f12e7c651b24dce3f1c9e5edf6c41e043dede6a031d39',1,49,'password','[]',0,'2023-09-12 13:18:42','2023-09-12 13:18:42','2024-03-12 13:18:42'),('aa7d66a2af14913c48e35ae504e3891579082e01ba70152da03f74e4c330c85155fe531f1a17983a',1,97,'password','[]',0,'2023-09-18 12:01:22','2023-09-18 12:01:22','2024-03-18 12:01:22'),('acfe19e4e00b4efde5e47ab682ca121e866c57ee12f6f86da90247fa9aeae8d531821952aa059da6',1,43,'password','[]',0,'2023-09-10 18:58:17','2023-09-10 18:58:17','2024-03-10 18:58:17'),('b439925d58e0ea7533bcd1c0d426387d26be1fde76e1a8cef4d6caedf08c7febc2e9cadb0ecd5731',1,103,'password','[]',1,'2023-09-19 09:12:55','2023-09-19 09:12:55','2024-03-19 09:12:55'),('b473e6dba7dd0495e8066d0626d0ad553988551515bd91c0fb1cf792ff3d583480ada3190a118038',1,88,'password','[]',0,'2023-09-17 12:45:19','2023-09-17 12:45:19','2024-03-17 12:45:19'),('b5333df43abbdfd6a2bfbc7a1cfa786d01f297260456c1cf62cd05c8dbdfc968463154630ba2a614',1,43,'password','[]',0,'2023-09-11 16:58:14','2023-09-11 16:58:14','2024-03-11 16:58:14'),('b647f0f0f9a6a08b61aba890a397b6fb2f5679698fa1a6c7df5584e3c1b03861e59f9f98f4c6465a',9,103,'swar@gmail.com','[]',0,'2023-09-19 09:13:42','2023-09-19 09:13:42','2024-03-19 09:13:42'),('b960d5a332d7ad1512b9704f81d1de7fcb95c1e62c638e7f099f5ec678c16d94e3978fe13d5d5a30',1,40,'password','[]',0,'2023-09-10 11:19:53','2023-09-10 11:19:53','2024-03-10 11:19:53'),('b9db3a6640cb5eea5538b6bfe5761a235d084dc76f1fd9309eff07b990020b737edff66eef410b0a',1,10,'password','[]',1,'2023-09-06 19:27:19','2023-09-06 19:27:19','2024-03-06 19:27:19'),('bb44c5ee86564e6e6ea4547622e31c5df6d78c6cf298482144731c2852756837a226834190c84213',1,61,'password','[]',0,'2023-09-13 10:09:26','2023-09-13 10:09:26','2024-03-13 10:09:26'),('bd99f1a704e8dbe35b57d87edde4ca78730dce70bd54f048a0d0a67fdd37ec19e9758a7189bb09a5',1,148,'password','[]',0,'2023-09-20 21:05:19','2023-09-20 21:05:19','2024-03-20 21:05:19'),('bf4684e605d6df8be808c4b8a11e82417021b00a6258bf0be1814d016019ded98695992285d165af',1,148,'password','[]',0,'2023-09-20 20:51:15','2023-09-20 20:51:15','2024-03-20 20:51:15'),('c6b5f04ed775356fd89b933af0ba34043ff0a9021d67680c21229e88751d462f82cf0b7d4e82f4ba',1,61,'password','[]',0,'2023-09-14 12:36:25','2023-09-14 12:36:25','2024-03-14 12:36:25'),('c6ed456636342c49780ac9c36a93936c0763938ed72b1ece26aafed616f3d76ee882d331f11aad59',1,10,'password','[]',1,'2023-09-06 17:49:01','2023-09-06 17:49:01','2024-03-06 17:49:01'),('c793d14c7c1ccb39ad0a930385d0a111e5dfdf1a6fdf1906fadc7a91e86eb5a9980e838c97ace7cf',2,10,'mseel3ttar@gmail.com','[]',0,'2023-09-06 19:44:40','2023-09-06 19:44:40','2024-03-06 19:44:40'),('c8cc8034faa605a773b067c130e53f66fceb3a754b8fcb1ce10de518a2fd25f4922d1f438b23ba5e',5,88,'dilam92368@ipnuc.com','[]',0,'2023-09-17 18:10:17','2023-09-17 18:10:17','2024-03-17 18:10:17'),('c92ea5a04cc49ae1fe6c6ddbe402d152cd8d45ac7eae793183395af2cee84bc8d73d023b2757940a',1,97,'password','[]',0,'2023-09-18 10:55:39','2023-09-18 10:55:39','2024-03-18 10:55:39'),('c9a2a6686e318e174bc58f1f43024ec11e3d81e718654b8b347c94e6537f31ad0048cead995b1147',1,49,'password','[]',0,'2023-09-13 09:08:22','2023-09-13 09:08:22','2024-03-13 09:08:22'),('caa9d0cb297278ce7731d65a332f348c800a14fda6090a9ed9c63dc0e3ba98b18e7ecd0fc4c280f2',1,40,'password','[]',0,'2023-09-10 08:45:47','2023-09-10 08:45:47','2024-03-10 08:45:47'),('ccc0b5df8556720dafe75b6c23b38836a8ad4d5dddbc001db164a185b323c33e8e4ee32329425133',1,148,'password','[]',1,'2023-09-20 18:48:11','2023-09-20 18:48:11','2024-03-20 18:48:11'),('cd132bacdcbbe1641289e994143bf86c7a8ff60bbdaa7a9c9530148c1e5f78e115f010b7e802e80f',1,40,'password','[]',0,'2023-09-09 19:58:51','2023-09-09 19:58:51','2024-03-09 19:58:51'),('cd2c17e2476f590f689a0c8b7e98c8843d7dd1fd0c121dbdc613284c99f0cee503cd50dcf5de8dd3',1,88,'password','[]',0,'2023-09-17 07:21:12','2023-09-17 07:21:12','2024-03-17 07:21:12'),('d21b92c6a3f3edda6576a32013dee727465a2ff3bc17f3a1369603a71394fe8bf8e079ae5e818567',1,103,'password','[]',0,'2023-09-19 10:34:56','2023-09-19 10:34:56','2024-03-19 10:34:56'),('d31a31c4603fa01e04a9b7b766148b2584e0c8eec9cb26a79c035652d65293d4584d7d7c99cf6991',1,91,'password','[]',0,'2023-09-18 07:46:05','2023-09-18 07:46:05','2024-03-18 07:46:05'),('d549bc69fb00d47317e0be94df4e85d564cec00167d2ea83341c778cc671c6ed531607eeb04aee59',1,7,'password','[]',0,'2023-09-05 19:53:55','2023-09-05 19:53:55','2024-03-05 19:53:55'),('d5ebabe50d89d977696d3ffa4557ed8507ec6cd7bfe4efc336f2d73806baf7edb03631552bbde4d4',1,40,'password','[]',0,'2023-09-10 10:55:22','2023-09-10 10:55:22','2024-03-10 10:55:22'),('d8ec9db9d34ad58cc2c1720237f9a32ba5e3c009a2388cc168377afb6de2d5908c5db93834be030d',1,145,'password','[]',0,'2023-09-20 10:33:33','2023-09-20 10:33:33','2024-03-20 10:33:33'),('dc3eba8c9b6b20049c6f1b765bd9602c550b4f76fe122334d5a7d13c25668c3d995d68b80127ba2d',1,97,'password','[]',0,'2023-09-18 12:37:35','2023-09-18 12:37:35','2024-03-18 12:37:35'),('e392fe58e82ecc076cecb8022bfee0bf8bb1eca4496276c3f89a466b77f57d13a92a33a10acc34d5',1,49,'password','[]',0,'2023-09-12 10:26:59','2023-09-12 10:26:59','2024-03-12 10:26:59'),('e67043dd1bdb5bc4d2094db9e9d8e420404f8792e0056044a849de38192c1e5ce2b85c5cd07cf11a',1,49,'password','[]',1,'2023-09-12 13:15:37','2023-09-12 13:15:37','2024-03-12 13:15:37'),('e6e4e917bc21974fe5c495263f26b973297e59749e192b847494972e9ea30bbf950b5d904a580286',1,88,'password','[]',0,'2023-09-18 06:20:10','2023-09-18 06:20:10','2024-03-18 06:20:10'),('e9590cf87f07baeb2885c2a00424a0169d65c4f47f7f1c4ed10ff5bc0bd5706fcbba4aef67027b6b',1,37,'password','[]',0,'2023-09-09 10:08:13','2023-09-09 10:08:13','2024-03-09 10:08:13'),('e9e1860313bdf1e58cc1b048f055e81ef386b7356a9f5d4e466fe0d4358050476a3c85260764ffaf',1,10,'password','[]',1,'2023-09-06 17:30:30','2023-09-06 17:30:30','2024-03-06 17:30:30'),('ed2e71c7b9d9f7d93a5969688f2e888908faa3bd8048f2d09b909079ba44167c50521ee2d615ab8e',1,139,'password','[]',0,'2023-09-20 08:55:33','2023-09-20 08:55:33','2024-03-20 08:55:33'),('ee5cf346c3879cb1916457c37f9d669b5f3fe994ba637b9f329e22dc7f68a568c6d6947313e87e3a',1,97,'password','[]',0,'2023-09-19 07:02:34','2023-09-19 07:02:34','2024-03-19 07:02:34'),('f337a01583f2a3a3e9823a56e217ce170a8c82f1ca169a64d5286eb65e3dac859088f71c36c8679a',1,97,'password','[]',0,'2023-09-19 08:02:19','2023-09-19 08:02:19','2024-03-19 08:02:19'),('f64e88344ad28a72eae8dfae1d8dfd0f37cf87794c25eab5d7e1cf14b1434aed089f4d980c5fa789',1,154,'password','[]',0,'2023-09-21 19:01:40','2023-09-21 19:01:40','2024-03-21 19:01:40'),('f6de947676d20cbf347355d0d208b93e16f9a6865296f0e985085848ea638bbea5964471ce7aaf6e',1,43,'password','[]',0,'2023-09-12 08:17:34','2023-09-12 08:17:34','2024-03-12 08:17:34'),('f9093526d2979bc658a232b784ade0e15b71c31840b017a5b3f8b00bafbbb2b701aaea75174d6733',6,97,'CEO@ee-fm.org','[]',0,'2023-09-18 12:09:51','2023-09-18 12:09:51','2024-03-18 12:09:51'),('fb8e135579513c164874dfc75fb618739b5b97757bee421654fe47c9fd6ddd8e5360fff780e3c90d',1,148,'password','[]',0,'2023-09-20 18:12:15','2023-09-20 18:12:15','2024-03-20 18:12:15'),('fdceb5373dd2b8c7d3c35e2fded9725524c7bdb0a28531513fb13596caa9052d2fd5379e968774d4',1,10,'password','[]',1,'2023-09-06 20:10:50','2023-09-06 20:10:50','2024-03-06 20:10:50');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','4R1UWn81w1Ww46RtSeS08yjNGwMqaerJjuO0xAHL',NULL,'http://localhost',1,0,0,'2023-09-05 19:47:51','2023-09-05 19:47:51'),(2,NULL,'Laravel Personal Access Client','h3FLRsxdOPaFUbdnQH0Nz3j8YMEUaLu2BVC8VMxP',NULL,'http://localhost',1,0,0,'2023-09-05 19:48:22','2023-09-05 19:48:22'),(3,NULL,'Laravel Password Grant Client','aoVeROF70r4TLwR30nlGCivGl2ad98M29WxWTQ3e','users','http://localhost',0,1,0,'2023-09-05 19:48:22','2023-09-05 19:48:22'),(4,NULL,'Laravel Personal Access Client','MxZN0FFdGp46TnyygA9I28Cd8IWH0BxroRCNGLLe',NULL,'http://localhost',1,0,0,'2023-09-05 19:48:25','2023-09-05 19:48:25'),(5,NULL,'Laravel Personal Access Client','JQow3iAGs7NqyYuWMODsSbcuG870BhSvelF0Aw4J',NULL,'http://localhost',1,0,0,'2023-09-05 19:52:03','2023-09-05 19:52:03'),(6,NULL,'Laravel Password Grant Client','1WfSwrxAP8lSK0eGq1fTLJmjfCn1J0hflG2etPB8','users','http://localhost',0,1,0,'2023-09-05 19:52:03','2023-09-05 19:52:03'),(7,NULL,'Laravel Personal Access Client','JoVHw7IgP5YkyKPFf6jrlXPOSbmsY3PaG8jCS4q7',NULL,'http://localhost',1,0,0,'2023-09-05 19:52:03','2023-09-05 19:52:03'),(8,NULL,'Laravel Personal Access Client','5mslYKDbSQI1rKtJDPZwjsR9nCGbBZZ9QhCQTj7X',NULL,'http://localhost',1,0,0,'2023-09-05 20:10:46','2023-09-05 20:10:46'),(9,NULL,'Laravel Password Grant Client','Z13ShJnekO1BtcyNwExpgqxiqfNWGOjdBbszgLEn','users','http://localhost',0,1,0,'2023-09-05 20:10:46','2023-09-05 20:10:46'),(10,NULL,'Laravel Personal Access Client','ZIwHljkDpKgwhHVKOFghBwUi9wmYHipP5QSe0rby',NULL,'http://localhost',1,0,0,'2023-09-05 20:10:47','2023-09-05 20:10:47'),(11,NULL,'Laravel Personal Access Client','N5qtwpLCvH2mMrWLgK5jR3vuM1p5IJ7qZYJUvH0z',NULL,'http://localhost',1,0,0,'2023-09-08 18:00:31','2023-09-08 18:00:31'),(12,NULL,'Laravel Password Grant Client','zbCOoBBBeXmEt3CT1PrTHSghL2dCNjtf5qkbhZKn','users','http://localhost',0,1,0,'2023-09-08 18:00:31','2023-09-08 18:00:31'),(13,NULL,'Laravel Personal Access Client','G7MJRARFf6QCPb6JAmzxZ6ndiOin83f5PYmw6dzw',NULL,'http://localhost',1,0,0,'2023-09-08 18:00:31','2023-09-08 18:00:31'),(14,NULL,'Laravel Personal Access Client','YrFdsKd9M3CUqLhzkLafOHuaSjh1sod39kmHMdeG',NULL,'http://localhost',1,0,0,'2023-09-08 18:01:31','2023-09-08 18:01:31'),(15,NULL,'Laravel Password Grant Client','PcOnffCIP3YNMaYbzD7qdm1uuWSwtuezNhFZPLdz','users','http://localhost',0,1,0,'2023-09-08 18:01:31','2023-09-08 18:01:31'),(16,NULL,'Laravel Personal Access Client','jp4pDtM9s0AFy3PfShjesK9UyEA5VONqggyuSM42',NULL,'http://localhost',1,0,0,'2023-09-08 18:01:31','2023-09-08 18:01:31'),(17,NULL,'Laravel Personal Access Client','UNRAyNxkfVEqK7LrQ7F1nYM3etqnB2FQyX0xVXdW',NULL,'http://localhost',1,0,0,'2023-09-08 18:02:18','2023-09-08 18:02:18'),(18,NULL,'Laravel Password Grant Client','zeqLvGsYRcaLQ7ZurObkj5Xb4XZckk5OL6JrAUni','users','http://localhost',0,1,0,'2023-09-08 18:02:18','2023-09-08 18:02:18'),(19,NULL,'Laravel Personal Access Client','GbjgNgmyoIjUbk0TUeK0H4n2pVgtmUbfVLq4L1Of',NULL,'http://localhost',1,0,0,'2023-09-08 18:02:18','2023-09-08 18:02:18'),(20,NULL,'Laravel Personal Access Client','vVB42BV5KEMrif866PmnlDOxCjf5unvOxQDbzrWW',NULL,'http://localhost',1,0,0,'2023-09-08 18:03:09','2023-09-08 18:03:09'),(21,NULL,'Laravel Password Grant Client','yNb7qkgHYU5IgXVFZEHraIzU3MrmgWkPjDCaWIEQ','users','http://localhost',0,1,0,'2023-09-08 18:03:09','2023-09-08 18:03:09'),(22,NULL,'Laravel Personal Access Client','wBRqWhqPKHjsOk0GEV1zRvWAKvTv5kKF7edCC6Ss',NULL,'http://localhost',1,0,0,'2023-09-08 18:03:09','2023-09-08 18:03:09'),(23,NULL,'Laravel Personal Access Client','ELDJWoy6MHGAGzQbqHnFrMUDe4qZWFhF7uDrNJed',NULL,'http://localhost',1,0,0,'2023-09-08 18:04:11','2023-09-08 18:04:11'),(24,NULL,'Laravel Password Grant Client','BZghwW20T0xTBPPVCHrxALnCByYvVerFd3QPe6dL','users','http://localhost',0,1,0,'2023-09-08 18:04:11','2023-09-08 18:04:11'),(25,NULL,'Laravel Personal Access Client','LaXn052Jlvk6Aoj6sowIer0lLzV6gAkrl9wyJRO0',NULL,'http://localhost',1,0,0,'2023-09-08 18:04:11','2023-09-08 18:04:11'),(26,NULL,'Laravel Personal Access Client','jIHKQ7uzSrzViqHMqPToOdY8ipXBu5wPdRgpjDtn',NULL,'http://localhost',1,0,0,'2023-09-08 18:05:38','2023-09-08 18:05:38'),(27,NULL,'Laravel Password Grant Client','jYA89ktBYr75n2P9qDKs1c981zCRRZAHcSyb2iNt','users','http://localhost',0,1,0,'2023-09-08 18:05:38','2023-09-08 18:05:38'),(28,NULL,'Laravel Personal Access Client','zDuydJIsNOKR71JQ4xCSXX9TLIM31JwkSfhZrEPF',NULL,'http://localhost',1,0,0,'2023-09-08 18:05:38','2023-09-08 18:05:38'),(29,NULL,'Laravel Personal Access Client','EAlUjfuxFpVlQCQPN7K2a3IGSq1WvdwM4iRYEakX',NULL,'http://localhost',1,0,0,'2023-09-08 18:07:22','2023-09-08 18:07:22'),(30,NULL,'Laravel Password Grant Client','kK6toDjd1PuZoYkxvuGRrTqvXJoEI2qqpg5ifJ5D','users','http://localhost',0,1,0,'2023-09-08 18:07:22','2023-09-08 18:07:22'),(31,NULL,'Laravel Personal Access Client','GJHA0p8zcTkq6ArgLjdLHe3l8nkm3hVrmkRO34CQ',NULL,'http://localhost',1,0,0,'2023-09-08 18:07:22','2023-09-08 18:07:22'),(32,NULL,'Laravel Personal Access Client','QZonRC8R8LzwS3vClhqg5qK4nfUYBou1QNGbM8lV',NULL,'http://localhost',1,0,0,'2023-09-08 18:10:09','2023-09-08 18:10:09'),(33,NULL,'Laravel Password Grant Client','ZnN8a0TNLtpde8XkSPqzbxwLmOchNMv14IQKnDXS','users','http://localhost',0,1,0,'2023-09-08 18:10:09','2023-09-08 18:10:09'),(34,NULL,'Laravel Personal Access Client','BSaDHYz8mQN18RVPu9QrOu97Iv3oK5kZa2Ipnz8p',NULL,'http://localhost',1,0,0,'2023-09-08 18:10:10','2023-09-08 18:10:10'),(35,NULL,'Laravel Personal Access Client','p1Ph0KvIxySMMxHusFRDJh2jRnFUJYVbugromt29',NULL,'http://localhost',1,0,0,'2023-09-08 18:15:05','2023-09-08 18:15:05'),(36,NULL,'Laravel Password Grant Client','1URtNpz7QC5O5OCKR6nCvKJ0kUkaDr9CXWcxHha3','users','http://localhost',0,1,0,'2023-09-08 18:15:05','2023-09-08 18:15:05'),(37,NULL,'Laravel Personal Access Client','7AVZru8mbA6BvFJSJ42pjGvMNt1MPAzAr2ZkSExJ',NULL,'http://localhost',1,0,0,'2023-09-08 18:15:05','2023-09-08 18:15:05'),(38,NULL,'Laravel Personal Access Client','Vwu1VOyLNFi8JgjMmea9PkIk99ePzXR7o9GhRuM7',NULL,'http://localhost',1,0,0,'2023-09-09 19:53:20','2023-09-09 19:53:20'),(39,NULL,'Laravel Password Grant Client','fRKXwhn5K4BvKRVDLrYYYjs7JwCcXrZmEchsaPc1','users','http://localhost',0,1,0,'2023-09-09 19:53:20','2023-09-09 19:53:20'),(40,NULL,'Laravel Personal Access Client','XY9vJfCbWvV8XEFVzCAXfzfnyvoNY4NFEY6YW5VN',NULL,'http://localhost',1,0,0,'2023-09-09 19:53:20','2023-09-09 19:53:20'),(41,NULL,'Laravel Personal Access Client','qaX70by6rf6Wa3nrHpygPVLO2uwevvy0ClaHFpb8',NULL,'http://localhost',1,0,0,'2023-09-10 18:25:19','2023-09-10 18:25:19'),(42,NULL,'Laravel Password Grant Client','qObvbQyWbUlCGGcaVpTyA9UYcf80u4ucqfy5TM37','users','http://localhost',0,1,0,'2023-09-10 18:25:19','2023-09-10 18:25:19'),(43,NULL,'Laravel Personal Access Client','09vaiCEfKwOOK4v0Ec4bNIItEDdYj601thjPDvvc',NULL,'http://localhost',1,0,0,'2023-09-10 18:25:20','2023-09-10 18:25:20'),(44,NULL,'Laravel Personal Access Client','Q69UwZw3JtpFsW7YM2wPP89xpuiH6zAiKYgqgYF8',NULL,'http://localhost',1,0,0,'2023-09-12 08:46:07','2023-09-12 08:46:07'),(45,NULL,'Laravel Password Grant Client','BvW062Q6sQ0U56Kk1MluOBxRcJuZdyNeT0ImmgLT','users','http://localhost',0,1,0,'2023-09-12 08:46:07','2023-09-12 08:46:07'),(46,NULL,'Laravel Personal Access Client','qDtymn9lt2hDA6yIOu5dirXCCdxWAK4lEEJJqI1p',NULL,'http://localhost',1,0,0,'2023-09-12 08:46:07','2023-09-12 08:46:07'),(47,NULL,'Laravel Personal Access Client','V8bSZsrJ9UrVxi7V0YUbpgT0rxVWdVZTLOIDW1By',NULL,'http://localhost',1,0,0,'2023-09-12 08:53:59','2023-09-12 08:53:59'),(48,NULL,'Laravel Password Grant Client','JtUBf6XuQ5hlQNjsdexXkJi3J0BtUQtwiDGw3bss','users','http://localhost',0,1,0,'2023-09-12 08:53:59','2023-09-12 08:53:59'),(49,NULL,'Laravel Personal Access Client','ygLN7rii2qeiphiSLBcXtXQerEfUFUD2fq3xFpLy',NULL,'http://localhost',1,0,0,'2023-09-12 08:53:59','2023-09-12 08:53:59'),(50,NULL,'Laravel Personal Access Client','sfGCUzD51pPosDmJfUNsLTmXy4W8gq3LZ6ELQWQZ',NULL,'http://localhost',1,0,0,'2023-09-13 09:39:22','2023-09-13 09:39:22'),(51,NULL,'Laravel Password Grant Client','SzV5CztMd0UqmPiSikKoMqAnAoZ6uCwABJMHfaXN','users','http://localhost',0,1,0,'2023-09-13 09:39:22','2023-09-13 09:39:22'),(52,NULL,'Laravel Personal Access Client','sXiNK3beo65BPB1NhRdKysox9xGHOWKUqjg076WL',NULL,'http://localhost',1,0,0,'2023-09-13 09:39:22','2023-09-13 09:39:22'),(53,NULL,'Laravel Personal Access Client','KlZ0obouTaVyvUBpxvacQZa4TzdCl0vGFzHLUSxw',NULL,'http://localhost',1,0,0,'2023-09-13 09:46:37','2023-09-13 09:46:37'),(54,NULL,'Laravel Password Grant Client','Yzc4G4vMiKlfwXiJErpb7Vx1YUR63yBtJdKmWIPD','users','http://localhost',0,1,0,'2023-09-13 09:46:37','2023-09-13 09:46:37'),(55,NULL,'Laravel Personal Access Client','M2wgui30P9ZW4OuFrfDbgKjBQLqj3yJhET46PHkx',NULL,'http://localhost',1,0,0,'2023-09-13 09:46:38','2023-09-13 09:46:38'),(56,NULL,'Laravel Personal Access Client','uoYLQObz3fEt9IgKpAbCXXVZyeU1c499qsS9fpXW',NULL,'http://localhost',1,0,0,'2023-09-13 09:52:17','2023-09-13 09:52:17'),(57,NULL,'Laravel Password Grant Client','jgKkT9HxoiSMQIFppMashxl8QULTnWvMipYRdj1r','users','http://localhost',0,1,0,'2023-09-13 09:52:17','2023-09-13 09:52:17'),(58,NULL,'Laravel Personal Access Client','g0gv5NBbCOKNLamoXyBYuUdjGEPQrS6qeBuJxxBV',NULL,'http://localhost',1,0,0,'2023-09-13 09:52:18','2023-09-13 09:52:18'),(59,NULL,'Laravel Personal Access Client','CyATT010wr49tna12U4Tpdw3owByqBleA4f5pl5I',NULL,'http://localhost',1,0,0,'2023-09-13 10:07:34','2023-09-13 10:07:34'),(60,NULL,'Laravel Password Grant Client','WGXrmzuOEJ2WUwEi8ZT28eUKFdemsgFIcjMQ0wBi','users','http://localhost',0,1,0,'2023-09-13 10:07:34','2023-09-13 10:07:34'),(61,NULL,'Laravel Personal Access Client','uYLCymENuoZGxoVKzPB9lmOQOOsAeZva8xRgk9ep',NULL,'http://localhost',1,0,0,'2023-09-13 10:07:34','2023-09-13 10:07:34'),(62,NULL,'Laravel Personal Access Client','VIofVKwgLFWHks0KjaD7VWiCZI3Z3Pq79mEL8v2Q',NULL,'http://localhost',1,0,0,'2023-09-15 18:01:25','2023-09-15 18:01:25'),(63,NULL,'Laravel Password Grant Client','EwQ2uTPSLsASBMUMe1W3sGi9702cFG07a02Oph8j','users','http://localhost',0,1,0,'2023-09-15 18:01:25','2023-09-15 18:01:25'),(64,NULL,'Laravel Personal Access Client','zQNFF6vVawcVkNz3ts1lKtV3GzBpkZZ3P4CDMu4t',NULL,'http://localhost',1,0,0,'2023-09-15 18:01:26','2023-09-15 18:01:26'),(65,NULL,'Laravel Personal Access Client','trxXtfdCrvnjWkd6KojqFgsNWRI6TSYhFTckyKgu',NULL,'http://localhost',1,0,0,'2023-09-15 18:02:34','2023-09-15 18:02:34'),(66,NULL,'Laravel Password Grant Client','b161AoaNUo6X8xDEBtVwEgWAMHLtdVrXdVwv6NDB','users','http://localhost',0,1,0,'2023-09-15 18:02:34','2023-09-15 18:02:34'),(67,NULL,'Laravel Personal Access Client','FzoGWwl0DPciEGp02nQzEx6DQWTzlc1dpRYhcok3',NULL,'http://localhost',1,0,0,'2023-09-15 18:02:35','2023-09-15 18:02:35'),(68,NULL,'Laravel Personal Access Client','E0hTCRLg8LzE0SDKibyoX4xt4Sn4aG9xjj8B5DGZ',NULL,'http://localhost',1,0,0,'2023-09-15 18:03:29','2023-09-15 18:03:29'),(69,NULL,'Laravel Password Grant Client','KdTPvaBtMkPDx5qWu80mSLsmB4gHt0f2MdNFPgkC','users','http://localhost',0,1,0,'2023-09-15 18:03:29','2023-09-15 18:03:29'),(70,NULL,'Laravel Personal Access Client','Wn2ecfYoZ0z8TqviUZBTmtPzMwRnrcRkpaluw3By',NULL,'http://localhost',1,0,0,'2023-09-15 18:03:30','2023-09-15 18:03:30'),(71,NULL,'Laravel Personal Access Client','diZ4SDVQhAlgzPpH7nTYTNIcz24he2co2MSMHxfC',NULL,'http://localhost',1,0,0,'2023-09-15 18:04:29','2023-09-15 18:04:29'),(72,NULL,'Laravel Password Grant Client','ElN4iZNxQFmqk3QBkTOPtc6JhycmNRKTOcGVfzO9','users','http://localhost',0,1,0,'2023-09-15 18:04:29','2023-09-15 18:04:29'),(73,NULL,'Laravel Personal Access Client','go9Io7rYAdZI14ciS6OYNUq7oa8b3wViTA6541Dg',NULL,'http://localhost',1,0,0,'2023-09-15 18:04:29','2023-09-15 18:04:29'),(74,NULL,'Laravel Personal Access Client','kRmrqVuIJsXjD9vcAGNTEJWZx0hEx7Gfumj4EkCH',NULL,'http://localhost',1,0,0,'2023-09-15 18:05:40','2023-09-15 18:05:40'),(75,NULL,'Laravel Password Grant Client','PufQ2dBBAvPz5Uk2DrcKJmlfl3NqvlVgVlotEEIw','users','http://localhost',0,1,0,'2023-09-15 18:05:40','2023-09-15 18:05:40'),(76,NULL,'Laravel Personal Access Client','l2FrDMDANStDeOvlH18EVQ9WTPxUHbUJX5C9Zam1',NULL,'http://localhost',1,0,0,'2023-09-15 18:05:41','2023-09-15 18:05:41'),(77,NULL,'Laravel Personal Access Client','LMAED2qdClNOAWFj2wnDArX11wNEYsfOSaP60oq8',NULL,'http://localhost',1,0,0,'2023-09-15 18:07:02','2023-09-15 18:07:02'),(78,NULL,'Laravel Password Grant Client','0N5sJbD7xHk7HXL98BhXQe57zmWgjyr0pPlAtwwA','users','http://localhost',0,1,0,'2023-09-15 18:07:02','2023-09-15 18:07:02'),(79,NULL,'Laravel Personal Access Client','BzLGHwtNtXwfgpDpHhKV5yv1cRXaAHeHyFGLSl42',NULL,'http://localhost',1,0,0,'2023-09-15 18:07:03','2023-09-15 18:07:03'),(80,NULL,'Laravel Personal Access Client','tBWbSX1GZB8GUqvNNcEIZT40T1bkmVy984yDHXFM',NULL,'http://localhost',1,0,0,'2023-09-15 18:08:50','2023-09-15 18:08:50'),(81,NULL,'Laravel Password Grant Client','XyrnOiYzQ8iSRU0akZ4FhaLhwYXLtkqOp9zMwuan','users','http://localhost',0,1,0,'2023-09-15 18:08:50','2023-09-15 18:08:50'),(82,NULL,'Laravel Personal Access Client','GEOpauD3W3aBvhJiZeJUQG32pzfAsPGj4YhFjJ1e',NULL,'http://localhost',1,0,0,'2023-09-15 18:08:50','2023-09-15 18:08:50'),(83,NULL,'Laravel Personal Access Client','HzmEyTr3HiDyMqMtv8vyRrq6MLZSm5vPon0s3Sxx',NULL,'http://localhost',1,0,0,'2023-09-15 18:11:44','2023-09-15 18:11:44'),(84,NULL,'Laravel Password Grant Client','rxbqUkslK1QADGwy3L0vxgUU0k0QIiVhTuKWCrZy','users','http://localhost',0,1,0,'2023-09-15 18:11:44','2023-09-15 18:11:44'),(85,NULL,'Laravel Personal Access Client','GpS6meGtWJu9sBPgPln9cFkAIAL8QLPP7agKvEDg',NULL,'http://localhost',1,0,0,'2023-09-15 18:11:44','2023-09-15 18:11:44'),(86,NULL,'Laravel Personal Access Client','OHNyxHCrJCi53rYDpEeQybehThGfY0N9fZKCqGBM',NULL,'http://localhost',1,0,0,'2023-09-15 18:16:45','2023-09-15 18:16:45'),(87,NULL,'Laravel Password Grant Client','o1cqKwXwDgukIBtC2lB275BJkWtqAMRmDLoGZ7oO','users','http://localhost',0,1,0,'2023-09-15 18:16:45','2023-09-15 18:16:45'),(88,NULL,'Laravel Personal Access Client','PR4wdXjTMmlSZDwOMeuv4sN7yEg9tlzRZDfOR5dI',NULL,'http://localhost',1,0,0,'2023-09-15 18:16:46','2023-09-15 18:16:46'),(89,NULL,'Laravel Personal Access Client','TVtSkne2QLoLsvBEYGy05IVu056XbkumMfCDkZEv',NULL,'http://localhost',1,0,0,'2023-09-18 07:44:41','2023-09-18 07:44:41'),(90,NULL,'Laravel Password Grant Client','sT97iQrH6Vy2xq1a7yvrF28uVZn1gVJHS6EFLmIN','users','http://localhost',0,1,0,'2023-09-18 07:44:41','2023-09-18 07:44:41'),(91,NULL,'Laravel Personal Access Client','tci4BNquQ3ZxI5fKVZTKXlqol8HoJn9FL7vj9OnO',NULL,'http://localhost',1,0,0,'2023-09-18 07:44:42','2023-09-18 07:44:42'),(92,NULL,'Laravel Personal Access Client','S9OJ4fEcz0fQySNJ6AB0EUc8zZawBQyogkl1AXIY',NULL,'http://localhost',1,0,0,'2023-09-18 08:11:23','2023-09-18 08:11:23'),(93,NULL,'Laravel Password Grant Client','uXNlvawSIDPmCQRGbbONatMtm0v9dd5CNLEt9HTi','users','http://localhost',0,1,0,'2023-09-18 08:11:23','2023-09-18 08:11:23'),(94,NULL,'Laravel Personal Access Client','ZjPvJmOc6d1gBwXupeJtEITNTtijOk6H8Zn9iWRf',NULL,'http://localhost',1,0,0,'2023-09-18 08:11:23','2023-09-18 08:11:23'),(95,NULL,'Laravel Personal Access Client','hdejsqzOB5L2AFNv2iCoefzzPdpiKhnzNWKSNeLT',NULL,'http://localhost',1,0,0,'2023-09-18 09:20:09','2023-09-18 09:20:09'),(96,NULL,'Laravel Password Grant Client','KUQwNh2BPr354x99gA6TlW503JUvFANGtK5q2nSS','users','http://localhost',0,1,0,'2023-09-18 09:20:09','2023-09-18 09:20:09'),(97,NULL,'Laravel Personal Access Client','sa6Q1Pep1jjeQHpcyI2L2ILxFH7Q31UZXudywNrI',NULL,'http://localhost',1,0,0,'2023-09-18 09:20:09','2023-09-18 09:20:09'),(98,NULL,'Laravel Personal Access Client','BQplD52QYsUjStLSIIZbteiuuzlOieWAp3cd2Zeg',NULL,'http://localhost',1,0,0,'2023-09-19 08:10:37','2023-09-19 08:10:37'),(99,NULL,'Laravel Password Grant Client','IrJ2V3fEeVyixy1Rx8QKROsZGRuipdqSmnGB54Bs','users','http://localhost',0,1,0,'2023-09-19 08:10:37','2023-09-19 08:10:37'),(100,NULL,'Laravel Personal Access Client','p23X11Q7D3MWUDVzxplIGGZnv3MYM0S33flyRDTI',NULL,'http://localhost',1,0,0,'2023-09-19 08:10:37','2023-09-19 08:10:37'),(101,NULL,'Laravel Personal Access Client','qAhDskznfBVWrtTbsPISVX5LFokKSLmjYJT5VrGC',NULL,'http://localhost',1,0,0,'2023-09-19 08:39:26','2023-09-19 08:39:26'),(102,NULL,'Laravel Password Grant Client','YeCYWE1Ha0eD5hSvuDOTZMIRFe8EIb9QEk6dMFzL','users','http://localhost',0,1,0,'2023-09-19 08:39:26','2023-09-19 08:39:26'),(103,NULL,'Laravel Personal Access Client','ezdEDq5ayyua8npy4rVXiQo4Mz3ww8pSMxqEUyTf',NULL,'http://localhost',1,0,0,'2023-09-19 08:39:27','2023-09-19 08:39:27'),(104,NULL,'Laravel Personal Access Client','Za5esakWssmq3MT1YlRpykZ7qDXHWlNjJCDhNAPR',NULL,'http://localhost',1,0,0,'2023-09-19 13:39:35','2023-09-19 13:39:35'),(105,NULL,'Laravel Password Grant Client','PrkjXpissWXSb6MiYy8gmwkJOSHl3UjYyLpWxJEY','users','http://localhost',0,1,0,'2023-09-19 13:39:35','2023-09-19 13:39:35'),(106,NULL,'Laravel Personal Access Client','8FtD8zieKSmodEH7lHHIpTdwbGyu7O5qcWald7Cz',NULL,'http://localhost',1,0,0,'2023-09-19 13:39:35','2023-09-19 13:39:35'),(107,NULL,'Laravel Personal Access Client','8GJTZAjBEhT4VvaF1OYUT4g3ZMrnuEWB8dW0ONig',NULL,'http://localhost',1,0,0,'2023-09-19 18:54:25','2023-09-19 18:54:25'),(108,NULL,'Laravel Password Grant Client','mu0f2pn5BXjGbmu2bAiUAKzb4lf8hnzLl06d8tPB','users','http://localhost',0,1,0,'2023-09-19 18:54:25','2023-09-19 18:54:25'),(109,NULL,'Laravel Personal Access Client','IEShVCFkjEtuOQR3FXbA09cn2OkLirzCgFh3VcqF',NULL,'http://localhost',1,0,0,'2023-09-19 18:54:26','2023-09-19 18:54:26'),(110,NULL,'Laravel Personal Access Client','l3Bm7A1yRWPXPmlO9mG7H9GLJtmGqIPUD40Tn8v8',NULL,'http://localhost',1,0,0,'2023-09-19 19:04:41','2023-09-19 19:04:41'),(111,NULL,'Laravel Password Grant Client','0ICMqA0rOeqARZTOQyx5xnRbsdEMong8pu4WYuv0','users','http://localhost',0,1,0,'2023-09-19 19:04:41','2023-09-19 19:04:41'),(112,NULL,'Laravel Personal Access Client','GMqnLOnYDMbJRu6wNHTGLQIw5AqOekeEtuC1gOgC',NULL,'http://localhost',1,0,0,'2023-09-19 19:04:41','2023-09-19 19:04:41'),(113,NULL,'Laravel Personal Access Client','eQYXOxZTFflYLtJgVhfWItAT2wmFFepUUBQ2vzab',NULL,'http://localhost',1,0,0,'2023-09-19 19:06:57','2023-09-19 19:06:57'),(114,NULL,'Laravel Password Grant Client','wtrKJhjjOnwhVKau4S1biyj6JbQWt327FMFFkLYI','users','http://localhost',0,1,0,'2023-09-19 19:06:57','2023-09-19 19:06:57'),(115,NULL,'Laravel Personal Access Client','WcS15YVOvu1FBfz9SDDZ9u0hceAsaSDqVPTQ6ahs',NULL,'http://localhost',1,0,0,'2023-09-19 19:06:58','2023-09-19 19:06:58'),(116,NULL,'Laravel Personal Access Client','Q02MmxoDzJwr9Yy7rTbPYUrkVCatpiohDhxPkAJY',NULL,'http://localhost',1,0,0,'2023-09-19 19:08:43','2023-09-19 19:08:43'),(117,NULL,'Laravel Password Grant Client','1RBsqh7PaeQDxjmES8ZScYE388KBDB47IZH7HTry','users','http://localhost',0,1,0,'2023-09-19 19:08:43','2023-09-19 19:08:43'),(118,NULL,'Laravel Personal Access Client','7RCOsyRxg4dOvkur0heWpDvNy2Uml9XCsoiMXupY',NULL,'http://localhost',1,0,0,'2023-09-19 19:08:44','2023-09-19 19:08:44'),(119,NULL,'Laravel Personal Access Client','5VKBFVa6uuinZoeQzmkNB3baysll94LMFqvz69OP',NULL,'http://localhost',1,0,0,'2023-09-19 19:30:30','2023-09-19 19:30:30'),(120,NULL,'Laravel Password Grant Client','lrDPm6Cabj4an4zQiv8gLGaVLVJwVGivATVX6Ajw','users','http://localhost',0,1,0,'2023-09-19 19:30:30','2023-09-19 19:30:30'),(121,NULL,'Laravel Personal Access Client','6WJrHaZpp5Tazs8rSbWbSPbsGdpKL96bm7MRxUqf',NULL,'http://localhost',1,0,0,'2023-09-19 19:30:30','2023-09-19 19:30:30'),(122,NULL,'Laravel Personal Access Client','qUmdCb0eYxWleqFJQMP5x1FfBqwmL3U2Aq0n8d2t',NULL,'http://localhost',1,0,0,'2023-09-19 19:41:50','2023-09-19 19:41:50'),(123,NULL,'Laravel Password Grant Client','2QKuqabHLunSzuIRAxFvGa5Xe08y48U3Xc9h707C','users','http://localhost',0,1,0,'2023-09-19 19:41:51','2023-09-19 19:41:51'),(124,NULL,'Laravel Personal Access Client','zUaaZmdEYCpKFx2vxqUzKfeI5XPclkSXTUY6HJ8v',NULL,'http://localhost',1,0,0,'2023-09-19 19:41:51','2023-09-19 19:41:51'),(125,NULL,'Laravel Personal Access Client','ii1GXe9pCcpNHo07GXzWLnK7Vqr0DfAjENDrXRPP',NULL,'http://localhost',1,0,0,'2023-09-19 19:49:18','2023-09-19 19:49:18'),(126,NULL,'Laravel Password Grant Client','zaPUCSyQhwRfxdZeIPPmmvEavzD75MzPT4xHSlk6','users','http://localhost',0,1,0,'2023-09-19 19:49:18','2023-09-19 19:49:18'),(127,NULL,'Laravel Personal Access Client','wprNxwgqWRPr85zQ0BSe0xi0F3DejwOYGSKCHkLA',NULL,'http://localhost',1,0,0,'2023-09-19 19:49:18','2023-09-19 19:49:18'),(128,NULL,'Laravel Personal Access Client','7YUp4903fy02gCSnI3s2zrRV9sjXhiPUYJXnh7AX',NULL,'http://localhost',1,0,0,'2023-09-19 19:57:36','2023-09-19 19:57:36'),(129,NULL,'Laravel Password Grant Client','QVhOgmJXhxLa290ekZiXC1K7hoq8TCQJjoEfZz97','users','http://localhost',0,1,0,'2023-09-19 19:57:36','2023-09-19 19:57:36'),(130,NULL,'Laravel Personal Access Client','DNcKOQZkhwgaEIkLxQWXFEWiQi5945vVu4o6noRH',NULL,'http://localhost',1,0,0,'2023-09-19 19:57:37','2023-09-19 19:57:37'),(131,NULL,'Laravel Personal Access Client','5Ynihjpjgs2WnTEBdCYD2k23a23ow0koeyoANG6T',NULL,'http://localhost',1,0,0,'2023-09-19 20:07:01','2023-09-19 20:07:01'),(132,NULL,'Laravel Password Grant Client','Gojq54LD7SMwbTQlksIS3keFGRG6ybMoZgzAaDRZ','users','http://localhost',0,1,0,'2023-09-19 20:07:01','2023-09-19 20:07:01'),(133,NULL,'Laravel Personal Access Client','vXMBRQN7pEvXYYZC2ZfX0KHyxUcJgbcLjHyS9p1v',NULL,'http://localhost',1,0,0,'2023-09-19 20:07:02','2023-09-19 20:07:02'),(134,NULL,'Laravel Personal Access Client','FU4t9qfEV0UIcCRpB9iR9ZtOgZ8aLmWjexivL7F9',NULL,'http://localhost',1,0,0,'2023-09-19 20:22:03','2023-09-19 20:22:03'),(135,NULL,'Laravel Password Grant Client','6fghYFfgHX1kU36C38lLnE9ue6o5aMkFUBcuA8Xg','users','http://localhost',0,1,0,'2023-09-19 20:22:03','2023-09-19 20:22:03'),(136,NULL,'Laravel Personal Access Client','GFh5HHGnaypRebkboLDFSyQiE5tZJotsLd6ZrSlQ',NULL,'http://localhost',1,0,0,'2023-09-19 20:22:03','2023-09-19 20:22:03'),(137,NULL,'Laravel Personal Access Client','TiYdSWj1hn82xQQqQ2caKeLMBrFitEUqRC5PMvMK',NULL,'http://localhost',1,0,0,'2023-09-19 20:44:33','2023-09-19 20:44:33'),(138,NULL,'Laravel Password Grant Client','gsp6XKO8B73tNf27bSzZsokDBZnvNub31pOTx8fq','users','http://localhost',0,1,0,'2023-09-19 20:44:33','2023-09-19 20:44:33'),(139,NULL,'Laravel Personal Access Client','xuTarZx2CB7BR2d6Xm8rXLJyVlrWpz4GPTsvEL5Z',NULL,'http://localhost',1,0,0,'2023-09-19 20:44:34','2023-09-19 20:44:34'),(140,NULL,'Laravel Personal Access Client','5Y4S1F6Cm36xntaOqXFoMd2bCpMosxA4JP3xEiYK',NULL,'http://localhost',1,0,0,'2023-09-20 09:27:42','2023-09-20 09:27:42'),(141,NULL,'Laravel Password Grant Client','MKL1p9vSlHhC8npPkPDCHMTevScVb1gvRRyi5ZIZ','users','http://localhost',0,1,0,'2023-09-20 09:27:42','2023-09-20 09:27:42'),(142,NULL,'Laravel Personal Access Client','nZSvvistAm249juUTlfo3UzsdTc0NWNL1obo5Awm',NULL,'http://localhost',1,0,0,'2023-09-20 09:27:42','2023-09-20 09:27:42'),(143,NULL,'Laravel Personal Access Client','qZss7PsiZ3crXrrfwChtYyyKbo91aMu6IHtlFupW',NULL,'http://localhost',1,0,0,'2023-09-20 10:23:17','2023-09-20 10:23:17'),(144,NULL,'Laravel Password Grant Client','w1JJicaiTp8kH8wvJ7s0rBiMp9YrUPBR5LBRfiMu','users','http://localhost',0,1,0,'2023-09-20 10:23:17','2023-09-20 10:23:17'),(145,NULL,'Laravel Personal Access Client','HV0VHf79de1VmS0p0qc4zdQljtgGgjs8uJDE6bgn',NULL,'http://localhost',1,0,0,'2023-09-20 10:23:18','2023-09-20 10:23:18'),(146,NULL,'Laravel Personal Access Client','fmKCztgYUOyteTQ4snvWeFmWdA5WpbI0ZjpLBakq',NULL,'http://localhost',1,0,0,'2023-09-20 18:10:23','2023-09-20 18:10:23'),(147,NULL,'Laravel Password Grant Client','5kTIITvg7LLBYLAChV1sCQ8DdwwDbwdXPonbQ6B6','users','http://localhost',0,1,0,'2023-09-20 18:10:23','2023-09-20 18:10:23'),(148,NULL,'Laravel Personal Access Client','8gFpAGxhCNFGJMFDOXyGeWvVpOpbjrTz9RQfbgML',NULL,'http://localhost',1,0,0,'2023-09-20 18:10:23','2023-09-20 18:10:23'),(149,NULL,'Laravel Personal Access Client','jWDHS62H6Uhm9naeU34HY66R2902O1QbWUo1m74E',NULL,'http://localhost',1,0,0,'2023-09-21 13:41:37','2023-09-21 13:41:37'),(150,NULL,'Laravel Password Grant Client','mmfrCneFBC6BCMUcBSpN5dtCgFPdxYCDPQZKBYGy','users','http://localhost',0,1,0,'2023-09-21 13:41:37','2023-09-21 13:41:37'),(151,NULL,'Laravel Personal Access Client','aojzaNQteMXm4QPne4iA1fA91kQ3w2nIpy1uJpUo',NULL,'http://localhost',1,0,0,'2023-09-21 13:41:37','2023-09-21 13:41:37'),(152,NULL,'Laravel Personal Access Client','l64AxArFeW4AXzA3OmouLjezKrJiEaSK9tNLoJzV',NULL,'http://localhost',1,0,0,'2023-09-21 13:44:31','2023-09-21 13:44:31'),(153,NULL,'Laravel Password Grant Client','ZPcCmjBbUVTLlZmijY9UvZdyDIBIWCfoTwgBSQI3','users','http://localhost',0,1,0,'2023-09-21 13:44:31','2023-09-21 13:44:31'),(154,NULL,'Laravel Personal Access Client','Gl1r3T8HsgHqgVZz5vdSoUCzFjub7TQoSrLNYNJb',NULL,'http://localhost',1,0,0,'2023-09-21 13:44:32','2023-09-21 13:44:32'),(155,NULL,'Laravel Personal Access Client','MOBlwzVBKgdVnhyTezi7paGsOKWzDUzoCBcR0jEU',NULL,'http://localhost',1,0,0,'2023-09-22 18:01:28','2023-09-22 18:01:28'),(156,NULL,'Laravel Password Grant Client','PuvFJkjmVxuw64WwGXnX1C4TWe8ywTA5uITnLkUh','users','http://localhost',0,1,0,'2023-09-22 18:01:28','2023-09-22 18:01:28'),(157,NULL,'Laravel Personal Access Client','a7uXE8XQ11BbmsLWYKmokHbCyTfWrJrQCRTy25Se',NULL,'http://localhost',1,0,0,'2023-09-22 18:01:28','2023-09-22 18:01:28'),(158,NULL,'Laravel Personal Access Client','Ag0uhPsHBGoLQN9UTkz03pO8QPNtE21wRSv4MXHP',NULL,'http://localhost',1,0,0,'2023-09-22 18:02:36','2023-09-22 18:02:36'),(159,NULL,'Laravel Password Grant Client','VxUrNrUQwI3lmpCFW1RNxjQ9fuY02N5nlN323cMk','users','http://localhost',0,1,0,'2023-09-22 18:02:36','2023-09-22 18:02:36'),(160,NULL,'Laravel Personal Access Client','CKJmYXhoOFloh3ji4seG7P3KwHTaAHaZ2j2LcID3',NULL,'http://localhost',1,0,0,'2023-09-22 18:02:36','2023-09-22 18:02:36'),(161,NULL,'Laravel Personal Access Client','yESkXBvBhbnMHBCz6EwLCQz3pn5zf9WKhQwjFleB',NULL,'http://localhost',1,0,0,'2023-09-22 18:03:34','2023-09-22 18:03:34'),(162,NULL,'Laravel Password Grant Client','FLKZ7FJuquwm9juGWqpEdgnrumJGXKSsg0mxqK1K','users','http://localhost',0,1,0,'2023-09-22 18:03:34','2023-09-22 18:03:34'),(163,NULL,'Laravel Personal Access Client','cylo7pojtN4f3FmOxjsmRs9JrEsDiIZNCdmWsOD5',NULL,'http://localhost',1,0,0,'2023-09-22 18:03:34','2023-09-22 18:03:34'),(164,NULL,'Laravel Personal Access Client','IjT9SBPauSRjUWK9anL82GcBiz8mbnvTEt8ozSIR',NULL,'http://localhost',1,0,0,'2023-09-22 18:04:37','2023-09-22 18:04:37'),(165,NULL,'Laravel Password Grant Client','I1cpukEcXoiIcZhpFLycHEsi3KBqS6cLzqqoXpCc','users','http://localhost',0,1,0,'2023-09-22 18:04:37','2023-09-22 18:04:37'),(166,NULL,'Laravel Personal Access Client','XOfnvzQMAp6mkJoVkg9qXCFNCN0MQoFPTaySOl72',NULL,'http://localhost',1,0,0,'2023-09-22 18:04:38','2023-09-22 18:04:38'),(167,NULL,'Laravel Personal Access Client','wpwmJf8BQARDJfQV7Mz6RD9E9OiiMPogImO2gLip',NULL,'http://localhost',1,0,0,'2023-09-22 18:05:46','2023-09-22 18:05:46'),(168,NULL,'Laravel Password Grant Client','dLWgyNOjMBuUhrfsqUmG5nJ973tZIV15Er2nJER4','users','http://localhost',0,1,0,'2023-09-22 18:05:46','2023-09-22 18:05:46'),(169,NULL,'Laravel Personal Access Client','0632ANiEpJgEqrsghmNmFpR4kEBCHrXGVmV4c6Xn',NULL,'http://localhost',1,0,0,'2023-09-22 18:05:46','2023-09-22 18:05:46'),(170,NULL,'Laravel Personal Access Client','U8uCf4rOy3POpvuUGQpJ9yjhBoJmDoHf4soAZ3Ur',NULL,'http://localhost',1,0,0,'2023-09-22 18:07:12','2023-09-22 18:07:12'),(171,NULL,'Laravel Password Grant Client','0xJr9vB85ojfC95BSRfOxP0lJksl18ZdUkAUbFqn','users','http://localhost',0,1,0,'2023-09-22 18:07:12','2023-09-22 18:07:12'),(172,NULL,'Laravel Personal Access Client','TlivF1KrccqC2bSOSJVDRtQRrxkMSf00aLQSveZh',NULL,'http://localhost',1,0,0,'2023-09-22 18:07:13','2023-09-22 18:07:13'),(173,NULL,'Laravel Personal Access Client','xVpRXTsIdasCqwxI9vQgHQidM1x3ZB8ncQBMb8fn',NULL,'http://localhost',1,0,0,'2023-09-22 18:09:01','2023-09-22 18:09:01'),(174,NULL,'Laravel Password Grant Client','TZ8GAMfemhoJ9hzrViJfpaHnPMOr8ZJ7hD2Eawgo','users','http://localhost',0,1,0,'2023-09-22 18:09:01','2023-09-22 18:09:01'),(175,NULL,'Laravel Personal Access Client','HslV4Obxb2cxuwAGoXzppof8pCGUqpBELTaxBqfD',NULL,'http://localhost',1,0,0,'2023-09-22 18:09:02','2023-09-22 18:09:02'),(176,NULL,'Laravel Personal Access Client','ZdxvTi1a4zUEEPtHJup53EySqGu3m2nRF5EI92lL',NULL,'http://localhost',1,0,0,'2023-09-22 18:11:53','2023-09-22 18:11:53'),(177,NULL,'Laravel Password Grant Client','3QceMvO8TMfU3UGygDrqFpqqc9Lr9dZ1ggPOmmSm','users','http://localhost',0,1,0,'2023-09-22 18:11:53','2023-09-22 18:11:53'),(178,NULL,'Laravel Personal Access Client','voQDLy5WEDOVAe6ArerYy2NvxowDevDlMUGBib1u',NULL,'http://localhost',1,0,0,'2023-09-22 18:11:54','2023-09-22 18:11:54'),(179,NULL,'Laravel Personal Access Client','sMsaaw9T8UVHjwtjE3EdYIeygqAPpZrbWiQs3Vqb',NULL,'http://localhost',1,0,0,'2023-09-22 19:42:12','2023-09-22 19:42:12'),(180,NULL,'Laravel Password Grant Client','0sZCKcXUqvHmGc8Py9wKojdqZY0nQI9js2mc32wz','users','http://localhost',0,1,0,'2023-09-22 19:42:12','2023-09-22 19:42:12'),(181,NULL,'Laravel Personal Access Client','VQQ7STnc5QZ56yFhocvaqOch0cpougCahVdd9N8J',NULL,'http://localhost',1,0,0,'2023-09-22 19:42:12','2023-09-22 19:42:12'),(182,NULL,'Laravel Personal Access Client','d2wvHhWPtIIzE0Q4l0moX0Gg6qHF6esNfpYO1ktk',NULL,'http://localhost',1,0,0,'2023-09-22 21:13:39','2023-09-22 21:13:39'),(183,NULL,'Laravel Password Grant Client','wmDn8JGKZtlCOVJKk6mgOuexb17q4APF4b8AezSt','users','http://localhost',0,1,0,'2023-09-22 21:13:39','2023-09-22 21:13:39'),(184,NULL,'Laravel Personal Access Client','L7nPAhJ84gGIQTUhADJkyTtlk2pqIHimzASYC56Q',NULL,'http://localhost',1,0,0,'2023-09-22 21:13:40','2023-09-22 21:13:40');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2023-09-05 19:47:51','2023-09-05 19:47:51'),(2,2,'2023-09-05 19:48:22','2023-09-05 19:48:22'),(3,4,'2023-09-05 19:48:25','2023-09-05 19:48:25'),(4,5,'2023-09-05 19:52:03','2023-09-05 19:52:03'),(5,7,'2023-09-05 19:52:03','2023-09-05 19:52:03'),(6,8,'2023-09-05 20:10:46','2023-09-05 20:10:46'),(7,10,'2023-09-05 20:10:47','2023-09-05 20:10:47'),(8,11,'2023-09-08 18:00:31','2023-09-08 18:00:31'),(9,13,'2023-09-08 18:00:31','2023-09-08 18:00:31'),(10,14,'2023-09-08 18:01:31','2023-09-08 18:01:31'),(11,16,'2023-09-08 18:01:31','2023-09-08 18:01:31'),(12,17,'2023-09-08 18:02:18','2023-09-08 18:02:18'),(13,19,'2023-09-08 18:02:19','2023-09-08 18:02:19'),(14,20,'2023-09-08 18:03:09','2023-09-08 18:03:09'),(15,22,'2023-09-08 18:03:09','2023-09-08 18:03:09'),(16,23,'2023-09-08 18:04:11','2023-09-08 18:04:11'),(17,25,'2023-09-08 18:04:11','2023-09-08 18:04:11'),(18,26,'2023-09-08 18:05:38','2023-09-08 18:05:38'),(19,28,'2023-09-08 18:05:38','2023-09-08 18:05:38'),(20,29,'2023-09-08 18:07:22','2023-09-08 18:07:22'),(21,31,'2023-09-08 18:07:22','2023-09-08 18:07:22'),(22,32,'2023-09-08 18:10:09','2023-09-08 18:10:09'),(23,34,'2023-09-08 18:10:10','2023-09-08 18:10:10'),(24,35,'2023-09-08 18:15:05','2023-09-08 18:15:05'),(25,37,'2023-09-08 18:15:05','2023-09-08 18:15:05'),(26,38,'2023-09-09 19:53:20','2023-09-09 19:53:20'),(27,40,'2023-09-09 19:53:20','2023-09-09 19:53:20'),(28,41,'2023-09-10 18:25:19','2023-09-10 18:25:19'),(29,43,'2023-09-10 18:25:20','2023-09-10 18:25:20'),(30,44,'2023-09-12 08:46:07','2023-09-12 08:46:07'),(31,46,'2023-09-12 08:46:07','2023-09-12 08:46:07'),(32,47,'2023-09-12 08:53:59','2023-09-12 08:53:59'),(33,49,'2023-09-12 08:53:59','2023-09-12 08:53:59'),(34,50,'2023-09-13 09:39:22','2023-09-13 09:39:22'),(35,52,'2023-09-13 09:39:22','2023-09-13 09:39:22'),(36,53,'2023-09-13 09:46:37','2023-09-13 09:46:37'),(37,55,'2023-09-13 09:46:38','2023-09-13 09:46:38'),(38,56,'2023-09-13 09:52:17','2023-09-13 09:52:17'),(39,58,'2023-09-13 09:52:18','2023-09-13 09:52:18'),(40,59,'2023-09-13 10:07:34','2023-09-13 10:07:34'),(41,61,'2023-09-13 10:07:34','2023-09-13 10:07:34'),(42,62,'2023-09-15 18:01:25','2023-09-15 18:01:25'),(43,64,'2023-09-15 18:01:26','2023-09-15 18:01:26'),(44,65,'2023-09-15 18:02:34','2023-09-15 18:02:34'),(45,67,'2023-09-15 18:02:35','2023-09-15 18:02:35'),(46,68,'2023-09-15 18:03:29','2023-09-15 18:03:29'),(47,70,'2023-09-15 18:03:30','2023-09-15 18:03:30'),(48,71,'2023-09-15 18:04:29','2023-09-15 18:04:29'),(49,73,'2023-09-15 18:04:29','2023-09-15 18:04:29'),(50,74,'2023-09-15 18:05:40','2023-09-15 18:05:40'),(51,76,'2023-09-15 18:05:41','2023-09-15 18:05:41'),(52,77,'2023-09-15 18:07:02','2023-09-15 18:07:02'),(53,79,'2023-09-15 18:07:03','2023-09-15 18:07:03'),(54,80,'2023-09-15 18:08:50','2023-09-15 18:08:50'),(55,82,'2023-09-15 18:08:50','2023-09-15 18:08:50'),(56,83,'2023-09-15 18:11:44','2023-09-15 18:11:44'),(57,85,'2023-09-15 18:11:44','2023-09-15 18:11:44'),(58,86,'2023-09-15 18:16:45','2023-09-15 18:16:45'),(59,88,'2023-09-15 18:16:46','2023-09-15 18:16:46'),(60,89,'2023-09-18 07:44:41','2023-09-18 07:44:41'),(61,91,'2023-09-18 07:44:42','2023-09-18 07:44:42'),(62,92,'2023-09-18 08:11:23','2023-09-18 08:11:23'),(63,94,'2023-09-18 08:11:23','2023-09-18 08:11:23'),(64,95,'2023-09-18 09:20:09','2023-09-18 09:20:09'),(65,97,'2023-09-18 09:20:09','2023-09-18 09:20:09'),(66,98,'2023-09-19 08:10:37','2023-09-19 08:10:37'),(67,100,'2023-09-19 08:10:37','2023-09-19 08:10:37'),(68,101,'2023-09-19 08:39:26','2023-09-19 08:39:26'),(69,103,'2023-09-19 08:39:27','2023-09-19 08:39:27'),(70,104,'2023-09-19 13:39:35','2023-09-19 13:39:35'),(71,106,'2023-09-19 13:39:35','2023-09-19 13:39:35'),(72,107,'2023-09-19 18:54:25','2023-09-19 18:54:25'),(73,109,'2023-09-19 18:54:26','2023-09-19 18:54:26'),(74,110,'2023-09-19 19:04:41','2023-09-19 19:04:41'),(75,112,'2023-09-19 19:04:41','2023-09-19 19:04:41'),(76,113,'2023-09-19 19:06:57','2023-09-19 19:06:57'),(77,115,'2023-09-19 19:06:58','2023-09-19 19:06:58'),(78,116,'2023-09-19 19:08:43','2023-09-19 19:08:43'),(79,118,'2023-09-19 19:08:44','2023-09-19 19:08:44'),(80,119,'2023-09-19 19:30:30','2023-09-19 19:30:30'),(81,121,'2023-09-19 19:30:30','2023-09-19 19:30:30'),(82,122,'2023-09-19 19:41:51','2023-09-19 19:41:51'),(83,124,'2023-09-19 19:41:51','2023-09-19 19:41:51'),(84,125,'2023-09-19 19:49:18','2023-09-19 19:49:18'),(85,127,'2023-09-19 19:49:18','2023-09-19 19:49:18'),(86,128,'2023-09-19 19:57:36','2023-09-19 19:57:36'),(87,130,'2023-09-19 19:57:37','2023-09-19 19:57:37'),(88,131,'2023-09-19 20:07:01','2023-09-19 20:07:01'),(89,133,'2023-09-19 20:07:02','2023-09-19 20:07:02'),(90,134,'2023-09-19 20:22:03','2023-09-19 20:22:03'),(91,136,'2023-09-19 20:22:03','2023-09-19 20:22:03'),(92,137,'2023-09-19 20:44:33','2023-09-19 20:44:33'),(93,139,'2023-09-19 20:44:34','2023-09-19 20:44:34'),(94,140,'2023-09-20 09:27:42','2023-09-20 09:27:42'),(95,142,'2023-09-20 09:27:42','2023-09-20 09:27:42'),(96,143,'2023-09-20 10:23:17','2023-09-20 10:23:17'),(97,145,'2023-09-20 10:23:18','2023-09-20 10:23:18'),(98,146,'2023-09-20 18:10:23','2023-09-20 18:10:23'),(99,148,'2023-09-20 18:10:23','2023-09-20 18:10:23'),(100,149,'2023-09-21 13:41:37','2023-09-21 13:41:37'),(101,151,'2023-09-21 13:41:37','2023-09-21 13:41:37'),(102,152,'2023-09-21 13:44:31','2023-09-21 13:44:31'),(103,154,'2023-09-21 13:44:32','2023-09-21 13:44:32'),(104,155,'2023-09-22 18:01:28','2023-09-22 18:01:28'),(105,157,'2023-09-22 18:01:28','2023-09-22 18:01:28'),(106,158,'2023-09-22 18:02:36','2023-09-22 18:02:36'),(107,160,'2023-09-22 18:02:36','2023-09-22 18:02:36'),(108,161,'2023-09-22 18:03:34','2023-09-22 18:03:34'),(109,163,'2023-09-22 18:03:34','2023-09-22 18:03:34'),(110,164,'2023-09-22 18:04:37','2023-09-22 18:04:37'),(111,166,'2023-09-22 18:04:38','2023-09-22 18:04:38'),(112,167,'2023-09-22 18:05:46','2023-09-22 18:05:46'),(113,169,'2023-09-22 18:05:46','2023-09-22 18:05:46'),(114,170,'2023-09-22 18:07:12','2023-09-22 18:07:12'),(115,172,'2023-09-22 18:07:13','2023-09-22 18:07:13'),(116,173,'2023-09-22 18:09:01','2023-09-22 18:09:01'),(117,175,'2023-09-22 18:09:02','2023-09-22 18:09:02'),(118,176,'2023-09-22 18:11:53','2023-09-22 18:11:53'),(119,178,'2023-09-22 18:11:54','2023-09-22 18:11:54'),(120,179,'2023-09-22 19:42:12','2023-09-22 19:42:12'),(121,181,'2023-09-22 19:42:12','2023-09-22 19:42:12'),(122,182,'2023-09-22 21:13:39','2023-09-22 21:13:39'),(123,184,'2023-09-22 21:13:40','2023-09-22 21:13:40');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (2,'test2','test desc',100.00,'2023-09-09 20:48:33','2023-09-09 20:48:33','',''),(3,'Mohammed Elattar','test desc',100.00,'2023-09-09 20:48:49','2023-09-09 20:48:49','',''),(4,'Mohammed Elattar','test desc',100.00,'2023-09-09 20:49:10','2023-09-09 20:49:10','',''),(5,'بب','cxx',1112.00,'2023-09-16 21:05:52','2023-09-16 21:05:52','','');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rich_des_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_service_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rich_des_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_user_service_id_foreign` (`user_service_id`),
  CONSTRAINT `products_user_service_id_foreign` FOREIGN KEY (`user_service_id`) REFERENCES `user_services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'aaa','aa','aaa',8,'2023-09-20 10:40:56','2023-09-20 18:15:17','','',''),(2,'ffff','fffff','fffff',8,'2023-09-21 07:03:21','2023-09-21 07:03:21','','','');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `referrer_user_id` bigint unsigned NOT NULL,
  `referred_user_id` bigint unsigned NOT NULL,
  `awarded` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `referrals_referrer_user_id_index` (`referrer_user_id`),
  KEY `referrals_referred_user_id_index` (`referred_user_id`),
  CONSTRAINT `referrals_referred_user_id_foreign` FOREIGN KEY (`referred_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `referrals_referrer_user_id_foreign` FOREIGN KEY (`referrer_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_category_id_foreign` (`category_id`),
  CONSTRAINT `services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (16,'الأثاث والمفروشات','Furniture & Furnishings',77,'2023-09-18 11:31:23','2023-09-18 11:31:23'),(17,'المطبح والحمامات','kitchen & pathroom',77,'2023-09-18 11:53:27','2023-09-18 11:53:27'),(18,'aaa','aaa',21,'2023-09-19 08:42:21','2023-09-19 08:42:21'),(19,'عوامل الربط','Bonding agents. (sp)',21,'2023-09-19 09:46:09','2023-09-19 09:49:53'),(20,'ترقيع الملاط','Patching mortar(co)',20,'2023-09-19 09:47:12','2023-09-19 09:50:00'),(21,'عوامل الربط','Bonding agents(co)',20,'2023-09-19 09:47:30','2023-09-19 09:50:19'),(22,'ترقيع الملاط','Patching mortar(sp)',21,'2023-09-19 09:52:08','2023-09-19 09:52:08'),(23,'إصلاح سريع للخرسانة الأفقية','Rapid-setting horizontal concrete repair (co)',20,'2023-09-19 09:52:15','2023-09-19 09:52:15'),(24,'إصلاح سريع للخرسانة العمودية والعلوية','Rapid-setting vertical and overhead concrete repair.(co)',20,'2023-09-19 09:52:57','2023-09-19 09:52:57'),(25,'إصلاح الخرسانة الرأسية والعلوية.','Vertical and overhead concrete repair (co)',20,'2023-09-19 09:53:38','2023-09-19 09:53:38'),(26,'إصلاح سريع للخرسانة الأفقبة','Rapid-setting horizontal concrete repair(sp)',21,'2023-09-19 09:53:40','2023-09-19 09:54:45'),(27,'إصلاح الخرسانة الرأسية والعلوية المعدلة بالبوليمر','Polymer-modified vertical and overhead concrete repair (co)',20,'2023-09-19 09:54:08','2023-09-19 09:54:08'),(28,'إصلاح أفقي معدل بالبوليمر','Polymer-modified horizontal repair (co)',20,'2023-09-19 09:54:41','2023-09-19 09:54:41'),(29,'طبقات خرسانية ذاتية التسوية.','Self-leveling concrete toppings (co)',20,'2023-09-19 09:55:14','2023-09-19 09:55:14'),(30,'إصلاح سريع للخرسانة الرأسية والعلوية','Rapid-setting vertical and overhead concrete repair(sp)',21,'2023-09-19 09:55:38','2023-09-19 09:55:38'),(31,'تشكيل وصب / إصلاح الخرسانة','Form and pour/pump concrete repair (co)',20,'2023-09-19 09:55:45','2023-09-19 09:55:45'),(32,'إصلاح الخرسانة الرأسية والعلوية المعدلة بالبوليمر','Polymer-modified vertical and overhead concrete repair(sp)',21,'2023-09-19 09:56:26','2023-09-19 09:56:26'),(33,'ترميم الخرسانة الأفقية.','Horizontal concrete repair (co)',20,'2023-09-19 09:56:30','2023-09-19 09:56:30'),(34,'إصلاح الخرسانة المعززة بدخان السيليكا','Silica-fume-enhanced concrete repair (co)',20,'2023-09-19 09:57:01','2023-09-19 09:57:01'),(35,'إصلاح أفقي معدل بالبوليمر','Polymer-modified horizontal repair(sp)',21,'2023-09-19 09:57:13','2023-09-19 09:57:13'),(36,'المواد الخرسانية الجاهزة','Preplaced concrete materials (co)',20,'2023-09-19 09:57:44','2023-09-19 09:57:44'),(37,'طبقات خرسانية ذاتية التسوية','Self-leveling concrete toppings (sp)',21,'2023-09-19 09:58:05','2023-09-19 09:58:05'),(38,'حقن التشققات بالإيبوكسي','Epoxy crack-injection (co)',20,'2023-09-19 09:58:13','2023-09-19 09:58:13'),(39,'مثبط للتآكل','Corrosion-inhibiting (co)',20,'2023-09-19 09:58:38','2023-09-19 09:58:38'),(40,'تشكيل وصب / إصلاح الخرسانة','Form and pour/pump concrete repair(sp)',21,'2023-09-19 09:58:41','2023-09-19 09:58:41'),(41,'تراكب البوليمر','Polymer-overlay(co)',20,'2023-09-19 09:59:06','2023-09-19 09:59:06'),(42,'إصلاح الخرسانة المعززة بدخان السيليكا','Silica-fume-enhanced concrete repair(sp)',21,'2023-09-19 09:59:22','2023-09-19 09:59:22'),(43,'مادة عازلة للبوليمر','Polymer-sealer (co)',20,'2023-09-19 09:59:29','2023-09-19 09:59:29'),(44,'التعزيز المركب','Composite reinforcement (co)',20,'2023-09-19 09:59:52','2023-09-19 09:59:52'),(45,'المواد الخرسانية الجاهزة','Preplaced concrete materials(sp)',21,'2023-09-19 10:00:07','2023-09-19 10:00:07'),(46,'حقن الكراك بالإيبوكسي','Epoxy crack-injection(sp)',21,'2023-09-19 10:00:48','2023-09-19 10:00:48'),(47,'تثبيط التآكل','Corrosion-inhibiting (sp)',21,'2023-09-19 10:01:44','2023-09-19 10:01:44'),(48,'تراكب البوليمر','Polymer-overlay(sp)',21,'2023-09-19 10:02:28','2023-09-19 10:02:28'),(49,'مادة عازلة للبوليمر','Polymer-sealer(sp)',21,'2023-09-19 10:03:34','2023-09-19 10:03:34'),(50,'التعزيز المركب','Composite reinforcement(sp)',21,'2023-09-19 10:04:09','2023-09-19 10:04:09'),(51,'ألواح على الصف','Slabs on grade',178,'2023-09-19 10:06:41','2023-09-19 10:06:41'),(52,'ألواح مرتفعة','Elevated slabs',178,'2023-09-19 10:08:29','2023-09-19 10:08:29'),(53,'أسطح السقف','Roof decks',178,'2023-09-19 10:09:11','2023-09-19 10:09:11'),(54,'صعود الدرج وهبوطه','Stair treads and landings',178,'2023-09-19 10:09:53','2023-09-19 10:09:53'),(55,'الخرسانة المقاومة للماء التي تسد المسام','Hydrophobic Pore Blocking Concrete',180,'2023-09-19 10:11:10','2023-09-19 10:11:10'),(56,'الخرسانة العازلة للماء','Waterproofing Concrete',180,'2023-09-19 10:12:00','2023-09-19 10:12:00'),(57,'الحماية من التآكل والخرسانة العازلة للماء','Corrosion protection and waterproofing concrete',180,'2023-09-19 10:14:04','2023-09-19 10:14:04'),(58,'مثبط التآكل ثنائي الفعل والعزل المائي','Migrating Dual-Action Corrosion Inhibitor and Waterproofing',180,'2023-09-19 10:14:31','2023-09-19 10:14:31'),(59,'مادة كريستالية عازلة للماء للخرسانة','Crystalline waterproofing admixture for concrete',182,'2023-09-19 10:16:22','2023-09-19 10:16:22'),(60,'معالجة العزل المائي البلوري للفواصل الإنشائية بين عمليات الصب الخرسانية المتعاقبة','Crystalline waterproofing treatment of construction joints between successive concrete pours',182,'2023-09-19 10:16:54','2023-09-19 10:16:54'),(61,'خليط متكامل للعزل المائي للخرسانة السائلة','Integral liquid concrete waterproofing admixture',185,'2023-09-19 10:18:42','2023-09-19 10:18:42'),(62,'صبغات أكسيد الحديد المجففة التي تضاف إلى الخرسانة','Dry powder iron oxide pigments to be added to concrete',28,'2023-09-19 10:20:39','2023-09-19 10:20:39'),(63,'أصباغ أكسيد الحديد السائل المراد إضافتها إلى الخرسانة','Liquid iron oxide pigments to be added to concrete',28,'2023-09-19 10:21:17','2023-09-19 10:21:17'),(64,'المسرعات','Accelerators',187,'2023-09-19 10:23:02','2023-09-19 10:23:02'),(65,'عوامل دخول الهواء','Air-entraining agents',187,'2023-09-19 10:23:43','2023-09-19 10:23:43'),(66,'مثبطات التآكل','Corrosion inhibitors',187,'2023-09-19 10:24:18','2023-09-19 10:24:18'),(67,'منتجات البناء','Masonry products',187,'2023-09-19 10:24:52','2023-09-19 10:24:52'),(68,'مخفض الانكماش','Shrinkage reducer',187,'2023-09-19 10:25:29','2023-09-19 10:25:29'),(69,'غبار السيليكا','Silica fume',187,'2023-09-19 10:26:20','2023-09-19 10:26:20'),(70,'خليط الاحتفاظ بالركود','Slump-retention admixture',187,'2023-09-19 10:26:59','2023-09-19 10:26:59'),(71,'الملدنات الفائقة','Superplasticizers',187,'2023-09-19 10:27:32','2023-09-19 10:27:32'),(72,'عوامل تعديل اللزوجة','Viscosity-modifying agents',187,'2023-09-19 10:28:24','2023-09-19 10:28:24'),(73,'مخفضات المياه','Water reducers',187,'2023-09-19 10:28:57','2023-09-19 10:28:57'),(74,'مضافات العزل المائي','Waterproofing admixtures',187,'2023-09-19 10:29:27','2023-09-19 10:29:27'),(75,'مادة: بلاستيك ثيرموسبيك فردي أو متعدد الاستخدامات','Material: Thermospec Single or Multi-Use Plastic',188,'2023-09-19 10:44:11','2023-09-19 10:44:11'),(76,'مادة Elastospec Lite شبه المرنة متعددة الاستخدامات','Elastospec Lite Semi-Elastomeric Multi-Use Material',188,'2023-09-19 11:21:55','2023-09-19 11:21:55'),(77,'Elastospec 100% من اليوريثان الصلب مربوط بخشب رقائقي مقاس 3/4 بوصة','Elastospec 100% Solid Urethane Bonded to 3/4 inch Plywood',188,'2023-09-19 11:22:35','2023-09-19 11:22:35'),(78,'أنماط الطوب','Brick Patterns',188,'2023-09-19 11:27:09','2023-09-19 11:27:09'),(79,'الأنماط الهندسية','Geometric Patterns',188,'2023-09-19 11:27:56','2023-09-19 11:27:56'),(80,'بطانات القوالب المرنة القابلة لإعادة الاستخدام لتركيب الخرسانة المعمارية بأنماط قياسية','Reusable, elastomeric formliners for texturing architectural concrete with standard patterns',190,'2023-09-19 11:29:51','2023-09-19 11:29:51'),(81,'قوالب تشكيل مطاطية قابلة لإعادة الاستخدام لتركيب الخرسانة المعمارية مع نقش الصور','Reusable, elastomeric formliners for texturing architectural concrete with photo engraving',190,'2023-09-19 11:30:53','2023-09-19 11:30:53'),(82,'قوالب تشكيل مرنة وقابلة لإعادة الاستخدام لتركيب الخرسانة المعمارية باستخدام أنماط النقوش البارزة الرسومية باستخدام الحاسب الآلي','Reusable, elastomeric formliners for texturing architectural concrete with CNC graphic bas-relief patterns',190,'2023-09-19 11:31:46','2023-09-19 11:31:46'),(83,'قوالب تشكيل مرنة وقابلة لإعادة الاستخدام لتركيب الخرسانة المعمارية بأنماط مصممة خصيصًا.','Reusable, elastomeric formliners for texturing architectural concrete with custom designed patterns',190,'2023-09-19 11:35:21','2023-09-19 11:35:21'),(84,'الصبغة المعمارية لتلوين الخرسانة','Architectural Stain for coloring concrete',190,'2023-09-19 11:36:12','2023-09-19 11:36:12'),(85,'ملحقات Formliner كما هو مطلوب للتثبيت الكامل.\"','Formliner accessories as required for complete installation',190,'2023-09-19 11:37:38','2023-09-19 11:37:38'),(86,'لوحات على الأرض','Slabs on grade',176,'2023-09-19 11:37:43','2023-09-19 11:37:43'),(87,'لوحات مرتفعة','Elevated slabs',176,'2023-09-19 11:38:26','2023-09-19 11:38:26'),(88,'أسطح السقف','Roof decks',176,'2023-09-19 11:39:39','2023-09-19 11:39:39'),(89,'درج ومنصة الهبوط','Stair treads and landings',176,'2023-09-19 11:40:12','2023-09-19 11:40:12'),(90,'ألياف تقوية الخرسانة السليلوزية الطبيعية المقاومة للقلويات','Alkali-resistant, natural cellulose concrete reinforcing fiber',192,'2023-09-19 11:42:38','2023-09-19 11:42:38'),(91,'الخرسانة المانعة لاختراق المسام المقاومة للماء','Hydrophobic Pore Blocking Concrete',177,'2023-09-19 11:43:20','2023-09-19 11:43:20'),(92,'مزيج من ألياف السليلوز الطبيعية المقاومة للقلويات مع ألياف الفولاذ','Alkali-resistant, natural cellulose fiber blend with steel fibers',192,'2023-09-19 11:43:55','2023-09-19 11:43:55'),(93,'الخرسانة المقاومة للماء','Hydrophobic Concrete',177,'2023-09-19 11:44:00','2023-09-19 11:44:00'),(94,'الخرسانة المضادة للماء','Waterproofing Concrete',177,'2023-09-19 11:44:32','2023-09-19 11:44:32'),(95,'الخرسانة المقاومة للتآكل والمضادة للماء','Corrosion protection and waterproofing concrete',177,'2023-09-19 11:45:00','2023-09-19 11:45:00'),(96,'مثبط التآكل ذو الفعالية المزدوجة والمضاد للماء','Migrating Dual-Action Corrosion Inhibitor and Waterproofing',177,'2023-09-19 11:45:30','2023-09-19 11:45:30'),(97,'مقاومة الماء المقاومة للماء','Hydrophobic waterproofing',177,'2023-09-19 11:45:54','2023-09-19 11:45:54'),(98,'صبغة حمض الخرسانة الدائمة للخرسانة الداخلية أو الخارجية','Permanent concrete acid stain for interior or exterior concrete',194,'2023-09-19 11:46:40','2023-09-19 11:46:40'),(99,'خليط مانع لتسرب الرطوبة بالكريستالات للخرسانة','Crystalline waterproofing admixture for concrete',179,'2023-09-19 11:47:08','2023-09-19 11:47:08'),(100,'معالجة مانعة لتسرب الرطوبة بالكريستالات للمفاصل الإنشائية بين الصبات المتتالية من الخرسانة','Crystalline waterproofing treatment of construction joints between successive concrete pours',179,'2023-09-19 11:47:31','2023-09-19 11:47:31'),(101,'صبغة بوليمر للأسطح الأفقية والرأسية الداخلية والخارجية','Polymer stain for interior and exterior horizontal and vertical surfaces',194,'2023-09-19 11:47:49','2023-09-19 11:47:49'),(102,'مادة عازلة للأسطح الداخلية للأرضيات الخرسانية','Sealer for interior concrete floor surfaces',194,'2023-09-19 11:49:16','2023-09-19 11:49:16'),(103,'خليط مانع لتسرب الرطوبة بالكريستالات للخرسانة','Integral liquid concrete waterproofing admixture',181,'2023-09-19 11:49:16','2023-09-19 11:49:16'),(104,'مانع تسرب الأرضية الخرسانية','Concrete floor sealer',194,'2023-09-19 11:50:10','2023-09-19 11:50:10'),(105,'منظفات لإعداد السطح','Cleaners for surface preparation',194,'2023-09-19 11:51:06','2023-09-19 11:51:06'),(106,'طلاءات الايبوكسي','Epoxy coatings',194,'2023-09-19 11:52:11','2023-09-19 11:52:11'),(107,'الصبغات الجافة لأكاسيد الحديد التي يتم إضافتها إلى الخرسانة','Dry powder iron oxide pigments to be added to concrete',27,'2023-09-19 11:54:00','2023-09-19 11:54:00'),(108,'ألواح خرسانية داخلية','Interior concrete slabs',194,'2023-09-19 11:54:30','2023-09-19 11:54:30'),(109,'ألواح خرسانية خارجية','Exterior concrete slabs',194,'2023-09-19 11:55:13','2023-09-19 11:55:13'),(110,'الصبغات السائلة لأكاسيد الحديد التي يتم إضافتها إلى الخرسانة','Liquid iron oxide pigments to be added to concrete',27,'2023-09-19 11:55:20','2023-09-19 11:55:20'),(111,'أسطح أرضية مرتفعة','Elevated floor decks',194,'2023-09-19 11:56:19','2023-09-19 11:56:19'),(112,'أسطح مرتفعة','Elevated roof decks',194,'2023-09-19 11:57:00','2023-09-19 11:57:00'),(113,'مسرعات','Accelerators',183,'2023-09-19 11:57:05','2023-09-19 11:57:05'),(114,'عوامل تكوين الفقاعات','Air-entraining agents',183,'2023-09-19 11:57:32','2023-09-19 11:57:32'),(115,'مثبطات التآكل','Corrosion inhibitors',183,'2023-09-19 11:57:55','2023-09-19 11:57:55'),(116,'منتجات البناء','Masonry products',183,'2023-09-19 11:58:13','2023-09-19 11:58:13'),(117,'مثبطات','Retarders',183,'2023-09-19 11:58:31','2023-09-19 11:58:31'),(118,'خافض انكماش','Shrinkage reducer',183,'2023-09-19 11:58:47','2023-09-19 11:58:47'),(119,'قمم الجدران التي ستبقى مكشوفة للعرض أو الطقس','Tops of walls that will remain exposed to view or weather',194,'2023-09-19 11:59:03','2023-09-19 11:59:03'),(120,'غبار السيليكا','Silica fume',183,'2023-09-19 11:59:46','2023-09-19 11:59:46'),(121,'الأرصفة الخرسانية','Concrete sidewalks',194,'2023-09-19 12:00:05','2023-09-19 12:00:05'),(122,'خليط مثبت للتشققات','Slump-retention admixture',183,'2023-09-19 12:00:06','2023-09-19 12:00:06'),(123,'مضافات مرنة','Superplasticizers',183,'2023-09-19 12:00:45','2023-09-19 12:00:45'),(124,'عوامل تعديل اللزوجة','Viscosity-modifying agents',183,'2023-09-19 12:01:05','2023-09-19 12:01:05'),(125,'مخفضات الماء','Water reducers',183,'2023-09-19 12:01:23','2023-09-19 12:01:23'),(126,'مضافات مقاومة للماء','Waterproofing admixtures',183,'2023-09-19 12:01:43','2023-09-19 12:01:43'),(127,'الممرات الخرسانية','Concrete driveways',194,'2023-09-19 12:01:49','2023-09-19 12:01:49'),(128,'ألواح خرسانية قابلة للإمالة','Tilt-up concrete panels',194,'2023-09-19 12:02:25','2023-09-19 12:02:25'),(129,'هياكل مواقف السيارات','Parking structures',194,'2023-09-19 12:03:38','2023-09-19 12:03:38'),(130,'المجاري والخزانات وهياكل الصرف الصحي','Culverts, tanks, and drainage structures',194,'2023-09-19 12:04:33','2023-09-19 12:04:33'),(131,'أسطح الجسور','Bridge decks',194,'2023-09-19 12:05:04','2023-09-19 12:05:04'),(132,'البلاستيك الفردي أو متعدد الاستخدامات تيرموسبيك','Thermospec Single or Multi-Use Plastic',184,'2023-09-19 12:06:03','2023-09-19 12:06:03'),(133,'المادة شبه المطاطية المتعددة الاستخدامات لإليستوسبيك لايت','Elastospec Lite Semi-Elastomeric Multi-Use Material',184,'2023-09-19 12:06:28','2023-09-19 12:06:28'),(134,'الأوريثان الصلب 100٪ المرتبط بقشرة خشب رقيقة بسمك 3/4 بوصة','Elastospec 100% Solid Urethane Bonded to 3/4 inch Plywood',184,'2023-09-19 12:06:53','2023-09-19 12:06:53'),(135,'منتجات التراكبات الخرسانية الخرسانية والزخرفية','Concrete and decorative concrete overlay products',196,'2023-09-19 12:07:14','2023-09-19 12:07:14'),(136,'حبيبات الخشب','Wood Grains',184,'2023-09-19 12:07:19','2023-09-19 12:07:19'),(137,'أنماط الطوب','Brick Patterns',184,'2023-09-19 12:07:38','2023-09-19 12:07:38'),(138,'أنماط الكتلة','Block Patterns',184,'2023-09-19 12:07:57','2023-09-19 12:07:57'),(139,'أنماط الصخور','Rock Patterns',184,'2023-09-19 12:08:20','2023-09-19 12:08:20'),(140,'نظام تلوين الخرسانة موضعياً ومتكاملاً','Concrete and decorative concrete overlay products',196,'2023-09-19 12:08:34','2023-09-19 12:08:34'),(141,'أنماط محببة','Textured Patterns',184,'2023-09-19 12:08:43','2023-09-19 12:08:43'),(142,'نغمات ناعمة','Smooth Flutes',184,'2023-09-19 12:09:01','2023-09-19 12:09:01'),(143,'إظهارات','Reveals',184,'2023-09-19 12:09:22','2023-09-19 12:09:22'),(144,'أنماط هندسية','Geometric Patterns',184,'2023-09-19 12:09:43','2023-09-19 12:09:43'),(145,'ألياف صناعية كبيرة تستخدم كتعزيز ثانوي للخرسانة','Synthetic Macrofibers for use as secondary reinforcement in concrete',40,'2023-09-19 12:11:26','2023-09-19 12:11:26'),(146,'خليط متكامل لتصلب الخرسانة السائلة','Integral liquid concrete hardening admixture',40,'2023-09-19 12:11:57','2023-09-19 12:11:57'),(147,'مقوي موضعي للخرسانة السائلة','Topical liquid concrete hardener',40,'2023-09-19 12:12:26','2023-09-19 12:12:26'),(148,'الأغلفة المرنة والقابلة لإعادة الاستخدام لتشكيل الخرسانة المعمارية بأنماط قياسية','Reusable, elastomeric formliners for texturing architectural concrete with standard patterns',186,'2023-09-19 12:18:33','2023-09-19 12:18:33'),(149,'الأغلفة المرنة والقابلة لإعادة الاستخدام لتشكيل الخرسانة المعمارية بالنقش الفوتوغرافي','Reusable, elastomeric formliners for texturing architectural concrete with photo engraving',186,'2023-09-19 12:18:58','2023-09-19 12:18:58'),(150,'الأغلفة المرنة والقابلة لإعادة الاستخدام لتشكيل الخرسانة المعمارية بأنماط CNC البارزة','Reusable, elastomeric formliners for texturing architectural concrete with CNC graphic bas-relief patterns',186,'2023-09-19 12:19:29','2023-09-19 12:19:29'),(151,'الأغلفة المرنة والقابلة لإعادة الاستخدام لتشكيل الخرسانة المعمارية بأنماط مصممة حسب الطلب','Reusable, elastomeric formliners for texturing architectural concrete with custom designed patterns',186,'2023-09-19 12:20:09','2023-09-19 12:20:09'),(152,'الأغلفة البلاستيكية ABS قابلة لإعادة الاستخدام لتشكيل الخرسانة المعمارية بأنماط قياسية','Reusable, ABS plastic formliners for texturing architectural concrete with standard patterns',186,'2023-09-19 12:20:32','2023-09-19 12:20:32'),(153,'الأغلفة البلاستيكية HIPS للاستخدام مرة واحدة لتشكيل الخرسانة المعمارية بأنماط قياسية','Single-use, HIPS plastic formliners for texturing architectural concrete with standard patterns',186,'2023-09-19 12:20:53','2023-09-19 12:20:53'),(154,'صبغ معماري لتلوين الخرسانة','Architectural Stain for coloring concrete',186,'2023-09-19 12:21:15','2023-09-19 12:21:15'),(155,'ملحقات أغطية الأشكال حسب متطلبات التثبيت الكامل','Formliner accessories as required for complete installation',186,'2023-09-19 12:21:34','2023-09-19 12:21:34'),(156,'ألياف تسليح الخرسانة الطبيعية المقاومة للقلويات','Alkali-resistant, natural cellulose concrete reinforcing fiber',189,'2023-09-19 12:23:52','2023-09-19 12:23:52'),(157,'مزيج ألياف السليلوز الطبيعية المقاومة للقلويات مع ألياف الصلب','Alkali-resistant, natural cellulose fiber blend with steel fibers',189,'2023-09-19 12:25:01','2023-09-19 12:25:01'),(158,'نظام الألواح الخرسانية ذات الضمان لإنبعاث بخار الرطوبة لـ Assurance LWC للألواح الخفيفة الجديدة المستخدمة في تلقي الأرضيات أو الطلاء أو أنظمة السقف','Assurance LWC moisture vapor emission warranted concrete slab system for new structural lightweight slabs to receive flooring, coatings, or roofing systems',37,'2023-09-19 12:26:45','2023-09-19 12:26:45'),(159,'الكسوة المعمارية الجاهزة.','Architectural precast cladding.',46,'2023-09-20 07:41:15','2023-09-20 07:41:15'),(160,'الوحدات الحاملة المعمارية مسبقة الصب','Architectural precast load bearing units',46,'2023-09-20 07:44:55','2023-09-20 07:44:55'),(161,'الوحدات المعمارية ذات الواجهة الطوبية','Brick Faced architectural units',46,'2023-09-20 07:46:10','2023-09-20 07:46:10'),(162,'الأعمدة المعمارية الجاهزة','Architectural precast columns',46,'2023-09-20 07:50:41','2023-09-20 07:50:41'),(163,'الوحدات المعمارية سابقة الصب لمنسوب المياه.','Water table architectural precast units',46,'2023-09-20 07:52:58','2023-09-20 07:52:58'),(164,'ألواح الجدران المعمارية الجاهزة','Architectural precast wall panels',46,'2023-09-20 07:54:44','2023-09-20 07:54:44'),(165,'مواد التسليح','Reinforcing materials',46,'2023-09-20 07:56:42','2023-09-20 07:56:42'),(166,'المواد الخرسانية المعمارية سابقة الصب.','Architectural precast concrete materials',46,'2023-09-20 07:57:39','2023-09-20 07:57:39'),(167,'المثبتات والمثبتات والمواد المتنوعة.','Anchors, fasteners, and miscellaneous materials',46,'2023-09-20 07:59:25','2023-09-20 07:59:25'),(168,'مواد الجص.','Grout materials',46,'2023-09-20 08:02:12','2023-09-20 08:02:12'),(169,'الخلطات الخرسانية','Concrete mixtures',46,'2023-09-20 08:03:31','2023-09-20 08:03:31'),(170,'التشطيبات','Finishes.',46,'2023-09-20 08:04:17','2023-09-20 08:04:17'),(171,'الأرضيات الجبسية','Gypsum Floor Underlayment',205,'2023-09-20 08:18:33','2023-09-20 08:18:33'),(172,'طبقة سفلية حرارية من الجبس قابلة للصب','Gypsum Pourable Thermal Underlayment',205,'2023-09-20 08:20:33','2023-09-20 08:20:33'),(173,'الطبقة السفلية من الجبس لبناء الأسطح الفولاذية المموجة','Gypsum Underlayment for Corrugated Steel Deck Construction',205,'2023-09-20 08:21:26','2023-09-20 08:21:26'),(174,'أرضية أسمنتية ذاتية التسوية','Cementitious self-leveling floor underlayment',205,'2023-09-20 08:22:27','2023-09-20 08:22:27'),(175,'سطح أسمنتي ذاتي التسوية','Cementitious self-leveling wearing surface',205,'2023-09-20 08:23:06','2023-09-20 08:23:06'),(176,'حشوة اسمنتية خفيفة الوزن','Cementitious lightweight aggregate fill',205,'2023-09-20 08:24:33','2023-09-20 08:24:33'),(177,'حواجز العزل','Isolating barriers',205,'2023-09-20 08:27:12','2023-09-20 08:27:12'),(178,'جص بناء ذو أساس أسمنتي، عالي الأداء، غير قابل للانكماش، DOT','Cement-based, high-performance, non-shrink, DOT construction grout',207,'2023-09-20 08:34:06','2023-09-20 08:34:06'),(179,'الجص الدقيق غير القابل للانكماش','Non-shrink precision grout',207,'2023-09-20 08:34:52','2023-09-20 08:34:52'),(180,'الجص البناء للأغراض العامة القائم على الأسمنت','Cement-based general purpose Construction grout',207,'2023-09-20 08:35:34','2023-09-20 08:35:34');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_categories`
--

DROP TABLE IF EXISTS `user_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_categories_category_id_foreign` (`category_id`),
  KEY `user_categories_user_id_foreign` (`user_id`),
  CONSTRAINT `user_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_categories`
--

LOCK TABLES `user_categories` WRITE;
/*!40000 ALTER TABLE `user_categories` DISABLE KEYS */;
INSERT INTO `user_categories` VALUES (2,21,6,'2023-09-19 08:39:18','2023-09-19 08:39:18'),(3,28,6,'2023-09-19 08:39:55','2023-09-19 08:39:55'),(4,90,8,'2023-09-19 08:41:09','2023-09-19 08:41:09'),(5,21,8,'2023-09-19 08:42:44','2023-09-19 08:42:44'),(7,28,9,'2023-09-19 09:30:59','2023-09-19 09:30:59'),(8,76,9,'2023-09-19 09:32:16','2023-09-19 09:32:16'),(9,21,9,'2023-09-19 09:50:16','2023-09-19 09:50:16'),(10,20,7,'2023-09-19 10:02:23','2023-09-19 10:02:23'),(11,176,7,'2023-09-19 10:02:23','2023-09-19 10:02:23');
/*!40000 ALTER TABLE `user_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_ideas`
--

DROP TABLE IF EXISTS `user_ideas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ideas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_service_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_ideas_user_service_id_foreign` (`user_service_id`),
  CONSTRAINT `user_ideas_user_service_id_foreign` FOREIGN KEY (`user_service_id`) REFERENCES `user_services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_ideas`
--

LOCK TABLES `user_ideas` WRITE;
/*!40000 ALTER TABLE `user_ideas` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_ideas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_interests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_interests_user_id_foreign` (`user_id`),
  KEY `user_interests_service_id_foreign` (`service_id`),
  CONSTRAINT `user_interests_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
INSERT INTO `user_interests` VALUES (12,6,16,'2023-09-18 12:17:16','2023-09-18 12:17:16'),(13,6,17,'2023-09-18 12:17:16','2023-09-18 12:17:16'),(14,7,16,'2023-09-18 12:41:23','2023-09-18 12:41:23'),(15,7,17,'2023-09-18 12:41:23','2023-09-18 12:41:23'),(16,8,16,'2023-09-18 19:47:07','2023-09-18 19:47:07'),(24,1,52,'2023-09-20 19:53:06','2023-09-20 19:53:06');
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_services`
--

DROP TABLE IF EXISTS `user_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_services_service_id_foreign` (`service_id`),
  KEY `user_services_user_id_foreign` (`user_id`),
  CONSTRAINT `user_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_services`
--

LOCK TABLES `user_services` WRITE;
/*!40000 ALTER TABLE `user_services` DISABLE KEYS */;
INSERT INTO `user_services` VALUES (3,41,7,'2023-09-19 10:03:25','2023-09-19 10:03:25'),(4,21,7,'2023-09-19 10:03:25','2023-09-19 10:03:25'),(5,27,7,'2023-09-19 10:03:25','2023-09-19 10:03:25'),(6,19,9,'2023-09-19 10:38:18','2023-09-19 10:38:18'),(7,30,9,'2023-09-19 10:38:18','2023-09-19 10:38:18'),(8,37,9,'2023-09-19 10:38:18','2023-09-19 10:38:18'),(9,19,8,'2023-09-19 13:40:55','2023-09-19 13:40:55'),(10,19,8,'2023-09-21 19:40:32','2023-09-21 19:40:32'),(11,32,8,'2023-09-21 19:40:32','2023-09-21 19:40:32'),(12,37,8,'2023-09-21 19:40:32','2023-09-21 19:40:32'),(13,48,8,'2023-09-21 19:40:32','2023-09-21 19:40:32'),(14,47,8,'2023-09-21 19:40:32','2023-09-21 19:40:32');
/*!40000 ALTER TABLE `user_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` enum('android','ios','windows','mac','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_tokens_user_id_index` (`user_id`),
  CONSTRAINT `user_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` int NOT NULL,
  `account_status` int NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `experience_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referral_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_referral_code_unique` (`referral_code`),
  KEY `users_city_id_foreign` (`city_id`),
  CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'aaa','service.account@craftsceneapp.com','123456789','2023-09-05 19:46:07','2023-09-05 19:46:07','$2y$10$5rhR.gZO2N9Y7nPg8I1JhepA/mDkdkMMVs8dyhMxMpy/5KX/H11i.',7,2,NULL,'1988-03-13T00:00:00.000Z','1','expert','623492',1,NULL,NULL,'2023-09-14 18:23:16'),(2,'Attar2','mseel3ttar@gmail.com','01056620659',NULL,NULL,'$2y$10$nc13r5PeaxTB4jrtfwRV8ecEMOd7QMbyl5E1xXCsk6UgFEGyxZo5W',2,1,NULL,'2023-09-05T22:00:00.000Z','1','expert','315460',1,NULL,'2023-09-06 19:44:40','2023-09-20 17:50:49'),(3,'test','test@gmail.com','12345',NULL,NULL,'$2y$10$.IhhMWqbC5EbU6Cphm5d3eYByYT9eMx.TD807Q//2nTATBQx6e80u',2,1,NULL,'2000-09-05T22:00:00.000Z','1','expert','794744',1,'2023-09-07 22:19:35','2023-09-07 22:01:43','2023-09-07 22:19:35'),(4,'youssef','yousef@gmail.com','1234567',NULL,NULL,'$2y$10$sd2teMdKJl1jzu.Ke71bhugWdQTUogIBNHYMBkeCmTFiFTGC.Tm2K',7,1,NULL,'1990-09-05T22:00:00.000Z','1','0','926634',1,'2023-09-16 16:57:29','2023-09-09 21:53:25','2023-09-16 16:57:29'),(5,'Mohammed Said','dilam92368@ipnuc.com','015123456789',NULL,NULL,'$2y$10$D14GZZ3t7xE3r3vO9/Ikf.9q0BwRRjHoGjnN50Uz/ebkSyLhVLkte',2,1,NULL,'2023-09-10T22:00:00.000Z','1','expert','569417',1,NULL,'2023-09-17 18:10:17','2023-09-17 18:10:17'),(6,'HATEM HASSAN','CEO@ee-fm.org','00201095915959',NULL,NULL,'$2y$10$EDbgkFmrpXLhEinOOD7tTuZ4kcXlflKTlr/Xsch7qNjGLruJ4vHJK',3,1,NULL,'1976-08-04T21:00:00.000Z','1','expert','623111',1,NULL,'2023-09-18 12:09:51','2023-09-18 12:09:51'),(7,'A-Form Sp. Z O.o.','info@room108.nl','12365486',NULL,NULL,'$2y$10$8fcfQuk675Y1hqjVjysHDuh.HlH4HLReGlUkETJgW6hPnms9hDom.',4,1,NULL,'2023-09-17T21:00:00.000Z','1','0','406948',1,NULL,'2023-09-18 12:10:27','2023-09-18 12:10:27'),(8,'test 100-edit','test100@test.com','012345678',NULL,NULL,'$2y$10$D1fPRKCuRWMq3JI8DfgRg.aDEAzD1RJ/4HsHQLKQWvO34cd7K4noq',6,1,NULL,'2000-09-06T22:00:00.000Z','1','expert','297169',1,NULL,'2023-09-18 19:24:47','2023-09-20 18:17:53'),(9,'swar','swar@gmail.com','010979100630',NULL,NULL,'$2y$10$PEJtyPWPMTFHd/cckx2jCuJVbdWt43I7rotJNj25zTBYaeI7ApKXq',6,1,NULL,'2023-09-03T21:00:00.000Z','1','expert','617930',1,NULL,'2023-09-19 09:13:42','2023-09-19 10:36:39'),(10,'susupybah','gucaxaf@mailinator.com','111',NULL,NULL,'$2y$10$8a/g38ZC551o/20RNCBV2ua27VM69o8Dc4CuItw5YWkPTxWwIyIlu',1,1,NULL,'2023-09-18T21:00:00.000Z','1','0','808788',1,'2023-09-20 17:51:04','2023-09-20 17:50:19','2023-09-20 17:51:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `values`
--

DROP TABLE IF EXISTS `values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `modelable_id` bigint unsigned NOT NULL,
  `modelable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` bigint unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `values`
--

LOCK TABLES `values` WRITE;
/*!40000 ALTER TABLE `values` DISABLE KEYS */;
INSERT INTO `values` VALUES (1,1,'App\\Models\\UserIdea',1,'qqqqq','2023-09-20 10:38:02','2023-09-20 18:14:09'),(2,1,'App\\Models\\Product',1,'qqq','2023-09-20 10:40:57','2023-09-20 10:40:57'),(3,2,'App\\Models\\UserIdea',1,'as','2023-09-20 19:07:20','2023-09-20 19:07:20'),(4,3,'App\\Models\\UserIdea',1,'xlage','2023-09-21 06:46:59','2023-09-21 06:46:59'),(5,2,'App\\Models\\Product',1,'red','2023-09-21 07:03:22','2023-09-21 07:03:22');
/*!40000 ALTER TABLE `values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` double(8,2) NOT NULL,
  `branch_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variants_branch_id_foreign` (`branch_id`),
  KEY `variants_product_id_foreign` (`product_id`),
  CONSTRAINT `variants_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_codes`
--

DROP TABLE IF EXISTS `verification_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verification_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_type` enum('email','phone') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `verification_codes_code_unique` (`code`),
  KEY `verification_codes_user_id_foreign` (`user_id`),
  CONSTRAINT `verification_codes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_codes`
--

LOCK TABLES `verification_codes` WRITE;
/*!40000 ALTER TABLE `verification_codes` DISABLE KEYS */;
INSERT INTO `verification_codes` VALUES (1,'267839','email',2,'2023-09-06 20:10:28','2023-09-06 20:10:28'),(2,'172493','email',1,'2023-09-09 09:46:50','2023-09-09 09:46:50');
/*!40000 ALTER TABLE `verification_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `current_balance` int NOT NULL,
  `total_earned` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_user_id_index` (`user_id`),
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-22 21:21:10
