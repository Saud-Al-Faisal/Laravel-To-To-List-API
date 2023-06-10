-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: db    Database: project_2
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_05_06_145923_create_to_do_lists_table',1),(6,'2023_05_06_172958_create_tasks_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `to_do_list_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tasks_uuid_unique` (`uuid`),
  KEY `tasks_to_do_list_id_foreign` (`to_do_list_id`),
  KEY `tasks_created_by_foreign` (`created_by`),
  CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_to_do_list_id_foreign` FOREIGN KEY (`to_do_list_id`) REFERENCES `to_do_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'b0fe3706-720f-418b-a609-d2a2c4487d6a','Abigale Mayert','Pending',1,1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(2,'1c4da554-206c-4fd1-8a49-2f3d866fa37d','Theo O\'Connell','Complete',1,1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(3,'3584be8b-4279-4acc-a19a-34976b1ea04b','Miss Clara Dietrich PhD','Processing',1,1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(4,'e4a3f1ce-e017-406f-a808-60b3007206bb','Mr. Randall Haley Sr.','Processing',2,1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(5,'db3397b0-450e-4b48-baee-56b605a92dfa','Miss Noemy Wilkinson II','Complete',2,1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(6,'e339006b-e443-4671-81da-63121c7f707c','Xander Thompson','Processing',2,1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(7,'c6ca350f-dd99-4445-bb21-70cf0414f325','Shana Predovic II','Processing',3,1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(8,'891cedeb-0979-4439-a743-3d0513810ddc','Sophia Reynolds','Pending',3,1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(9,'afefb911-5c05-4a37-8ddb-9ce9989379d1','Prof. Haskell Pagac V','Processing',3,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(10,'03d7bc3c-fb52-4b8e-9237-d1d34daab0f6','Brook Lemke','Processing',4,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(11,'cee58297-ae7e-4b23-842d-6ff7085fc7d2','Mittie Rosenbaum','Complete',4,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(12,'6c0b2769-59c2-414b-a294-a312e4d69ce8','Destinee Kuphal','Complete',4,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(13,'ce90e4c5-623b-444b-88a7-61adea72be81','Winifred Batz IV','Complete',5,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(14,'4bf3aed6-20a9-441f-98f9-c4b53d808797','Prof. Tod Stamm','Complete',5,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(15,'a4fd0fce-1d63-4a81-ba77-129ddeac8472','Mrs. Marcella Bergnaum','Complete',5,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(16,'464206cf-0075-481c-81f3-3d32f276e2b9','Mrs. Arielle Hessel DDS','Complete',6,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(17,'6f1833ed-efac-4423-84e6-d09d878fbb85','Cathy Shields','Processing',6,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(18,'476d1cdb-5d38-4176-ad2d-e0e78de9e97f','Berenice Kulas','Complete',6,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(19,'1ff972d9-bf44-461d-b3c8-7a8a4248b6e6','Florine Douglas III','Pending',7,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(20,'efd662db-d829-43a4-b270-11af4d0249da','Quinn Turcotte','Processing',7,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(21,'eb616fbf-ceb1-4db3-945a-8304eef9ee2a','Erin Barrows','Processing',7,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(22,'855cef4a-0ca9-467e-aaf5-4bb652768739','Tod Watsica','Processing',8,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(23,'2dea8a44-b7f5-4659-a691-337562fa5b2c','Miss Ona Bartell','Pending',8,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(24,'0997d7a3-1434-4602-8788-26d91726022e','Cathy Schmidt','Pending',8,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(25,'320684a4-c5ec-423e-ba71-b2155330b938','Conner DuBuque','Complete',9,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(26,'180eebca-b669-42f3-9b21-504860726379','Alize Mayert','Pending',9,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(27,'66432dcf-4176-4bd5-be8a-319164ba860c','Mrs. Rosella Dickens','Pending',9,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(28,'bb47cf89-3039-40af-b923-eec47982af87','Edwin Schimmel Jr.','Processing',10,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(29,'52297daf-2d62-4437-90d5-2e92374a09c1','General Bogan','Processing',10,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(30,'326b922d-6841-4ac5-9b2e-7ea830b5da89','Alysa Brown','Complete',10,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(31,'eccfaaad-b72d-4bc7-890a-2b76f53777ee','Vincent Mante','Processing',11,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(32,'5e345f0a-9ef6-4d8f-b791-fe1dc66d25d7','Audrey Turcotte','Pending',11,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(33,'380346d9-44d2-419e-8806-5080336c7dd0','Esteban Ankunding','Pending',11,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(34,'12966838-9a1a-4e1f-b54f-7455f69add70','Ms. Barbara Borer V','Complete',12,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(35,'9fd48c45-ff3e-42cb-8873-df858cfb6865','Mr. Merlin Greenfelder I','Processing',12,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(36,'ea195a68-8157-4255-abd0-3b1dc0c5cd74','Ethyl Greenholt','Pending',12,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(37,'b25f40b9-81a2-40b7-82cc-dd6a678dfc64','Breana Strosin','Processing',13,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(38,'27578da1-0d17-44cb-8e3f-367a8ef147a7','Modesto Farrell','Pending',13,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(39,'649ff461-8c56-4b5b-bdf5-9d291cb1b7e5','Cyrus Bins','Processing',13,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(40,'625c68e9-e825-494a-b414-3e2d11cb9f70','Mr. Ted Marks I','Pending',14,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(41,'7324fa8c-b142-4b61-a242-f30f64b39a99','Makenzie Padberg Sr.','Processing',14,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(42,'b1a5fc8d-96bd-4444-8641-59a8adb83957','Lorenza Miller','Processing',14,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(43,'8de2f8d6-bef7-48c7-846d-d8b133dc77e3','Merle Cormier','Pending',15,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(44,'13a6d4fe-03f7-46b0-b2e6-0643aaf3cb01','Herta Legros','Complete',15,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(45,'c9360006-bead-4e8a-8512-0297ac90a866','Easton Cronin','Complete',15,1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(46,'480a3dc4-3363-4503-ab48-4628edb79711','Jermain Jones IV','Complete',16,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(47,'408f56b3-abbe-427f-94fe-a23c941caa07','Carmela Murphy','Pending',16,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(48,'3c21370e-2b2d-4bf2-acb4-1e745eb13b8e','Prof. Garrison Marks PhD','Pending',16,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(49,'04eca6ca-11ef-483d-b8b0-a9a72a473f56','Mrs. Drew King II','Complete',17,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(50,'35181adb-c294-42e6-b3e2-dcf7331c454f','Dr. Sandy King PhD','Processing',17,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(51,'8059412f-e799-41b5-829b-57e27b9f59cc','Mr. Thurman Morissette I','Complete',17,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(52,'94f4f046-a92e-4707-9c6a-343ebcbfe82a','Marcelino Feest','Complete',18,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(53,'917fded0-a984-4391-bf20-90b18828eae4','Troy Simonis','Processing',18,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(54,'4e3c31e6-6499-437b-a01e-884896b1aa71','Nikko Powlowski','Complete',18,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(55,'e9283654-2b6d-48ae-a219-9fddff541d43','Miss Zelda Friesen','Pending',19,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(56,'fd2521ff-fcc8-4e25-9dac-96565eeffb13','Phyllis Kuphal','Complete',19,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(57,'c973a2e4-70bd-4f63-bc4f-310429622699','Ericka Miller MD','Pending',19,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(58,'7bc69483-91f6-40b4-8a70-cf37c8c84ade','Dr. Arlie Torphy','Complete',20,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(59,'8716769c-df41-4628-b442-619204ee15e4','Shayne Lang','Complete',20,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(60,'ec2bdc96-4ba0-4d23-8fbf-7a25c1a3671e','Regan Ziemann','Pending',20,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(61,'bfb510f9-4473-4eb7-bca7-07185a2f4502','Rudolph Bahringer','Processing',21,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(62,'2225b781-6f2b-4685-9e1b-a5228528bb2c','Yolanda Braun','Complete',21,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(63,'b4e6c21c-7f55-439e-95da-d76190fa1667','Jeanette Kshlerin','Pending',21,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(64,'92017aaa-87ab-4b45-9edf-054a3dd13c88','David Parker','Processing',22,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(65,'baee3646-2c41-4435-b225-46231efc7c34','Major Rolfson','Complete',22,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(66,'63f19405-afcf-4755-8823-ac22b64a8284','Dr. Era Stanton','Complete',22,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(67,'61225d28-857b-467b-8518-8b6bbbbf469d','Kariane Gorczany','Pending',23,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(68,'753b8399-d5c3-45eb-94f6-edb470dbf9fd','Jewel Goyette','Processing',23,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(69,'0ff64e4d-277c-4acd-a655-a1f4b90f82d9','Darien Dibbert','Complete',23,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(70,'260d99fb-f8b8-4c5f-aab2-fe61fae08e40','Prof. Timmy Harvey V','Processing',24,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(71,'0ad5e170-44ff-4d70-ac74-7e3a7d44f760','Kristina Shields','Pending',24,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(72,'ba9439bd-f101-4022-ac08-7373eecb5d47','Rodolfo Nader','Pending',24,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(73,'c905c9f4-ec6b-41de-8d00-93b832cc23ce','Virginia Upton MD','Complete',25,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(74,'e862e15c-9ed4-4cac-a8b9-96ba29a8c7eb','Alysa Spencer MD','Processing',25,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(75,'673200db-fcda-4069-8a21-d8aa8215f439','Elda Zieme','Complete',25,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(76,'3997fea0-5909-443a-bcf3-7516e77ede4b','Miss Tressa Murazik Sr.','Complete',26,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(77,'3414979c-e6d5-4ccd-9c4e-3127cd0818d0','Elaina Hane','Pending',26,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(78,'1d813bd6-20a9-403a-b1eb-ae86d84d0c3e','Hunter Leuschke','Pending',26,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(79,'8def54f5-b3f1-4dad-8e37-53831873931e','Pink King','Complete',27,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(80,'66a89683-c4da-4a04-a27e-1b8044f9ff6f','Cruz Haag','Pending',27,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(81,'c4a3de33-7b89-4bb0-9066-a5d299cf3e80','Dorothea McLaughlin','Pending',27,1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(82,'ad0a770b-0a8e-4459-ae4d-6fc85bdca217','Lesly Cronin','Processing',28,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(83,'2eac45f1-e68a-4b60-bb36-3bd8b91aad91','Athena Krajcik','Processing',28,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(84,'8c5992d3-b48a-4d24-8bdd-189a3d372301','Henderson Ullrich','Pending',28,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(85,'7720bdc8-6aa6-486f-a8ed-0d41affdfab7','Prof. Myah Wisozk','Complete',29,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(86,'adb622bf-dbce-4543-a667-4667b2f5ae98','Shaylee Schroeder','Pending',29,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(87,'43f934b6-5e07-44c4-9081-74fcb275783b','Mr. Keshawn Hirthe V','Pending',29,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(88,'bd4118c8-47f3-4047-9e9c-284cb17dcfae','Penelope Wyman','Processing',30,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(89,'4d0730de-eadf-4fcc-ac58-ef704d03e358','Robert McDermott','Processing',30,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(90,'d3f0525a-6c69-4c8b-b594-3f2b4c2e8d50','Therese Schimmel','Pending',30,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(91,'f0903a28-5d43-4bf2-93d8-f013daca7ebf','Kendall Buckridge DDS','Complete',31,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(92,'43a50d26-084a-4da5-a58a-e7d5a955af98','Lisette Grant IV','Complete',31,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(93,'012dac7a-adda-4ebc-a4cd-0582f36a3bff','Mr. Jovani West','Pending',31,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(94,'e6ab1270-6ca4-4161-87ac-2dc7dcdb665b','Arden Nolan','Pending',32,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(95,'cfdeb47c-cc46-49ac-9a4e-1e56da6d8034','Randal Howe','Complete',32,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(96,'de00435a-0153-4800-b3f4-4ccc12e1438a','Jovani Purdy','Pending',32,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(97,'7213eac3-967d-4606-9cd7-aa750c921fd6','Dr. Abdul Sporer','Pending',33,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(98,'1b0fa8fb-c887-475a-a543-57fc44668980','Mr. Allan Morissette III','Pending',33,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(99,'d240c318-c45b-4064-a839-a5eaa01ff2c6','Cory Ankunding','Pending',33,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(100,'3120e5e0-2253-4583-a75f-7febab904edd','Chadrick Rohan','Processing',34,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(101,'3f37e6cf-4893-4c77-a2f0-d35827340671','Elton Schowalter','Complete',34,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(102,'915c0b04-5346-414d-8833-fc799c188bb2','Jean Bernier','Processing',34,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(103,'3b61ed4f-0579-45a5-af78-94f2b3373adf','Amani Morar','Pending',35,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(104,'4117ccfd-04a8-4cb9-b111-21073035af17','Gianni Hagenes','Pending',35,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(105,'4149cffa-895c-49ff-bf2f-1eedc3484f47','Godfrey Stark II','Processing',35,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(106,'1747c2e9-a496-434e-9a26-66f79de49204','Sim Schmidt','Pending',36,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(107,'c7155e63-1dc9-486f-82f1-eb9e9792760f','Mona Weissnat','Processing',36,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(108,'e2f536fa-4dce-4afa-8ef5-4facdc39ad8a','Mr. Wyatt Kuhlman IV','Complete',36,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(109,'051959da-9193-4409-9287-fbff426f63af','Dr. Sheldon Hamill','Complete',37,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(110,'5394734e-6836-4f58-aa97-2822bfa1651d','Lizeth Tillman','Complete',37,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(111,'a94f8245-3cbc-4629-b1a2-ce277dd9f5b2','Prof. Katharina Koch','Complete',37,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(112,'ed88e137-b18d-4e18-895f-e7dddd35d78d','Brittany Simonis','Complete',38,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(113,'adf035e6-8208-46e9-a83c-c41840343048','Lynn Stroman','Pending',38,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(114,'d97ae6dc-a85f-4f75-adb6-974fc9cb30aa','Luis Buckridge','Complete',38,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(115,'0a229c7e-1e6c-463f-b7ef-e396b1111fb5','Olin Lubowitz','Complete',39,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(116,'3466760a-94c9-447f-b7b3-b1d0d5b04dda','Ulices Hayes','Processing',39,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(117,'a383394b-683b-4b87-afd3-9b43b0f9acd5','Neva Blanda','Processing',39,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(118,'1e647b3d-d6f9-4ae5-aa14-8f62b1036a09','Beaulah Bashirian DVM','Pending',40,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(119,'4a6e7038-51bf-487b-ab49-581c0da34b96','Gladys Hane','Processing',40,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(120,'44053b5e-ef5b-448e-a146-82e6263bc2fb','Newell Harber IV','Pending',40,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(121,'c1aa48d7-4be5-45b0-930f-6dd23df43941','Katlynn Kerluke','Pending',41,1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(122,'fc3522bb-9153-447a-a684-9465338357d6','Miss Clara Kreiger','Processing',41,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(123,'ddcccfef-af1e-4c11-8886-b1cfeccd8a35','Julius Williamson','Processing',41,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(124,'91ae8c12-cc2c-4474-8f34-0e68fec8e3de','Dr. Lennie Purdy','Pending',42,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(125,'c34c0a9e-7cee-4c56-8d26-229413ba8b6d','Dr. Wyman Goyette','Processing',42,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(126,'6f1c5835-d1a6-4611-9abf-8445213a3ba3','Henri Tremblay','Pending',42,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(127,'afeb905a-214a-4da4-a19d-96d39da4dee6','Royce Fay','Pending',43,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(128,'ccb8fd3e-be98-4f44-84ad-08893bc23211','Maegan Goyette','Pending',43,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(129,'ac3258da-6fe8-40c0-91fb-57d64bf94dd9','Kelvin Konopelski','Complete',43,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(130,'95482ff7-79c9-48e3-bbf7-8e69a0fe40e2','Mrs. Violet Kautzer DDS','Processing',44,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(131,'c7993f7a-60ea-4ea1-9e33-deb2d2c0d22d','Prof. Sedrick Pagac II','Processing',44,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(132,'c2524b04-cc7e-463d-9168-badc62bc49ff','Aleen Beahan','Processing',44,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(133,'07aeb7d9-72c4-4a14-9fe1-c80a8e2e624b','Candice Murazik MD','Processing',45,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(134,'5257284f-3ce7-4e4c-a513-3a592c079759','Mr. Rowland O\'Kon Jr.','Complete',45,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(135,'6407e3c7-8edd-4c37-b274-ada747aa7405','Kaleb Cummerata III','Processing',45,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(136,'159b3ef7-74af-4585-8ee2-31b60e66a4f6','Prof. Wava Mohr DDS','Processing',46,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(137,'5c01ca58-0a82-44b8-a589-ebabcf55cfde','Dr. Daisha McLaughlin','Pending',46,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(138,'ee3c528b-7adb-45b1-bcc6-d18e5e80e6c6','Mrs. Margarete Steuber I','Complete',46,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(139,'88c7fc30-6c06-41e3-937b-8498654935f6','Adrianna Kerluke','Processing',47,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(140,'0ade2c6d-640d-4ee9-a7d2-d346364a540a','Marjorie Haag','Pending',47,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(141,'2c8282f0-3299-4b44-8505-861e118f22d6','Wendy Feest','Processing',47,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(142,'f7e2ea45-9b35-45da-80e7-e2684a76dea8','Miss Breanna Frami','Complete',48,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(143,'ed135bca-94e0-4bc3-8d72-1a47fb80c43a','Lindsay Rippin','Pending',48,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(144,'2f35d100-ebe8-4c68-98a9-49001675b146','Dr. Mitchell Moore','Processing',48,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(145,'7eed7122-d334-49e5-ac7c-fd040d915fa4','Dahlia Boyle','Complete',49,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(146,'40f35594-a4d2-4495-9da1-5468892a6693','Dorothy Kohler II','Processing',49,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(147,'e306be72-788c-4f3f-ba64-e515366317f6','Colt Muller Jr.','Complete',49,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(148,'845dc18f-fe32-46e7-9ede-4ca8ce10f8e0','Alyce Beatty II','Complete',50,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(149,'7c9f314e-3217-438f-98af-f7e59a16e238','Miss Hope Hilpert','Complete',50,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(150,'ae02ddf6-61f1-40b7-a3de-723f11f749f6','Jace Stroman','Complete',50,1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `to_do_lists`
--

DROP TABLE IF EXISTS `to_do_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `to_do_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `to_do_lists_uuid_unique` (`uuid`),
  UNIQUE KEY `to_do_lists_name_unique` (`name`),
  KEY `to_do_lists_created_by_foreign` (`created_by`),
  CONSTRAINT `to_do_lists_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `to_do_lists`
--

LOCK TABLES `to_do_lists` WRITE;
/*!40000 ALTER TABLE `to_do_lists` DISABLE KEYS */;
INSERT INTO `to_do_lists` VALUES (1,'9fd27f44-766f-4d65-8bd8-d2bc020bd0a2','Voluptate quo molestiae est et. Ex maiores quae labore quia. Minus quam maxime libero vitae in.',1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(2,'e4b20bbd-0338-4883-b58f-4b48c4a76c91','Qui dicta et atque eligendi culpa. Ipsa et ad quo.',1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(3,'98d4f7e4-c608-4f48-bd4c-9800c155469c','Voluptas error qui qui animi non. Perferendis dolore natus laboriosam et et architecto dolor.',1,NULL,NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15',NULL),(4,'1bcd9483-eab9-4be5-96b8-90edbfe03fb4','Qui optio in perferendis suscipit id. Quo fuga facere et qui et. Sit animi aut assumenda.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(5,'e123fd1c-9533-44eb-a3d0-e5ed97da05dd','Consectetur eos sunt cupiditate illo illo quos. Delectus est iure sit fugiat est iure.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(6,'d3896d2d-022a-49ca-91aa-514dab5cd549','Iste dolore autem rerum cum. Corporis qui nemo veritatis ratione necessitatibus sit.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(7,'345eb3ea-32f7-4310-adf2-e98c760e8f0e','Eos non quis et possimus. Nobis quia nesciunt excepturi in et. Velit tenetur dolor modi est.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(8,'85cbba80-c86c-4042-b8f4-f45f2d4c57e3','Et autem quidem dolor debitis. Praesentium ea non sed. Voluptatem quo dolores iure rerum suscipit.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(9,'007b5c8b-25ca-4e32-9ed3-cf5b120b01d6','Incidunt vel eum voluptas repellat. Vel dolor voluptatum et labore corrupti.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(10,'1ed1c02e-21c5-4399-95f2-7a2b55205f25','Odit sint vero odio praesentium quod. Debitis dolor quo nemo mollitia.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(11,'e679b9d6-ac17-4926-a14f-17c1aba4e60d','Animi quia ut magni deserunt unde omnis. Esse veritatis et sunt eius.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(12,'6e7c29a6-14b2-4ee5-8236-beb022855bd5','A aliquam ut qui ipsa vel. Laudantium aut facilis et quisquam laudantium natus.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(13,'69414939-2457-4fef-9531-c38d5ad46af8','Reprehenderit ut est tempora mollitia nemo odio sint quae. Quisquam quia perferendis est.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(14,'96d5a803-41da-4edd-9368-2fb50e60eb4c','Et enim quis molestiae sapiente alias. At et unde ea vero.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(15,'937ed6c9-8d1e-4628-8462-82be81596e05','Quis magnam quos dolores porro aspernatur voluptatem. Explicabo eaque optio voluptas beatae.',1,NULL,NULL,'2023-06-10 06:23:16','2023-06-10 06:23:16',NULL),(16,'f1eb57f6-2dbb-4ded-8082-807fbd0ffb9a','Neque ex sint voluptas recusandae earum. Dolores magni id qui saepe eveniet.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(17,'5f554515-4ae7-4fb6-bcd3-fdf5a76f664f','Eum sapiente vero aut impedit fugit. Quis magnam nam libero et voluptatem repellat exercitationem.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(18,'2cfa7382-08ab-4a97-b63b-d94fa7c163f9','Dolores quaerat deleniti tenetur. Veniam blanditiis labore delectus impedit ad eum.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(19,'65e9fc6f-abd6-439e-8776-f28de636fb9f','At quas ut eos et. Velit iste iusto expedita ipsa. Aut maxime qui libero impedit reiciendis.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(20,'8d993189-b83e-4c5c-9299-bc5d39d9b1f1','Reprehenderit et deserunt id veniam. Voluptates deleniti velit hic temporibus.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(21,'5f772368-b99f-4714-aaa0-7e3a423a1776','Non non id minus in consequatur molestiae odio. Nulla qui reiciendis et et.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(22,'f2c342e5-7c66-44ad-8b5b-84cbee404c3e','Velit error quos odit laboriosam. Consequuntur illo ut doloremque ad id.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(23,'364e27ef-5861-40ad-9ee0-57d57d07e089','Quo eum laborum voluptatem quia cumque harum exercitationem. Vero dicta voluptatibus dolor.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(24,'8c8b3685-7188-4ecb-8f6a-d2ca32f0bfcd','Sapiente in commodi et et nihil. Ut cupiditate quas excepturi et maxime.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(25,'007fb5fa-a3d4-430b-af70-c0c6f31434ae','Illo qui beatae nostrum at. Corporis enim odio aut illum. Et explicabo necessitatibus molestias ut.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(26,'2684b957-9bc8-4152-949d-4440a45b7c03','Ducimus nisi fugit quod. Soluta molestiae et et. Non libero molestiae iusto et.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(27,'efd2916d-69fd-4e30-af46-7c2ea7ceb458','Sed consectetur occaecati blanditiis et. Omnis corporis vero debitis et eaque delectus.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(28,'e6c2c6f7-1239-44df-a1a2-85ff2d58a3d2','Eos rerum omnis delectus. Porro autem temporibus quae veritatis aliquam enim. Quo hic rem minus.',1,NULL,NULL,'2023-06-10 06:23:17','2023-06-10 06:23:17',NULL),(29,'1588c541-57fa-4eae-9ed1-808e3e0e10c0','Praesentium provident nemo deserunt in impedit. Alias beatae iure illo in sit ipsam expedita.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(30,'d93a51eb-9047-442f-901b-19fc7d8003a4','Omnis molestiae ut aliquam non. Et aspernatur sint maxime rem placeat est.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(31,'61758985-ecd1-44e0-90e5-81d8b98f8a8a','Provident molestiae qui nostrum. Eligendi dolorem vero consequatur commodi nobis et esse quis.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(32,'a3aded1c-d213-4421-beec-9c3f04cf2543','Beatae sunt facere excepturi omnis placeat molestiae qui. Nobis enim quis modi.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(33,'a43921bf-5a01-40ba-a06e-97926443d208','Sit fugiat et sed soluta dignissimos. Id qui neque optio. Debitis fugiat velit ea expedita.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(34,'0a2ad0dd-ae4e-4ffe-92d9-f90c76c7d0f9','Minus impedit quo qui dolorum non sunt. Quod voluptas ea quia et adipisci autem.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(35,'3f2df9fd-2c2e-4dc9-9cfe-4d6714b25b50','Aliquam non minus fugit aut mollitia. Temporibus numquam porro quae voluptatem neque.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(36,'4592bbd2-6491-4212-8086-f131d8eaa52b','Est velit molestiae magnam rerum ea. Dignissimos ut qui nulla voluptate non.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(37,'5b101324-549a-4e30-9b23-129106ed1178','Illum quia distinctio alias ratione. Sed optio rerum neque pariatur. Aut dolore quo cum aut at aut.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(38,'ab1fc9e9-af9b-41bb-8de2-670bfccf09ce','Voluptas tenetur labore eos rerum optio velit. Velit sequi perferendis sed labore quisquam maxime.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(39,'d110b53a-ea20-45fb-8501-d73aa5a3425d','Et ducimus laudantium voluptas dignissimos odit amet. Minus odio eos laborum et soluta.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(40,'983f577c-0f9c-4a0e-9814-7895ccde0f6c','Ut voluptatem voluptatem soluta. Ut sunt voluptate enim expedita.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(41,'ceb53cc2-fcb3-4761-9bf0-3cd68daa3c81','Voluptatem tempore sed totam nihil ut voluptatem. Non quod recusandae molestias iste.',1,NULL,NULL,'2023-06-10 06:23:18','2023-06-10 06:23:18',NULL),(42,'1dd1d0e4-7fd0-48ff-99ab-97916e862579','Consequatur aut nam aut illo. Hic libero possimus nemo. Est iusto et officiis fugiat.',1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(43,'930ef482-1c2d-4897-a38f-73e01ae1c241','Neque ducimus aperiam incidunt maxime earum et et. Enim maiores sit omnis porro consequatur eum.',1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(44,'8c53cb6b-69a0-41ac-b3fe-d1526026a9f5','In aperiam voluptas inventore rerum aut corrupti. Et amet quas facilis.',1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(45,'e1785171-c30c-43e0-9f8c-7e483d416908','Natus provident incidunt incidunt provident hic. Veritatis est dolores culpa culpa ratione.',1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(46,'6d0ec0e7-8992-462a-800f-8ae1e42cb95b','Quaerat officiis veritatis consequatur. Eveniet omnis aut dolores eveniet.',1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(47,'327a2c20-b1e4-492a-ae9c-3a22a8335ffa','Qui itaque dicta officiis animi omnis. Unde qui et consequatur neque debitis maxime in.',1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(48,'98b0c22a-d604-4399-acf1-0c26fb86a426','Repellat consequatur at deleniti et qui. Nesciunt magni qui qui sit voluptates aliquid.',1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(49,'fdfb5cc8-ee6a-44bd-8178-923087c9d182','Labore quis rerum delectus rerum. Quia aut et ut. Qui asperiores minima saepe porro.',1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL),(50,'4bdb1e37-5efe-485e-93bf-d75b6b586626','Minima aut odio nihil numquam. Quia ipsa dignissimos accusamus quam quia consectetur rem.',1,NULL,NULL,'2023-06-10 06:23:19','2023-06-10 06:23:19',NULL);
/*!40000 ALTER TABLE `to_do_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Api user','user@api.com',NULL,'$2y$10$zygp/8rfwPrb5Q1XocFrDuxg6AzZGUBKZ/bPg9ZtgiBo9l5MgADJW',NULL,'2023-06-10 06:23:15','2023-06-10 06:23:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-10  7:43:23
