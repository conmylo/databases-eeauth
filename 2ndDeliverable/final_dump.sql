-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.33

DROP SCHEMA IF EXISTS `mydb`;
CREATE SCHEMA `mydb`;
USE `mydb`;

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` char(14) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `phoneNumber_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Tom','Hopkins','hopkins@gmail.com','+302310245871','tomhop','password','2023-12-20 16:41:37',NULL,_binary '\0'),(2,'John','Doe','johndoe@gmail.com','+302310478965','johndoe','secret','2023-12-20 16:42:44',NULL,_binary ''),(3,'Jane','Smith','jane.smith@email.com','+309876543210','janesmith','securepass','2023-12-20 17:03:04',NULL,_binary '\0'),(4,'Emily','Williams','emily.w@email.com','+302223334444','emilyw','pass123','2023-12-20 17:10:34',NULL,_binary ''),(5,'David','Miller','david.m@email.com','+309998887777','davidm','mypassword','2023-12-20 17:11:12',NULL,_binary ''),(6,'Susan','Anderson','susan.a@email.com','+304445556666','susan','anderson123','2023-12-20 17:11:50',NULL,_binary '\0'),(7,'Brian','Clark','brian.c@email.com','+307776665555','brianclark','letmein','2023-12-20 17:12:55',NULL,_binary '\0'),(8,'Alice','White','alice.w@email.com','+301112223333','alicew','password456','2023-12-20 17:13:28',NULL,_binary ''),(9,'Richard','Martin','richard.m@email.com','+306667778888','richardm','hello123','2023-12-20 17:15:30',NULL,_binary ''),(10,'Lisa','Turner','lisa.t@email.com','+303334445555','lisat','ilovecoding','2023-12-20 17:16:04',NULL,_binary '\0');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluates`
--

DROP TABLE IF EXISTS `evaluates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluates` (
  `Customer_id` int NOT NULL,
  `Store_id` int NOT NULL,
  `number_of_stars` tinyint DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`Customer_id`,`Store_id`),
  KEY `fk_Customer_has_Store_Store1_idx` (`Store_id`),
  KEY `fk_Customer_has_Store_Customer1_idx` (`Customer_id`),
  CONSTRAINT `fk_Customer_has_Store_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_Customer_has_Store_Store1` FOREIGN KEY (`Store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluates`
--

LOCK TABLES `evaluates` WRITE;
/*!40000 ALTER TABLE `evaluates` DISABLE KEYS */;
INSERT INTO `evaluates` VALUES (1,1,4,'Really nice store with delicius food!','2023-12-21 14:34:49',NULL),(2,1,3,'Decent restaurant','2023-12-21 14:34:49',NULL),(2,3,5,'Excellent store!','2023-12-21 14:34:49',NULL),(3,2,2,'Not so good service. The food quality was not so bad but it could be better.','2023-12-21 14:34:49',NULL),(4,4,5,'Very good tastes and the staff was really kind!','2023-12-21 14:34:49',NULL),(5,4,4,'It is worth it to have a beatifull night at this store!','2023-12-21 14:34:49',NULL),(5,6,4,'Very nice drinks and the vibe of the store is really cozy!','2023-12-21 14:34:49',NULL),(6,5,1,'Very bad service from the waiters who were quite rude','2023-12-21 14:34:49',NULL),(6,6,4,'Decent food quality and happy place to be!','2023-12-21 14:34:49',NULL),(10,3,5,'Would recomend this store to everyone!','2023-12-21 14:34:49',NULL);
/*!40000 ALTER TABLE `evaluates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_list`
--

DROP TABLE IF EXISTS `favourite_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite_list` (
  `Customer_id` int NOT NULL,
  `Store_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`Customer_id`,`Store_id`),
  KEY `fk_Customer_has_Store_Store2_idx` (`Store_id`),
  KEY `fk_Customer_has_Store_Customer2_idx` (`Customer_id`),
  CONSTRAINT `fk_Customer_has_Store_Customer2` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_Customer_has_Store_Store2` FOREIGN KEY (`Store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_list`
--

LOCK TABLES `favourite_list` WRITE;
/*!40000 ALTER TABLE `favourite_list` DISABLE KEYS */;
INSERT INTO `favourite_list` VALUES (1,1,'2023-12-21 14:28:11',NULL),(1,4,'2023-12-21 14:28:11',NULL),(2,4,'2023-12-21 14:28:11',NULL),(3,5,'2023-12-21 14:28:11',NULL),(3,6,'2023-12-21 14:28:11',NULL),(4,1,'2023-12-21 14:28:11',NULL),(5,2,'2023-12-21 14:28:11',NULL),(5,6,'2023-12-21 14:28:11',NULL),(6,3,'2023-12-21 14:28:11',NULL),(7,3,'2023-12-21 14:28:11',NULL),(7,5,'2023-12-21 14:28:11',NULL),(8,6,'2023-12-21 14:28:11',NULL);
/*!40000 ALTER TABLE `favourite_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `get_all_stores`
--

DROP TABLE IF EXISTS `get_all_stores`;
/*!50001 DROP VIEW IF EXISTS `get_all_stores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_all_stores` AS SELECT 
 1 AS `name`,
 1 AS `email`,
 1 AS `phone_number`,
 1 AS `address`,
 1 AS `ZIP`,
 1 AS `city`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_customer_reservations`
--

DROP TABLE IF EXISTS `get_customer_reservations`;
/*!50001 DROP VIEW IF EXISTS `get_customer_reservations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_customer_reservations` AS SELECT 
 1 AS `customer_id`,
 1 AS `number_of_people`,
 1 AS `date`,
 1 AS `time_slot`,
 1 AS `comment`,
 1 AS `table_id`,
 1 AS `store_id`,
 1 AS `store_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_evaluates`
--

DROP TABLE IF EXISTS `get_evaluates`;
/*!50001 DROP VIEW IF EXISTS `get_evaluates`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_evaluates` AS SELECT 
 1 AS `store_id`,
 1 AS `name`,
 1 AS `number_of_stars`,
 1 AS `comment`,
 1 AS `firstname`,
 1 AS `lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_reservations_of_store`
--

DROP TABLE IF EXISTS `get_reservations_of_store`;
/*!50001 DROP VIEW IF EXISTS `get_reservations_of_store`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_reservations_of_store` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `phone_number`,
 1 AS `number_of_people`,
 1 AS `date`,
 1 AS `time_slot`,
 1 AS `comment`,
 1 AS `table_id`,
 1 AS `store_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_specific_customer`
--

DROP TABLE IF EXISTS `get_specific_customer`;
/*!50001 DROP VIEW IF EXISTS `get_specific_customer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_specific_customer` AS SELECT 
 1 AS `id`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `email`,
 1 AS `phone_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_specific_menu`
--

DROP TABLE IF EXISTS `get_specific_menu`;
/*!50001 DROP VIEW IF EXISTS `get_specific_menu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_specific_menu` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `price`,
 1 AS `menu_id`,
 1 AS `store_id`,
 1 AS `menu_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `id` int NOT NULL,
  `Store_id` int NOT NULL,
  PRIMARY KEY (`id`,`Store_id`),
  KEY `fk_Menu_Store1_idx` (`Store_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_Menu_Store1` FOREIGN KEY (`Store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('2023-12-21 12:05:54',NULL,'Christmas Menu','This is our Christmas menu for 2023',1,1),('2023-12-21 12:05:54',NULL,'Easter Menu','This is our Easter menu for 2023',2,2),('2023-12-21 12:05:54',NULL,'Casual Menu','Our casual options',3,3),('2023-12-21 12:05:54',NULL,'Exceptional Menu','Our special menu',4,4),('2023-12-21 12:05:54',NULL,'Christmas Menu','This is our Christmas menu for 2023',5,5),('2023-12-21 12:05:54',NULL,'Anniversary Menu','The menu for our 10 years anniversary',6,6),('2023-12-21 12:05:54',NULL,'Christmas Menu','This is our Christmas menu for the new year',7,1),('2023-12-21 12:05:54',NULL,'Anniversary Menu','The menu for our 5 years anniversary',8,2),('2023-12-21 12:05:54',NULL,'Clasic Menu','This is our clasic menu',9,3),('2023-12-21 12:05:54',NULL,'Clasic Menu','This is our clasic menu',10,4);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` float(5,2) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `Menu_id` int NOT NULL,
  `Menu_Store_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Menu_Item_Menu1_idx` (`Menu_id`,`Menu_Store_id`),
  CONSTRAINT `fk_Menu_Item_Menu1` FOREIGN KEY (`Menu_id`, `Menu_Store_id`) REFERENCES `menu` (`id`, `Store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES (1,'Classic Cheeseburger','Beef patty with American cheese, lettuce, and tomato',8.99,'2023-12-21 12:09:34',NULL,1,1),(2,'Vegetarian Supreme Pizza','Assorted vegetables with cheese on a thin crust',12.99,'2023-12-21 12:14:48',NULL,2,2),(3,'Double Espresso','Two shots of strong black coffee',2.99,'2023-12-21 12:14:48',NULL,3,3),(4,'Chicken Alfredo Fettuccine','Grilled chicken with creamy Alfredo sauce on fettuccine pasta',14.99,'2023-12-21 12:14:48',NULL,4,4),(5,'Tropical Mango Smoothie','Blended mango with yogurt and ice',5.99,'2023-12-21 12:14:48',NULL,5,5),(6,'Caesar Salad with Grilled Chicken','Grilled chicken with romaine lettuce and Caesar dressing',10.99,'2023-12-21 12:14:48',NULL,6,6),(7,'Pepperoni Pizza','Classic pepperoni with mozzarella on a traditional crust',11.99,'2023-12-21 12:14:48',NULL,7,1),(8,'Iced Caramel Macchiato','Espresso with caramel and milk over ice',4.99,'2023-12-21 12:14:48',NULL,8,2),(9,'Spicy Tuna Sushi Roll','Fresh tuna with spicy mayo and avocado in a sushi roll',9.99,'2023-12-21 12:14:48',NULL,9,3),(10,'Chocolate Fudge Brownie Sundae','Warm chocolate brownie topped with vanilla ice cream',7.99,'2023-12-21 12:14:48',NULL,10,4),(11,'BBQ Chicken Wings','Crispy chicken wings with barbecue sauce',8.49,'2023-12-21 12:19:32',NULL,1,1),(12,'Margherita Flatbread','Tomato, mozzarella, and basil on a flatbread',10.99,'2023-12-21 12:19:32',NULL,2,2),(13,'Cappuccino','Espresso with steamed milk and foam',3.49,'2023-12-21 12:19:32',NULL,3,3),(14,'Shrimp Scampi Pasta','Sauteed shrimp with garlic, butter, and white wine sauce',16.99,'2023-12-21 12:19:32',NULL,4,4),(15,'Berry Blast Smoothie','Mixed berries blended with yogurt and ice',6.49,'2023-12-21 12:19:32',NULL,5,5),(16,'Greek Salad','Feta cheese, olives, and fresh vegetables with Greek dressing',9.99,'2023-12-21 12:19:32',NULL,6,6),(17,'Four Cheese Pizza','Mozzarella, cheddar, feta, and parmesan on a traditional crust',12.99,'2023-12-21 12:19:32',NULL,7,1),(18,'Iced Mocha','Espresso with chocolate and milk over ice',5.49,'2023-12-21 12:19:32',NULL,8,2),(19,'Dragon Roll','Shrimp tempura, avocado, and eel sauce in a sushi roll',11.49,'2023-12-21 12:19:32',NULL,9,3),(20,'Strawberry Cheesecake','Creamy cheesecake with strawberry topping',8.99,'2023-12-21 12:19:32',NULL,10,4);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `notification_type` enum('info','warning','verification') DEFAULT NULL,
  `Reservation_Customer_id` int NOT NULL,
  `Reservation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Notification_Reservation1_idx` (`Reservation_Customer_id`,`Reservation_id`),
  CONSTRAINT `fk_Notification_Reservation1` FOREIGN KEY (`Reservation_Customer_id`, `Reservation_id`) REFERENCES `reservation` (`Customer_id`, `id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'2023-12-21 16:37:58',NULL,'info',1,1),(2,'2023-12-21 16:37:58',NULL,'verification',2,2),(3,'2023-12-21 16:37:58',NULL,'warning',3,3),(4,'2023-12-21 16:37:58',NULL,'verification',3,4),(5,'2023-12-21 16:37:58',NULL,'info',4,5),(6,'2023-12-21 16:37:58',NULL,'info',5,6),(7,'2023-12-21 16:37:58',NULL,'verification',6,7),(8,'2023-12-21 16:37:58',NULL,'warning',6,8),(9,'2023-12-21 16:37:58',NULL,'warning',4,9),(10,'2023-12-21 16:37:58',NULL,'verification',5,10);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `date` date NOT NULL,
  `number_of_people` tinyint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `Customer_id` int NOT NULL,
  `time_slot` enum('00:00','00:15','00:30','00:45','01:00','01:15','01:30','01:45','02:00','02:15','02:30','02:45','03:00','03:15','03:30','03:45','04:00','04:15','04:30','04:45','05:00','05:15','05:30','05:45','06:00','06:15','06:30','06:45','07:00','07:15','07:30','07:45','08:00','08:15','08:30','08:45','09:00','09:15','09:30','09:45','10:00','10:15','10:30','10:45','11:00','11:15','11:30','11:45','12:00','12:15','12:30','12:45','13:00','13:15','13:30','13:45','14:00','14:15','14:30','14:45','15:00','15:15','15:30','15:45','16:00','16:15','16:30','16:45','17:00','17:15','17:30','17:45','18:00','18:15','18:30','18:45','19:00','19:15','19:30','19:45','20:00','20:15','20:30','20:45','21:00','21:15','21:30','21:45','22:00','22:15','22:30','22:45','23:00','23:15','23:30','23:45') DEFAULT NULL,
  `Table_id` int NOT NULL,
  `Table_Store_id` int NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`Customer_id`,`id`),
  KEY `fk_Reservation_Customer1_idx` (`Customer_id`),
  KEY `fk_Reservation_Table1_idx` (`Table_id`,`Table_Store_id`),
  CONSTRAINT `fk_Reservation_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_Reservation_Table1` FOREIGN KEY (`Table_id`, `Table_Store_id`) REFERENCES `table` (`id`, `Store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('2023-12-22',2,'2023-12-21 12:28:43',NULL,'',1,'18:00',1,1,1),('2023-12-23',4,'2023-12-21 14:26:09',NULL,'',2,'22:00',2,2,2),('2023-12-24',6,'2023-12-21 14:26:09',NULL,'',3,'14:00',5,2,3),('2024-01-10',2,'2023-12-21 16:30:25',NULL,NULL,3,'17:00',9,5,4),('2023-12-25',4,'2023-12-21 14:26:09',NULL,'',4,'21:30',7,3,5),('2024-01-20',4,'2023-12-21 16:35:54',NULL,NULL,4,'20:00',8,4,9),('2023-12-26',8,'2023-12-21 14:26:09',NULL,'',5,'15:00',13,1,6),('2024-01-25',8,'2023-12-21 16:35:54',NULL,'Its my son\'s birthday',5,'20:00',12,6,10),('2024-01-05',6,'2023-12-21 16:29:36',NULL,NULL,6,'21:00',11,6,7),('2024-01-03',4,'2023-12-21 16:35:54',NULL,'We will be late by 5 min',6,'19:00',8,4,8);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` char(14) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `password` varchar(45) NOT NULL,
  `store_type` enum('restaurant','cafe','bar') DEFAULT NULL,
  `address` char(20) DEFAULT NULL,
  `ZIP` char(5) DEFAULT NULL,
  `city` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phoneNumber_UNIQUE` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Thermaikos Garden','Thermaikosgarden@gmail.com','+302310587945','2023-12-21 09:40:48',NULL,_binary '','password','restaurant','Nikiforou Foka 2','54621','Thessaloniki'),(2,'TastyGrill','info@tastygrill.com','+301234567890','2023-12-21 09:45:40',NULL,_binary '','grill123','restaurant','123 Main St','54321','Thessaloniki'),(3,'CheersBar','info@cheersbar.com','+309876543210','2023-12-21 09:47:46',NULL,_binary '\0','cheers123','bar','456 Pub Ave','98765','Thessaloniki'),(4,'CafeAroma','info@cafearoma.com','+305551234567','2023-12-21 09:47:46',NULL,_binary '','aroma456','cafe','789 Aroma Blvd','65432','Thessaloniki'),(5,'MediterraneanFlavors','info@medflavors.com','+302223334444','2023-12-21 09:47:46',NULL,_binary '\0','med123','restaurant','567 Med St','23456','Thessaloniki'),(6,'GreenTeaCafe','info@greenteacafe.com','+309998887777','2023-12-21 09:47:46',NULL,_binary '\0','greentea456','cafe','890 Tea Lane','87654','Thessaloniki');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table`
--

DROP TABLE IF EXISTS `table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `capacity` tinyint NOT NULL,
  `status` enum('available','occupied') DEFAULT NULL,
  `Store_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`Store_id`),
  KEY `fk_Table_Store1_idx` (`Store_id`),
  CONSTRAINT `fk_Table_Store1` FOREIGN KEY (`Store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table`
--

LOCK TABLES `table` WRITE;
/*!40000 ALTER TABLE `table` DISABLE KEYS */;
INSERT INTO `table` VALUES (1,2,'available',1,'2023-12-21 09:49:30',NULL),(2,4,'available',2,'2023-12-21 09:52:14',NULL),(3,4,'occupied',2,'2023-12-21 09:52:14',NULL),(4,2,'occupied',2,'2023-12-21 09:52:14',NULL),(5,6,'available',2,'2023-12-21 09:52:14',NULL),(6,6,'occupied',3,'2023-12-21 09:52:14',NULL),(7,4,'available',3,'2023-12-21 09:52:14',NULL),(8,4,'available',4,'2023-12-21 09:52:14',NULL),(9,2,'occupied',5,'2023-12-21 09:52:14',NULL),(10,4,'available',5,'2023-12-21 09:52:14',NULL),(11,6,'available',6,'2023-12-21 09:52:14',NULL),(12,8,'occupied',6,'2023-12-21 09:52:14',NULL),(13,8,'available',1,'2023-12-21 09:52:14',NULL),(14,4,'available',4,'2023-12-21 09:52:40',NULL),(15,4,'available',6,'2023-12-21 09:52:40',NULL);
/*!40000 ALTER TABLE `table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waits`
--

DROP TABLE IF EXISTS `waits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waits` (
  `Customer_id` int NOT NULL,
  `Store_id` int NOT NULL,
  `time_slot` enum('00:00','00:15','00:30','00:45','01:00','01:15','01:30','01:45','02:00','02:15','02:30','02:45','03:00','03:15','03:30','03:45','04:00','04:15','04:30','04:45','05:00','05:15','05:30','05:45','06:00','06:15','06:30','06:45','07:00','07:15','07:30','07:45','08:00','08:15','08:30','08:45','09:00','09:15','09:30','09:45','10:00','10:15','10:30','10:45','11:00','11:15','11:30','11:45','12:00','12:15','12:30','12:45','13:00','13:15','13:30','13:45','14:00','14:15','14:30','14:45','15:00','15:15','15:30','15:45','16:00','16:15','16:30','16:45','17:00','17:15','17:30','17:45','18:00','18:15','18:30','18:45','19:00','19:15','19:30','19:45','20:00','20:15','20:30','20:45','21:00','21:15','21:30','21:45','22:00','22:15','22:30','22:45','23:00','23:15','23:30','23:45') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`Customer_id`,`Store_id`),
  KEY `fk_Customer_has_Store_Store3_idx` (`Store_id`),
  KEY `fk_Customer_has_Store_Customer3_idx` (`Customer_id`),
  CONSTRAINT `fk_Customer_has_Store_Customer3` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_Customer_has_Store_Store3` FOREIGN KEY (`Store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waits`
--

LOCK TABLES `waits` WRITE;
/*!40000 ALTER TABLE `waits` DISABLE KEYS */;
INSERT INTO `waits` VALUES (8,1,'18:00','2023-12-26','2023-12-21 12:25:10',NULL),(9,3,'19:00','2023-12-28','2023-12-21 12:25:10',NULL),(10,5,'22:00','2023-12-30','2023-12-21 12:25:10',NULL);
/*!40000 ALTER TABLE `waits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `get_all_stores`
--

/*!50001 DROP VIEW IF EXISTS `get_all_stores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_all_stores` AS select `store`.`name` AS `name`,`store`.`email` AS `email`,`store`.`phone_number` AS `phone_number`,`store`.`address` AS `address`,`store`.`ZIP` AS `ZIP`,`store`.`city` AS `city` from `store` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_customer_reservations`
--

/*!50001 DROP VIEW IF EXISTS `get_customer_reservations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_customer_reservations` AS select `customer`.`id` AS `customer_id`,`reservation`.`number_of_people` AS `number_of_people`,`reservation`.`date` AS `date`,`reservation`.`time_slot` AS `time_slot`,`reservation`.`comment` AS `comment`,`table`.`id` AS `table_id`,`table`.`Store_id` AS `store_id`,`store`.`name` AS `store_name` from (((`reservation` join `customer` on((`customer`.`id` = `reservation`.`Customer_id`))) join `table` on((`table`.`id` = `reservation`.`Table_id`))) join `store` on((`store`.`id` = `table`.`Store_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_evaluates`
--

/*!50001 DROP VIEW IF EXISTS `get_evaluates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_evaluates` AS select `store`.`id` AS `store_id`,`store`.`name` AS `name`,`evaluates`.`number_of_stars` AS `number_of_stars`,`evaluates`.`comment` AS `comment`,`customer`.`firstname` AS `firstname`,`customer`.`lastname` AS `lastname` from ((`evaluates` join `store` on((`store`.`id` = `evaluates`.`Store_id`))) join `customer` on((`customer`.`id` = `evaluates`.`Customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_reservations_of_store`
--

/*!50001 DROP VIEW IF EXISTS `get_reservations_of_store`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_reservations_of_store` AS select `customer`.`firstname` AS `firstname`,`customer`.`lastname` AS `lastname`,`customer`.`phone_number` AS `phone_number`,`reservation`.`number_of_people` AS `number_of_people`,`reservation`.`date` AS `date`,`reservation`.`time_slot` AS `time_slot`,`reservation`.`comment` AS `comment`,`table`.`id` AS `table_id`,`table`.`Store_id` AS `store_id` from ((`reservation` join `customer` on((`customer`.`id` = `reservation`.`Customer_id`))) join `table` on((`table`.`id` = `reservation`.`Table_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_specific_customer`
--

/*!50001 DROP VIEW IF EXISTS `get_specific_customer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_specific_customer` AS select `customer`.`id` AS `id`,`customer`.`firstname` AS `firstname`,`customer`.`lastname` AS `lastname`,`customer`.`email` AS `email`,`customer`.`phone_number` AS `phone_number` from `customer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_specific_menu`
--

/*!50001 DROP VIEW IF EXISTS `get_specific_menu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_specific_menu` AS select `menu_item`.`id` AS `id`,`menu_item`.`name` AS `name`,`menu_item`.`description` AS `description`,`menu_item`.`price` AS `price`,`menu_item`.`Menu_id` AS `menu_id`,`menu_item`.`Menu_Store_id` AS `store_id`,`menu`.`name` AS `menu_name` from (`menu_item` join `menu` on((`menu`.`id` = `menu_item`.`Menu_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-22 22:09:38
