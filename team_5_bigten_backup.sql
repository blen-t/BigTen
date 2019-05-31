CREATE DATABASE  IF NOT EXISTS `bigten` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bigten`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bigten
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `admissions`
--

DROP TABLE IF EXISTS `admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admissions` (
  `college_id` int(11) NOT NULL,
  `acceptance_rate` decimal(3,2) NOT NULL,
  `avg_sat_score` int(11) NOT NULL,
  `avg_act_score` int(11) NOT NULL,
  `incoming_gpa` decimal(3,2) NOT NULL,
  KEY `fk_admissions_colleges1_idx` (`college_id`),
  CONSTRAINT `fk_admissions_colleges1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admissions`
--

LOCK TABLES `admissions` WRITE;
/*!40000 ALTER TABLE `admissions` DISABLE KEYS */;
INSERT INTO `admissions` VALUES (1,0.58,1220,25,3.65),(2,0.56,1270,29,3.60),(3,0.53,1370,29,3.85),(4,0.66,1320,27,3.68),(5,0.56,1380,29,3.72),(6,0.54,1460,29,3.72),(7,0.11,1490,33,4.11),(8,0.44,1305,28,3.78),(9,0.29,1450,26,3.83),(10,0.78,1240,18,3.64),(11,0.45,1370,18,4.22),(12,0.84,1220,26,3.63),(13,0.57,1300,30,3.66),(14,0.66,1420,30,3.63);
/*!40000 ALTER TABLE `admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `avgsatscore`
--

DROP TABLE IF EXISTS `avgsatscore`;
/*!50001 DROP VIEW IF EXISTS `avgsatscore`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `avgsatscore` AS SELECT 
 1 AS `college_id`,
 1 AS `college_name`,
 1 AS `avg_sat_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `avgtuition_for_acceptance_rate`
--

DROP TABLE IF EXISTS `avgtuition_for_acceptance_rate`;
/*!50001 DROP VIEW IF EXISTS `avgtuition_for_acceptance_rate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `avgtuition_for_acceptance_rate` AS SELECT 
 1 AS `Average`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colleges` (
  `college_id` int(11) NOT NULL AUTO_INCREMENT,
  `college_name` varchar(45) NOT NULL,
  `abbreviation` varchar(5) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(2) NOT NULL,
  `mascot` varchar(25) NOT NULL,
  `setting_id` int(11) NOT NULL,
  PRIMARY KEY (`college_id`),
  KEY `fk_colleges_settings_idx` (`setting_id`),
  CONSTRAINT `fk_colleges_settings` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`setting_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES (1,'University of Nebraska','UNL','Lincoln','NE','Herbie Husker',2),(2,'Pennsylvania State University','PSU','State College','PA','Nittany Lion',3),(3,'University of Wisconsin','UW','Madison','WI','Bucky Badger',2),(4,'Michigan State University','MSU','East Lansing','MI','Sparty',1),(5,'Purdue University','PU','West Lafayette','IN','Boilermaker Special',1),(6,'Ohio State University','OSU','Columbus','OH','Brutus Buckeye',2),(7,'Northwestern University','NU','	Evanston','IL','Willie Wildcat',1),(8,'Univeristy of Minnestoa','UMN','Minneapolis ','MN','Goldy Gopher',2),(9,'University of Michigan','U-M','Ann Arbor','MI','Wolverine',2),(10,'Indiana University Bloomington','IU','Bloomington','ID','Hoosier',2),(11,'University of Maryland','UMD','College Park','MD','Testudo',1),(12,'University of Iowa','UI','Iowa City','IA','Herky the Hawk',1),(13,'Rutgers University','RU','New Brunswick','NJ','Scarlet Knight',1),(14,'University of Illinois at Urbana - Champaign','UIUC','Champaign','IL','Chief Illiniwek',2);
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_stats`
--

DROP TABLE IF EXISTS `degree_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree_stats` (
  `college_id` int(11) NOT NULL,
  `bachelors` int(11) NOT NULL,
  `masters` int(11) NOT NULL,
  `doctoral` int(11) NOT NULL,
  KEY `fk_degree_stats_colleges1_idx` (`college_id`),
  CONSTRAINT `fk_degree_stats_colleges1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_stats`
--

LOCK TABLES `degree_stats` WRITE;
/*!40000 ALTER TABLE `degree_stats` DISABLE KEYS */;
INSERT INTO `degree_stats` VALUES (1,3958,948,417),(2,11174,1411,809),(3,6922,2227,1432),(4,9298,2270,1185),(5,7045,2151,992),(6,10840,2830,1601),(7,2190,3272,565),(8,7807,3485,893),(9,7059,4442,1515),(10,7553,2690,712),(11,7308,2837,600),(12,4811,1242,922),(13,8377,2998,1322),(14,8096,4193,731);
/*!40000 ALTER TABLE `degree_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `college_id` int(11) NOT NULL,
  `avg_age` int(11) NOT NULL,
  `on_campus` decimal(3,2) NOT NULL,
  `off_campus` decimal(3,2) NOT NULL,
  `full_time` decimal(3,2) NOT NULL,
  `part_time` decimal(3,2) NOT NULL,
  KEY `fk_enrollment_colleges1_idx` (`college_id`),
  CONSTRAINT `fk_enrollment_colleges1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,20,0.39,0.61,0.93,0.07),(2,20,0.35,0.65,0.97,0.03),(3,21,0.26,0.74,0.92,0.08),(4,20,0.39,0.61,0.91,0.09),(5,20,0.41,0.59,0.94,0.06),(6,21,0.34,0.66,0.91,0.09),(7,24,0.67,0.16,0.94,0.06),(8,20,0.22,0.78,0.76,0.23),(9,20,0.33,0.67,0.97,0.03),(10,20,0.35,0.65,0.82,0.18),(11,21,0.40,0.60,0.93,0.07),(12,21,0.33,0.67,0.85,0.15),(13,21,0.53,0.47,0.94,0.06),(14,20,0.50,0.50,0.91,0.08);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `incidentcount`
--

DROP TABLE IF EXISTS `incidentcount`;
/*!50001 DROP VIEW IF EXISTS `incidentcount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `incidentcount` AS SELECT 
 1 AS `college_id`,
 1 AS `college_name`,
 1 AS `number_of_incidents`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidents` (
  `college_id` int(11) NOT NULL,
  `non_negligent_manslaughter` int(11) NOT NULL,
  `negligent_manslaughter` int(11) NOT NULL,
  `rape` int(11) NOT NULL,
  `fondling` int(11) NOT NULL,
  `incest` int(11) NOT NULL,
  `statutory_rape` int(11) NOT NULL,
  `robbery` int(11) NOT NULL,
  `aggravated_assult` int(11) NOT NULL,
  `burglary` int(11) NOT NULL,
  `motor_vehicle_theft` int(11) NOT NULL,
  `arson` int(11) NOT NULL,
  KEY `fk_incidents_colleges1_idx` (`college_id`),
  CONSTRAINT `fk_incidents_colleges1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (1,0,0,12,11,0,0,0,5,12,5,0),(2,0,0,35,16,0,0,5,15,65,0,7),(3,0,0,7,28,0,0,1,4,34,3,2),(4,0,0,17,6,0,0,9,12,73,25,0),(5,0,0,18,12,0,0,2,4,14,6,4),(6,0,0,61,22,0,0,7,16,19,12,2),(7,0,0,13,1,0,0,0,1,33,0,0),(8,0,0,10,8,0,0,4,5,26,8,0),(9,0,0,13,13,0,0,2,4,11,4,3),(10,0,0,15,9,0,0,2,1,44,10,3),(11,0,0,5,11,0,0,3,6,17,18,0),(12,0,0,20,20,0,0,0,20,30,13,4),(13,0,0,23,8,0,0,1,7,26,1,7),(14,1,0,17,4,0,0,3,3,32,4,3);
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `incidents_per_setting`
--

DROP TABLE IF EXISTS `incidents_per_setting`;
/*!50001 DROP VIEW IF EXISTS `incidents_per_setting`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `incidents_per_setting` AS SELECT 
 1 AS `setting_id`,
 1 AS `Setting`,
 1 AS `Total Incidents`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rankings`
--

DROP TABLE IF EXISTS `rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rankings` (
  `college_id` int(11) NOT NULL,
  `sport_id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `division` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`college_id`,`sport_id`),
  KEY `fk_colleges_has_sports_sports1_idx` (`sport_id`),
  KEY `fk_colleges_has_sports_colleges1_idx` (`college_id`),
  CONSTRAINT `fk_colleges_has_sports_colleges1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_colleges_has_sports_sports1` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`sport_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rankings`
--

LOCK TABLES `rankings` WRITE;
/*!40000 ALTER TABLE `rankings` DISABLE KEYS */;
INSERT INTO `rankings` VALUES (1,1,5,NULL),(1,2,5,NULL),(1,3,5,'West'),(1,4,NULL,NULL),(1,5,8,NULL),(1,6,11,NULL),(1,7,NULL,NULL),(1,8,NULL,NULL),(2,1,6,NULL),(2,2,11,NULL),(2,3,3,'East'),(2,4,7,NULL),(2,5,5,NULL),(2,6,13,NULL),(2,7,5,NULL),(2,8,4,NULL),(3,1,9,NULL),(3,2,13,NULL),(3,3,1,'West'),(3,4,5,NULL),(3,5,6,NULL),(3,6,NULL,NULL),(3,7,NULL,NULL),(3,8,NULL,NULL),(4,1,1,NULL),(4,2,10,NULL),(4,3,2,'East'),(4,4,3,NULL),(4,5,12,NULL),(4,6,8,NULL),(4,7,NULL,NULL),(4,8,NULL,NULL),(5,1,2,NULL),(5,2,8,NULL),(5,3,4,'West'),(5,4,NULL,NULL),(5,5,7,NULL),(5,6,3,NULL),(5,7,NULL,NULL),(5,8,NULL,NULL),(6,1,3,NULL),(6,2,1,NULL),(6,3,1,'East'),(6,4,6,NULL),(6,5,1,NULL),(6,6,6,NULL),(6,7,3,NULL),(6,8,7,NULL),(7,1,10,NULL),(7,2,12,NULL),(7,3,2,'West'),(7,4,7,NULL),(7,5,2,NULL),(7,6,7,NULL),(7,7,6,NULL),(7,8,7,NULL),(8,1,10,NULL),(8,2,12,NULL),(8,3,2,'West'),(8,4,8,NULL),(8,5,2,NULL),(8,6,3,NULL),(8,7,NULL,NULL),(8,8,NULL,NULL),(9,1,4,NULL),(9,2,6,NULL),(9,3,4,'East'),(9,4,1,NULL),(9,5,10,NULL),(9,6,1,NULL),(9,7,6,NULL),(9,8,5,NULL),(10,1,7,NULL),(10,2,7,NULL),(10,3,6,'East'),(10,4,2,NULL),(10,5,11,NULL),(10,6,5,NULL),(10,7,NULL,NULL),(10,8,NULL,NULL),(11,1,8,NULL),(11,2,2,NULL),(11,3,7,'East'),(11,4,4,NULL),(11,5,14,NULL),(11,6,10,NULL),(11,7,1,NULL),(11,8,1,NULL),(12,1,13,NULL),(12,2,3,NULL),(12,3,8,'West'),(12,4,NULL,NULL),(12,5,9,NULL),(12,6,7,NULL),(12,7,NULL,NULL),(12,8,NULL,NULL),(13,1,14,NULL),(13,2,9,NULL),(13,3,9,'West'),(13,4,9,NULL),(13,5,4,NULL),(13,6,9,NULL),(13,7,4,NULL),(13,8,6,NULL),(14,1,12,NULL),(14,2,14,NULL),(14,3,7,'West'),(14,4,NULL,NULL),(14,5,13,NULL),(14,6,4,NULL),(14,7,NULL,NULL),(14,8,NULL,NULL);
/*!40000 ALTER TABLE `rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `schools_for_each_label`
--

DROP TABLE IF EXISTS `schools_for_each_label`;
/*!50001 DROP VIEW IF EXISTS `schools_for_each_label`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `schools_for_each_label` AS SELECT 
 1 AS `label`,
 1 AS `counts`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(8) NOT NULL,
  `description` varchar(80) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Suburban','May be in small cities or large towns or residential areas near large cities'),(2,'Urban','Located in cities'),(3,'Rural','Located in the country and usually near a small town');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sports` (
  `sport_id` int(11) NOT NULL AUTO_INCREMENT,
  `sport_name` varchar(10) NOT NULL,
  `gender` varchar(6) NOT NULL,
  PRIMARY KEY (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports`
--

LOCK TABLES `sports` WRITE;
/*!40000 ALTER TABLE `sports` DISABLE KEYS */;
INSERT INTO `sports` VALUES (1,'Basketball','Men'),(2,'Basketball','Women'),(3,'Football','Men'),(4,'Soccer','Men'),(5,'Soccer','Women'),(6,'Baseball','Men'),(7,'Lacrosse','Men'),(8,'Lacrosse','Women');
/*!40000 ALTER TABLE `sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top3ranks`
--

DROP TABLE IF EXISTS `top3ranks`;
/*!50001 DROP VIEW IF EXISTS `top3ranks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `top3ranks` AS SELECT 
 1 AS `college_name`,
 1 AS `sport_name`,
 1 AS `rank`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tuition`
--

DROP TABLE IF EXISTS `tuition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuition` (
  `college_id` int(11) NOT NULL,
  `in_state` int(11) NOT NULL,
  `out_of_state` int(11) NOT NULL,
  `room_and_board` int(11) NOT NULL,
  KEY `fk_tuition_colleges1_idx` (`college_id`),
  CONSTRAINT `fk_tuition_colleges1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuition`
--

LOCK TABLES `tuition` WRITE;
/*!40000 ALTER TABLE `tuition` DISABLE KEYS */;
INSERT INTO `tuition` VALUES (1,8978,24098,11044),(2,18436,33664,11280),(3,10533,34783,10842),(4,14460,39406,10026),(5,9992,28794,10030),(6,10592,29696,12292),(7,52678,52678,16047),(8,14417,26603,9825),(9,14417,47476,11198),(10,10533,34845,10258),(11,10399,33606,12082),(12,8965,30609,10450),(13,14638,30579,12452),(14,15868,31988,11308);
/*!40000 ALTER TABLE `tuition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `avgsatscore`
--

/*!50001 DROP VIEW IF EXISTS `avgsatscore`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `avgsatscore` AS select `admissions`.`college_id` AS `college_id`,`colleges`.`college_name` AS `college_name`,`admissions`.`avg_sat_score` AS `avg_sat_score` from (`admissions` join `colleges` on((`admissions`.`college_id` = `colleges`.`college_id`))) where ((`admissions`.`avg_sat_score` > 1100) and (`admissions`.`avg_sat_score` < 1350)) order by `admissions`.`avg_sat_score` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `avgtuition_for_acceptance_rate`
--

/*!50001 DROP VIEW IF EXISTS `avgtuition_for_acceptance_rate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `avgtuition_for_acceptance_rate` AS select avg(`tuition`.`in_state`) AS `Average` from (`admissions` join `tuition` on((`admissions`.`college_id` = `tuition`.`college_id`))) where (`admissions`.`acceptance_rate` < 0.5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `incidentcount`
--

/*!50001 DROP VIEW IF EXISTS `incidentcount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `incidentcount` AS select `sub`.`college_id` AS `college_id`,`bigten`.`colleges`.`college_name` AS `college_name`,`sub`.`number_of_incidents` AS `number_of_incidents` from (((select `bigten`.`incidents`.`college_id` AS `college_id`,((((((((((`bigten`.`incidents`.`non_negligent_manslaughter` + `bigten`.`incidents`.`negligent_manslaughter`) + `bigten`.`incidents`.`rape`) + `bigten`.`incidents`.`fondling`) + `bigten`.`incidents`.`incest`) + `bigten`.`incidents`.`statutory_rape`) + `bigten`.`incidents`.`robbery`) + `bigten`.`incidents`.`aggravated_assult`) + `bigten`.`incidents`.`burglary`) + `bigten`.`incidents`.`motor_vehicle_theft`) + `bigten`.`incidents`.`arson`) AS `number_of_incidents` from `bigten`.`incidents`)) `sub` join `bigten`.`colleges` on((`sub`.`college_id` = `bigten`.`colleges`.`college_id`))) where (`sub`.`number_of_incidents` < 100) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `incidents_per_setting`
--

/*!50001 DROP VIEW IF EXISTS `incidents_per_setting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `incidents_per_setting` AS select `sub`.`setting_id` AS `setting_id`,`bigten`.`settings`.`label` AS `Setting`,sum(`sub`.`Total_Incidents`) AS `Total Incidents` from (((select `bigten`.`colleges`.`setting_id` AS `setting_id`,((((((((((`bigten`.`incidents`.`non_negligent_manslaughter` + `bigten`.`incidents`.`negligent_manslaughter`) + `bigten`.`incidents`.`rape`) + `bigten`.`incidents`.`fondling`) + `bigten`.`incidents`.`incest`) + `bigten`.`incidents`.`statutory_rape`) + `bigten`.`incidents`.`robbery`) + `bigten`.`incidents`.`aggravated_assult`) + `bigten`.`incidents`.`burglary`) + `bigten`.`incidents`.`motor_vehicle_theft`) + `bigten`.`incidents`.`arson`) AS `Total_Incidents` from (`bigten`.`colleges` join `bigten`.`incidents` on((`bigten`.`colleges`.`college_id` = `bigten`.`incidents`.`college_id`))))) `sub` join `bigten`.`settings` on((`sub`.`setting_id` = `bigten`.`settings`.`setting_id`))) group by `sub`.`setting_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schools_for_each_label`
--

/*!50001 DROP VIEW IF EXISTS `schools_for_each_label`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `schools_for_each_label` AS select `settings`.`label` AS `label`,count(`colleges`.`setting_id`) AS `counts` from (`colleges` join `settings` on((`colleges`.`setting_id` = `settings`.`setting_id`))) group by `colleges`.`setting_id` order by `counts` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top3ranks`
--

/*!50001 DROP VIEW IF EXISTS `top3ranks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top3ranks` AS select `colleges`.`college_name` AS `college_name`,`sports`.`sport_name` AS `sport_name`,`rankings`.`rank` AS `rank` from ((`colleges` join `rankings` on((`colleges`.`college_id` = `rankings`.`college_id`))) join `sports` on((`rankings`.`sport_id` = `sports`.`sport_id`))) where ((`rankings`.`rank` <= 3) and `colleges`.`college_id` in (select `rankings`.`college_id` from `rankings` where (`rankings`.`rank` <= 3) group by `rankings`.`college_id` having (count(0) > 2))) group by `colleges`.`college_id`,`rankings`.`sport_id` */;
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

-- Dump completed on 2018-05-09 13:12:20
