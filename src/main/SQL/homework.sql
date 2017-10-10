-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: homework
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.17.04.1

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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `introduction` varchar(100) DEFAULT NULL,
  `file_name` varchar(45) DEFAULT NULL,
  `create_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recevied_id` int(11) DEFAULT NULL,
  `recevied_time` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `item_name` varchar(20) DEFAULT NULL,
  `success` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `recevied_user_idx` (`recevied_id`),
  KEY `create_user_idx` (`create_id`),
  CONSTRAINT `create_user` FOREIGN KEY (`create_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recevied_user` FOREIGN KEY (`recevied_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (2,'测试修改附件','jquery-1.10.2.min.js',1,'2017-10-08 13:35:47',2,'2017-10-08 12:28:19',1,'test',1),(3,'测试','jquery-1.10.2.min.js',1,'2017-10-08 12:16:54',2,'2017-10-07 18:58:09',1,'第三个任务',0),(4,'dfgdg','2017-10-02 01-07-06屏幕截图.png',1,'2017-10-10 15:44:00',NULL,NULL,0,'第四',0),(5,'大赛','2017-10-02 01-07-06屏幕截图.png',1,'2017-10-08 13:03:42',NULL,NULL,0,'大大',0),(6,'大赛',NULL,1,'2017-10-08 12:16:54',2,'2017-10-07 19:01:39',1,'色方式',0),(7,'sad',NULL,1,'2017-10-08 12:16:54',NULL,NULL,0,'asd',0),(8,'dsada',NULL,1,'2017-10-08 12:16:54',NULL,NULL,0,'asda',0),(9,'大',NULL,1,'2017-10-08 12:16:54',NULL,NULL,0,'四',0),(10,'阿达撒',NULL,1,'2017-10-08 12:16:54',NULL,NULL,0,'ttt',0);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  `email` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `college` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL,
  `grade` varchar(45) DEFAULT NULL,
  `classes` varchar(45) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `area` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','61762ac3e441918d4d168e9d47893e05','帅',1,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-10-09 13:34:31',NULL),(2,'user','148c7b3b2844d964be07132957d8e6ae','普通',0,'380781000@qq.com',NULL,0,'软件学院','软件工程','2016级','4班','2017-10-09 13:41:20','java'),(3,'user2','148c7b3b2844d964be07132957d8e6ae','普通2',0,'380781010@qq.com',NULL,0,'软件学院','温室','2017','1班','2017-10-09 13:41:20','php'),(4,'user3','148c7b3b2844d964be07132957d8e6ae','普通3',0,'380781010@qq.com',NULL,0,'软件学院','温室','2017','1班','2017-10-09 13:41:20','php'),(5,'user4','148c7b3b2844d964be07132957d8e6ae','普通4',0,'380781010@qq.com',NULL,0,'软件学院','温室','2017','1班','2017-10-09 13:41:20','php'),(6,'user5','148c7b3b2844d964be07132957d8e6ae','普通5',0,'380781000@qq.com',NULL,0,'软件学院','软件工程','2016级','4班','2017-10-09 13:41:20','java'),(7,'user6','148c7b3b2844d964be07132957d8e6ae','普通6',0,'380781010@qq.com',NULL,0,'软件学院','温室','2017','1班','2017-10-09 13:41:20','php'),(8,'user7','148c7b3b2844d964be07132957d8e6ae','普通7',0,'380781010@qq.com',NULL,0,'软件学院','温室','2017','1班','2017-10-09 13:41:20','php'),(9,'user8','148c7b3b2844d964be07132957d8e6ae','普通8',0,'380781010@qq.com',NULL,0,'软件学院','温室','2017','1班','2017-10-09 13:41:20','php'),(10,'wxz1997','148c7b3b2844d964be07132957d8e6ae','dasd',0,'54854787@qq.com',NULL,0,'书信学院','书记','2017','1','2017-10-09 13:41:20','书记管理'),(11,'aaaa','148c7b3b2844d964be07132957d8e6ae','fsfdsfs',0,'hjhugu@qq.com',NULL,0,'dsfhsuidf','jkdfhids','2016','1','2017-10-09 13:41:20','方式'),(12,'fsdad','148c7b3b2844d964be07132957d8e6ae','的阿达式',0,'jshfh@qq.com',NULL,0,'的撒大',' 阿三 ','大但是',' 的撒的','2017-10-09 13:41:20','的撒'),(13,'a2777287','148c7b3b2844d964be07132957d8e6ae','knf',0,'57857@qq.com',NULL,0,'fsd','费收费式','发射的','发色','2017-10-09 13:41:20','方式'),(30,'fsfs','679d4dbd781eaeb32e91e9997780aa98','费收费大赛',0,'sdfs@qq.com',NULL,0,'散发的沙发上','到沙发式','式方式','发色','2017-10-09 13:38:47',' 发色');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-10 23:44:52
