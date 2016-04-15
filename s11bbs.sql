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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add article',7,'add_article'),(20,'Can change article',7,'change_article'),(21,'Can delete article',7,'delete_article'),(22,'Can add comment',8,'add_comment'),(23,'Can change comment',8,'change_comment'),(24,'Can delete comment',8,'delete_comment'),(25,'Can add thumb up',9,'add_thumbup'),(26,'Can change thumb up',9,'change_thumbup'),(27,'Can delete thumb up',9,'delete_thumbup'),(28,'Can add category',10,'add_category'),(29,'Can change category',10,'change_category'),(30,'Can delete category',10,'delete_category'),(31,'Can add user profile',11,'add_userprofile'),(32,'Can change user profile',11,'change_userprofile'),(33,'Can delete user profile',11,'delete_userprofile'),(34,'Can add user group',12,'add_usergroup'),(35,'Can change user group',12,'change_usergroup'),(36,'Can delete user group',12,'delete_usergroup'),(37,'Can add chat group',13,'add_chatgroup'),(38,'Can change chat group',13,'change_chatgroup'),(39,'Can delete chat group',13,'delete_chatgroup');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$zdqiklxyDzsW$6hKOPYA79q1a79hYSlMKGjss2saNFEINlJ+bHizy7x8=','2016-04-09 09:54:20',1,'alan','','','',1,1,'2016-03-30 08:13:29'),(2,'pbkdf2_sha256$24000$EBiQyncMz5Jy$6+nCUpovkdHKrqQQJThvLzMB1EamfX10j/vMKKygK1M=',NULL,0,'lisa','','','',0,1,'2016-03-30 08:24:37'),(3,'pbkdf2_sha256$24000$PqlSfPX3KZcV$ArZmXWAEatehhBAGB1YfaxGvzRZUQray96O8QFltcyY=',NULL,0,'zhangsan','','','',0,1,'2016-04-10 01:49:31'),(4,'pbkdf2_sha256$24000$9cu4umYNUhdr$Kwy9itLUy9R7tdbzZInoi3gQQglY9fRLM7WkXiI8Hew=','2016-04-15 08:54:27',0,'lisi','','','',0,1,'2016-04-13 07:05:17');
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
-- Table structure for table `chat_chatgroup`
--

DROP TABLE IF EXISTS `chat_chatgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_chatgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `descride` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_chatgroup`
--

LOCK TABLES `chat_chatgroup` WRITE;
/*!40000 ALTER TABLE `chat_chatgroup` DISABLE KEYS */;
INSERT INTO `chat_chatgroup` VALUES (1,'python 交流社区','python 技术分享、顺便扯个淡'),(2,'黑苹果交流社区','专注黑苹果20年 除了不会搞黑苹果 啥（b）都会装'),(3,'组团忽悠的','无伤害无忽悠');
/*!40000 ALTER TABLE `chat_chatgroup` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-03-30 08:14:51','1','admin',1,'Added.',12,1),(2,'2016-03-30 08:14:58','2','guest',1,'Added.',12,1),(3,'2016-03-30 08:17:53','1','Alan',1,'Added.',11,1),(4,'2016-03-30 08:20:31','1','notice',1,'Added.',10,1),(5,'2016-03-30 08:20:41','2','hot',1,'Added.',10,1),(6,'2016-03-30 08:21:20','1','alan test author:Alan',1,'Added.',7,1),(7,'2016-03-30 08:22:27','2','notice test author:Alan',1,'Added.',7,1),(8,'2016-03-30 08:22:53','1','hahahahahhahah user:Alan',1,'Added.',8,1),(9,'2016-03-30 08:23:02','2','woquuuaa user:Alan',1,'Added.',8,1),(10,'2016-03-30 08:23:13','3','dadadadadadadad user:Alan',1,'Added.',8,1),(11,'2016-03-30 08:23:24','4','goood user:Alan',1,'Added.',8,1),(12,'2016-03-30 08:24:37','2','lisa',1,'Added.',4,1),(13,'2016-03-30 08:24:40','2','lisa',1,'Added.',11,1),(14,'2016-04-09 09:09:37','3','IntegerFiel author:Alan',3,'',7,1),(15,'2016-04-09 09:09:37','1','alan test author:Alan',3,'',7,1),(16,'2016-04-09 09:09:37','2','notice test author:Alan',3,'',7,1),(17,'2016-04-10 01:49:31','3','zhangsan',1,'Added.',4,1),(18,'2016-04-10 01:49:44','3','zhangsan',2,'No fields changed.',4,1),(19,'2016-04-10 02:17:14','5','教授给力啊 user:Alan',1,'Added.',8,1),(20,'2016-04-10 02:17:42','6','那是必须啊 对了告诉你 这是你的第二层 1-2 user:Alan',1,'Added.',8,1),(21,'2016-04-10 02:17:59','7','OOOO 好赞啊 user:Alan',1,'Added.',8,1),(22,'2016-04-10 02:18:39','8','不容易啊 唉 小同志们你们要努力啊 1-3 user:Alan',1,'Added.',8,1),(23,'2016-04-10 02:18:57','9','那是必须  1-4 user:Alan',1,'Added.',8,1),(24,'2016-04-10 02:19:11','10','无以言表 user:Alan',1,'Added.',8,1),(25,'2016-04-10 02:19:37','11','3-2 user:Alan',1,'Added.',8,1),(26,'2016-04-13 07:02:34','1','grouppython 交流社区 descride:python 技术分享、顺便扯个淡',1,'Added.',13,1),(27,'2016-04-13 07:03:23','2','group黑苹果交流社区 descride:专注黑苹果20年 除了不会搞黑苹果 啥（b）都会装',1,'Added.',13,1),(28,'2016-04-13 07:03:47','3','group组团忽悠的 descride:无伤害无忽悠',1,'Added.',13,1),(29,'2016-04-13 07:04:21','2','lisa',2,'Changed chatgroup.',11,1),(30,'2016-04-13 07:04:26','1','Alan',2,'Changed chatgroup.',11,1),(31,'2016-04-13 07:04:42','3','zhangsan',1,'Added.',11,1),(32,'2016-04-13 07:05:17','4','lisi',1,'Added.',4,1),(33,'2016-04-13 07:16:58','3','zhangsan',2,'Changed friend.',11,1),(34,'2016-04-13 07:17:03','2','lisa',2,'Changed friend.',11,1),(35,'2016-04-13 07:17:15','3','zhangsan',2,'Changed friend.',11,1),(36,'2016-04-13 07:17:29','4','lisi',1,'Added.',11,1),(37,'2016-04-13 10:21:22','1','Alan',2,'Changed friend.',11,1),(38,'2016-04-13 10:21:31','1','Alan',2,'No fields changed.',11,1),(39,'2016-04-15 08:54:47','4','lisi',2,'Changed friend.',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'chat','chatgroup'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'web','article'),(10,'web','category'),(8,'web','comment'),(9,'web','thumbup'),(12,'web','usergroup'),(11,'web','userprofile');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-03-30 08:09:32'),(2,'auth','0001_initial','2016-03-30 08:09:34'),(3,'admin','0001_initial','2016-03-30 08:09:34'),(4,'admin','0002_logentry_remove_auto_add','2016-03-30 08:09:34'),(5,'contenttypes','0002_remove_content_type_name','2016-03-30 08:09:35'),(6,'auth','0002_alter_permission_name_max_length','2016-03-30 08:09:35'),(7,'auth','0003_alter_user_email_max_length','2016-03-30 08:09:35'),(8,'auth','0004_alter_user_username_opts','2016-03-30 08:09:35'),(9,'auth','0005_alter_user_last_login_null','2016-03-30 08:09:35'),(10,'auth','0006_require_contenttypes_0002','2016-03-30 08:09:35'),(11,'auth','0007_alter_validators_add_error_messages','2016-03-30 08:09:35'),(12,'sessions','0001_initial','2016-03-30 08:09:36'),(13,'web','0001_initial','2016-03-30 08:09:40'),(14,'web','0002_auto_20160330_1617','2016-03-30 08:17:43'),(15,'web','0003_article_summery','2016-04-07 07:41:48'),(16,'web','0004_auto_20160409_1507','2016-04-09 07:07:22'),(17,'chat','0001_initial','2016-04-13 06:58:57'),(18,'web','0005_userprofile_chatgroup','2016-04-13 06:58:58'),(19,'web','0006_userprofile_friend','2016-04-13 07:10:35');
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
INSERT INTO `django_session` VALUES ('9i9nv1zauay6hiqtcicjjyfj5oke8k98','NTcwNDU5YWExMWQzMWEzYWM1OTE0NDBlYWE4OWY2YWJjZjRlNTM5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMjcwODkxN2I0MjdiOGE5OTQzYTRmNzI3ZThlMDA1ZjRiNTVjNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-04-23 09:54:20'),('to0uaayac6hojvnjix2ms1a2lkyuwsn0','ZTZiNGNmN2RmM2ZmZjNlYjQwMzE1M2U5ZDhhNzI4MWE5ODFiZDA3Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjAwMTgyY2NhZGE0MDdmY2RmYzI2OWNlMTk1NmI0OWMzYjFhYWU5MDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-04-29 08:54:27');
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
  `category_id` int(11) NOT NULL,
  `summery` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `web_article_4f331e2f` (`author_id`),
  KEY `web_article_5bf698f4` (`category_id`),
  CONSTRAINT `web_article_category_id_427b8715_fk_web_category_id` FOREIGN KEY (`category_id`) REFERENCES `web_category` (`id`),
  CONSTRAINT `web_article_author_id_de2be06b_fk_web_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `web_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_article`
--

LOCK TABLES `web_article` WRITE;
/*!40000 ALTER TABLE `web_article` DISABLE KEYS */;
INSERT INTO `web_article` VALUES (4,'上海交大校庆92岁院士演讲 推开为其准备的椅子','/static/imgs/1/133280344.jpg','<p>&ldquo;在惊涛骇浪的孤岛，他埋下头，甘心做沉默的砥柱；在一穷二白的年代，他挺起胸，成为国家最大的财富。他的人生，正如深海中的潜艇，无声，但有无穷的力量。&rdquo;</p>\r\n\r\n<p>　　在120周年校庆之际，上海交通大学官方微博8日转发了一张照片，在校庆活动中，92岁的老学长，在演讲时毅然推开了为他准备的椅子，他就是上海交大1949届造船系校友、中国核潜艇之父、中国工程院院士黄旭华。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"上海交大校庆92岁院士演讲 推开为其准备的椅子\" src=\"http://img1.gtimg.com/news/pics/hv1/4/173/2049/133280344.jpg\" /></p>\r\n\r\n<p>　　黄旭华，中国工程院院士，我国第一代核动力潜艇研制创始人之一。原籍广东省揭阳市揭东县玉湖镇新寮村，1924年2月24日出生于广东省汕尾市海丰县田墘镇。1949年毕业于国立交通大学造船系船舶制造专业，先后从事过民用船舶和军用舰艇的研究设计工作，1958年开始参与并领导我国第一代核潜艇的研究设计工作。先后出任第一代核潜艇副总设计师、第二任总设计师，历任中船重工集团公司副所长、所长、党委书记。曾先后于1978年获全国科学大会奖、1982年获国防科工委二等奖。他参与完成的我国第一代核潜艇研制获1985年国家科学技术进步奖特等奖、导弹核潜艇研制获1996年国家科学技术进步奖特等奖。1989年被评为全国先进工作者。1994年当选为中国工程院院士。2014年1月当选中央电视台感动中国2013年度人物。</p>\r\n\r\n<p>　　&ldquo;若有人问我们如何评价这一生，我们会说，此生没有虚度，我们的这一生都奉献给国家、给核潜艇事业，我们仅用不到10年的时间就实现了毛主席&lsquo;核潜艇，一万年也要造出来&rsquo;的誓言，我们此生无悔！&rdquo; &mdash;&mdash;核动力潜艇总设计师黄旭华。</p>','15:39:12',1,1000,1,2,'“在惊涛骇浪的孤岛，他挺起胸.....'),(5,'\"海淘\"税改首日:多家电商宣布包税 被指贴钱占位','/static/imgs/1/20160409075619234.jpg','<p>　（原标题：&ldquo;海淘&rdquo;税改首日 多家电商宣布&ldquo;包税&rdquo;打响补贴大战(组图)）</p>\r\n\r\n<p><img src=\"http://himg2.huanqiu.com/attachment2010/2016/0409/20160409075619234.jpg\" /></p>\r\n\r\n<p>妈妈们最爱海淘的奶粉在&ldquo;正面清单&rdquo;里。</p>\r\n\r\n<p>　　<strong>《&ldquo;海淘&rdquo;免税终结部分电商已调价》追踪</strong></p>\r\n\r\n<p>　　4月8日是跨境电商税改实施首日，跨境电商零售进口商品不再按邮递物品征收行邮税，而是按货物征收关税和进口环节增值税、消费税。</p>\r\n\r\n<p>　　就在4月7日晚间，财政部等11部门公布了《跨境电子商务零售进口商品清单》，也就是俗称的&ldquo;正面清单&rdquo;，共涵盖1142个8位税号商品。</p>\r\n\r\n<p>　　税改第一天，电商们在忙什么？他们的感受是什么？在这个特殊的节点上，<a href=\"http://country.huanqiu.com/china\" target=\"_blank\">中国</a>跨境电子商务峰会在成都举行，记者采访了波罗蜜、汇通天下等多家涉及跨境电商的企业。</p>\r\n\r\n<p>　　多家企业的负责人都告诉记者，前夜几乎无人入睡。一方面是忙着改造升级系统、清查产品，以保证商品能够符合7日夜间出台的进口清单。另一方面，未来跨境电商怎么走？&ldquo;补贴战&rdquo;是否一触即发？这些都是他们不得不考虑的问题。</p>\r\n\r\n<p>　　<strong>进口清单出炉</strong></p>\r\n\r\n<p>　　<strong>1142个8位税号商品免交许可证</strong></p>\r\n\r\n<p>　　4月7日晚间公布的清单，共涵盖1142个8位税号商品，主要是国内有一定消费需求，可满足相关部门监管要求，且客观上能够以快件、邮件等方式进境的生活消费品，包括部分食品饮料、服装鞋帽、家用电器以及部分化妆品、纸尿裤、儿童玩具、保温杯等。</p>\r\n\r\n<p>　　根据相关主管部门的意见，清单内的商品将免于向海关提交许可证件，检验检疫监督管理按照国家相关法律法规的规定执行；直购商品免于验核通关单，网购保税商品&ldquo;一线&rdquo;进区时须按货物验核通关单、&ldquo;二线&rdquo;出区时免于验核通关单。</p>\r\n\r\n<p>　　&ldquo;我从事外贸进出口相关业务将近30年，从来没有见过一项政策的出台是那么的艰难，那么的纠结！就算经过两年的试点磨合，今时今日正式开始实施新政，很多资深从业者依然没有搞清楚实施的细节。&rdquo;汇通天下CEO孙剑巍说，7日晚间进口清单才出台，为了能在8日合规营业，不少电商都忙于改系统，&ldquo;很多老大从昨天开始就在公司里没停过，可能现在都还没有睡觉。&rdquo;</p>','15:59:02',1,1000,1,2,'4月8日是跨境电商税改实施首日'),(6,'沈海高速发生重大交通事故 已致8死17伤','/static/imgs/1/1460163207939560.jpg','<h1>沈海高速发生重大交通事故 已致8死17伤</h1>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<p>2016-04-09 08:53:07来源：新华社</p>\r\n\r\n<p>分享</p>\r\n\r\n<p>字号:大中小</p>\r\n\r\n<p><img src=\"http://images.haiwainet.cn/20160409/1460163206213817.jpg\" /></p>\r\n\r\n<p>沈海高速发生重大交通事故 已致8死17伤</p>\r\n\r\n<p>4月9日上午，青岛市公安局交通警察支队官方微博发布消息，9日凌晨1时许，在沈海高速北向南方向618KM+900M处发生一辆长途卧铺客车与两辆货车相撞的交通事故，造成8人死亡，17人受伤。事故调查及善后处置等工作正在进行中。</p>\r\n\r\n<p>【相关报道】</p>\r\n\r\n<p>微博网友@苏州名流 ：【从苏州开车到青岛出差遭遇严重车祸[伤心][伤心]】凌晨1点左右，沈海高速胶州段，一辆满载瓷砖大货车失控与一辆大客车激烈碰撞。造成两车头完全损毁。</p>\r\n\r\n<p><img src=\"http://images.haiwainet.cn/20160409/1460163207245101.jpg\" /></p>\r\n\r\n<p><img src=\"http://images.haiwainet.cn/20160409/1460163207939560.jpg\" /></p>\r\n\r\n<p><img src=\"http://images.haiwainet.cn/20160409/1460163207114826.jpg\" /></p>\r\n\r\n<p><img src=\"http://images.haiwainet.cn/20160409/1460163207469434.jpg\" /></p>','17:39:13',1,1000,1,1,'4月9日上午，青岛市公安局交通警察支队');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_comment`
--

LOCK TABLES `web_comment` WRITE;
/*!40000 ALTER TABLE `web_comment` DISABLE KEYS */;
INSERT INTO `web_comment` VALUES (5,'教授给力啊','10:17:14',4,NULL,1),(6,'那是必须啊 对了告诉你 这是你的第二层 1-2','10:17:42',4,5,1),(7,'OOOO 好赞啊','10:17:59',4,NULL,1),(8,'不容易啊 唉 小同志们你们要努力啊 1-3','10:18:39',4,6,1),(9,'那是必须  1-4','10:18:57',4,8,1),(10,'无以言表','10:19:11',4,NULL,1),(11,'3-2','10:19:37',4,10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userprofile`
--

LOCK TABLES `web_userprofile` WRITE;
/*!40000 ALTER TABLE `web_userprofile` DISABLE KEYS */;
INSERT INTO `web_userprofile` VALUES (1,'Alan',1),(2,'lisa',2),(3,'zhangsan',3),(4,'lisi',4);
/*!40000 ALTER TABLE `web_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userprofile_chatgroup`
--

DROP TABLE IF EXISTS `web_userprofile_chatgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userprofile_chatgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `chatgroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_userprofile_chatgroup_userprofile_id_d878c72e_uniq` (`userprofile_id`,`chatgroup_id`),
  KEY `web_userprofile_chatg_chatgroup_id_490445dc_fk_chat_chatgroup_id` (`chatgroup_id`),
  CONSTRAINT `web_userprofile_chatg_chatgroup_id_490445dc_fk_chat_chatgroup_id` FOREIGN KEY (`chatgroup_id`) REFERENCES `chat_chatgroup` (`id`),
  CONSTRAINT `web_userprofile_ch_userprofile_id_f029ca48_fk_web_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `web_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userprofile_chatgroup`
--

LOCK TABLES `web_userprofile_chatgroup` WRITE;
/*!40000 ALTER TABLE `web_userprofile_chatgroup` DISABLE KEYS */;
INSERT INTO `web_userprofile_chatgroup` VALUES (2,1,1),(1,2,1),(3,3,2),(4,4,2);
/*!40000 ALTER TABLE `web_userprofile_chatgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userprofile_friend`
--

DROP TABLE IF EXISTS `web_userprofile_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userprofile_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_userprofile_friend_userprofile_id_29481ced_uniq` (`userprofile_id`,`user_id`),
  KEY `web_userprofile_friend_user_id_52581bb3_fk_auth_user_id` (`user_id`),
  CONSTRAINT `web_userprofile_friend_user_id_52581bb3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `web_userprofile_fr_userprofile_id_7b510fb1_fk_web_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `web_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userprofile_friend`
--

LOCK TABLES `web_userprofile_friend` WRITE;
/*!40000 ALTER TABLE `web_userprofile_friend` DISABLE KEYS */;
INSERT INTO `web_userprofile_friend` VALUES (5,1,2),(6,1,4),(2,2,1),(3,3,4),(7,4,1),(4,4,3);
/*!40000 ALTER TABLE `web_userprofile_friend` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userprofile_groups`
--

LOCK TABLES `web_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `web_userprofile_groups` DISABLE KEYS */;
INSERT INTO `web_userprofile_groups` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,2);
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

-- Dump completed on 2016-04-15 18:38:47
