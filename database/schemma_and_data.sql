-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: schooldb7staging
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cities_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Αθήνα'),(3,'Βόλος'),(7,'Δράμα'),(10,'Ηράκλειο'),(5,'Θεσσαλονίκη'),(9,'Καλαμάτα'),(6,'Κέρκυρα'),(4,'Λάρισσα'),(2,'Πάτρα'),(8,'Πύργος'),(11,'Χανιά');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `fathername` varchar(45) DEFAULT NULL,
  `phone_num` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `registration_year` int DEFAULT NULL,
  `study_direction` varchar(45) DEFAULT NULL,
  `city_id` int DEFAULT NULL COMMENT 'FK του cities',
  `birth_date` date DEFAULT NULL,
  `uuid` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_students_cities_id_idx` (`city_id`),
  KEY `ifx_students_lastname` (`lastname`),
  CONSTRAINT `fk_students_cities_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Γιάννης','Παπαδόπουλος','Δημήτρης','6912345678','giannis.papadopoulos@example.com',2023,'FRONTEND',1,'2000-05-15','b08f25db-1520-11f0-8866-d05099813f00','2025-04-09 08:57:39','2025-04-09 08:57:39'),(2,'Μαρία','Κωνσταντίνου','Νίκος','6978945612','maria.konstantinou@example.com',2022,'BACKEND',2,'1999-08-20','b08fa96f-1520-11f0-8866-d05099813f00','2025-04-09 08:57:39','2025-04-09 08:57:39'),(3,'Δημήτρης','Ιωάννου','Αλέξανδρος','6987451236','dimitris.ioannou@example.com',2023,'FULL_STACK',3,'2001-02-10','b08fb8a7-1520-11f0-8866-d05099813f00','2025-04-09 08:57:39','2025-04-09 08:57:39'),(4,'Ελένη','Φουφου','Πέτρος','6996325417','eleni.petrou@example.com',2024,'FRONTEND',1,'2002-11-05','b08fbbe8-1520-11f0-8866-d05099813f00','2025-04-09 08:57:39','2025-04-09 20:15:20'),(5,'Νίκος','Αντωνίου','Αντώνης','6947852369','nikos.antonious@example.com',2022,'BACKEND',4,'1991-07-12','b08fbd8a-1520-11f0-8866-d05099813f00','2025-04-09 08:57:39','2025-04-09 22:27:37'),(6,'Δημήτρης','Παπαδόπουλος','Γεώργιος','6912345678','d.papadopoulos@example.com',2020,'FRONTEND',1,'1999-05-15','9833b826-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(7,'Μαρία','Κωνσταντίνου','Νικόλαος','6912345679','m.konstantinou@example.com',2021,'BACKEND',2,'2000-07-22','9833c9ba-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(8,'Γιάννης','Ιωαννίδης','Αθανάσιος','6912345680','g.ioannidis@example.com',2019,'FULL_STACK',3,'1998-11-30','9833cb30-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(9,'Ελένη','Αντωνίου','Δημήτρης','6912345681','e.antoniou@example.com',2022,'FRONTEND',4,'2001-02-14','9833cc3d-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(10,'Νίκος','Γεωργίου','Παναγιώτης','6912345682','n.georgiou@example.com',2020,'BACKEND',5,'1999-09-05','9833cd36-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(11,'Σοφία','Δημητρίου','Αλέξανδρος','6912345683','s.dimitriou@example.com',2021,'FULL_STACK',1,'2000-04-18','9833ce4f-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(12,'Αλέξανδρος','Νικολάου','Σπύρος','6912345684','a.nikolaou@example.com',2019,'FRONTEND',2,'1998-12-25','9833d120-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(13,'Χριστίνα','Μιχαήλ','Βασίλης','6912345685','ch.michael@example.com',2022,'BACKEND',3,'2001-01-10','9833d24a-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(14,'Παναγιώτης','Οικονόμου','Σταύρος','6912345686','p.oikonomou@example.com',2020,'FULL_STACK',4,'1999-08-07','9833d335-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(15,'Αγγελική','Σωτηρίου','Κωνσταντίνος','6912345687','a.sotiriou@example.com',2021,'FRONTEND',5,'2000-03-19','9833d462-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(16,'Σταύρος','Θεοδωρίδης','Ηλίας','6912345688','s.theodoridis@example.com',2019,'BACKEND',1,'1998-10-12','9833d548-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(17,'Ειρήνη','Παυλίδου','Αριστείδης','6912345689','e.pavlidou@example.com',2022,'FULL_STACK',2,'2001-06-28','9833d631-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(18,'Κωνσταντίνος','Αλεξάνδρου','Μιχάλης','6912345690','k.alexandrou@example.com',2020,'FRONTEND',3,'1999-04-03','9833d71b-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(19,'Αναστασία','Στεφάνου','Αντώνης','6912345691','a.stefanou@example.com',2021,'BACKEND',4,'2000-11-15','9833d811-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57'),(20,'Θεόδωρος','Βασιλείου','Διονύσης','6912345692','th.vasileiou@example.com',2019,'FULL_STACK',5,'1998-07-09','9833d8f7-1610-11f0-8866-d05099813f00','2025-04-10 13:34:57','2025-04-10 13:34:57');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `vat` varchar(45) NOT NULL,
  `fathername` varchar(45) DEFAULT NULL,
  `phone_num` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `street_num` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_teachers_lastname` (`lastname`) /*!80000 INVISIBLE */,
  KEY `idx_teachers_vat` (`vat`) /*!80000 INVISIBLE */,
  KEY `idx_teachers_city_id` (`city_id`),
  CONSTRAINT `fk_teachers_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Αθανάσιος','Ανδρούτσος','876543210','Ανδρέας','6935565765','a8ana@gmail.com','Πατησίων','76','10434',4,'e27aee5e-f447-4203-9b4a-7c638f422057','2025-03-17 18:01:18','2025-04-03 11:50:01'),(2,'Άννα','Γιαννούτσου','123456781','Κώ','12345678','anna@gmail.com','Γεωργούτσου','16','67856',5,'68bc653a-abc7-4c30-8eb9-247b6b380d2e','2025-03-17 18:01:18','2025-04-09 17:12:49'),(3,'Μάκης','Καπέτης','987654321','Ευάγγελος','6935465768','makis@gmail.com','Πατησίων','76','10434',1,'94110e89-c23b-4c41-8c6b-f3e8b1fe9664','2025-03-17 18:01:18','2025-03-17 18:01:18'),(5,'Κωνσταντίνος','Ρούμπας','456782341','Κλεάνθης','69987678767','kostis@gmail.com','Φράγκου','32','34567',3,'c69e23eb-5027-4bf3-a141-cc1a142d93dc','2025-03-17 18:01:18','2025-04-09 22:19:12'),(6,'Ελένη','Λαμπρούτσου','9078563411','Λάμπρος','2111309876','eleni@aueb.gr','Αδριανής','11','98076',7,'5c2c955d-98b1-47ca-bce6-3803f7754805','2025-03-17 18:01:18','2025-04-09 22:20:37');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` enum('ADMIN','LIGHT_ADMIN') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'thanos@aueb.gr','$2a$12$aHazLO91r.h7IUSzLfXfhejbBZyTRg2HIHwmXdhzKrMLOjLqL0zZy','ADMIN'),(2,'anna@gmail.com','$2a$12$.j.oBMUr8T1P8kdTWydAIOBr7SmOofxSwF/wlkZSCs5higLC7hVpO','LIGHT_ADMIN'),(3,'niki@aueb.gr','$2a$12$bI/ti.LEbS5BwzzQL0OsXefEQRT3m6wuLmFkyluUYtlKbkVEJStey','ADMIN'),(4,'niki2@gmail.com','$2a$12$chRNgLtEpqnZLn8GnYfBSOt4y5PiXkvOmkubaunF8TmDyYIe2yKoS','ADMIN'),(5,'digeo@yahoo.gr','$2a$12$e5jr4U4xvXfGxcKY9CjlT.Qf/1RuDE1llyH6NfO9.zYiu.QlWoHTi','ADMIN');
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

-- Dump completed on 2025-04-10 16:42:46
