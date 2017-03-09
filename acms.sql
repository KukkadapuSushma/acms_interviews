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
INSERT INTO `candidate` VALUES ('Prasanna','Female','prasu@yahoo.com','7123089760','PG',2),('Harshi','Male','harshi@gmail.com','8008962436','Btech',1),('Raju','Male','raju123@ymail.com','8282128212','MBA',3),('Damini','Female','daminisatya@gmail.com','8989898989','Btech',2),('Haritha','Female','haritha@gmail.com','9000928928','Btech',2),('Vasanth','Male','vasanth@gmail.com','9191919191','Btech',1),('Kumar','Male','kumar3165@gmail.com','9391181566','PG',1),('Kavii','Female','ka@gmail.com','9399973512','Mtech',2),('Preetha','Female','preetha@gmail.com','9399973514','PG',2),('Mayank','Male','mayank@gmail.com','9494234630','Btech',1),('Sushma','Female','sush@gmail.com','9701387079','Btech',2),('Rani','Female','rani@yahoo.com','9898989898','PG',2),('Rahul','Male','rahul@gmail.com','9900990090','PG',1),('Vipin','Male','vipin@gmail.com','9988998899','Btech',1);
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate1`
--

DROP TABLE IF EXISTS `candidate1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate1` (
  `name` varchar(20) NOT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate1`
--

LOCK TABLES `candidate1` WRITE;
/*!40000 ALTER TABLE `candidate1` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate1` ENABLE KEYS */;
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
INSERT INTO `interview_review` VALUES ('anuranjan@gmail.com','7123089760',2,'Selected','Good'),('anuranjan@gmail.com','8989898989',2,'Rejected','Bad Performance'),('datladivyakrishna1996@gmail.com','8989898989',1,'Selected','Good communication skills'),('datladivyakrishna1996@gmail.com','9000928928',2,'Selected','Have to improve'),('datladivyakrishna1996@gmail.com','9191919191',1,'Rejected','Excellent'),('datladivyakrishna1996@gmail.com','9399973512',1,'Rejected','Very bad performance'),('kavith@g.com','9000928928',0,'Rejected','Core subjects knowledge is weak'),('raghuram@hotmail.com','8989898989',2,'Selected','Good');
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
  `var` int(11) DEFAULT '1',
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
INSERT INTO `interviewer` VALUES ('Anuranjan','anuranjan@gmail.com','9797979797',3,1),('Kavitha','datladivyakrishna1996@gmail.com','9963027712',1,1),('Datla Divya Krishna','divya@gmail.com','999999999',2,1),('ganesh','kavith@g.com','1234567890',1,1),('Lohith','lohith@gmail.com','9845880616',2,1),('Radhika','radhika@yahoo.com','8143374403',1,1),('Raghuram','raghuram@hotmail.com','8703212345',2,1),('Raja','raja12@yahoo.com','8712345678',3,1),('Kavi','s@r.com','9876543211',3,1),('sathya','sathya@gmail.com','9885885033',4,1),('Sunitha','sunitha@gmail.com','9090909090',2,1),('Sush','sush@gmail.com','9701387069',3,1);
/*!40000 ALTER TABLE `interviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interviewer1`
--

DROP TABLE IF EXISTS `interviewer1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interviewer1` (
  `name` varchar(20) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `var` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interviewer1`
--

LOCK TABLES `interviewer1` WRITE;
/*!40000 ALTER TABLE `interviewer1` DISABLE KEYS */;
/*!40000 ALTER TABLE `interviewer1` ENABLE KEYS */;
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
  `slot` int(11) DEFAULT NULL,
  PRIMARY KEY (`interview_id`),
  UNIQUE KEY `email_ifk` (`email_ifk`,`mobile_fk`),
  UNIQUE KEY `email_ifk_2` (`email_ifk`),
  UNIQUE KEY `mobile_fk` (`mobile_fk`),
  CONSTRAINT `schedule_interview_ibfk_1` FOREIGN KEY (`email_ifk`) REFERENCES `interviewer` (`email`),
  CONSTRAINT `schedule_interview_ibfk_2` FOREIGN KEY (`mobile_fk`) REFERENCES `candidate` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_interview`
--

LOCK TABLES `schedule_interview` WRITE;
/*!40000 ALTER TABLE `schedule_interview` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_interview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler`
--

DROP TABLE IF EXISTS `scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler` (
  `candidate` varchar(20) DEFAULT NULL,
  `interviewer` varchar(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `interview_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`interview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler`
--

LOCK TABLES `scheduler` WRITE;
/*!40000 ALTER TABLE `scheduler` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slots`
--

DROP TABLE IF EXISTS `slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slots` (
  `slot` int(11) DEFAULT NULL,
  `time` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots`
--

LOCK TABLES `slots` WRITE;
/*!40000 ALTER TABLE `slots` DISABLE KEYS */;
INSERT INTO `slots` VALUES (1,'09-10'),(2,'10-11'),(3,'11-12'),(4,'12-13'),(5,'14-15'),(6,'15-16'),(7,'16-17');
/*!40000 ALTER TABLE `slots` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-06 21:22:19
