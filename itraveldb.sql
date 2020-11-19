CREATE DATABASE  IF NOT EXISTS `itraveldb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `itraveldb`;
-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: itraveldb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street1` varchar(225) DEFAULT '',
  `street2` varchar(225) DEFAULT '',
  `zip` varchar(10) NOT NULL,
  `latitude` double DEFAULT '0',
  `longitude` double DEFAULT '0',
  `City_id` int NOT NULL,
  PRIMARY KEY (`id`,`City_id`),
  KEY `fk_Address_City1_idx` (`City_id`),
  CONSTRAINT `fk_Address_City1` FOREIGN KEY (`City_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'9th Street','','94103',0,0,8),(2,'Berwyn Ave','','60018',0,0,26),(3,'Ridge Square','','60007',0,0,26),(4,'22nd Street','','50211',0,0,28),(5,'1000 North Fourth St  (MR#82)','MR#82','52557',0,0,32),(12,'1000 North Fourth St  (MR#82)','','52557',0,0,32),(13,'1000 North Fourth St  (MR#82)','','52557',0,0,32),(14,'1000 North Fourth St  (MR#82)','','52557',0,0,32),(15,'1000 North Fourth St  (MR#82)','','52557',0,0,32),(16,'1000 North Fourth St  (MR#82)','','52557',0,0,32),(17,'1000 North Fourth St  (MR#82)','','52557',0,0,32);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `adminname` varchar(20) NOT NULL,
  `Person_id` int NOT NULL,
  PRIMARY KEY (`id`,`Person_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `adminname_UNIQUE` (`adminname`),
  KEY `fk_Admin_Person1_idx` (`Person_id`),
  CONSTRAINT `fk_Admin_Person1` FOREIGN KEY (`Person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'john@admin.itravel.com','*6B4F89A54E2D27ECD7E8DA05B4AB8FD9D1D8B119','adminjohn',1),(2,'robert@admin.itravel.com','*6B4F89A54E2D27ECD7E8DA05B4AB8FD9D1D8B119','adminrobert',4);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `shortname` varchar(20) DEFAULT NULL,
  `State_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`,`State_id`),
  KEY `fk_City_State1_idx` (`State_id`),
  CONSTRAINT `fk_City_State1` FOREIGN KEY (`State_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Montgomery','Montgomery','AL'),(2,'Juneau','Juneau','AK'),(3,'Anchorage','Anchorage','AK'),(4,'Phoenix','Phoenix','AZ'),(5,'Little Rock','Little Rock','AR'),(6,'Sacramento','Sacramento','CA'),(7,'Los Angeles','LA','CA'),(8,'San Francisco','San Francisco','CA'),(9,'Raleigh','Raleigh','NC'),(10,'Charlotte','Charlotte','NC'),(11,'Columbia','Columbia','SC'),(12,'Denver','Denver','CO'),(13,'Hartford','Hartford','CT'),(14,'Bridgeport','Bridgeport','CT'),(15,'Bismark','Bismark','ND'),(16,'Pierre','Pierre','SD'),(17,'Dover','Dover','DE'),(18,'Wilmington','Wilmington','DE'),(19,'Tallahassee','Tallahassee','FL'),(20,'Miami','MIA','FL'),(21,'Orlando','Orlando','FL'),(22,'Atlanta','ATL','GA'),(23,'Honolulu','Honolulu','HI'),(24,'Boise','Boise','ID'),(25,'Springfield','Springfield','IL'),(26,'Chicago','Chicago','IL'),(27,'Indianapolis','Indianapolis','IN'),(28,'Des Moines','Des Moines','IA'),(29,'Cedar Rapids','Cedar Rapids','IA'),(30,'Iowa City','Iowa City','IA'),(31,'Ottumwa','Ottumwa','IA'),(32,'Fairfield','Fairfield','IA'),(33,'Topeka','Topeka','KS'),(34,'Wichita','Wichita','KS'),(35,'Frankfort','Frankfort','KY'),(36,'Louisville','Louisville','KY'),(37,'Baton Rouge','Baton Rouge','LA'),(38,'New Orleans','New Orleans','LA'),(39,'Augusta','Augusta','ME'),(40,'Annapolis','Annapolis','MD'),(41,'Baltimore','Baltimore','MD'),(42,'Boston','Boston','MA'),(43,'Lansing','Lansing','MI'),(44,'Detroit','Detroit','MI'),(45,'Saint Paul','Saint Paul','MN'),(46,'Minneapolis','Minneapolis','MN'),(47,'Jackson','Jackson','MS'),(48,'Jefferson City','Jefferson City','MO'),(49,'Kansas City','Kansas City','MO'),(50,'Helena','Helena','MT'),(51,'Lincoln','Lincoln','NE'),(52,'Omaha','Omaha','NE'),(53,'Carson City','Carson City','NV'),(54,'Las Vegas','Las Vegas','NV'),(55,'Trenton','Trenton','NJ'),(56,'Newark','Newark','NJ'),(57,'Albany','Albany','NY'),(58,'New York','NYC','NY'),(59,'Concord','Concord','NH'),(60,'Santa Fe','Santa Fe','NM'),(61,'Albuquerque','Albuquerque','NM'),(62,'Columbus','Columbus','OH'),(63,'Oklahoma City','Oklahoma City','OK'),(64,'Salem','Salem','OR'),(65,'Portland','Portland','OR'),(66,'Harrisburg','Harrisburg','PA'),(67,'Filadelfia','Filadelfia','PA'),(68,'Pittsburgh','Pittsburgh','PA'),(69,'Providence','Providence','RI'),(70,'Nashville','Nashville','TN'),(71,'Memphis','Memphis','TN'),(72,'Austin','Austin','TX'),(73,'Houston','Houston','TX'),(74,'Dallas','Dallas','TX'),(75,'Salt Lake City','Salt Lake City','UT'),(76,'Montpelier','Montpelier','VT'),(77,'Burlington','Burlington','VT'),(78,'Richmond','Richmond','VA'),(79,'Charleston','Charleston','WV'),(80,'Olympia','Olympia','WA'),(81,'Seattle','Seattle','WA'),(82,'Madison','Madison','WI'),(83,'Milwaukee','Milwaukee','WI'),(84,'Cheyenne','Cheyenne','WY'),(85,'Washington DC','Washington DC','DC');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `Post_id` int NOT NULL,
  `Actor_id` int NOT NULL,
  PRIMARY KEY (`id`,`Post_id`,`Actor_id`),
  KEY `fk_Comment_Post1_idx` (`Post_id`),
  KEY `fk_Comment_Actor_idx` (`Actor_id`),
  CONSTRAINT `fk_Comment_Actor` FOREIGN KEY (`Actor_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_Comment_Post1` FOREIGN KEY (`Post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Wow amazing View',1,1),(3,'Not a nice View',1,3),(4,'Where are you going?',1,4),(9,' I want to bring my family too',3,6),(10,'Alone ?',4,6),(11,'With Your Wife ?',5,6),(12,'Alone or there is anyone?',6,4),(13,'With Your Girl friend ?',7,2),(14,'ok breakfast',1,2),(16,'hello',17,2),(17,'hello',17,2),(18,'',23,2),(19,'hello',10,1),(21,'hello',5,2),(22,'hello\n',5,2),(23,'amaing',1,9),(27,'hello',10,1),(28,'hello',10,2),(29,'Hello',3,4),(30,'my own comment\n',8,4);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filterwords`
--

DROP TABLE IF EXISTS `filterwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filterwords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `theWord` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filterwords`
--

LOCK TABLES `filterwords` WRITE;
/*!40000 ALTER TABLE `filterwords` DISABLE KEYS */;
INSERT INTO `filterwords` VALUES (3,'spartan123'),(4,'ganzo'),(5,'party'),(6,'alcohol'),(7,'whiskey'),(8,'smoke'),(9,'aloha'),(10,'HelloWorld'),(11,'sumo'),(13,'dota2020'),(15,'microsoft'),(16,'mirror'),(17,'AMD'),(18,'unicorn');
/*!40000 ALTER TABLE `filterwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follower`
--

DROP TABLE IF EXISTS `follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follower` (
  `User_id` int NOT NULL,
  `Follower1_id` int NOT NULL,
  PRIMARY KEY (`User_id`,`Follower1_id`),
  KEY `fk_Follower_User_idx` (`User_id`),
  KEY `fk_Follower_Follower1_idx` (`Follower1_id`),
  CONSTRAINT `fk_Follower_Follower1` FOREIGN KEY (`Follower1_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_Follower_User` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follower`
--

LOCK TABLES `follower` WRITE;
/*!40000 ALTER TABLE `follower` DISABLE KEYS */;
INSERT INTO `follower` VALUES (1,2),(1,3),(1,4),(1,5),(1,14),(2,1),(2,3),(2,4),(2,5),(3,1),(3,4),(4,1),(4,2),(4,3),(4,5),(4,6),(4,7),(5,1),(5,2),(5,8),(5,14),(6,4),(6,7),(6,8),(7,2),(7,3),(7,6),(8,4),(8,5),(8,6),(9,4);
/*!40000 ALTER TABLE `follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `link` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'post','images/post/post-1.jpg'),(3,'post','images/post/post-3.jpg'),(4,'post','images/post/post-4.jpg'),(5,'post','images/post/post-5.jpg'),(6,'post','images/post/post-6.jpg'),(7,'post','images/post/post-7.jpg'),(8,'post','images/post/post-1.jpg'),(9,'post','images/post/post-2.jpg'),(10,'post','images/post/post-3.jpg'),(11,'post','images/post/post-4.jpg'),(12,'post','images/post/post-5.jpg'),(13,'post','images/post/post-6.jpg'),(14,'post','images/post/post-7.jpg'),(15,'post','images/post/post-1.jpg'),(16,'post','images/post/post-2.jpg'),(17,'post','images/post/post-3.jpg'),(18,'post','images/post/post-4.jpg'),(19,'post','images/post/post-5.jpg'),(20,'post','images/post/post-6.jpg'),(21,'post','images/post/post-7.jpg'),(22,'post','images/post/post-1.jpg'),(23,'post','images/post/post-2.jpg'),(24,'post','images/post/post-3.jpg'),(25,'post','images/post/post-4.jpg'),(26,'post','images/post/post-5.jpg'),(29,'post','images/post/post-1.jpg'),(30,'post','images/post/post-2.jpg'),(31,'post','images/post/post-3.jpg'),(32,'post','images/post/post-4.jpg'),(33,'post','images/post/post-5.jpg'),(34,'post','images/post/post-6.jpg'),(35,'post','images/post/post-7.jpg'),(36,'u6_l','images/profile/profile-1.jpg'),(37,'u6_m','images/profile/profile-midle-1.jpg'),(38,'u2_m','images/profile/profile-midle-2.jpg'),(39,'u3_s','images/profile/profile-small-4.jpg'),(40,'u1','images/profile/profile-small-2.jpg'),(41,'u4','images/profile/profile-small-8.jpg'),(42,'u5','images/profile/profile-small-10.jpg'),(43,'u7','images/profile/profile-small-13.jpg'),(44,'u8','images/profile/profile-small-15.jpg'),(45,'banner','images/banner/profile-banner.jpg'),(46,'banner_small','images/banner/banner-small.jpg'),(47,'default_male_l','images/profile/default-male-large.jpg'),(48,'default_male_m','images/profile/default-male-medium.jpg'),(49,'default_male_s','images/profile/default-male-small.jpg'),(50,'default_female_l','images/profile/default-female-large.jpg'),(51,'default_female_m','images/profile/default-female-medium.jpg'),(52,'default_female_s','images/profile/default-female-small.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT '',
  `lname` varchar(50) DEFAULT '',
  `gender` varchar(1) NOT NULL,
  `dateBirth` date NOT NULL,
  `cityBirth` varchar(50) DEFAULT '',
  `job` varchar(80) DEFAULT '',
  `Address_id` int NOT NULL,
  PRIMARY KEY (`id`,`Address_id`),
  KEY `fk_Person_Address1_idx` (`Address_id`),
  CONSTRAINT `fk_Person_Address1` FOREIGN KEY (`Address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'John','','Smith','M','1970-06-02','Dallas, TX','Engineer',1),(2,'Mary','','Sandler','F','1988-11-20','Des Moines, IA','Teacher',2),(3,'Jane','','Green','F','1991-08-23','Los Angeles, CA','Teacher',3),(4,'Robert','','Redford','M','1986-08-24','Des Moines, IA','Doctor',4),(5,'Will','','Smith','M','1990-12-22','Pittsburgh, PA','Engineer',5),(6,'Sandi','','Grey','F','1998-07-13','Albany, NY','Engineer',5),(7,'Chris','','Pratt','M','1989-09-03','Sacramento, CA','Teacher',5),(8,'Amy','','Schneider','F','1993-10-14','Atlanta, GA','Doctor',5),(15,'Mohan ','','Lar','M','1950-01-30','','',12),(16,'Mohan','','Lar','M','1944-06-13','','',13),(17,'Welcom','','Welco','M','1983-03-02','','',14),(18,'Welcom','','Pedro','M','1944-06-13','','',15),(19,'Tina','','Xing','M','1984-06-05','','',16),(20,'Random','','User','M','1995-11-25','','',17);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `description` longtext,
  `departureAddress` varchar(225) DEFAULT NULL,
  `destinationAddress` varchar(225) DEFAULT NULL,
  `unhealthy` tinyint(1) DEFAULT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  `User_id` int NOT NULL,
  PRIMARY KEY (`id`,`User_id`),
  KEY `fk_Post_User1_idx` (`User_id`),
  CONSTRAINT `fk_Post_User1` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','FL,United States','Fairfield,IA,United States',0,0,1),(3,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for','FL,United States','Fairfield,IA,United States',0,1,3),(4,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised ','FL,United States','Fairfield,IA,United States',0,1,1),(5,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','FL,United States','Fairfield,IA,United States',0,1,2),(6,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','IN,United States','AZ,United States',0,1,4),(7,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly','ID,United States','AL,United States',0,1,1),(8,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','IL,United States','CA,United States',0,1,2),(9,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy','CO,United States','Fairfield,IA,United States',0,1,3),(10,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','FL,United States','CO,United States',0,1,6),(11,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy','KS,United States','Fairfield,IA,United States',0,1,5),(12,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','IN,United States','AZ,United States',0,1,4),(13,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','IN,United States','AZ,United States',0,1,4),(14,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly','ID,United States','AL,United States',0,1,1),(15,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','IL,United States','CA,United States',0,1,2),(16,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy','CO,United States','Fairfield,IA,United States',0,1,3),(17,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','FL,United States','CO,United States',0,1,6),(18,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy','KS,United States','Fairfield,IA,United States',0,1,5),(19,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy','KS,United States','Fairfield,IA,United States',0,1,5),(20,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly','ID,United States','AL,United States',0,1,1),(21,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','IL,United States','CA,United States',0,1,2),(22,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy','CO,United States','Fairfield,IA,United States',0,1,3),(23,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','FL,United States','CO,United States',0,1,6),(24,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy','KS,United States','Fairfield,IA,United States',0,1,5),(25,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','IN,United States','AZ,United States',0,1,4),(26,'Thu Nov 12 10:33:52 CST 2020',41.0230709,41.0230709,'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.','IN,United States','AZ,United States',0,1,4);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_image`
--

DROP TABLE IF EXISTS `post_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_image` (
  `Post_id` int NOT NULL,
  `Image_id` int NOT NULL,
  PRIMARY KEY (`Post_id`,`Image_id`),
  KEY `fk_Post_Image_Image1_idx` (`Image_id`),
  KEY `fk_Post_Image_Post1_idx` (`Post_id`),
  CONSTRAINT `fk_Post_Image_Image1` FOREIGN KEY (`Image_id`) REFERENCES `image` (`id`),
  CONSTRAINT `fk_Post_Image_Post1` FOREIGN KEY (`Post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_image`
--

LOCK TABLES `post_image` WRITE;
/*!40000 ALTER TABLE `post_image` DISABLE KEYS */;
INSERT INTO `post_image` VALUES (5,1),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(5,29),(5,30),(4,31),(6,32),(6,33),(7,34),(7,35);
/*!40000 ALTER TABLE `post_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_reaction`
--

DROP TABLE IF EXISTS `post_reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_reaction` (
  `Post_id` int NOT NULL,
  `Reaction_id` int NOT NULL,
  `Actor_id` int NOT NULL,
  PRIMARY KEY (`Post_id`,`Reaction_id`,`Actor_id`),
  KEY `fk_Post_Reaction_Reaction1_idx` (`Reaction_id`),
  KEY `fk_Post_Reaction_Post1_idx` (`Post_id`),
  KEY `fk_Post_Reaction_Actor_idx` (`Actor_id`),
  CONSTRAINT `fk_Post_Reaction_Actor` FOREIGN KEY (`Actor_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_Post_Reaction_Post1` FOREIGN KEY (`Post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `fk_Post_Reaction_Reaction1` FOREIGN KEY (`Reaction_id`) REFERENCES `reaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_reaction`
--

LOCK TABLES `post_reaction` WRITE;
/*!40000 ALTER TABLE `post_reaction` DISABLE KEYS */;
INSERT INTO `post_reaction` VALUES (1,1,1),(1,1,3),(1,1,4),(1,1,14),(3,1,1),(3,1,2),(3,1,3),(3,1,5),(3,1,6),(4,1,1),(4,1,5),(4,1,6),(4,1,7),(5,1,2),(5,1,5),(5,1,6),(5,1,7),(5,1,8),(6,1,8),(7,1,8),(8,1,1),(8,1,2),(8,1,3),(8,1,4),(9,1,1),(9,1,3),(10,1,2),(10,1,3),(10,1,4),(10,1,5),(10,1,6),(10,1,7),(11,1,8),(17,1,2),(18,1,2),(21,1,2),(23,1,4),(26,1,2);
/*!40000 ALTER TABLE `post_reaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `profilenopics`
--

DROP TABLE IF EXISTS `profilenopics`;
/*!50001 DROP VIEW IF EXISTS `profilenopics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `profilenopics` AS SELECT 
 1 AS `id`,
 1 AS `email`,
 1 AS `password`,
 1 AS `biography`,
 1 AS `Person_id`,
 1 AS `fname`,
 1 AS `mname`,
 1 AS `lname`,
 1 AS `gender`,
 1 AS `dateBirth`,
 1 AS `cityBirth`,
 1 AS `job`,
 1 AS `Address_id`,
 1 AS `street1`,
 1 AS `street2`,
 1 AS `zip`,
 1 AS `city`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reaction`
--

DROP TABLE IF EXISTS `reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reaction`
--

LOCK TABLES `reaction` WRITE;
/*!40000 ALTER TABLE `reaction` DISABLE KEYS */;
INSERT INTO `reaction` VALUES (1,'like'),(2,'dislike'),(3,'fav');
/*!40000 ALTER TABLE `reaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id` varchar(2) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES ('AK','Alaska'),('AL','Alabama'),('AR','Arkansas'),('AZ','Arizona'),('CA','California'),('CO','Colorado'),('CT','Connecticut'),('DC','District of Columbia'),('DE','Delaware'),('FL','Florida'),('GA','Georgia'),('HI','Hawaii'),('IA','Iowa'),('ID','Idaho'),('IL','Illinois'),('IN','Indiana'),('KS','Kansas'),('KY','Kentucky'),('LA','Louisiana'),('MA','Massachusetts'),('MD','Maryland'),('ME','Maine'),('MI','Michigan'),('MN','Minnesota'),('MO','Missouri'),('MS','Mississippi'),('MT','Montana'),('NC','North Carolina'),('ND','North Dakota'),('NE','Nebraska'),('NH','New Hampshire'),('NJ','New Jersey'),('NM','New Mexico'),('NV','Nevada'),('NY','New York'),('OH','Ohio'),('OK','Oklahoma'),('OR','Oregon'),('PA','Pennsylvania'),('RI','Rhode Island'),('SC','South Carolina'),('SD','South Dakota'),('TN','Tennessee'),('TX','Texas'),('UT','Utah'),('VA','Virginia'),('VT','Vermont'),('WA','Washington'),('WI','Wisconsin'),('WV','West Virginia'),('WY','Wyoming');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Mary','Public','mary@luv2code.com'),(2,'John','Doe','john@luv2code.com'),(3,'Ajay','Rao','ajay@luv2code.com'),(4,'Bill','Neely','bill@luv2code.com'),(5,'Maxwell','Dixon','max@luv2code.com');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `Biography` mediumtext,
  `isDeactivated` tinyint(1) NOT NULL,
  `Person_id` int NOT NULL,
  PRIMARY KEY (`id`,`Person_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_User_Person1_idx` (`Person_id`),
  CONSTRAINT `fk_User_Person1` FOREIGN KEY (`Person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mary@example.com','61BD60C60D9FB60CC8FC7767669D40A1','empty biography',0,2),(2,'jane@example.com','61BD60C60D9FB60CC8FC7767669D40A1','empty biography',0,3),(3,'will@example.com','61BD60C60D9FB60CC8FC7767669D40A1','empty biography',0,5),(4,'sandy@example.comm','61BD60C60D9FB60CC8FC7767669D40A1','empty biography',0,6),(5,'chris@example.com','61BD60C60D9FB60CC8FC7767669D40A1','empty biography',0,7),(6,'amy@example.com','61BD60C60D9FB60CC8FC7767669D40A1','empty biography',0,8),(7,'robot@example.com','61BD60C60D9FB60CC8FC7767669D40A1','empty biography',0,4),(8,'john@example.com','61BD60C60D9FB60CC8FC7767669D40A1','empty biography',0,1),(9,'mohan.lar96@gmail.com','61BD60C60D9FB60CC8FC7767669D40A1','I am very happy person .',0,15),(10,'mohan.lar996@gmail.com','61BD60C60D9FB60CC8FC7767669D40A1',NULL,0,16),(11,'welcom@example.com','61BD60C60D9FB60CC8FC7767669D40A1',NULL,0,17),(12,'welcompedro@gmail.com','61BD60C60D9FB60CC8FC7767669D40A1',NULL,0,18),(13,'tina@miu.com','61BD60C60D9FB60CC8FC7767669D40A1',NULL,0,19),(14,'random@user.com','61BD60C60D9FB60CC8FC7767669D40A1',NULL,0,20);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_image`
--

DROP TABLE IF EXISTS `user_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_image` (
  `User_id` int NOT NULL,
  `Image_id` int NOT NULL,
  `sizeimg` varchar(1) NOT NULL,
  PRIMARY KEY (`User_id`,`Image_id`,`sizeimg`),
  KEY `fk_User_Image_Image1_idx` (`Image_id`),
  KEY `fk_User_Image_User1_idx` (`User_id`),
  CONSTRAINT `fk_User_Image_Image1` FOREIGN KEY (`Image_id`) REFERENCES `image` (`id`),
  CONSTRAINT `fk_User_Image_User1` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_image`
--

LOCK TABLES `user_image` WRITE;
/*!40000 ALTER TABLE `user_image` DISABLE KEYS */;
INSERT INTO `user_image` VALUES (6,36,'L'),(6,37,'M'),(6,37,'S'),(2,38,'L'),(2,38,'M'),(2,38,'S'),(3,39,'L'),(3,39,'M'),(3,39,'S'),(1,40,'L'),(1,40,'M'),(1,40,'S'),(4,41,'L'),(4,41,'M'),(4,41,'S'),(5,42,'L'),(5,42,'M'),(5,42,'S'),(7,43,'L'),(7,43,'M'),(7,43,'S'),(8,44,'L'),(8,44,'M'),(8,44,'S'),(1,45,'B'),(2,45,'B'),(3,45,'B'),(4,45,'B'),(5,45,'B'),(6,45,'B'),(7,45,'B'),(8,45,'B'),(9,45,'B'),(10,45,'B'),(11,45,'B'),(12,45,'B'),(13,45,'B'),(14,45,'B'),(1,46,'V'),(2,46,'V'),(3,46,'V'),(4,46,'V'),(5,46,'V'),(6,46,'V'),(7,46,'V'),(8,46,'V'),(9,46,'V'),(10,46,'V'),(11,46,'V'),(12,46,'V'),(13,46,'V'),(14,46,'V'),(9,47,'L'),(10,47,'L'),(11,47,'L'),(12,47,'L'),(13,47,'L'),(14,47,'L'),(9,48,'M'),(10,48,'M'),(11,48,'M'),(12,48,'M'),(13,48,'M'),(14,48,'M'),(9,49,'S'),(10,49,'S'),(11,49,'S'),(12,49,'S'),(13,49,'S'),(14,49,'S');
/*!40000 ALTER TABLE `user_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `profilenopics`
--

/*!50001 DROP VIEW IF EXISTS `profilenopics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `profilenopics` AS select `user`.`id` AS `id`,`user`.`email` AS `email`,`user`.`password` AS `password`,`user`.`Biography` AS `biography`,`user`.`Person_id` AS `Person_id`,`person`.`fname` AS `fname`,`person`.`mname` AS `mname`,`person`.`lname` AS `lname`,`person`.`gender` AS `gender`,`person`.`dateBirth` AS `dateBirth`,`person`.`cityBirth` AS `cityBirth`,`person`.`job` AS `job`,`person`.`Address_id` AS `Address_id`,`address`.`street1` AS `street1`,`address`.`street2` AS `street2`,`address`.`zip` AS `zip`,`city`.`name` AS `city`,`state`.`name` AS `state` from ((((`user` join `person` on((`user`.`Person_id` = `person`.`id`))) join `address` on((`person`.`Address_id` = `address`.`id`))) join `city` on((`address`.`City_id` = `city`.`id`))) join `state` on((`city`.`State_id` = `state`.`id`))) */;
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

-- Dump completed on 2020-11-19  0:13:51
