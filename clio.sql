/*
SQLyog v10.2 
MySQL - 5.5.44-MariaDB : Database - clio
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`clio` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `clio`;

/*Table structure for table `event_type_enum_lookup` */

DROP TABLE IF EXISTS `event_type_enum_lookup`;

CREATE TABLE `event_type_enum_lookup` (
  `code` tinyint(4) NOT NULL COMMENT '对象类型-代码',
  `description` char(32) DEFAULT NULL COMMENT '对象类型明文',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='不同等级对象类型的编码';

/*Table structure for table `market_impact_enum_lookup` */

DROP TABLE IF EXISTS `market_impact_enum_lookup`;

CREATE TABLE `market_impact_enum_lookup` (
  `code` tinyint(1) NOT NULL COMMENT '事件性质-代码',
  `description` char(32) DEFAULT NULL COMMENT '事件性质明文',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rank_a_event` */

DROP TABLE IF EXISTS `rank_a_event`;

CREATE TABLE `rank_a_event` (
  `id` char(32) NOT NULL COMMENT '对象ID, 使用UUID生成',
  `t_name` char(128) DEFAULT NULL COMMENT '对象名称',
  `start_time` int(10) DEFAULT NULL COMMENT '对象开始时间, UTC时间戳',
  `t_type` int(3) DEFAULT NULL COMMENT '对象类型',
  `market_impact_index` float DEFAULT NULL COMMENT '对象影响力 - (0-1)浮点数',
  `related_industry` text COMMENT '相关行业(最新) ; [汽车, 互联网] （json, 存储行业名称）',
  `related_stock` text COMMENT '相关股票(最新) ; [腾讯控股, 阿里巴巴控股] （json, 存储股票名称）',
  `related_sector` text COMMENT '相关投资板块(最新) ; [人工智能, 物联网] （json, 存储板块名称）',
  `related_article` text COMMENT '相关文本; （json, 存储相关文本id）',
  `definition` text COMMENT '对象定义，json格式',
  PRIMARY KEY (`id`),
  KEY `t_name` (`t_name`),
  KEY `start_time` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事件对象表(Rank A),代表原子事件,存储其最新状态,作缓存使用, 存MySQL';

/*Table structure for table `rank_a_event_snap` */

DROP TABLE IF EXISTS `rank_a_event_snap`;

CREATE TABLE `rank_a_event_snap` (
  `id` char(32) NOT NULL COMMENT '快照ID, 使用对象ID和时间戳组合生成的MD5',
  `snapshot_time` int(10) DEFAULT NULL COMMENT '快照时间, UTC时间戳',
  `event_id` char(32) DEFAULT NULL COMMENT '对象ID',
  `t_name` char(128) DEFAULT NULL COMMENT '对象名称',
  `start_time` int(10) DEFAULT NULL COMMENT '对象开始时间, UTC时间戳',
  `t_type` int(3) DEFAULT NULL COMMENT '对象类型',
  `market_impact_index` float DEFAULT NULL COMMENT '对象影响力 - (0-1)浮点数',
  `related_industry` text COMMENT '相关行业; [汽车, 互联网] （json, 存储行业名称）',
  `related_stock` text COMMENT '相关股票; [腾讯控股, 阿里巴巴控股] （json, 存储股票名称）',
  `related_sector` text COMMENT '相关板块; [人工智能, 物联网] （json, 存储板块名称）',
  `related_article` text COMMENT '相关文本; （json, 存储相关文本id）',
  `definition` text COMMENT '对象定义，json格式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_id` (`event_id`),
  KEY `snapshot_time` (`snapshot_time`),
  KEY `start_time` (`start_time`),
  KEY `event_id_2` (`event_id`),
  KEY `t_name` (`t_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事件对象表(Rank A)的快照，存储其时间序列, 存ES';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
