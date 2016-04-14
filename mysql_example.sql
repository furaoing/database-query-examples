/*
SQLyog v10.2 
MySQL - 5.5.44-MariaDB : Database - fin_mysql_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fin_mysql_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fin_mysql_db`;

/*Table structure for table `AH_price_comp` */

DROP TABLE IF EXISTS `AH_price_comp`;

CREATE TABLE `AH_price_comp` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `a_code` char(6) DEFAULT NULL COMMENT 'A股代码',
  `h_code` char(6) DEFAULT NULL COMMENT 'H股代码',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `stock_name` char(64) DEFAULT NULL COMMENT '股票名称',
  `HK_latest_price` float DEFAULT NULL COMMENT '最新价(HKD)',
  `RMB_latest_price` float DEFAULT NULL COMMENT '最新价(RMB)',
  `HK_price_chg_percentage` float DEFAULT NULL COMMENT '涨跌幅(HKD)',
  `RMB_price_chg_percentage` float DEFAULT NULL COMMENT '涨跌幅(RMB)',
  `bi_jia` float DEFAULT NULL COMMENT '比价(H/A)',
  `yi_jia` float DEFAULT NULL COMMENT '溢价(H/A)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='AH股比价';

/*Table structure for table `additional_calendar` */

DROP TABLE IF EXISTS `additional_calendar`;

CREATE TABLE `additional_calendar` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `Stock_code` char(6) DEFAULT NULL COMMENT '证券代码',
  `Short_id` char(24) DEFAULT NULL COMMENT '证券简称',
  `Add_code` char(6) DEFAULT NULL COMMENT '增发代码',
  `Method_pro` char(6) DEFAULT NULL COMMENT '方案进度',
  `Count_value` float DEFAULT NULL COMMENT '发行数量(万股)',
  `Count_net` float DEFAULT NULL COMMENT '网上发行数量(万股)',
  `Count_price` float DEFAULT NULL COMMENT '发行价格(元)',
  `Muji_value` float DEFAULT NULL COMMENT '募集资金(亿元)',
  `Date_start` datetime DEFAULT NULL COMMENT '发行日期',
  `Date_pub` datetime DEFAULT NULL COMMENT '公告日',
  `Date_market` datetime DEFAULT NULL COMMENT '增发上市日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='增发日历';

/*Table structure for table `agency_forcasts` */

DROP TABLE IF EXISTS `agency_forcasts`;

CREATE TABLE `agency_forcasts` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `stock_name` char(64) DEFAULT NULL COMMENT '股票名称',
  `title` char(128) DEFAULT NULL COMMENT '文章标题',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Name_yc` char(128) DEFAULT NULL COMMENT '机构名称',
  `Type_yc` char(128) DEFAULT NULL COMMENT '评级类别',
  `Change_yc` char(128) DEFAULT NULL COMMENT '评级变动',
  `RoseSpace_YC` int(8) DEFAULT NULL COMMENT '上涨空间',
  `Date_yc` datetime DEFAULT NULL COMMENT '评级时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构预测';

/*Table structure for table `agency_stock_holding_per_period` */

DROP TABLE IF EXISTS `agency_stock_holding_per_period`;

CREATE TABLE `agency_stock_holding_per_period` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(32) DEFAULT NULL COMMENT '股票代码',
  `code_name` char(128) DEFAULT NULL COMMENT '股票名称',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Item_jggg` char(128) DEFAULT NULL COMMENT '机构属性',
  `Value_jggg` float DEFAULT NULL COMMENT '持股总数(万股)',
  `TotalStockPatio_jggg` float DEFAULT NULL COMMENT '持股市值(亿元)',
  `ChangeStock_jggg` float DEFAULT NULL COMMENT '持股变动数值(万股)',
  `GBBL_jggg` float DEFAULT NULL COMMENT '占总股本比例(%)',
  `TPDE_jggg` float DEFAULT NULL COMMENT '持股变动比例(%)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构持仓（日期区间）';

/*Table structure for table `agency_stock_holding_per_stock` */

DROP TABLE IF EXISTS `agency_stock_holding_per_stock`;

CREATE TABLE `agency_stock_holding_per_stock` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Name_jgcc` char(128) DEFAULT NULL COMMENT '机构名称',
  `Property_jgcc` datetime DEFAULT NULL COMMENT '机构属性',
  `Count_jgcc` float DEFAULT NULL COMMENT '持股总数(万股)',
  `Value_jgcc` float DEFAULT NULL COMMENT '持股市值(亿元)',
  `TotalStockPatio_jqcc` float DEFAULT NULL COMMENT '占总股本比例(%)',
  `GBBL_jgcc` float DEFAULT NULL COMMENT '占流通股本比例(%)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构持仓（各股）';

/*Table structure for table `annual_gdp` */

DROP TABLE IF EXISTS `annual_gdp`;

CREATE TABLE `annual_gdp` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `year` bigint(20) DEFAULT NULL COMMENT '统计年度',
  `gdp` float DEFAULT NULL COMMENT '国内生产总值(亿元)',
  `pc_gdp` float DEFAULT NULL COMMENT '人均国内生产总值(元)',
  `gnp` float DEFAULT NULL COMMENT '国民生产总值(亿元)',
  `pi` float DEFAULT NULL COMMENT '第一产业(亿元)',
  `si` float DEFAULT NULL COMMENT '第二产业(亿元)',
  `industry` float DEFAULT NULL COMMENT '工业(亿元)',
  `cons_industry` float DEFAULT NULL COMMENT '建筑业(亿元)',
  `ti` float DEFAULT NULL COMMENT '第三产业(亿元)',
  `trans_industry` float DEFAULT NULL COMMENT '交通运输仓储邮电通信业(亿元)',
  `lbdy` float DEFAULT NULL COMMENT '批发零售贸易及餐饮业(亿元)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国内生产总值(年度)';

/*Table structure for table `bank_quote_data` */

DROP TABLE IF EXISTS `bank_quote_data`;

CREATE TABLE `bank_quote_data` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `bank` text COMMENT '报价银行名称',
  `ON_B` text COMMENT '隔夜拆放买入价',
  `ON_A` text COMMENT '隔夜拆放卖出价',
  `1W_B` text COMMENT '1周买入',
  `1W_A` text COMMENT '1周卖出',
  `2W_B` text COMMENT '买入',
  `2W_A` text COMMENT '卖出',
  `1M_B` text COMMENT '买入',
  `1M_A` text COMMENT '卖出',
  `3M_B` text COMMENT '买入',
  `3M_A` text COMMENT '卖出',
  `6M_B` text COMMENT '买入',
  `6M_A` text COMMENT '卖出',
  `9M_B` text COMMENT '买入',
  `9M_A` text COMMENT '卖出',
  `1Y_B` text COMMENT '买入',
  `1Y_A` text COMMENT '卖出',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行报价数据';

/*Table structure for table `base_rate_loans` */

DROP TABLE IF EXISTS `base_rate_loans`;

CREATE TABLE `base_rate_loans` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `1Y` float DEFAULT NULL COMMENT '1年贷款基础利率',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贷款基础利率（LPR）';

/*Table structure for table `broker_tops` */

DROP TABLE IF EXISTS `broker_tops`;

CREATE TABLE `broker_tops` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `broker` char(64) DEFAULT NULL COMMENT '营业部名称',
  `span` char(128) DEFAULT NULL COMMENT '统计周期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `_change` float DEFAULT NULL COMMENT '当日涨跌幅',
  `_count` float DEFAULT NULL COMMENT '上榜次数',
  `bamount` float DEFAULT NULL COMMENT '累计购买额',
  `samount` float DEFAULT NULL COMMENT '累计卖出额',
  `bcount` float DEFAULT NULL COMMENT '买入席位数',
  `scount` float DEFAULT NULL COMMENT '卖出席位数',
  `top3` varchar(4048) DEFAULT NULL COMMENT '买入前3股票',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个股上榜统计';

/*Table structure for table `cap_tops` */

DROP TABLE IF EXISTS `cap_tops`;

CREATE TABLE `cap_tops` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `span` char(128) DEFAULT NULL COMMENT '统计周期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `_change` float DEFAULT NULL COMMENT '当日涨跌幅',
  `_count` float DEFAULT NULL COMMENT '上榜次数',
  `bamount` float DEFAULT NULL COMMENT '累计购买额',
  `samount` float DEFAULT NULL COMMENT '累计卖出额',
  `net` float DEFAULT NULL COMMENT '净额',
  `bcount` float DEFAULT NULL COMMENT '买入席位数',
  `scount` float DEFAULT NULL COMMENT '卖出席位数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个股上榜统计';

/*Table structure for table `capital_balances_movements` */

DROP TABLE IF EXISTS `capital_balances_movements`;

CREATE TABLE `capital_balances_movements` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `Fund_category` char(64) DEFAULT NULL COMMENT '资金类别',
  `End_count` float DEFAULT NULL COMMENT '期末数(资金余额)',
  `Average_count` float DEFAULT NULL COMMENT '日平均数(资金余额)',
  `Zhuanru_count` float DEFAULT NULL COMMENT '转入额(投资者印证转账/银衍转账资金变动)',
  `Zhuanchu_count` float DEFAULT NULL COMMENT '转出额(投资者印证转账/银衍转账资金变动)',
  `Jin_ru_chu_count` float DEFAULT NULL COMMENT '净转入(转出)额',
  `Date_zq` datetime DEFAULT NULL COMMENT '日期',
  `Remark_zq` char(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='证券及股票期权投资者的资金余额及变动情况';

/*Table structure for table `capital_reorganization` */

DROP TABLE IF EXISTS `capital_reorganization`;

CREATE TABLE `capital_reorganization` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Date_zccz` datetime DEFAULT NULL COMMENT '公告日期',
  `Name_wg` char(128) DEFAULT NULL COMMENT '公司名称',
  `Type_zccz` char(128) DEFAULT NULL COMMENT '重组类型',
  `object_zccz` char(128) DEFAULT NULL COMMENT '重组标的',
  `progress_zccz` char(128) DEFAULT NULL COMMENT '重组进度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产重组';

/*Table structure for table `capital_structure` */

DROP TABLE IF EXISTS `capital_structure`;

CREATE TABLE `capital_structure` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `CurrentRatio` float DEFAULT NULL COMMENT '流动比率',
  `QuickRatio` float DEFAULT NULL COMMENT '速动比率',
  `CashRatio` float DEFAULT NULL COMMENT '现金比率(%)',
  `ICR` float DEFAULT NULL COMMENT '利息支付倍数',
  `LDATROWC` float DEFAULT NULL COMMENT '长期债务与营运资金比率(%)',
  `EquityRatio` float DEFAULT NULL COMMENT '股东权益比率(%)',
  `LDEBT` float DEFAULT NULL COMMENT '长期负债比率(%)',
  `SEAFAR` float DEFAULT NULL COMMENT '股东权益与固定资产比率(%)',
  `DTNW` float DEFAULT NULL COMMENT '负债与所有者权益比率(%)',
  `LAALCR` float DEFAULT NULL COMMENT '长期资产与长期资金比率(%)',
  `CapitalizationRate` float DEFAULT NULL COMMENT '资本化比率(%)',
  `RONVOFA` float DEFAULT NULL COMMENT '固定资产净值率(%)',
  `ImmobilizedCapitalRatios` float DEFAULT NULL COMMENT '资本固定化比率(%)',
  `DebtEquityRatio` float DEFAULT NULL COMMENT '产权比率(%)',
  `LVA` float DEFAULT NULL COMMENT '清算价值比率(%)',
  `CapitalIntensity` float DEFAULT NULL COMMENT '固定资产比重(%)',
  `LEV` float DEFAULT NULL COMMENT '资产负债率(%)',
  `TotalAssets` float DEFAULT NULL COMMENT '总资产(元)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='偿债及资本结构';

/*Table structure for table `cash_ratios` */

DROP TABLE IF EXISTS `cash_ratios`;

CREATE TABLE `cash_ratios` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `OCFTSR` float DEFAULT NULL COMMENT '经营现金净流量对销售收入比率(%)',
  `ROAOCF` float DEFAULT NULL COMMENT '资产的经营现金流量回报率(%)',
  `TROCFNI` float DEFAULT NULL COMMENT '经营现金净流量与净利润的比率(%)',
  `OCTDR` float DEFAULT NULL COMMENT '经营现金净流量对负债比率(%)',
  `CashFlowRatio` float DEFAULT NULL COMMENT '现金流量比率(%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='现金流量';

/*Table structure for table `commodity_trading` */

DROP TABLE IF EXISTS `commodity_trading`;

CREATE TABLE `commodity_trading` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(8) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `deal_price` float DEFAULT NULL COMMENT '成交价格',
  `volume` float DEFAULT NULL COMMENT '交易量',
  `amount` float DEFAULT NULL COMMENT '交易金额(元)',
  `buy_agency` char(128) DEFAULT NULL COMMENT '买方营业部',
  `sell_agency` char(128) DEFAULT NULL COMMENT '卖方营业部',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='大宗交易';

/*Table structure for table `conception_classify` */

DROP TABLE IF EXISTS `conception_classify`;

CREATE TABLE `conception_classify` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `name` text COMMENT '股票名称',
  `c_name` text COMMENT '概念名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='概念分类';

/*Table structure for table `corp_financing` */

DROP TABLE IF EXISTS `corp_financing`;

CREATE TABLE `corp_financing` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `fin_balance` float DEFAULT NULL COMMENT '融资余额',
  `fin_buyin` float DEFAULT NULL COMMENT '融资买入额',
  `fin_repay` float DEFAULT NULL COMMENT '融资偿还额',
  `sec_lending_balance` float DEFAULT NULL COMMENT '融券余额',
  `sec_lending_sellout` float DEFAULT NULL COMMENT '融券卖出',
  `sec_lending_repay` float DEFAULT NULL COMMENT '融券偿还',
  `ex_agency` int(1) DEFAULT NULL COMMENT '交易所ID',
  `_type` int(1) DEFAULT NULL COMMENT '类别ID（融资/融券）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='融资融券';

/*Table structure for table `cpi` */

DROP TABLE IF EXISTS `cpi`;

CREATE TABLE `cpi` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `item_type` char(32) DEFAULT NULL COMMENT '全国，城市，农村',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `value_amout` float DEFAULT NULL COMMENT '当月',
  `tongbi_zengzhang` float DEFAULT NULL COMMENT '同比增长',
  `huanbi_zengzhang` float DEFAULT NULL COMMENT '环比增长',
  `leiji` float DEFAULT NULL COMMENT '累积',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='居民消费CPI';

/*Table structure for table `csi_500_constituent_stocks` */

DROP TABLE IF EXISTS `csi_500_constituent_stocks`;

CREATE TABLE `csi_500_constituent_stocks` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `name` char(6) DEFAULT NULL COMMENT '股票名称',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `weight` float DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中证500成份股';

/*Table structure for table `deposit_rate` */

DROP TABLE IF EXISTS `deposit_rate`;

CREATE TABLE `deposit_rate` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `date` text COMMENT '变动日期',
  `deposit_type` text COMMENT '存款利率',
  `rate` text COMMENT '利率(%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存款利率';

/*Table structure for table `deposit_reserve_ratio` */

DROP TABLE IF EXISTS `deposit_reserve_ratio`;

CREATE TABLE `deposit_reserve_ratio` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `date` text COMMENT '变动日期',
  `before` text COMMENT '调整前存款准备金率(%)',
  `now` text COMMENT '调整后存款准备金率(%)',
  `changed` text COMMENT '调整幅度(%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存款准备金率';

/*Table structure for table `fin_report_code_lookup` */

DROP TABLE IF EXISTS `fin_report_code_lookup`;

CREATE TABLE `fin_report_code_lookup` (
  `code` char(2) NOT NULL DEFAULT '' COMMENT '代码',
  `name` char(128) DEFAULT NULL COMMENT '代码所对应的名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务指标代码对应表';

/*Table structure for table `financial_summary` */

DROP TABLE IF EXISTS `financial_summary`;

CREATE TABLE `financial_summary` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Date_Finance` datetime DEFAULT NULL COMMENT '公告日期',
  `NetAssetPS` float DEFAULT NULL COMMENT '每股净资产',
  `EarningPS` float DEFAULT NULL COMMENT '每股收益',
  `CashPS` float DEFAULT NULL COMMENT '每股现金含量',
  `AdditionalPaidInPS` float DEFAULT NULL COMMENT '每股资本公积金',
  `Fixed_Assets` float DEFAULT NULL COMMENT '固定资产合计',
  `CurrentAssets` float DEFAULT NULL COMMENT '流动资产合计',
  `AssetTotal` float DEFAULT NULL COMMENT '资产总计',
  `LongTermDebt` float DEFAULT NULL COMMENT '长期负债合计',
  `MainIncome` float DEFAULT NULL COMMENT '主营业务收入',
  `FinancingExpenses` float DEFAULT NULL COMMENT '财务费用',
  `NetProfit` float DEFAULT NULL COMMENT '净利润',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务摘要';

/*Table structure for table `fuquan_market` */

DROP TABLE IF EXISTS `fuquan_market`;

CREATE TABLE `fuquan_market` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `open` float DEFAULT NULL COMMENT '开盘价',
  `high` float DEFAULT NULL COMMENT '最高价',
  `close` float DEFAULT NULL COMMENT '收盘价',
  `low` float DEFAULT NULL COMMENT '最低价',
  `volume` float DEFAULT NULL COMMENT '交易量(股)',
  `amount` float DEFAULT NULL COMMENT '交易金额(元)',
  `fuquan_factor` float DEFAULT NULL COMMENT '复权因子',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='复权交易(新浪财经）';

/*Table structure for table `gem_composite_classify` */

DROP TABLE IF EXISTS `gem_composite_classify`;

CREATE TABLE `gem_composite_classify` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `name` text COMMENT '股票名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='创业板分类';

/*Table structure for table `growth_ratios` */

DROP TABLE IF EXISTS `growth_ratios`;

CREATE TABLE `growth_ratios` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `MBRG` float DEFAULT NULL COMMENT '主营业务收入增长率(%)',
  `NPGR` float DEFAULT NULL COMMENT '净利润增长率(%)',
  `NAVG` float DEFAULT NULL COMMENT '净资产增长率(%)',
  `TAGR` float DEFAULT NULL COMMENT '总资产增长率(%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成长能力';

/*Table structure for table `index_list` */

DROP TABLE IF EXISTS `index_list`;

CREATE TABLE `index_list` (
  `_index` char(6) NOT NULL DEFAULT '0' COMMENT '指数代码',
  `index_name` char(128) DEFAULT NULL COMMENT '指数名称',
  PRIMARY KEY (`_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数列表';

/*Table structure for table `lending_rate` */

DROP TABLE IF EXISTS `lending_rate`;

CREATE TABLE `lending_rate` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `date` text COMMENT '执行日期',
  `loan_type` text COMMENT '存款种类',
  `rate` text COMMENT '利率(%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贷款利率';

/*Table structure for table `list_of_suspended_stocks` */

DROP TABLE IF EXISTS `list_of_suspended_stocks`;

CREATE TABLE `list_of_suspended_stocks` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `name` char(6) DEFAULT NULL COMMENT '股票名称',
  `oDate` datetime DEFAULT NULL COMMENT '上市日期',
  `tDate` datetime DEFAULT NULL COMMENT '终止上市日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停上市股票列表';

/*Table structure for table `list_of_termination_of_listing` */

DROP TABLE IF EXISTS `list_of_termination_of_listing`;

CREATE TABLE `list_of_termination_of_listing` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `name` char(6) DEFAULT NULL COMMENT '股票名称',
  `oDate` datetime DEFAULT NULL COMMENT '上市日期',
  `tDate` datetime DEFAULT NULL COMMENT '终止上市日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终止上市股票列表';

/*Table structure for table `longhu_list` */

DROP TABLE IF EXISTS `longhu_list`;

CREATE TABLE `longhu_list` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `_change` float DEFAULT NULL COMMENT '当日涨跌幅',
  `amount` float DEFAULT NULL COMMENT '龙虎榜成交额',
  `buyin` float DEFAULT NULL COMMENT '买入额',
  `buyin_percentage` float DEFAULT NULL COMMENT '买入占总成交比例',
  `sellout` float DEFAULT NULL COMMENT '卖出额',
  `sellout_percentage` float DEFAULT NULL COMMENT '卖出占总成交比例',
  `onlist_cause` varchar(4048) DEFAULT NULL COMMENT '上榜原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='龙虎榜';

/*Table structure for table `lpr_value_data` */

DROP TABLE IF EXISTS `lpr_value_data`;

CREATE TABLE `lpr_value_data` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `1Y_5` text COMMENT '5日均值',
  `1Y_10` text COMMENT '10日均值',
  `1Y_20` text COMMENT '20日均值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LPR均值数据';

/*Table structure for table `mil_code_lookup` */

DROP TABLE IF EXISTS `mil_code_lookup`;

CREATE TABLE `mil_code_lookup` (
  `code` int(2) NOT NULL DEFAULT '0' COMMENT '代码',
  `index_name` char(128) DEFAULT NULL COMMENT '代码所对应的名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='杂项名称代码对应表';

/*Table structure for table `money_flow` */

DROP TABLE IF EXISTS `money_flow`;

CREATE TABLE `money_flow` (
  `id` char(64) NOT NULL DEFAULT '' COMMENT '记录的UUID',
  `date_time` datetime DEFAULT NULL COMMENT '日期',
  `turnover` float DEFAULT NULL COMMENT '换手率',
  `_change` float DEFAULT NULL COMMENT '涨跌幅',
  `closing` float DEFAULT NULL COMMENT '收盘价',
  `net_inflow` float DEFAULT NULL COMMENT '净流入/万',
  `net_inflow_rate` float DEFAULT NULL COMMENT '净流入率',
  `zhuli_inflow` float DEFAULT NULL COMMENT '主力净流入/万',
  `zhuli_net_inflow_rate` float DEFAULT NULL COMMENT '主力净流入率',
  `zhuli_compass` float DEFAULT NULL COMMENT '主力罗盘度',
  `industry_net_inflow` float DEFAULT NULL COMMENT '行业净流入率',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基金流入趋势';

/*Table structure for table `money_supply` */

DROP TABLE IF EXISTS `money_supply`;

CREATE TABLE `money_supply` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `month` text COMMENT '统计时间',
  `m2` text COMMENT '货币和准货币（广义货币M2）(亿元)',
  `m2_yoy` text COMMENT '货币和准货币（广义货币M2）同比增长(%)',
  `m1` text COMMENT '货币(狭义货币M1)(亿元)',
  `m1_yoy` text COMMENT '货币(狭义货币M1)同比增长(%)',
  `m0` text COMMENT '流通中现金(M0)(亿元)',
  `m0_yoy` text COMMENT '流通中现金(M0)同比增长(%)',
  `cd` text COMMENT '活期存款(亿元)',
  `cd_yoy` text COMMENT '活期存款同比增长(%)',
  `qm` text COMMENT '准货币(亿元)',
  `qm_yoy` text COMMENT '准货币同比增长(%)',
  `ftd` text COMMENT '定期存款(亿元)',
  `ftd_yoy` text COMMENT '定期存款同比增长(%)',
  `sd` text COMMENT '储蓄存款(亿元)',
  `sd_yoy` text COMMENT '储蓄存款同比增长(%)',
  `rests` text COMMENT '其他存款(亿元)',
  `rests_yoy` text COMMENT '其他存款同比增长(%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货币供应量';

/*Table structure for table `money_supply_end` */

DROP TABLE IF EXISTS `money_supply_end`;

CREATE TABLE `money_supply_end` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `year` text COMMENT '统计年度',
  `m2` text COMMENT '货币和准货币(亿元)',
  `m1` text COMMENT '货币(亿元)',
  `m0` text COMMENT '流通中现金(亿元)',
  `cd` text COMMENT '活期存款(亿元)',
  `qm` text COMMENT '准货币(亿元)',
  `ftd` text COMMENT '定期存款(亿元)',
  `sd` text COMMENT '储蓄存款(亿元)',
  `rests` text COMMENT '其他存款(亿元)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货币供应量(年底余额)';

/*Table structure for table `new_stock_calendar` */

DROP TABLE IF EXISTS `new_stock_calendar`;

CREATE TABLE `new_stock_calendar` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `Stock_code` char(6) DEFAULT NULL COMMENT '证券代码',
  `Shengou_code` char(6) DEFAULT NULL COMMENT '申购代码',
  `Short_id` char(24) DEFAULT NULL COMMENT '证券简称',
  `Fa_xing_date` datetime DEFAULT NULL COMMENT '上网发行日期',
  `Date_market` datetime DEFAULT NULL COMMENT '上市日期',
  `Count_value` float DEFAULT NULL COMMENT '发行数量(万股)',
  `Count_net` float DEFAULT NULL COMMENT '上网发行数量(万股)',
  `Count_price` float DEFAULT NULL COMMENT '发行价格(元)',
  `Rate_market` float DEFAULT NULL COMMENT '市盈率',
  `Person_max` float DEFAULT NULL COMMENT '个人申购上限(万股)',
  `Muji_value` float DEFAULT NULL COMMENT '募集资金(亿元)',
  `Online_rate` float DEFAULT NULL COMMENT '网上中签率(%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新股日历';

/*Table structure for table `operational_ratios` */

DROP TABLE IF EXISTS `operational_ratios`;

CREATE TABLE `operational_ratios` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `TOAR` float DEFAULT NULL COMMENT '应收账款周转率(次)',
  `ARTD` float DEFAULT NULL COMMENT '应收账款周转天数(天)',
  `DSOI` float DEFAULT NULL COMMENT '存货周转天数(天)',
  `ITR` float DEFAULT NULL COMMENT '存货周转率(次)',
  `FATO` float DEFAULT NULL COMMENT '固定资产周转率(次)',
  `TAV` float DEFAULT NULL COMMENT '总资产周转率(次)',
  `TATD` float DEFAULT NULL COMMENT '总资产周转天数(天)',
  `CAT` float DEFAULT NULL COMMENT '流动资产周转率(次)',
  `CATD` float DEFAULT NULL COMMENT '流动资产周转天数(天)',
  `SETR` float DEFAULT NULL COMMENT '股东权益周转率(次)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='营运能力';

/*Table structure for table `ownership_chg_details` */

DROP TABLE IF EXISTS `ownership_chg_details`;

CREATE TABLE `ownership_chg_details` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Name_bd` char(128) DEFAULT NULL COMMENT '名称',
  `Person_bd` char(128) DEFAULT NULL COMMENT '变动人',
  `ChangeNum_bd` float DEFAULT NULL COMMENT '变动股数',
  `AvePrice_bd` float DEFAULT NULL COMMENT '成交均价',
  `Money_bd` float DEFAULT NULL COMMENT '变动金额(万)',
  `Reason_bd` varchar(4048) DEFAULT NULL COMMENT '变动原因',
  `Ratio_bd` float DEFAULT NULL COMMENT '变动比例(%)',
  `NumShares_bd` float DEFAULT NULL COMMENT '变动后持股数',
  `KindsPositions_bd` char(128) DEFAULT NULL COMMENT '持股种类',
  `Executives_bd` char(128) DEFAULT NULL COMMENT '董监高人员姓名',
  `Duty_bd` char(128) DEFAULT NULL COMMENT '职务',
  `relationship_bd` char(128) DEFAULT NULL COMMENT '变动人与董监高的关系',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='变动明细';

/*Table structure for table `per_stock_ratios` */

DROP TABLE IF EXISTS `per_stock_ratios`;

CREATE TABLE `per_stock_ratios` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `DilutedEPS` float DEFAULT NULL COMMENT '摊薄每股收益(元)',
  `EPSWA` float DEFAULT NULL COMMENT '加权每股收益(元)',
  `AdjustedEPS` float DEFAULT NULL COMMENT '每股收益_调整后(元)',
  `fjcxsyEPS` float DEFAULT NULL COMMENT '扣除非经常性损益后的每股收益(元)',
  `beforeANetAssetPS` float DEFAULT NULL COMMENT '每股净资产_调整前(元)',
  `AdjustedNetAssetPS` float DEFAULT NULL COMMENT '每股净资产_调整后(元)',
  `OCFPS` varchar(4048) DEFAULT NULL COMMENT '每股经营性现金流(元)',
  `AdditionalPaidInPS` float DEFAULT NULL COMMENT '每股资本公积金(元)',
  `UDPPS` float DEFAULT NULL COMMENT '每股未分配利润(元)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每股指标';

/*Table structure for table `performance_report` */

DROP TABLE IF EXISTS `performance_report`;

CREATE TABLE `performance_report` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `code` text COMMENT '股票代码',
  `name` text COMMENT '股票名称',
  `type` text COMMENT '业绩变动类型(预增、预亏等)',
  `report_date` text COMMENT '发布日期',
  `pre_eps` float DEFAULT NULL COMMENT '上年同期每股收益',
  `range` float DEFAULT NULL COMMENT '业绩变动范围',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业绩预告';

/*Table structure for table `producer_price_index` */

DROP TABLE IF EXISTS `producer_price_index`;

CREATE TABLE `producer_price_index` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `month` text COMMENT '统计月份',
  `ppiip` text COMMENT '工业品出厂价格指数',
  `ppi` text COMMENT '生产资料价格指数',
  `qm` text COMMENT '采掘工业价格指数',
  `rmi` text COMMENT '原材料工业价格指数',
  `pi` text COMMENT '加工工业价格指数',
  `cg` text COMMENT '生活资料价格指数',
  `food` text COMMENT '食品类价格指数',
  `clothing` text COMMENT '衣着类价格指数',
  `roeu` text COMMENT '一般日用品价格指数',
  `dcg` text COMMENT '耐用消费品价格指数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工业品出厂价格指数';

/*Table structure for table `profitability_ratios` */

DROP TABLE IF EXISTS `profitability_ratios`;

CREATE TABLE `profitability_ratios` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `ROTA` float DEFAULT NULL COMMENT '总资产利润率(%)',
  `CROE` float DEFAULT NULL COMMENT '主营业务利润率(%)',
  `TANIR` float DEFAULT NULL COMMENT '总资产净利润率(%)',
  `ROPTC` float DEFAULT NULL COMMENT '成本费用利润率(%)',
  `OPM` float DEFAULT NULL COMMENT '营业利润率(%)',
  `COGSTS` float DEFAULT NULL COMMENT '主营业务成本率(%)',
  `NPMOS` float DEFAULT NULL COMMENT '销售净利率(%)',
  `DOE` float DEFAULT NULL COMMENT '股本报酬率(%)',
  `RONA` float DEFAULT NULL COMMENT '净资产报酬率(%)',
  `ROA` float DEFAULT NULL COMMENT '资产报酬率(%)',
  `GPTS` float DEFAULT NULL COMMENT '销售毛利率(%)',
  `3CostProportion` float DEFAULT NULL COMMENT '三项费用比重',
  `NMBPR` float DEFAULT NULL COMMENT '非主营比重',
  `MBPR` float DEFAULT NULL COMMENT '主营利润比重',
  `ReleaseRate` float DEFAULT NULL COMMENT '股息发放率(%)',
  `ROI` float DEFAULT NULL COMMENT '投资收益率(%)',
  `IFMO` float DEFAULT NULL COMMENT '主营业务利润(元)',
  `ROE` float DEFAULT NULL COMMENT '净资产收益率(%)',
  `WAROE` float DEFAULT NULL COMMENT '加权净资产收益率(%)',
  `NPADNGAL` float DEFAULT NULL COMMENT '扣除非经常性损益后的净利润(元)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='盈利能力';

/*Table structure for table `quarter_gdp` */

DROP TABLE IF EXISTS `quarter_gdp`;

CREATE TABLE `quarter_gdp` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `quarter` bigint(20) DEFAULT NULL COMMENT '季度',
  `gdp` float DEFAULT NULL COMMENT '国内生产总值(亿元)',
  `gdp_yoy` float DEFAULT NULL COMMENT '国内生产总值同比增长(%)',
  `pi` float DEFAULT NULL COMMENT '第一产业增加值(亿元)',
  `pi_yoy` float DEFAULT NULL COMMENT '第一产业增加值同比增长(%)',
  `si` float DEFAULT NULL COMMENT '第二产业增加值(亿元)',
  `si_yoy` float DEFAULT NULL COMMENT '第二产业增加值同比增长(%)',
  `ti` float DEFAULT NULL COMMENT '第三产业增加值(亿元)',
  `ti_yoy` float DEFAULT NULL COMMENT '第三产业增加值同比增长(%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国内生产总值(季度)';

/*Table structure for table `regulation_violation` */

DROP TABLE IF EXISTS `regulation_violation`;

CREATE TABLE `regulation_violation` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Name_wg` char(128) DEFAULT NULL COMMENT '公司名称',
  `Law_wg` char(128) DEFAULT NULL COMMENT '相关法规',
  `Punish_wg` char(128) DEFAULT NULL COMMENT '处分类型',
  `Behavior_wg` varchar(4048) DEFAULT NULL COMMENT '违规行为',
  `Details_wg` varchar(4048) DEFAULT NULL COMMENT '批复内容',
  `Person_wg` char(128) DEFAULT NULL COMMENT '处理人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='违规记录';

/*Table structure for table `risk_warning_board` */

DROP TABLE IF EXISTS `risk_warning_board`;

CREATE TABLE `risk_warning_board` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `name` text COMMENT '股票名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风险警示板分类';

/*Table structure for table `sh_margin_details` */

DROP TABLE IF EXISTS `sh_margin_details`;

CREATE TABLE `sh_margin_details` (
  `index` bigint(20) DEFAULT NULL,
  `opDate` datetime DEFAULT NULL,
  `stockCode` text,
  `securityAbbr` text,
  `rzye` bigint(20) DEFAULT NULL,
  `rzmre` bigint(20) DEFAULT NULL,
  `rzche` bigint(20) DEFAULT NULL,
  `rqyl` bigint(20) DEFAULT NULL,
  `rqmcl` bigint(20) DEFAULT NULL,
  `rqchl` bigint(20) DEFAULT NULL,
  KEY `ix_sh_margin_details_index` (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sh_margins` */

DROP TABLE IF EXISTS `sh_margins`;

CREATE TABLE `sh_margins` (
  `index` bigint(20) DEFAULT NULL,
  `opDate` datetime DEFAULT NULL,
  `rzye` bigint(20) DEFAULT NULL,
  `rzmre` bigint(20) DEFAULT NULL,
  `rqyl` bigint(20) DEFAULT NULL,
  `rqylje` bigint(20) DEFAULT NULL,
  `rqmcl` bigint(20) DEFAULT NULL,
  `rzrqjyzl` bigint(20) DEFAULT NULL,
  KEY `ix_sh_margins_index` (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sh_sz_300_ingredients_weight` */

DROP TABLE IF EXISTS `sh_sz_300_ingredients_weight`;

CREATE TABLE `sh_sz_300_ingredients_weight` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `name` text COMMENT '股票名称',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `weight` text COMMENT '权重',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='沪深300成份及权重';

/*Table structure for table `shang_hk_stock_funds` */

DROP TABLE IF EXISTS `shang_hk_stock_funds`;

CREATE TABLE `shang_hk_stock_funds` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `date_sh` datetime DEFAULT NULL COMMENT '数据的日期',
  `crawler` char(64) DEFAULT NULL COMMENT '数据来源',
  `source` char(32) DEFAULT NULL COMMENT '爬虫ID',
  `url` char(64) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `CurrentDay_funds` float DEFAULT NULL COMMENT '当日资金流入(单位：亿)',
  `CurrentDay_left_funds` float DEFAULT NULL COMMENT '当日余额(单位：亿)',
  `Overall_balance` float DEFAULT NULL COMMENT '总余额(单位：亿)',
  `CurrentDay_deals` float DEFAULT NULL COMMENT '当日成交净买额',
  `Buy_balance` float DEFAULT NULL COMMENT '买入成交额(单位：亿)',
  `Sell_balance` float DEFAULT NULL COMMENT '卖出成交额(单位：亿)',
  `Advancer_name` char(64) DEFAULT NULL COMMENT '领涨股',
  `Advancer_change` float DEFAULT NULL COMMENT '领涨股跌幅(%)',
  `SH_composite_index` float DEFAULT NULL COMMENT '上证指数',
  `Change_sh` float DEFAULT NULL COMMENT '涨跌幅(%)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='沪港通资金流历史数据';

/*Table structure for table `shang_hk_stock_ten` */

DROP TABLE IF EXISTS `shang_hk_stock_ten`;

CREATE TABLE `shang_hk_stock_ten` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `date_ten` datetime DEFAULT NULL COMMENT '数据的日期',
  `url` char(128) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `crawler` char(32) DEFAULT NULL COMMENT '数据来源',
  `source` char(32) DEFAULT NULL COMMENT '爬虫ID',
  `Rank` int(11) DEFAULT NULL COMMENT '排名',
  `code` char(6) DEFAULT NULL COMMENT '代码',
  `stock_name` char(32) DEFAULT NULL COMMENT '名称',
  `Close_price` float DEFAULT NULL COMMENT '收盘价',
  `Change_ten` float DEFAULT NULL COMMENT '涨跌幅(%)',
  `SH_buy_only` float DEFAULT NULL COMMENT '沪股通净买额(单位:万)',
  `SH_buy_balance` float DEFAULT NULL COMMENT '沪港通买入金额(单位：万)',
  `SH_sell_balance` float DEFAULT NULL COMMENT '沪港通卖出金额(单位：万)',
  `SH_deals_balance` float DEFAULT NULL COMMENT '沪港通成交额(单位：万)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='沪港通十大成交股';

/*Table structure for table `shareholder_infos` */

DROP TABLE IF EXISTS `shareholder_infos`;

CREATE TABLE `shareholder_infos` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `ReportDate_gd` datetime DEFAULT NULL COMMENT '报告期',
  `TotalShareholders_gd` float DEFAULT NULL COMMENT '股东总数',
  `AveShareholders_gd` float DEFAULT NULL COMMENT '人均持股(股)',
  `Capitalization_gd` float DEFAULT NULL COMMENT '总股本(万股)',
  `FloatingStock_gb` float DEFAULT NULL COMMENT '流通股本(万股)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='股东户数';

/*Table structure for table `shibor_offered_rate` */

DROP TABLE IF EXISTS `shibor_offered_rate`;

CREATE TABLE `shibor_offered_rate` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `ON` text COMMENT '隔夜拆放利率',
  `1W` text COMMENT '1周拆放利率',
  `2W` text COMMENT '2周拆放利率',
  `1M` text COMMENT '1个月拆放利率',
  `3M` text COMMENT '3个月拆放利率',
  `6M` text COMMENT '6个月拆放利率',
  `9M` text COMMENT '9个月拆放利率',
  `1Y` text COMMENT '1年拆放利率',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shibor拆放利率';

/*Table structure for table `shibor_value_data` */

DROP TABLE IF EXISTS `shibor_value_data`;

CREATE TABLE `shibor_value_data` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `ON_5` text COMMENT '隔夜拆放利率',
  `ON_10` text COMMENT '隔夜拆放买入价',
  `ON_20` text COMMENT '隔夜拆放卖出价',
  `1W_5` text COMMENT '1周买入',
  `1W_10` text COMMENT '1周卖出',
  `1W_20` text COMMENT '1周卖出',
  `2W_5` text COMMENT '买入',
  `2W_10` text COMMENT '卖出',
  `2W_20` text COMMENT '买入',
  `1M_5` text COMMENT '买入',
  `1M_10` text COMMENT '买入',
  `1M_20` text COMMENT '买入',
  `3M_5` text COMMENT '买入',
  `3M_10` text COMMENT '买入',
  `3M_20` text COMMENT '买入',
  `6M_5` text COMMENT '买入',
  `6M_10` text COMMENT '卖出',
  `6M_20` text COMMENT '买入',
  `9M_5` text COMMENT '卖出',
  `9M_10` text COMMENT '买入',
  `9M_20` text COMMENT '卖出',
  `1Y_5` text COMMENT '买入',
  `1Y_10` text COMMENT '卖出',
  `1Y_20` text COMMENT '卖出',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shibor均值数据';

/*Table structure for table `sse_50_constituent_stocks` */

DROP TABLE IF EXISTS `sse_50_constituent_stocks`;

CREATE TABLE `sse_50_constituent_stocks` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `name` char(6) DEFAULT NULL COMMENT '股票名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上证50成份股';

/*Table structure for table `sse_composite_classify` */

DROP TABLE IF EXISTS `sse_composite_classify`;

CREATE TABLE `sse_composite_classify` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `name` text COMMENT '股票名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中小板分类';

/*Table structure for table `stock_dividends` */

DROP TABLE IF EXISTS `stock_dividends`;

CREATE TABLE `stock_dividends` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(32) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Date_fh` datetime DEFAULT NULL COMMENT '公告日期',
  `StockPaidP10` float DEFAULT NULL COMMENT '分红方案(每10股)送股(股)',
  `StockDonationP10` float DEFAULT NULL COMMENT '分红方案(每10股)转增(股)',
  `StockDividendP10` float DEFAULT NULL COMMENT '分红方案(每10股)派息(税前)(元)',
  `Progress_fh` char(32) DEFAULT NULL COMMENT '进度',
  `ExDividend_Date` datetime DEFAULT NULL COMMENT '除权除息日',
  `RecordDate_fh` datetime DEFAULT NULL COMMENT '股权登记日',
  `LaunchDate_fh` datetime DEFAULT NULL COMMENT '红股上市日',
  `Details_fh` float DEFAULT NULL COMMENT '查看详细',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分红';

/*Table structure for table `stock_list` */

DROP TABLE IF EXISTS `stock_list`;

CREATE TABLE `stock_list` (
  `code` char(6) NOT NULL DEFAULT '0' COMMENT '股票代码',
  `stock_name` char(128) DEFAULT NULL COMMENT '股票名称',
  `stock_exchange` char(6) DEFAULT NULL COMMENT '所属交易所',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='股票列表';

/*Table structure for table `stock_offering` */

DROP TABLE IF EXISTS `stock_offering`;

CREATE TABLE `stock_offering` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(32) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(16) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Date_pg` datetime DEFAULT NULL COMMENT '公告日期',
  `ProgramP10` float DEFAULT NULL COMMENT '配股方案(每10股配股股数)',
  `AllotmentPrice` float DEFAULT NULL COMMENT '配股价格(元)',
  `BenchmarkEquity` float DEFAULT NULL COMMENT '基准股本(万股)',
  `Exright_Date` datetime DEFAULT NULL COMMENT '除权日',
  `RecordDate_pg` datetime DEFAULT NULL COMMENT '股权登记日',
  `PayBeginDate` datetime DEFAULT NULL COMMENT '缴款起始日',
  `PayEndDate` datetime DEFAULT NULL COMMENT '缴款终止日',
  `LaunchDate_pg` datetime DEFAULT NULL COMMENT '配股上市日',
  `TotalRaiseFunds` float DEFAULT NULL COMMENT '募集资金合计(元)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配股';

/*Table structure for table `stock_structure` */

DROP TABLE IF EXISTS `stock_structure`;

CREATE TABLE `stock_structure` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Name_gb` float DEFAULT NULL COMMENT '公司简称',
  `ShortID_gb` float DEFAULT NULL COMMENT '股票代码',
  `ChangeDate_gb` float DEFAULT NULL COMMENT '股本变动日期',
  `Capitalization_gb` float DEFAULT NULL COMMENT '总股本',
  `FloatingAStock_gb` datetime DEFAULT NULL COMMENT '流通A股',
  `ExecutiveStock_gb` datetime DEFAULT NULL COMMENT '高管股',
  `LimitSaleStockA_gb` datetime DEFAULT NULL COMMENT '限售A股(历史记录)',
  `FloatingBStock_gb` datetime DEFAULT NULL COMMENT '流通B股',
  `LimitSaleStockB_gb` datetime DEFAULT NULL COMMENT '限售B股',
  `FloatingHStock_gb` float DEFAULT NULL COMMENT '流通H股',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='股本信息';

/*Table structure for table `stock_unrestriction_per_data` */

DROP TABLE IF EXISTS `stock_unrestriction_per_data`;

CREATE TABLE `stock_unrestriction_per_data` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `ShortID_xjd` char(6) DEFAULT NULL COMMENT '代码',
  `Name_xjd` char(128) DEFAULT NULL COMMENT '名称',
  `Date_xjd` datetime DEFAULT NULL COMMENT '解除限售日期',
  `CapitalizationRatio_xjd` float DEFAULT NULL COMMENT '占总股本比例（%）',
  `Count_xjd` float DEFAULT NULL COMMENT '数量（万股）',
  `LatestPrices_xjd` float DEFAULT NULL COMMENT '最新收盘价（元）',
  `CurrentValue_xjd` float DEFAULT NULL COMMENT '当前市值（亿元）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限售解禁（按日期）';

/*Table structure for table `stock_unrestriction_per_stock` */

DROP TABLE IF EXISTS `stock_unrestriction_per_stock`;

CREATE TABLE `stock_unrestriction_per_stock` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `ShortID_xjg` char(6) DEFAULT NULL COMMENT '代码',
  `Name_xjg` char(128) DEFAULT NULL COMMENT '名称',
  `AnnouncementDate_xjg` datetime DEFAULT NULL COMMENT '公告日期',
  `batch_xjg` float DEFAULT NULL COMMENT '上市批次',
  `PredictDate_xjg` datetime DEFAULT NULL COMMENT '预计上市日期',
  `BanCount_xjg` float DEFAULT NULL COMMENT '解禁数量(万股)',
  `BanValue_xjg` float DEFAULT NULL COMMENT '解禁股流通市值(亿元)',
  `BeginDate_xjg` datetime DEFAULT NULL COMMENT '有效开始日期',
  `EndDate_xjg` datetime DEFAULT NULL COMMENT '有效截止日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限售解禁（按股票）';

/*Table structure for table `sz_margin_details` */

DROP TABLE IF EXISTS `sz_margin_details`;

CREATE TABLE `sz_margin_details` (
  `index` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sz_marginss` */

DROP TABLE IF EXISTS `sz_marginss`;

CREATE TABLE `sz_marginss` (
  `index` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `three_major_demand_gdp` */

DROP TABLE IF EXISTS `three_major_demand_gdp`;

CREATE TABLE `three_major_demand_gdp` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `year` bigint(20) DEFAULT NULL COMMENT '统计年度',
  `end_for` float DEFAULT NULL COMMENT '最终消费支出贡献率(%)',
  `for_rate` float DEFAULT NULL COMMENT '最终消费支出拉动(百分点)',
  `asset_for` float DEFAULT NULL COMMENT '资本形成总额贡献率(%)',
  `asset_rate` float DEFAULT NULL COMMENT '资本形成总额拉动(百分点)',
  `goods_for` float DEFAULT NULL COMMENT '货物和服务净出口贡献率(%)',
  `goods_rate` float DEFAULT NULL COMMENT '货物和服务净出口拉动(百分点)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三大需求对GDP贡献';

/*Table structure for table `three_major_industries_gdp` */

DROP TABLE IF EXISTS `three_major_industries_gdp`;

CREATE TABLE `three_major_industries_gdp` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `year` bigint(20) DEFAULT NULL COMMENT '统计年度',
  `gdp_yoy` float DEFAULT NULL COMMENT '国内生产总值同比增长(%)',
  `pi` float DEFAULT NULL COMMENT '第一产业拉动率(%)',
  `si` float DEFAULT NULL COMMENT '第二产业拉动率(%)',
  `industry` float DEFAULT NULL COMMENT '其中工业拉动(%)',
  `ti` float DEFAULT NULL COMMENT '第三产业拉动率(%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三大产业对GDP拉动';

/*Table structure for table `three_major_industries_rate` */

DROP TABLE IF EXISTS `three_major_industries_rate`;

CREATE TABLE `three_major_industries_rate` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `source` char(8) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `year` bigint(20) DEFAULT NULL COMMENT '统计年度',
  `gdp_yoy` float DEFAULT NULL COMMENT '国内生产总值',
  `pi` float DEFAULT NULL COMMENT '第一产业献率(%)',
  `si` float DEFAULT NULL COMMENT '第二产业献率(%)',
  `industry` float DEFAULT NULL COMMENT '其中工业献率(%)',
  `ti` float DEFAULT NULL COMMENT '第三产业献率(%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三大产业贡献率';

/*Table structure for table `ting_fu_pai` */

DROP TABLE IF EXISTS `ting_fu_pai`;

CREATE TABLE `ting_fu_pai` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `Name_wg` char(128) DEFAULT NULL COMMENT '简称',
  `stop_time` datetime DEFAULT NULL COMMENT '停牌时间',
  `resume_time` datetime DEFAULT NULL COMMENT '复牌时间',
  `stop_duration` char(64) DEFAULT NULL COMMENT '期限',
  `stop_reason` char(64) DEFAULT NULL COMMENT '停牌原因',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='停复牌';

/*Table structure for table `top_10_shareholders` */

DROP TABLE IF EXISTS `top_10_shareholders`;

CREATE TABLE `top_10_shareholders` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `ReportDate_gd10` datetime DEFAULT NULL COMMENT '报告日期',
  `ranking` int(2) DEFAULT NULL COMMENT '股东名次(按股本比例)',
  `SHName_gd10` char(64) DEFAULT NULL COMMENT '股东名称',
  `StockCount_gd10` float DEFAULT NULL COMMENT '持股数量(万股)',
  `StockProperty_gd10` char(64) DEFAULT NULL COMMENT '股份性质',
  `CapitalizationRatio_gd` float DEFAULT NULL COMMENT '占总股本比例',
  `ChangeCount_gd10` float DEFAULT NULL COMMENT '持股变动数(万股)',
  `AnnouncementDate_gd` datetime DEFAULT NULL COMMENT '公告日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='十大股东';

/*Table structure for table `top_ownership_chgs` */

DROP TABLE IF EXISTS `top_ownership_chgs`;

CREATE TABLE `top_ownership_chgs` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '每条记录的UUID',
  `code` char(6) DEFAULT NULL COMMENT '股票代码',
  `date_time` datetime DEFAULT NULL COMMENT '数据的日期',
  `source` char(64) DEFAULT NULL COMMENT '数据来源',
  `crawler` char(8) DEFAULT NULL COMMENT '爬虫ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '抓取的URL',
  `fetchtime` datetime DEFAULT NULL COMMENT '抓取时间',
  `ranking_zjc` float DEFAULT NULL COMMENT '排名',
  `ShortID_zjc` char(6) DEFAULT NULL COMMENT '代码',
  `Name_zjc` char(128) DEFAULT NULL COMMENT '名称',
  `StockMoney_zjc` float DEFAULT NULL COMMENT '股份金额(万)',
  `StockCount_zjc` float DEFAULT NULL COMMENT '股份数额(股)',
  `AveStockPrice_zjc` float DEFAULT NULL COMMENT '增减持均价(元)',
  `LatestPrices_zjc` float DEFAULT NULL COMMENT '最新价(元)',
  `PRC_zjc` float DEFAULT NULL COMMENT '涨跌幅(%)',
  `TimeInterval_zjc` char(128) DEFAULT NULL COMMENT '时间区间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='增（减）持排行榜';

/*Table structure for table `fin` */

DROP TABLE IF EXISTS `fin`;

/*!50001 DROP VIEW IF EXISTS `fin` */;
/*!50001 DROP TABLE IF EXISTS `fin` */;

/*!50001 CREATE TABLE  `fin`(
 `TABLE_NAME` varchar(64) 
)*/;

/*View structure for view fin */

/*!50001 DROP TABLE IF EXISTS `fin` */;
/*!50001 DROP VIEW IF EXISTS `fin` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`palas`@`%` SQL SECURITY DEFINER VIEW `fin` AS (select `information_schema`.`TABLES`.`TABLE_NAME` AS `TABLE_NAME` from `INFORMATION_SCHEMA`.`TABLES` where (`information_schema`.`TABLES`.`TABLE_SCHEMA` = 'fin_mysql_db')) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
