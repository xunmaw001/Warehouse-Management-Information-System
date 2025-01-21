-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: ssmwhkb8
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Current Database: `ssmwhkb8`
--

/*!40000 DROP DATABASE IF EXISTS `ssmwhkb8`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ssmwhkb8` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ssmwhkb8`;

--
-- Table structure for table `cangkugonggao`
--

DROP TABLE IF EXISTS `cangkugonggao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cangkugonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) NOT NULL COMMENT '标题',
  `jianjie` longtext COMMENT '简介',
  `fabushijian` date DEFAULT NULL COMMENT '发布时间',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `neirong` longtext COMMENT '内容',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1645257140264 DEFAULT CHARSET=utf8 COMMENT='仓库公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cangkugonggao`
--

LOCK TABLES `cangkugonggao` WRITE;
/*!40000 ALTER TABLE `cangkugonggao` DISABLE KEYS */;
INSERT INTO `cangkugonggao` VALUES (21,'2022-02-19 07:44:43','标题1','简介1','2022-02-19','upload/cangkugonggao_fengmian1.jpg','内容1','2022-02-19 15:44:43',1),(22,'2022-02-19 07:44:43','标题2','简介2','2022-02-19','upload/cangkugonggao_fengmian2.jpg','内容2','2022-02-19 15:44:43',2),(23,'2022-02-19 07:44:43','标题3','简介3','2022-02-19','upload/cangkugonggao_fengmian3.jpg','内容3','2022-02-19 15:44:43',3),(24,'2022-02-19 07:44:43','标题4','简介4','2022-02-19','upload/cangkugonggao_fengmian4.jpg','内容4','2022-02-19 15:44:43',4),(25,'2022-02-19 07:44:43','标题5','简介5','2022-02-19','upload/cangkugonggao_fengmian5.jpg','内容5','2022-02-19 15:44:43',5),(26,'2022-02-19 07:44:43','标题6','简介6','2022-02-19','upload/cangkugonggao_fengmian6.jpg','内容6','2022-02-19 15:44:43',6),(1645257140263,'2022-02-19 07:52:19',' 给对方给对方','的给对方刚发的给对方给对方给对方给对方的给对方刚发的给对方给对方给对方给对方的给对方刚发的给对方给对方给对方给对方','2022-02-19','upload/1645257130721.jpg','<p>的给对方刚发的给对方给对方给对方给对方的给对方刚发的给对方给对方给对方给对方的给对方刚发的给对方给对方给对方给对方的给对方刚发的给对方给对方给对方给对方的给对方刚发的给对方给对方给对方给对方的给对方刚发的给对方给对方给对方给对方的给对方刚发的给对方给对方给对方给对方的给对方刚发的给对方给对方给对方给对方的给对方刚发的给对方给对方给对方给对方</p><p><img src=\"http://localhost:8080/ssmwhkb8/upload/1645257138913.jpg\"></p>','2022-02-19 15:55:48',2);
/*!40000 ALTER TABLE `cangkugonggao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cangkuxinxi`
--

DROP TABLE IF EXISTS `cangkuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cangkuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cangkubianhao` varchar(200) DEFAULT NULL COMMENT '仓库编号',
  `cangkumingcheng` varchar(200) NOT NULL COMMENT '仓库名称',
  `cangkudizhi` varchar(200) DEFAULT NULL COMMENT '仓库地址',
  `mianji` varchar(200) DEFAULT NULL COMMENT '面积',
  `zhuyaoyongtu` longtext COMMENT '主要用途',
  `xiangqing` longtext COMMENT '详情',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cangkubianhao` (`cangkubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1645257267304 DEFAULT CHARSET=utf8 COMMENT='仓库信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cangkuxinxi`
--

LOCK TABLES `cangkuxinxi` WRITE;
/*!40000 ALTER TABLE `cangkuxinxi` DISABLE KEYS */;
INSERT INTO `cangkuxinxi` VALUES (51,'2022-02-19 07:44:43','1111111111','仓库名称1','仓库地址1','面积1','主要用途1','详情1','upload/cangkuxinxi_tupian1.jpg','2022-02-19 15:44:43',1),(52,'2022-02-19 07:44:43','2222222222','仓库名称2','仓库地址2','面积2','主要用途2','详情2','upload/cangkuxinxi_tupian2.jpg','2022-02-19 15:44:43',2),(53,'2022-02-19 07:44:43','3333333333','仓库名称3','仓库地址3','面积3','主要用途3','详情3','upload/cangkuxinxi_tupian3.jpg','2022-02-19 15:44:43',3),(54,'2022-02-19 07:44:43','4444444444','仓库名称4','仓库地址4','面积4','主要用途4','详情4','upload/cangkuxinxi_tupian4.jpg','2022-02-19 15:44:43',4),(55,'2022-02-19 07:44:43','5555555555','仓库名称5','仓库地址5','面积5','主要用途5','详情5','upload/cangkuxinxi_tupian5.jpg','2022-02-19 15:44:43',5),(56,'2022-02-19 07:44:43','6666666666','仓库名称6','仓库地址6','面积6','主要用途6','详情6','upload/cangkuxinxi_tupian6.jpg','2022-02-19 15:44:43',6),(1645257267303,'2022-02-19 07:54:27','1645257253731','第一仓库','水电费时代','44','的发送到发顺丰时代发多少发送到发送到发生电商发送到的发送到发顺丰时代发多少发送到发送到发生电商发送到','<p>的发送到发顺丰时代发多少发送到发送到发生电商发送到的发送到发顺丰时代发多少发送到发送到发生电商发送到的发送到发顺丰时代发多少发送到发送到发生电商发送到的发送到发顺丰时代发多少发送到发送到发生电商发送到的发送到发顺丰时代发多少发送到发送到发生电商发送到的发送到发顺丰时代发多少发送到发送到发生电商发送到的发送到发顺丰时代发多少发送到发送到发生电商发送到</p>','upload/1645257261192.jpg','2022-02-19 15:55:57',2);
/*!40000 ALTER TABLE `cangkuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg'),(2,'picture2','upload/picture2.jpg'),(3,'picture3','upload/picture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gongyingshang`
--

DROP TABLE IF EXISTS `gongyingshang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gongyingshang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bianhao` varchar(200) DEFAULT NULL COMMENT '编号',
  `mingcheng` varchar(200) NOT NULL COMMENT '名称',
  `fuzeren` varchar(200) NOT NULL COMMENT '负责人',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `beizhu` longtext COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bianhao` (`bianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1645257159062 DEFAULT CHARSET=utf8 COMMENT='供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gongyingshang`
--

LOCK TABLES `gongyingshang` WRITE;
/*!40000 ALTER TABLE `gongyingshang` DISABLE KEYS */;
INSERT INTO `gongyingshang` VALUES (31,'2022-02-19 07:44:43','1111111111','名称1','负责人1','13823888881','地址1','备注1'),(32,'2022-02-19 07:44:43','2222222222','名称2','负责人2','13823888882','地址2','备注2'),(33,'2022-02-19 07:44:43','3333333333','名称3','负责人3','13823888883','地址3','备注3'),(34,'2022-02-19 07:44:43','4444444444','名称4','负责人4','13823888884','地址4','备注4'),(35,'2022-02-19 07:44:43','5555555555','名称5','负责人5','13823888885','地址5','备注5'),(36,'2022-02-19 07:44:43','6666666666','名称6','负责人6','13823888886','地址6','备注6'),(1645257159061,'2022-02-19 07:52:38','1645257144835','第一供应商','时代','11122233333','时代发送到发送到','是发送到发送到发送到发送到');
/*!40000 ALTER TABLE `gongyingshang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huowuchuku`
--

DROP TABLE IF EXISTS `huowuchuku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huowuchuku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `chukubianhao` varchar(200) DEFAULT NULL COMMENT '出库编号',
  `huowubianhao` varchar(200) DEFAULT NULL COMMENT '货物编号',
  `huowumingcheng` varchar(200) DEFAULT NULL COMMENT '货物名称',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `kehu` varchar(200) DEFAULT NULL COMMENT '客户',
  `chukuriqi` date DEFAULT NULL COMMENT '出库日期',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chukubianhao` (`chukubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1645257384209 DEFAULT CHARSET=utf8 COMMENT='货物出库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huowuchuku`
--

LOCK TABLES `huowuchuku` WRITE;
/*!40000 ALTER TABLE `huowuchuku` DISABLE KEYS */;
INSERT INTO `huowuchuku` VALUES (81,'2022-02-19 07:44:43','1111111111','货物编号1','货物名称1',1,'客户1','2022-02-19','备注1','账号1','姓名1'),(82,'2022-02-19 07:44:43','2222222222','货物编号2','货物名称2',2,'客户2','2022-02-19','备注2','账号2','姓名2'),(83,'2022-02-19 07:44:43','3333333333','货物编号3','货物名称3',3,'客户3','2022-02-19','备注3','账号3','姓名3'),(84,'2022-02-19 07:44:43','4444444444','货物编号4','货物名称4',4,'客户4','2022-02-19','备注4','账号4','姓名4'),(85,'2022-02-19 07:44:43','5555555555','货物编号5','货物名称5',5,'客户5','2022-02-19','备注5','账号5','姓名5'),(86,'2022-02-19 07:44:43','6666666666','货物编号6','货物名称6',6,'客户6','2022-02-19','备注6','账号6','姓名6'),(1645257384208,'2022-02-19 07:56:24','1645257377925','1645257309298','第一货物',25,'电饭锅','2022-02-19','的份上','11','时代');
/*!40000 ALTER TABLE `huowuchuku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huowuruku`
--

DROP TABLE IF EXISTS `huowuruku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huowuruku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `rukubianhao` varchar(200) DEFAULT NULL COMMENT '入库编号',
  `huowubianhao` varchar(200) DEFAULT NULL COMMENT '货物编号',
  `huowumingcheng` varchar(200) DEFAULT NULL COMMENT '货物名称',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `gongyingshang` varchar(200) DEFAULT NULL COMMENT '供应商',
  `rukuriqi` date DEFAULT NULL COMMENT '入库日期',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rukubianhao` (`rukubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1645257395525 DEFAULT CHARSET=utf8 COMMENT='货物入库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huowuruku`
--

LOCK TABLES `huowuruku` WRITE;
/*!40000 ALTER TABLE `huowuruku` DISABLE KEYS */;
INSERT INTO `huowuruku` VALUES (71,'2022-02-19 07:44:43','1111111111','货物编号1','货物名称1',1,'供应商1','2022-02-19','备注1','账号1','姓名1'),(72,'2022-02-19 07:44:43','2222222222','货物编号2','货物名称2',2,'供应商2','2022-02-19','备注2','账号2','姓名2'),(73,'2022-02-19 07:44:43','3333333333','货物编号3','货物名称3',3,'供应商3','2022-02-19','备注3','账号3','姓名3'),(74,'2022-02-19 07:44:43','4444444444','货物编号4','货物名称4',4,'供应商4','2022-02-19','备注4','账号4','姓名4'),(75,'2022-02-19 07:44:43','5555555555','货物编号5','货物名称5',5,'供应商5','2022-02-19','备注5','账号5','姓名5'),(76,'2022-02-19 07:44:43','6666666666','货物编号6','货物名称6',6,'供应商6','2022-02-19','备注6','账号6','姓名6'),(1645257395524,'2022-02-19 07:56:34','1645257388496','1645257309298','第一货物',500,'第一供应商','2022-02-19','水电费水电费时代','11','时代');
/*!40000 ALTER TABLE `huowuruku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huowuxinxi`
--

DROP TABLE IF EXISTS `huowuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huowuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `huowubianhao` varchar(200) DEFAULT NULL COMMENT '货物编号',
  `huowumingcheng` varchar(200) NOT NULL COMMENT '货物名称',
  `huowuleixing` varchar(200) NOT NULL COMMENT '货物类型',
  `huowuguige` varchar(200) DEFAULT NULL COMMENT '货物规格',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `cangku` varchar(200) DEFAULT NULL COMMENT '仓库',
  `shengchanriqi` date DEFAULT NULL COMMENT '生产日期',
  `huowuxiangqing` longtext COMMENT '货物详情',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `huowubianhao` (`huowubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1645257326559 DEFAULT CHARSET=utf8 COMMENT='货物信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huowuxinxi`
--

LOCK TABLES `huowuxinxi` WRITE;
/*!40000 ALTER TABLE `huowuxinxi` DISABLE KEYS */;
INSERT INTO `huowuxinxi` VALUES (61,'2022-02-19 07:44:43','1111111111','货物名称1','货物类型1','货物规格1','upload/huowuxinxi_tupian1.jpg',11,'仓库1','2022-02-19','<p>货物详情1</p>','2022-02-19 15:54:44',2),(62,'2022-02-19 07:44:43','2222222222','货物名称2','货物类型2','货物规格2','upload/huowuxinxi_tupian2.jpg',2,'仓库2','2022-02-19','货物详情2','2022-02-19 15:44:43',2),(63,'2022-02-19 07:44:43','3333333333','货物名称3','货物类型3','货物规格3','upload/huowuxinxi_tupian3.jpg',3,'仓库3','2022-02-19','货物详情3','2022-02-19 15:44:43',3),(64,'2022-02-19 07:44:43','4444444444','货物名称4','货物类型4','货物规格4','upload/huowuxinxi_tupian4.jpg',4,'仓库4','2022-02-19','货物详情4','2022-02-19 15:44:43',4),(65,'2022-02-19 07:44:43','5555555555','货物名称5','货物类型5','货物规格5','upload/huowuxinxi_tupian5.jpg',5,'仓库5','2022-02-19','货物详情5','2022-02-19 15:44:43',5),(66,'2022-02-19 07:44:43','6666666666','货物名称6','货物类型6','货物规格6','upload/huowuxinxi_tupian6.jpg',6,'仓库6','2022-02-19','货物详情6','2022-02-19 15:44:43',6),(1645257326558,'2022-02-19 07:55:25','1645257309298','第一货物','送到发送到','时代发','upload/1645257316856.jpg',525,'第一仓库','2022-02-19','<p>时代发送到发送到发送到发送到时代发送到发送到发送到发送到时代发送到发送到发送到发送到时代发送到发送到发送到发送到</p>',NULL,0);
/*!40000 ALTER TABLE `huowuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kehuxinxi`
--

DROP TABLE IF EXISTS `kehuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kehuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kehubianhao` varchar(200) DEFAULT NULL COMMENT '客户编号',
  `kehuxingming` varchar(200) NOT NULL COMMENT '客户姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `beizhu` longtext COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kehubianhao` (`kehubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1645257247767 DEFAULT CHARSET=utf8 COMMENT='客户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kehuxinxi`
--

LOCK TABLES `kehuxinxi` WRITE;
/*!40000 ALTER TABLE `kehuxinxi` DISABLE KEYS */;
INSERT INTO `kehuxinxi` VALUES (41,'2022-02-19 07:44:43','1111111111','客户姓名1','男','13823888881','地址1','备注1'),(42,'2022-02-19 07:44:43','2222222222','客户姓名2','男','13823888882','地址2','备注2'),(43,'2022-02-19 07:44:43','3333333333','客户姓名3','男','13823888883','地址3','备注3'),(44,'2022-02-19 07:44:43','4444444444','客户姓名4','男','13823888884','地址4','备注4'),(45,'2022-02-19 07:44:43','5555555555','客户姓名5','男','13823888885','地址5','备注5'),(46,'2022-02-19 07:44:43','6666666666','客户姓名6','男','13823888886','地址6','备注6'),(1645257247766,'2022-02-19 07:54:07','1645257238071','电饭锅','女','11122233344','时代发顺丰电商','时代发送到发送到发送到');
/*!40000 ALTER TABLE `kehuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  `type` varchar(200) DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1645257101445,'11','yuangong','员工','6rev7dyv95xlqotjnajeztqjloszrfu6','2022-02-19 07:51:45','2022-02-19 08:55:45'),(2,1,'abo','users','管理员','38tr2cugt57n808pl8bleil7hkz9xj2p','2022-02-19 07:51:58','2022-02-19 08:56:55');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2022-02-19 07:44:43');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yuangong`
--

DROP TABLE IF EXISTS `yuangong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yuangong` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1645257101446 DEFAULT CHARSET=utf8 COMMENT='员工';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yuangong`
--

LOCK TABLES `yuangong` WRITE;
/*!40000 ALTER TABLE `yuangong` DISABLE KEYS */;
INSERT INTO `yuangong` VALUES (11,'2022-02-19 07:44:43','账号1','123456','姓名1',1,'男','13823888881','440300199101010001','upload/yuangong_zhaopian1.jpg'),(12,'2022-02-19 07:44:43','账号2','123456','姓名2',2,'男','13823888882','440300199202020002','upload/yuangong_zhaopian2.jpg'),(13,'2022-02-19 07:44:43','账号3','123456','姓名3',3,'男','13823888883','440300199303030003','upload/yuangong_zhaopian3.jpg'),(14,'2022-02-19 07:44:43','账号4','123456','姓名4',4,'男','13823888884','440300199404040004','upload/yuangong_zhaopian4.jpg'),(15,'2022-02-19 07:44:43','账号5','123456','姓名5',5,'男','13823888885','440300199505050005','upload/yuangong_zhaopian5.jpg'),(16,'2022-02-19 07:44:43','账号6','123456','姓名6',6,'男','13823888886','440300199606060006','upload/yuangong_zhaopian6.jpg'),(1645257101445,'2022-02-19 07:51:41','11','11','时代',11,'女','11122211111','441421111111111111','upload/1645257110704.jpg');
/*!40000 ALTER TABLE `yuangong` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-19 23:09:03
