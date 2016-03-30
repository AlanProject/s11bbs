-- MySQL dump 10.13  Distrib 5.5.20, for Win32 (x86)
--
-- Host: localhost    Database: s11bbs
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add article',7,'add_article'),(20,'Can change article',7,'change_article'),(21,'Can delete article',7,'delete_article'),(22,'Can add comment',8,'add_comment'),(23,'Can change comment',8,'change_comment'),(24,'Can delete comment',8,'delete_comment'),(25,'Can add thumb up',9,'add_thumbup'),(26,'Can change thumb up',9,'change_thumbup'),(27,'Can delete thumb up',9,'delete_thumbup'),(28,'Can add category',10,'add_category'),(29,'Can change category',10,'change_category'),(30,'Can delete category',10,'delete_category'),(31,'Can add user profile',11,'add_userprofile'),(32,'Can change user profile',11,'change_userprofile'),(33,'Can delete user profile',11,'delete_userprofile'),(34,'Can add user group',12,'add_usergroup'),(35,'Can change user group',12,'change_usergroup'),(36,'Can delete user group',12,'delete_usergroup');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$zdqiklxyDzsW$6hKOPYA79q1a79hYSlMKGjss2saNFEINlJ+bHizy7x8=','2016-03-30 08:13:48',1,'alan','','','',1,1,'2016-03-30 08:13:29'),(2,'pbkdf2_sha256$24000$EBiQyncMz5Jy$6+nCUpovkdHKrqQQJThvLzMB1EamfX10j/vMKKygK1M=',NULL,0,'lisa','','','',0,1,'2016-03-30 08:24:37');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-03-30 08:14:51','1','admin',1,'Added.',12,1),(2,'2016-03-30 08:14:58','2','guest',1,'Added.',12,1),(3,'2016-03-30 08:17:53','1','Alan',1,'Added.',11,1),(4,'2016-03-30 08:20:31','1','notice',1,'Added.',10,1),(5,'2016-03-30 08:20:41','2','hot',1,'Added.',10,1),(6,'2016-03-30 08:21:20','1','alan test author:Alan',1,'Added.',7,1),(7,'2016-03-30 08:22:27','2','notice test author:Alan',1,'Added.',7,1),(8,'2016-03-30 08:22:53','1','hahahahahhahah user:Alan',1,'Added.',8,1),(9,'2016-03-30 08:23:02','2','woquuuaa user:Alan',1,'Added.',8,1),(10,'2016-03-30 08:23:13','3','dadadadadadadad user:Alan',1,'Added.',8,1),(11,'2016-03-30 08:23:24','4','goood user:Alan',1,'Added.',8,1),(12,'2016-03-30 08:24:37','2','lisa',1,'Added.',4,1),(13,'2016-03-30 08:24:40','2','lisa',1,'Added.',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'web','article'),(10,'web','category'),(8,'web','comment'),(9,'web','thumbup'),(12,'web','usergroup'),(11,'web','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-03-30 08:09:32'),(2,'auth','0001_initial','2016-03-30 08:09:34'),(3,'admin','0001_initial','2016-03-30 08:09:34'),(4,'admin','0002_logentry_remove_auto_add','2016-03-30 08:09:34'),(5,'contenttypes','0002_remove_content_type_name','2016-03-30 08:09:35'),(6,'auth','0002_alter_permission_name_max_length','2016-03-30 08:09:35'),(7,'auth','0003_alter_user_email_max_length','2016-03-30 08:09:35'),(8,'auth','0004_alter_user_username_opts','2016-03-30 08:09:35'),(9,'auth','0005_alter_user_last_login_null','2016-03-30 08:09:35'),(10,'auth','0006_require_contenttypes_0002','2016-03-30 08:09:35'),(11,'auth','0007_alter_validators_add_error_messages','2016-03-30 08:09:35'),(12,'sessions','0001_initial','2016-03-30 08:09:36'),(13,'web','0001_initial','2016-03-30 08:09:40'),(14,'web','0002_auto_20160330_1617','2016-03-30 08:17:43');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c9d6kk5zqdrh9kv8g1bi1rrjdomrdzkm','NTcwNDU5YWExMWQzMWEzYWM1OTE0NDBlYWE4OWY2YWJjZjRlNTM5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMjcwODkxN2I0MjdiOGE5OTQzYTRmNzI3ZThlMDA1ZjRiNTVjNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-04-13 08:13:48');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_article`
--

DROP TABLE IF EXISTS `web_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `head_img` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `publish_date` time NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `categroy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `web_article_4f331e2f` (`author_id`),
  KEY `web_article_5bf698f4` (`categroy_id`),
  CONSTRAINT `web_article_categroy_id_ad0f6811_fk_web_category_id` FOREIGN KEY (`categroy_id`) REFERENCES `web_category` (`id`),
  CONSTRAINT `web_article_author_id_de2be06b_fk_web_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `web_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_article`
--

LOCK TABLES `web_article` WRITE;
/*!40000 ALTER TABLE `web_article` DISABLE KEYS */;
INSERT INTO `web_article` VALUES (1,'alan test','uploads/QQ图片20160329173910.png','This example is a quick exercise to illustrate how the default, static navbar and fixed to top navbar work. It','16:21:20',0,1000,1,2),(2,'notice test','uploads/QQ图片20160329173910_tpJGv9x.png','This example is a quick exercise to illustrate how the default, static navbar and fixed to top navbar work. It','16:22:27',0,1000,1,1);
/*!40000 ALTER TABLE `web_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_category`
--

DROP TABLE IF EXISTS `web_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_category`
--

LOCK TABLES `web_category` WRITE;
/*!40000 ALTER TABLE `web_category` DISABLE KEYS */;
INSERT INTO `web_category` VALUES (2,'hot'),(1,'notice');
/*!40000 ALTER TABLE `web_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_category_admin`
--

DROP TABLE IF EXISTS `web_category_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_category_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_category_admin_category_id_04924e5f_uniq` (`category_id`,`userprofile_id`),
  KEY `web_category_admin_userprofile_id_44edb7de_fk_web_userprofile_id` (`userprofile_id`),
  CONSTRAINT `web_category_admin_userprofile_id_44edb7de_fk_web_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `web_userprofile` (`id`),
  CONSTRAINT `web_category_admin_category_id_51f1ec83_fk_web_category_id` FOREIGN KEY (`category_id`) REFERENCES `web_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_category_admin`
--

LOCK TABLES `web_category_admin` WRITE;
/*!40000 ALTER TABLE `web_category_admin` DISABLE KEYS */;
INSERT INTO `web_category_admin` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `web_category_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_comment`
--

DROP TABLE IF EXISTS `web_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `date` time NOT NULL,
  `article_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_comment_article_id_38a05d92_fk_web_article_id` (`article_id`),
  KEY `web_comment_parent_comment_id_d631e863_fk_web_comment_id` (`parent_comment_id`),
  KEY `web_comment_e8701ad4` (`user_id`),
  CONSTRAINT `web_comment_user_id_b2b3ecef_fk_web_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `web_userprofile` (`id`),
  CONSTRAINT `web_comment_article_id_38a05d92_fk_web_article_id` FOREIGN KEY (`article_id`) REFERENCES `web_article` (`id`),
  CONSTRAINT `web_comment_parent_comment_id_d631e863_fk_web_comment_id` FOREIGN KEY (`parent_comment_id`) REFERENCES `web_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_comment`
--

LOCK TABLES `web_comment` WRITE;
/*!40000 ALTER TABLE `web_comment` DISABLE KEYS */;
INSERT INTO `web_comment` VALUES (1,'hahahahahhahah','16:22:53',1,NULL,1),(2,'woquuuaa','16:23:02',1,1,1),(3,'dadadadadadadad','16:23:13',1,2,1),(4,'goood','16:23:24',2,NULL,1);
/*!40000 ALTER TABLE `web_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_thumbup`
--

DROP TABLE IF EXISTS `web_thumbup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_thumbup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` time NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_thumbup_article_id_3fa4a3bd_fk_web_article_id` (`article_id`),
  KEY `web_thumbup_e8701ad4` (`user_id`),
  CONSTRAINT `web_thumbup_user_id_3328376c_fk_web_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `web_userprofile` (`id`),
  CONSTRAINT `web_thumbup_article_id_3fa4a3bd_fk_web_article_id` FOREIGN KEY (`article_id`) REFERENCES `web_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_thumbup`
--

LOCK TABLES `web_thumbup` WRITE;
/*!40000 ALTER TABLE `web_thumbup` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_thumbup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_usergroup`
--

DROP TABLE IF EXISTS `web_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_usergroup`
--

LOCK TABLES `web_usergroup` WRITE;
/*!40000 ALTER TABLE `web_usergroup` DISABLE KEYS */;
INSERT INTO `web_usergroup` VALUES (1,'admin'),(2,'guest');
/*!40000 ALTER TABLE `web_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userprofile`
--

DROP TABLE IF EXISTS `web_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `web_userprofile_user_id_3dea3d05_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userprofile`
--

LOCK TABLES `web_userprofile` WRITE;
/*!40000 ALTER TABLE `web_userprofile` DISABLE KEYS */;
INSERT INTO `web_userprofile` VALUES (1,'Alan',1),(2,'lisa',2);
/*!40000 ALTER TABLE `web_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userprofile_groups`
--

DROP TABLE IF EXISTS `web_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_userprofile_groups_from_userprofile_id_1892dbeb_uniq` (`userprofile_id`,`usergroup_id`),
  KEY `web_userprofile_groups_usergroup_id_feb5ec90_fk_web_usergroup_id` (`usergroup_id`),
  CONSTRAINT `web_userprofile_gr_userprofile_id_e2cc8eaf_fk_web_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `web_userprofile` (`id`),
  CONSTRAINT `web_userprofile_groups_usergroup_id_feb5ec90_fk_web_usergroup_id` FOREIGN KEY (`usergroup_id`) REFERENCES `web_usergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userprofile_groups`
--

LOCK TABLES `web_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `web_userprofile_groups` DISABLE KEYS */;
INSERT INTO `web_userprofile_groups` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `web_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-30 18:21:54
