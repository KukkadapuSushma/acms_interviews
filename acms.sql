-- MySQL dump 10.13  Distrib 5.7.13, for Win64 (x86_64)
--
-- Host: localhost    Database: acms
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate` (
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `level` int(11) DEFAULT '0',
  PRIMARY KEY (`mobile`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES ('Shashank','M','shashank@gmail.com','212121212121','PG',4),('Haritha','F','haritha@gmail.com','9000928928','Btech',4),('Kumar','M','kumar3165@gmail.com','9391181566','PG',4),('Preetha','F','preetha@gmail.com','9399973514','PG',4),('Mayank','M','mayank@gmail.com','9494234630','Btech',4),('Sushma','F','sush@gmail.com','9701387079','Btech',4);
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_review`
--

DROP TABLE IF EXISTS `interview_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_review` (
  `email_ifk` varchar(255) NOT NULL,
  `mobile_fk` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  PRIMARY KEY (`email_ifk`,`mobile_fk`,`level`),
  KEY `mobile_fk` (`mobile_fk`),
  CONSTRAINT `interview_review_ibfk_1` FOREIGN KEY (`email_ifk`) REFERENCES `interviewer` (`email`),
  CONSTRAINT `interview_review_ibfk_2` FOREIGN KEY (`mobile_fk`) REFERENCES `candidate` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_review`
--

LOCK TABLES `interview_review` WRITE;
/*!40000 ALTER TABLE `interview_review` DISABLE KEYS */;
INSERT INTO `interview_review` VALUES ('datladivyakrishna1996@gmail.com','9391181566',1,'Rejected','\"Good Technical Skills\"'),('datladivyakrishna1996@gmail.com','9399973514',1,'Rejected','good'),('datladivyakrishna1996@gmail.com','9494234630',1,'Rejected','bad performance'),('divya@gmail.com','9000928928',3,'Selected','great'),('s@r.com','9000928928',4,'Selected','good performance');
/*!40000 ALTER TABLE `interview_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interviewer`
--

DROP TABLE IF EXISTS `interviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interviewer` (
  `Name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interviewer`
--

LOCK TABLES `interviewer` WRITE;
/*!40000 ALTER TABLE `interviewer` DISABLE KEYS */;
INSERT INTO `interviewer` VALUES ('Kavitha','datladivyakrishna1996@gmail.com','9963027712',1),('Datla Divya Krishna','divya@gmail.com','999999999',2),('ganesh','kavith@g.com','1234567890',1),('Kavi','s@r.com','9876543211',3),('sathya','sathya@gmail.com','9885885033',4);
/*!40000 ALTER TABLE `interviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `login_id` varchar(10) DEFAULT NULL,
  `password` varbinary(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('acms','³Z«\ç\'u\Ý\ë~ó\ìn˜J\0');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_interview`
--

DROP TABLE IF EXISTS `schedule_interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_interview` (
  `interview_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_ifk` varchar(255) NOT NULL,
  `mobile_fk` varchar(255) NOT NULL,
  `startTime` varchar(8) NOT NULL,
  `endTime` varchar(8) NOT NULL,
  PRIMARY KEY (`interview_id`),
  UNIQUE KEY `email_ifk` (`email_ifk`,`startTime`,`endTime`,`mobile_fk`),
  UNIQUE KEY `email_ifk_2` (`email_ifk`,`startTime`,`endTime`),
  UNIQUE KEY `mobile_fk` (`mobile_fk`,`startTime`,`endTime`),
  CONSTRAINT `schedule_interview_ibfk_1` FOREIGN KEY (`email_ifk`) REFERENCES `interviewer` (`email`),
  CONSTRAINT `schedule_interview_ibfk_2` FOREIGN KEY (`mobile_fk`) REFERENCES `candidate` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_interview`
--

LOCK TABLES `schedule_interview` WRITE;
/*!40000 ALTER TABLE `schedule_interview` DISABLE KEYS */;
INSERT INTO `schedule_interview` VALUES (1,'s@r.com','9000928928','10','11'),(2,'s@r.com','9391181566','11','12'),(3,'s@r.com','9399973514','12','13'),(4,'s@r.com','9494234630','14','15'),(5,'sathya@gmail.com','9701387079','15','16');
/*!40000 ALTER TABLE `schedule_interview` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-06 21:54:30
