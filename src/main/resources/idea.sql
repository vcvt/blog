CREATE DATABASE  IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `blog`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.1.49-community

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `summary` varchar(400) DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `clickHit` int(11) DEFAULT NULL,
  `replyHit` int(11) DEFAULT NULL,
  `content` text,
  `keyword` varchar(200) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'标题1','总结1','2016-05-06 10:34:19',800,8,'内容1',NULL,1),(2,'标题2','总结2','2016-06-06 10:34:19',900,6,'内容2',NULL,2),(3,'标题3','总结3','2016-07-06 10:34:19',200,4,'内容3',NULL,3),(4,'标题4','总结4','2016-11-10 10:34:19',100,1,'内容4',NULL,2),(5,'标题5','总结5','2016-11-22 10:34:19',1000,8,'内容5',NULL,4);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogger`
--

DROP TABLE IF EXISTS `blogger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogger` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博主ID',
  `username` varchar(50) NOT NULL COMMENT '博主姓名',
  `password` varchar(100) NOT NULL COMMENT '博主密码',
  `profile` text COMMENT '博主信息',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `signature` varchar(100) DEFAULT NULL COMMENT '签名',
  `imagename` varchar(100) DEFAULT NULL COMMENT '博主头像路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='博主信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogger`
--

LOCK TABLES `blogger` WRITE;
/*!40000 ALTER TABLE `blogger` DISABLE KEYS */;
INSERT INTO `blogger` VALUES (1,'vcvt','fa0b26c2a1a71d9f490095571d420fbd','lazy','vcvt','abc',NULL);
/*!40000 ALTER TABLE `blogger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogtype`
--

DROP TABLE IF EXISTS `blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(30) DEFAULT NULL COMMENT '博客名称',
  `orderNum` int(11) DEFAULT NULL COMMENT '博客排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='博客类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogtype`
--

LOCK TABLES `blogtype` WRITE;
/*!40000 ALTER TABLE `blogtype` DISABLE KEYS */;
INSERT INTO `blogtype` VALUES (1,'java进阶',1),(2,'Spring',2),(3,'Hibernate',3),(4,'Struts',4),(5,'Mybatis',5),(6,'SpringMVC',6);
/*!40000 ALTER TABLE `blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userIp` varchar(50) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `commentDate` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkname` varchar(100) DEFAULT NULL,
  `linkurl` varchar(200) DEFAULT NULL,
  `linkorder` varchar(200) DEFAULT NULL COMMENT '用于查询时排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'CSDN博客','http://www.csdn.net/','1'),(2,'GitHub主页','https://pages.github.com/','2'),(3,'极客头条','http://geek.csdn.net/','3'),(4,'百度','https://www.baidu.com/','4');
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-20 16:00:06
