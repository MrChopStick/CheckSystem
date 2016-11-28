-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: checksystem
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `check_list`
--

DROP TABLE IF EXISTS `check_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_list` (
  `check_id` int(10) NOT NULL AUTO_INCREMENT,
  `check_type` int(11) NOT NULL,
  `check_name` varchar(10) COLLATE utf8_bin NOT NULL,
  `check_detail` varchar(10) COLLATE utf8_bin NOT NULL,
  `check_result` int(1) NOT NULL COMMENT '结果格式',
  PRIMARY KEY (`check_id`),
  KEY `check_type` (`check_type`),
  KEY `check_type_2` (`check_type`),
  CONSTRAINT `check_list_ibfk_1` FOREIGN KEY (`check_type`) REFERENCES `eq_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='巡检项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list`
--

LOCK TABLES `check_list` WRITE;
/*!40000 ALTER TABLE `check_list` DISABLE KEYS */;
INSERT INTO `check_list` VALUES (1,1,'服务器测试检查','测试检查项',1),(2,1,'服务器测试检查2','测试检查项2',1),(3,1,'测试项3','Test',1),(4,1,'测试项4','Test',1),(5,1,'测试项5','Test',1),(6,1,'测试项6','Test',1),(7,1,'测试项7','Test',1),(8,1,'测试项8','Test',1),(9,1,'测试项9','Test',1),(10,1,'测试项10','Test',1);
/*!40000 ALTER TABLE `check_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_plan`
--

DROP TABLE IF EXISTS `check_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_plan` (
  `plan_id` int(10) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(10) COLLATE utf8_bin NOT NULL,
  `plan_cycle` int(11) NOT NULL,
  `plan_start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `plan_start_time` time NOT NULL,
  `plan_dead_time` time NOT NULL,
  `inspector_id` int(10) NOT NULL,
  `manager_id` int(10) NOT NULL,
  `plan_state` int(11) NOT NULL,
  `plan_note` varchar(140) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `inspector_staffID` (`inspector_id`),
  KEY `manager_staffID` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='巡检计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_plan`
--

LOCK TABLES `check_plan` WRITE;
/*!40000 ALTER TABLE `check_plan` DISABLE KEYS */;
INSERT INTO `check_plan` VALUES (3,'计划1',24,'2016-10-31 16:00:00','10:00:00','13:00:00',12345678,12345000,0,'测试计划1'),(4,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(5,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(6,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(7,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(8,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(9,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(10,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(11,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(12,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(13,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(14,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(15,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(16,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(17,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test'),(18,'test',24,'2014-12-31 16:00:00','09:00:00','10:00:00',12345678,12345678,0,'test');
/*!40000 ALTER TABLE `check_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_plan_detail`
--

DROP TABLE IF EXISTS `check_plan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_plan_detail` (
  `cd_id` int(10) NOT NULL AUTO_INCREMENT,
  `cd_plan_id` int(10) NOT NULL,
  `cd_eq_id` int(10) NOT NULL,
  `cd_check_id` int(10) NOT NULL,
  `eq_name` varchar(10) COLLATE utf8_bin NOT NULL,
  `check_name` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cd_id`),
  KEY `CD_pID` (`cd_plan_id`),
  KEY `CD_eID` (`cd_eq_id`),
  KEY `CD_cID` (`cd_check_id`),
  CONSTRAINT `check_plan_detail_ibfk_1` FOREIGN KEY (`cd_plan_id`) REFERENCES `check_plan` (`plan_id`),
  CONSTRAINT `check_plan_detail_ibfk_2` FOREIGN KEY (`cd_eq_id`) REFERENCES `eq_list` (`eq_id`),
  CONSTRAINT `check_plan_detail_ibfk_3` FOREIGN KEY (`cd_check_id`) REFERENCES `check_list` (`check_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='巡检项目详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_plan_detail`
--

LOCK TABLES `check_plan_detail` WRITE;
/*!40000 ALTER TABLE `check_plan_detail` DISABLE KEYS */;
INSERT INTO `check_plan_detail` VALUES (16,3,3,1,'测试服务器1','测试项目1'),(17,3,3,2,'测试服务器1','测试项目2'),(18,3,3,3,'测试服务器1','测试项目3'),(19,3,3,4,'测试服务器1','测试项目4'),(20,3,3,5,'测试服务器1','测试项目5'),(21,3,3,6,'测试服务器1','测试项目6'),(22,3,4,2,'测试服务器2','测试项目2'),(23,3,4,3,'测试服务器2','测试项目3'),(24,3,4,4,'测试服务器2','测试项目4'),(25,3,4,5,'测试服务器2','测试项目5'),(26,3,4,6,'测试服务器2','测试项目6'),(27,4,4,1,'测试服务器2','测试检查项'),(28,4,4,2,'测试服务器2','测试检查项'),(29,4,4,3,'测试服务器2','测试检查项'),(30,4,4,4,'测试服务器2','测试检查项'),(31,4,4,5,'测试服务器2','测试检查项'),(32,4,4,6,'测试服务器2','测试检查项'),(33,4,3,6,'测试服务器1','测试项目'),(34,4,3,8,'测试服务器1','测试项目'),(35,4,3,7,'测试服务器1','测试项目'),(36,4,3,9,'测试服务器1','测试项目'),(37,4,3,10,'测试服务器1','测试项目');
/*!40000 ALTER TABLE `check_plan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_result`
--

DROP TABLE IF EXISTS `check_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_result` (
  `result_id` int(10) NOT NULL AUTO_INCREMENT,
  `eq_id` int(10) NOT NULL,
  `eq_name` varchar(10) COLLATE utf8_bin NOT NULL,
  `check_name` varchar(10) COLLATE utf8_bin NOT NULL,
  `task_id` int(10) NOT NULL,
  `result_detail` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'result',
  `result_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`),
  KEY `ct_eid` (`eq_id`,`eq_name`,`check_name`),
  KEY `ct_cid` (`eq_name`),
  KEY `check_task_result_ibfk_3` (`check_name`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `check_result_ibfk_1` FOREIGN KEY (`eq_id`) REFERENCES `eq_list` (`eq_id`),
  CONSTRAINT `check_result_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `check_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='巡检任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_result`
--

LOCK TABLES `check_result` WRITE;
/*!40000 ALTER TABLE `check_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_task`
--

DROP TABLE IF EXISTS `check_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_task` (
  `task_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_start_time` time NOT NULL,
  `task_dead_time` time NOT NULL,
  `task_state` int(11) NOT NULL,
  `plan_id` int(10) NOT NULL,
  `inspector_id` int(11) NOT NULL COMMENT '巡检员ID',
  PRIMARY KEY (`task_id`),
  KEY `inspector_id` (`inspector_id`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `check_task_ibfk_1` FOREIGN KEY (`inspector_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `check_task_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `check_plan` (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='巡检计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_task`
--

LOCK TABLES `check_task` WRITE;
/*!40000 ALTER TABLE `check_task` DISABLE KEYS */;
INSERT INTO `check_task` VALUES (1,'09:00:00','10:00:00',0,3,123123123),(6,'14:00:00','16:00:00',0,4,66773322);
/*!40000 ALTER TABLE `check_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'巡检部'),(2,'管理部');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eq_group`
--

DROP TABLE IF EXISTS `eq_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eq_group` (
  `group_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(10) COLLATE utf8_bin NOT NULL,
  `group_manager` int(10) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `eg_manager` (`group_manager`),
  CONSTRAINT `eq_group_ibfk_1` FOREIGN KEY (`group_manager`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='设备分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eq_group`
--

LOCK TABLES `eq_group` WRITE;
/*!40000 ALTER TABLE `eq_group` DISABLE KEYS */;
INSERT INTO `eq_group` VALUES (2,'',12345678);
/*!40000 ALTER TABLE `eq_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eq_list`
--

DROP TABLE IF EXISTS `eq_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eq_list` (
  `eq_id` int(10) NOT NULL AUTO_INCREMENT,
  `eq_name` varchar(10) COLLATE utf8_bin NOT NULL,
  `eq_state` int(11) NOT NULL,
  `eq_group` int(10) NOT NULL,
  `eq_type` int(11) NOT NULL,
  PRIMARY KEY (`eq_id`),
  KEY `eq_group` (`eq_group`),
  KEY `eq_type` (`eq_type`),
  CONSTRAINT `eq_list_ibfk_1` FOREIGN KEY (`eq_type`) REFERENCES `eq_type` (`type_id`),
  CONSTRAINT `eq_list_ibfk_2` FOREIGN KEY (`eq_group`) REFERENCES `eq_group` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='设备表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eq_list`
--

LOCK TABLES `eq_list` WRITE;
/*!40000 ALTER TABLE `eq_list` DISABLE KEYS */;
INSERT INTO `eq_list` VALUES (3,'Server1',1,2,1),(4,'server4',0,2,1);
/*!40000 ALTER TABLE `eq_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eq_type`
--

DROP TABLE IF EXISTS `eq_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eq_type` (
  `type_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '设备类型',
  `type_name` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='设备分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eq_type`
--

LOCK TABLES `eq_type` WRITE;
/*!40000 ALTER TABLE `eq_type` DISABLE KEYS */;
INSERT INTO `eq_type` VALUES (1,'服务器');
/*!40000 ALTER TABLE `eq_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_list`
--

DROP TABLE IF EXISTS `repair_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair_list` (
  `repair_id` int(10) NOT NULL AUTO_INCREMENT,
  `repair_eqid` int(10) NOT NULL,
  `repair_detail` varchar(100) COLLATE utf8_bin NOT NULL,
  `repair_state` int(11) NOT NULL,
  `repair_inspector_id` int(10) NOT NULL,
  `repor_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上报时间',
  `m_got_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '管理员接收时间',
  `m_deal_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '管理员处理完成时间',
  `i_got_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '巡检员接收时间',
  `i_arrive_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '巡检员到达现场时间',
  `i_dealTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '巡检员处理完成时间',
  `finish_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`repair_id`),
  KEY `order_sID` (`repair_inspector_id`),
  KEY `order_eqID` (`repair_eqid`),
  KEY `repair_eqid` (`repair_eqid`),
  CONSTRAINT `repair_list_ibfk_1` FOREIGN KEY (`repair_inspector_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `repair_list_ibfk_2` FOREIGN KEY (`repair_eqid`) REFERENCES `eq_list` (`eq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='报修表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_list`
--

LOCK TABLES `repair_list` WRITE;
/*!40000 ALTER TABLE `repair_list` DISABLE KEYS */;
INSERT INTO `repair_list` VALUES (1,3,'测试损坏',0,12345678,'2016-11-12 07:30:07','2016-11-01 16:00:00','2016-11-02 16:00:00','2016-11-03 16:00:00','2016-11-04 16:00:00','2016-11-05 16:00:00','2016-11-12 07:54:08'),(2,3,'test',0,12345678,'2016-11-12 07:47:08','2016-10-31 16:00:00','2016-11-01 16:00:00','2016-11-02 16:00:00','2016-11-03 16:00:00','2016-11-04 16:00:00','2016-11-05 16:00:00');
/*!40000 ALTER TABLE `repair_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staff_id` int(10) NOT NULL,
  `staff_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `staff_job` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `staff_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `staff_power` int(11) NOT NULL,
  `staff_passwd` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (12345678,'张*','管理员','12345678900',1,'1234',2),(66773322,'王*','巡检员','12345677',1,'1234',2),(123123123,'李*','巡检员','12315',1,'1111',2);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-28 20:05:00
