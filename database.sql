-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: khachsan_database
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbladmin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_username` char(60) NOT NULL COMMENT 'tên tài khoản',
  `admin_password` char(60) NOT NULL COMMENT 'Mật khẩu',
  `admin_note` varchar(1000) DEFAULT NULL COMMENT 'mô tả, ghi chú',
  `admin_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_username_UNIQUE` (`admin_username`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladmin`
--

LOCK TABLES `tbladmin` WRITE;
/*!40000 ALTER TABLE `tbladmin` DISABLE KEYS */;
INSERT INTO `tbladmin` VALUES (1,'admin2','c84258e9c39059a89ab77d846ddab909','another note.','2024-11-30 00:28:50','2024-11-30 00:39:23'),(3,'admin1','e10adc3949ba59abbe56e057f20f883e','just a note.','2024-11-30 00:31:16','2024-11-30 00:31:16'),(4,'admin','21232f297a57a5a743894a0e4a801fc3','just a note.','2024-11-30 07:13:26','2024-11-30 07:13:26');
/*!40000 ALTER TABLE `tbladmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbooking`
--

DROP TABLE IF EXISTS `tblbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblbooking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL COMMENT 'người đặt phòng',
  `room_id` int NOT NULL COMMENT 'phòng được đặt',
  `booking_state` int DEFAULT NULL COMMENT 'trạng thái đồng ý hay bị từ chối',
  `booking_comment` varchar(255) DEFAULT NULL COMMENT 'bình luận',
  `booking_rate` int DEFAULT NULL COMMENT 'đánh giá từ 1 đến 5 sao',
  `booking_start_date` date NOT NULL COMMENT 'thời gian bắt đầu, check in',
  `booking_end_date` date NOT NULL COMMENT 'thời gian kết thúc, check out',
  `booking_people_count` int DEFAULT NULL COMMENT 'số lượng người',
  `booking_note` int DEFAULT NULL COMMENT 'ghi chú, yêu cầu thêm',
  `booking_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `booking_id_UNIQUE` (`booking_id`),
  KEY `customer_id` (`customer_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `tblbooking_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tblcustomer` (`customer_id`),
  CONSTRAINT `tblbooking_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `tblroom` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbooking`
--

LOCK TABLES `tblbooking` WRITE;
/*!40000 ALTER TABLE `tblbooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomer`
--

DROP TABLE IF EXISTS `tblcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcustomer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_username` char(60) NOT NULL COMMENT 'tên đăng nhập',
  `customer_password` char(60) NOT NULL,
  `customer_fullname` varchar(255) DEFAULT NULL COMMENT 'tên đầy đủ',
  `customer_phone` char(20) DEFAULT NULL COMMENT 'sdt',
  `customer_email` varchar(60) DEFAULT NULL COMMENT 'email',
  `customer_address` varchar(255) DEFAULT NULL COMMENT 'địa chỉ',
  `customer_birthday` date DEFAULT NULL COMMENT 'ngày sinh',
  `customer_gender` char(20) DEFAULT NULL COMMENT 'giới tính',
  `customer_note` varchar(1000) DEFAULT NULL COMMENT 'mô tả, ghi chú',
  `customer_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`),
  UNIQUE KEY `customer_username_UNIQUE` (`customer_username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomer`
--

LOCK TABLES `tblcustomer` WRITE;
/*!40000 ALTER TABLE `tblcustomer` DISABLE KEYS */;
INSERT INTO `tblcustomer` VALUES (1,'gangplank','fe01d67a002dfa0f3ac084298142eccd',NULL,NULL,NULL,NULL,'2003-12-31',NULL,'just a note.','2024-11-30 01:15:02','2024-11-30 01:20:12'),(3,'customer2','a11c1e7006223a2a80bd295e96566d6e',NULL,NULL,NULL,NULL,'2003-01-07',NULL,'just a note.','2024-11-30 01:17:27','2024-11-30 01:17:27'),(4,'customer5','a11c1e7006223a2a80bd295e96566d6e',NULL,NULL,NULL,NULL,'2003-10-31',NULL,'just a note.','2024-11-30 01:18:44','2024-11-30 01:18:44');
/*!40000 ALTER TABLE `tblcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemployee`
--

DROP TABLE IF EXISTS `tblemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblemployee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_username` char(60) NOT NULL COMMENT 'tên đăng nhập',
  `employee_password` char(60) NOT NULL,
  `employee_fullname` varchar(255) DEFAULT NULL COMMENT 'tên đầy đủ',
  `employee_phone` char(20) DEFAULT NULL COMMENT 'sdt',
  `employee_email` varchar(60) DEFAULT NULL COMMENT 'email',
  `employee_address` varchar(255) DEFAULT NULL COMMENT 'địa chỉ',
  `employee_birthday` date DEFAULT NULL COMMENT 'ngày sinh',
  `employee_gender` char(20) DEFAULT NULL COMMENT 'giới tính',
  `employee_note` varchar(1000) DEFAULT NULL COMMENT 'mô tả, ghi chú',
  `employee_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  UNIQUE KEY `employee_username_UNIQUE` (`employee_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemployee`
--

LOCK TABLES `tblemployee` WRITE;
/*!40000 ALTER TABLE `tblemployee` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblroom`
--

DROP TABLE IF EXISTS `tblroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblroom` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) NOT NULL,
  `admin_id` int NOT NULL COMMENT '1 admin sở hữu nhiều phòng',
  `room_image` blob NOT NULL COMMENT 'ảnh minh hoạ phòng',
  `room_size` double NOT NULL COMMENT 'diện tích phòng, theo m2',
  `room_bed_count` int NOT NULL COMMENT 'số giường trong 1 phòng',
  `room_star_count` int NOT NULL COMMENT 'số sao của phòng, từ 1 sao đến 5 sao',
  `room_price_per_hour_vnd` double NOT NULL COMMENT 'Giá tiền thuê phòng trong 1 giờ',
  `room_is_available` tinyint(1) NOT NULL COMMENT 'phòng có sẵn sàng để dùng hay không.',
  `room_note` varchar(1000) NOT NULL COMMENT 'mô tả, ghi chú',
  `room_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `room_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_id_UNIQUE` (`room_id`),
  KEY `tblroom_ibfk_1` (`admin_id`),
  CONSTRAINT `tblroom_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `tbladmin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblroom`
--

LOCK TABLES `tblroom` WRITE;
/*!40000 ALTER TABLE `tblroom` DISABLE KEYS */;
INSERT INTO `tblroom` VALUES (1,'room1',1,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�Photoshop 3.0\08BIM\0\0\0\0\0h(\0bFBMD0a000a6f0100007b04000099090000930a0000d90b00000b1100006a1800001b190000481a0000a91b000067270000\0�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((�\�\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0+\';Q@\�\�:9-V\�z��\�%ܝ�-}\�y\�\�V�3hD݁[�d�_Y\�\�4JsU�r\�\�\� �/�\�t2Z�]�\�y��b�\�XT#��\�\�\�W�\\\�VzM�\��z��\�C\�kx%Y`�\Z�r�\�\\\�8Ժ*�\�e�csX��^\�2�n�O>�8m\�DA�\�j\�\"�7�\�\�ӼⒼ�ʆ%:12X\�N\�K�νOx<U��\�YF���$E��0S[�\�N\�F�ܒ	[2G\'��\�+\�\�u$�\�$r>I#����5,Ӄ��Y��x~�]�rS�X�}/\�=��ީz\�asƱ\�c\�;�y�m�$gD�����G�\�v�\�Y����ptp�NS7F#6�l�\�㸌䓎2^!l���\�F\���zp��\�Y�\�+D�d\'�\�U7U��4\��;2T4��g�9-{\\ܶ�$\�;Y?f6\�E\�X��/ЈM!(��	Ԓ\��N���\�\"ú�.�1\�~�kʶFT:��\�X��G�^\�&��\���U^\�F�#t:2\�Le��)|p�01L|o`����h,s��\\���WRPx\�sz��E	�ԉ+���\�\�5F�\�7Sf\�K���N.m-+�+W�\�6|���\'�q\�Y\�Q%Qjɋ���<r��KF�W�єqae\��\�=y��w;\�t\"�\�)#oL.\��\�Wk\�uQ��z���ς�+�\�	\�9\�آ\�C\06&�o˯>�\rw>�/\�zY\�ӯ`H\�D�-`(u#\�W0�!9�J\�xԤ�a.~�/J���\�Ob[�\�=&[%U�\�Jx��\��IXRI�\�\0-\0\0\0\0\0\01!23\"A#4 $C%B�\�\0\0�\0�L�\Z�?p\�br�\�{o�laZ�t�|h&*��.�	W\�_6����k��i\�|3��o%���NF�j\�\�_Ĝ\�\�Y�\�\�~\�L_�fg�\�>\�/�ͺM|\��\���\��U(\�\�[Bb|I͞\�5��\�|ʢ|\"ey\�_3\"�[\'}�UlvW�{5d\�3����YZ��G\�п\Z�g�\�r�\�\�|B_�./�R�+\�m�&ï\��S���-�\�\�E��\�\�q�=ߧ<㏍yw�\�=+��F�MD[A�\�\�~��\�\��;x8�f\�d����	^v/@Ҽ��\�\�r�E�loj�>4\�_P\'Q����\�׋��Xp�6\n\�t\�;`�?>�,^G5�?f��\��hf��\�\�+\'r�Dn#s\�9y�\�\��`\��\0(���˄\�];�N\�-�f��u2ˮ\�|��+�/t95ja\�9�\�\�w�}DwJ�ޣ3�w��\�χ�����1�\0�]ﲼm�\�X�s?���zh&ŝ�V�ȹ\�m6�Cfv\��\�vN\�\�,�\n{��\���m\��y\��O��Y��\n�\�_7�\�Q)Mg[J\�\�\�P�Rw@u%�!,���~[�\�W�i\�I�\�6�&m�#\"\�v�o��\�YӲ\�Em`����d涐[�\'{8���:}�7\��\�ߑ\Z�If[�ܐ\�N�v@\�{y~\�\���;1��/j���\�\�2\���Nʈ��[�\�^\�\�\�a\r� mes)�P\n\�e\�\�/\�QȬ�s��1v+��d?r\�OG+S���Z\�����3\�O&Ygn�\�\�k\�jg�/�\��)�7\"�C�\��\�M\�\�񴙳H�%Z�r�uJ\��/m��؂(\0_]�\�P�tt\"�+�6�\�vr�Fq�li\��\\۴��~�V~\�Q\�\�*�\r��`�\�۬�Qe�\�3\��<�\0!\�ک\�*�\���\�\�@\�\�\�v\�\�]�)?\�9�\�.^@�\"\�o���qw\�e,��rO�\�\�+�\�YU��%��Y\�D�nm\�/8Ss\0��4{�ݐ�a�z\�S�\��\0�\�E���_��rr\ZS\�2i�\��!�̼S�er\�P\�\�ʛ^\�;m4\�\�\�\�fʩ\r���%\rvR\�1v\�*n�\��ڒşL|�ץ���\�\�W\0\�m�j\�ٕP��j\�\�l\"���4�\�\�N�U�x�ko\�a\�fu�OH�CBΪ4\�f��\�lQ眴�	\�Yg\�O\�\�ݹ�\�X͝�2b��\r%?H�.�i��`\�\n>�<K1��\�:��\�/E\�k��\�E\�6\�ٰMlY_���ٟ\�E\�\�j��\�\�d����zJ��UZr��U�e�\���\0\n��*J٩��T�\�{\�q�f�ey6���_�z2i�RwѦ\�\Zk4#B���:���K\�˦���\��n\�\��\�K�U\�!�g�\rbhտ}N�m�\0 ʷN\�;(ѩѿ�\�\0$\0\0\0\0\0\0\0\0\0\0!1 2A0Q\"�\�\0?+\�Q{\Z\�\�l\��|e�׎X�8\ZJ5�\�dQ4�GQD��w\��xy,\�_\�\�E9���\�g��Z�\�\�VዶUc�V\��\08��W\�Ur=ȭ+s8\�ͱh-Lt�\�\�,\�\\�:\�讐\�\�E�=�\�%L=�\�M�i\�\�xpW�i�dE\�ʭ1��\�rsR2�\���y\�:t�jsn\'Dt\�	\�\'^2B61�e�V��kc�\�|�K��\�y\��\�\0$\0\0\0\0\0\0\0\0\0\0!1A\" BQ2�\�\0?�\�ӌ�\��Ad\�<\��3���#Ş�\�L�Q\�X\�Z~ןၝ\�pG��#P\�Q�#;�\�\\�w��;�B�̲1�\'\r&OTZ\��\n�\�t.?GS�\�8*��FVkR�-�:\�JR(Gw�CG�\�=	b�\�G�t#Ԉ\�ơ�l.7�m)iG�\�ft!;yҰ�-�CY1j�Y��z�AMoJ\�\�5��\�Ʀƃ6\Zܤ��FvH�h]�#�=%\ZR�ɸ\�I�!\�H�N�^�\�*\�\�CT�X#\�Ԅ\�\'ѫ�|\����\�V�\��7,�\�\�b\�\'\�֕�G-d�\�\05\0\0\0\0\0\0\0\0!\"1AQ aq�#20BRbr�3����C��\�\0\0?m��\�{���;*\�=�b��ET�Bw�\�u�C��\\\�5UN\�C�\�\�\�\�\�BV\�\�H1ƒ�H\�\�\�E�#aG��:*\�&A5\�\"E(�\Z�\�x�\�Nj��X;\�rW�L\\\�\�Q\��\nu�\�<\�\�H,�����)vea�@<^B\�n\�S,\�c�xͅ:\�\Z�EE[*�抰\�L\�ցa�p�>s�q-���0�\�q\�\�\n}���|RL\�rРfJ%�L�1�\'���o�29YH�\�ךb�\�􋺡y]n^\�\�\�qֽKE�Y�E�n�6�A\�\�f\�B7*����nhS�\0\�KQ\�M�c�\�\��̂>rԢ^\�K���\�QI\�$\0M\�\�Ą�5Lh�h��\�e�n\\\�\�^\�@�:�\�dW�ZIS-P����Z�\�H\rj\'ᜂ|G}���~���j�\"���\0P#EqԿdܤ\��\0\�\�!�\0��٪�)��Gg!�k\�g\�d�;\�a�i�Rw\�=t���\'r�\�\�>a^\"��\�wA\�ns\'u\�\'T{�\�\�z�s���SSo~vM�f�\�Π�y8��\0�ou5 1,o�)�\�e4\�p^Y�Rx.��t\nNk�P�\�\� x4f\�\'{<j=�a����N��ed@hL���\�U�F_S�����W�+Ţ}J��\0�\�|.Y�P%�W�	��ص1ٹ��\ncU�L[��k�E�{��DnN\�\�k�[3�-f[�\':��X�w7^�ש߅$:�\�\�0���\�\�**�Y\�^\�\�_v%ўEW;:R\��Kv��i\�*�\�4\\~dAn�\�\�wLx\�s@\�OUO£ְj\�%_�]�\�-\��wT��\0ʈc<�6�D�	�\�̄O\�U�T\�Q\�p\�JDn�,�,Va^f\'|��\�P�7��WL�F\��n\�d8�\����D��\0\�y\�G�0�3\��\0�\�\�\�\\�7�\�!x���\�l-\�$�D��gd\�Q3\� �49\�\�;\�ȣ\�Y�(?p�\��6�oJ�M@/Y� \�(wC\�wz�A��ʪ\�;�\�\��\�b���q�k3�s�D���^\��|I��\0i�Lmd�\�t)�\�Vk1�P\�; \�2�m\'\�]�\�\�)\n515],���?j(�f8ڬ8��\�8.<\�/.\�;IR�g.\�\�\�����K\�/xmq95��3MU\0#�c�\��Z�\�E��j�:�zڙ��o5V�\�\�x\"�\�Jr\�n�+\�sЬm#��I��ܼ\�į\�-\�P\Zؠ��I�\rF#E\�2\�ݩ��S�H�idW�-b!v5\�t{��y�0\�ƸKr�\����o\r�U9��\ZN�r:\�)�NvQ\�[/2O6\�Xb}\�M�x�Ԉ�Si#��PD01��aF1�?iQ{\'n���YUE��E\"�U�=�h�\�|l�5�g6\�Fi\��#\�D`\�U�\�\0\'\0\0\0\0\0\0\0!1AQaq����� \��\���\�\0\0?!��ы�*\n6��d�m���\�\�{\�N_�\�\�:%\���_$7�!a�?��>��x<$\�u\�,\0Eͳ\�S6\��%\�L�L�\�\�\�0�\�\���w\�f\�\�P\�\�;\�\�y��4�\�\�[	U\Z6��+��\�\�:a+K\�*d\��ʟf}��zXE���\�\�{}J(Fd~�3i\�=��C��C/h�9\\g��\��Ѥ�%��\�[\�{-\�\Z���sW�B\�ŋHs\�~\�#�j;=�RPX��fea}%.�Jn�i\�.�e��%�ܲ�o�V���l\�ooI�ҹ~��s\�f�\�6,l��řnӞ3�1�rЅ�\�O\�^\�+de\�\�3\�\�]tܥ�^�+M?3G�M\�w\�\�\Z�;��7\�Vn�Gs�\0�U!*4\�*�\�2\�^�r\�\"�I�)Rq�\n��͏\�\�9C)��&�\0���\n;�2d����?ĳ\��d�!�0:!`�\�hT\�[�8�k�,8NS\��+\�3�a�<Ѐ�� j�5Y\�-U#����k�O�\�)6L�\�19>h�\�螅C�v�B�|Jz@���xt�\�\�V^!K;>\�\"\�	R`BURS\�9<\�$J�7���\�R\�7\��\��&}3�@�	w�J��]F��5mX[=\�t\�X����I\�Y���\0v��#q\�\���<��l7\�;��\r=-Q\�~�!\�\�~�����\�|\"��g���l���\\�\�]���\�[6R\�1\�\�b�و.�ڛ\��E0`�+>��\�\�6B	 \��\�\�s\�(\�:<�\�Q\��\�	+\��)�7\�yy�ʣ�h�U\�?3B\�T�p\�\�cj��Γ/j:&\�8ea\�o5\�l�*�6�ugBa*~\�}\�)?4\r�R	zq�\0P-�0�rOb\�Z�F�aO�vA�`י\�h�{E23ĭV��gG\�\���\�0\�~��\�\�\�Q\��\�m@pa\�\�\�\�E��\�x�\�\�	ښ�8\�\�6`�7G�i�\�S�J\�7r۔<\�\0]��f0s��\�G\�\��_,J\�����n���e�r�\�\�8�.�D�Gc��G��6\0\�:7\�\�19�\�\�òf�Q\Z���\�Gb\�\'>D�	+\�\��\0&m�\�2�Į��\")�S9�\\}�\�\�\��w���\�\�\�\r-\�-�\\[7�\�3\���\��\\ŮW\��ڹIK����)��D\�^�|%\��\�Zc�40��0\�\�0�\�(��(g\�d5n��x�\n\�(Z�w�\�e���P�\�\��j\\�zǅ�ׄ�\��{58���<Y�Fƾ�=\�\��\0Q\\P�����HcX�>����ƣ�3�\�\�.�*�	X��\�2�g�\�\�\"�]�u�X���Ġ�k�@�\�\�k�5Sh\�f�\�Js=��1�\�4ܹ8c��\�jd=��9\'�)Z2�O��.\����Կ�Rݭ���� U[���AGjP4q����\�\�X�A�\�A�Bv�̫\�_n�j���&��:/xg\�~el\�A��L\�zv��~ga\��`_�k���\��?tA���w.\�\� r�x����\�u\�̽�2F\�12�t\�/#�&Sڝ�~\�\��4)\�!�,�eC���Ey�Qk\�\0���》\�Nf\�\�[�?G��ˤR\Z�Q9Iy�@/2\��L&Ho\�5(Vt}\�>oܦM_1VP-9��B㣦���� a�hV+�\��z����\04cl=F\�jS!Y����\�\n�U\�~ѣ$�\�\�U\�\�*67t}�\�ךJ{j$����q�\���w\�S�@�F\�X�þ�:��^\�V\�3\�I�?\"kaJ�	c����\r�1jO��\�^��F:�\��\0d[bxjxJ\�{KdI�ш��x���\�\�\�ǻ��-q5�3\0��\"\�.\�K\�h�PAψ��bQ+��v\��\0r�\�X\�\�\�\��\��sp\�\�̟��_\�\��L?$\�t\rr\�%K�z��\'DY�\�~\��( ��\����*���W��1�\�@�j�8E{s�s4\�:�J[�\'\n�#�U�h�Pȑ\�o_\���\��/��y��H�!(f\��0\�Ε�\0�W\���\��\�\0\0\0\0\0\0��\�Ss)��\�9�\0[F��3�qp&_�I=d�\���r�3\����\�\�\�%�\�\�x�6���I߽�kϷ�+�Wq\�#��˸��,7�\�{n>�N�\�ʉ2\�\�b�agm�\�\n|Mz�\�\�f\�W�sZ;~-�@\���\�|��\��\�\0!\0\0\0\0\0\0\0\0!1A aQ��q��\�\0?aB�\�qͶ�=��R\�$\�}�\�\"z�\�@\�_c� �g�ŏ\0ϰ�\��\�q�}�aM\r$3n���>�\0^��K\�\�=~\��g��\n�\����t%�ϳ\�t˿�F�\��\r��-\"y#&j�7\�Yz-�Ŋ+\�ٱ�N�pz�\�}\�x\�\�(\�*y���\���a[�3Ȼ!�\�}�^9�%k��\0�\r�=Z;[\ZB\��l\02�g�n\�\�\�T���\�zr��(�\0\�\�\�\�,�\�\���?-;*�9.ߨ�k\�t�/\�\0��\�\Z�ba�yȼ6�I��\�\0&\0\0\0\0\0\0\0\0\0!1AaQq�\�\�� �����\�\0?�\�\�\"\�R��E~a�b\�\�.D-E��\��!(\�>�\'\�\�f[���;q...9e;E�\r�\��Up���\�6��<�\�470U�6Ԥaj�)��#T7`Eil\�^zŭ\�W\�-�#B�4\�O\"10\�?��5\�\�}n\�\�L�6�\Z:K�؅9e\�̹�y(�^\�(en\�1E��\�J�VD�!jʦi4\�\�\�!a��\0��G���\��;*},�&jMBn#u\�[f�#a-��;j�\�>\�ˊa��8\�`I\�!0	U��&Ox\�&\ZG��sD��>��\�f�\��b�\�|\�\Z)\�>,$�wΕr����?I�\�\0&\0\0\0\0\0\0\0!1AQaq�����\��\���\�\0\0?-\�D9!��̱%�ܯ@i�~D5�Yj)L\�8�0\�1Y_\�\�U��M�x�\�+Q��\0w\��ɱ\���ܵ�Ȟ\�_]���g\��T\�-p�\'�W�g0��/\�I\�IH� �\"��/QC|XȚv b\�Y�\"��\0\n��\�W�>�\�\�grs|\�\�2�?���\�i\�9:��͈n�\�<�D0KK5���-� \0V]�\�<���g�\�\r�h\�a\�\�u\�My�5��FaL\���^)�0Om>f\���}\�.��M�ۃ^\��i��U�j\�[��A�4B?X�D\�qRӅȧ���##��|[h�U^\�>\Z\�>!\0\n�!�6\�Ȍǽ�\�\�\���{��\��:L\�	��\�.\�3\�t��V\�k�\�<|A��\���\r�\�yf�؂\�\�\��N�«NL+\�q�C+z�E�˘�\�k_���}�<�L\�,xL<\�?w\�\�\�\�7��T�\0�F+�M\0��-b\��\�f9X�B#f�c��\�j)�[\�\�\�s�)W��\�\\#^\�\� ��^d s1V�갧\�?.>\�\��\0u5O�~�\�wJ�\�?�\�n�٠ew\n��J��\�!Qp.G�m�D\�\�\Z�2\�)\�f%j�=E��þ�J���\�Ew�\�\�Cg(\�>�P0+\�6�\0	8����?8$�s�B;s��\�p\�0�@POx\�|t�	!�vLű9��\�Ue����\�	[@���\�+-ʓ0˙�\�X\����s*>�H�a+�\��R�\�|\r%@@-�o?�b��B\�\�\�}a�#%q�KN��I��Қ��^ߕ\�\�\�[\�D���Z�c\�\�ћ\�Y��cxoVwY��p_�B)�[<D� \�\\pOg\�>�%8ľ\�s��B�\�NYF-]\r02K{��\�gm��wF�\���l<�\�_\�\"�Kz\�-e�PN�\�}\�&������GYx\��&6s\�\�;����Gk�܂t��!�O�.>��\�\�!�꜃Pb�^��;���\��ul����]JW�q�	\0q��c\0|U\�AB΃��R�\�s-\�{\�)E�\�ʾn\�\r\�:�=�jPA�:\��5�\��*\�98�\0I�|�\�Ϸ1}e��\�0�c�$���o\�7e\"nd�J\��Jc4\Z���\�Lr\�]/�Z\���4�tP�����\�6ۓ�\�1�������\�\�\�y �\�dU\�~�2�֞{���,56+��\�Ҹ)\�!\n^!�,��S����2LQ̓\�\ru�]�Z\�f�ջ��͡��\���L\�CQ\�7\�jUO��J\�\�p\�QI\��\�[��[ߴD6�\�ӂ�/�E\0(�/Y��P\�L�Y\�Լ_@�\�\�\�TU� o��\�P�wP\�gx\�#���}��hv��\�G/2��갤+,�\�Qn.\�}�N��Y�)\�\�*_!k�t\��)+\�3i\�\�YM#\��\05()\�;����(\�\��L\�����\�ݽ\�%-c�el*nV�Z�?$�dp\��w��\0\�\�8��f���\0]#g��A��(\�	�Uѕi]��� �lFolz���\��J\�q���h��]���{�1\�\�E\�I\�\�v0�b\�\�\�tb\�]K����!A~S���k�gp�R\�^ �\Z\�,�$��|�a$+�6�K:��g��\����8AD?\�����\�f-�5\��Tm\�tI�;\�+D T+F\0�uM�o3\�\�Y�\�YA*\�?R\�Ҋ\�\�o\��\�d\';�%]G�nT��N���hT\�L�/	�\�\�\�x��ܵVt�\�2\�W��\�\�{�\�\�CQ\�\r\�ױ�\�\0n�}��l�^�G\�o���\�@��HX��v\r�\�dMݱyk.D>X(�TH��]0�F�\�w\0@�1q�\"X\�\�R�\��\0ǈ\r\�c�S鯉�b\�q�Z�*2�\�\��c�ŀTVԎ(%S\�R��2�Ge\�\�H\�/�`i=�z\�\�\�o>�\'\�A~Y\�%��3\��v�3{y�+\0�DY��[a�~&�C��/�t�@)��Ttǃ?���?k��qmz\�rP���\"\�)[�\ZP%�\�v[��nk̴�]v�g߬6�\�\�\��\�-�qG�/\�͎\�pW��\0\�b�a�\��|�/7\�;t���\�~\���+\�]-�ZэCQbԾ:@\�W>z�����(Tp\��\��\�)� �pZ�P�\0E�tQ6e\�o\�\�I@T.�u`B \�r\�7C\�2ƻN�\0H��!�\�c]��\�e��l���LhD��c�.�\�\���\��4��3�EunW\�O\��\0\rF�\��@0u\\\�g�ĥ҄ԥ���V���`/.��G��ط��������7.\�.9X+�VZwX\�¢v�\�K\ZH=s7fk\�\rpec\�Dh�V��d�U�É\�?���\�n�;�w�h��1L��QD\�Q�hBk�\�\�z�)\��2��e�\'��\0P#\�~\�O��\\)݃\��\0%�t�}ԲP\�|�c�\��\�\�\�l�I\�\���v\n��\��\�\�l�;��\�\"\�+@���\���:��L\�\�Q�AP5J��!1Vto-�p\�\�$\�K�Z�\"�\�\0����m=0�U�\�P0�* ʪ�AIf�ì�~�UE�]\�>\�ǌ���\"~Q�01)I��~R\�`�?\�#����L�.\�\�c�Ԩ.֝�}q\�{��\�9`�om�\0�Vu��ϛ%G\0(\n��&fFT�p;��ʛ�*Tmc6f;)\�D9�\��\�0z_���\�m\�u\�\�\�y�=�o\�\Z+\\�\�%gA��?�\'�\�>��i7ܡŐ�\�{�}^\�Lb�)EÅ\�f\r)\\Vԫ\�R�\�W\�\Z\�YR\�R)��,Y\�%:�x�|x��O^��\��1�\�\�ݣ�џ�qQ�\�`\�䔔}J\�(�ypeZ��W%p-���K\�̪:�-b�!\�\�\0�Ԧ��\\{`}\\M\�\��\r��Ԩ0x}��A\��O�)	(�<ݏ��\�\�4\�\�ںA\�R��4335�ז\��\�q\�~�\�\n\�s��_ԡ`e\�{|J�%��3�jl�,��\�UH�p��28\�	�����\�-P�k�K\n m�no\�\��\�\����-΃��`W\r�q2\�eh�Y\��\�\�s+�\�\�\�%\Zq\�>�ש\�o]�\0>\�e\���������寨�c��)�ĩe� �\�Mv2�7[�\�\�,�\�F�\��`f��a,\�z5s\�m\�0{��\0���l_uKcT.��$�J���\��\�\�PB~B`\��9\�R12�v6�)\�uaԺb\�\Z\��E(\�\��\�)�BE�\�\�\�`�U�\�\�_�Q\�\��+gӇ\��\�',20.5,3,5,250000,1,'just a note.','2024-11-30 02:00:49','2024-11-30 02:00:49');
/*!40000 ALTER TABLE `tblroom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30 17:01:44
