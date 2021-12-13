/*
Navicat MySQL Data Transfer

Source Server         : txyun
Source Server Version : 50734
Source Host           : 1.116.114.142:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-12-13 13:36:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(5) NOT NULL COMMENT '组别: [库存调拨, 采购入库, 生产入库, 销售出库, 消耗出库]',
  `storehouse_in` int(11) DEFAULT NULL COMMENT '收货仓库',
  `storehouse_out` int(11) DEFAULT NULL COMMENT '发货仓库',
  `customer` int(11) DEFAULT NULL COMMENT '客户',
  `supplier` int(11) DEFAULT NULL COMMENT '供应商',
  `dealer` varchar(20) NOT NULL COMMENT '经手人',
  `deal_time` varchar(20) NOT NULL COMMENT '操作日期',
  PRIMARY KEY (`id`),
  KEY `storehouse_in` (`storehouse_in`),
  KEY `storehouse_out` (`storehouse_out`),
  KEY `customer` (`customer`),
  KEY `supplier` (`supplier`),
  CONSTRAINT `record_ibfk_1` FOREIGN KEY (`storehouse_in`) REFERENCES `address` (`id`),
  CONSTRAINT `record_ibfk_3` FOREIGN KEY (`storehouse_out`) REFERENCES `address` (`id`),
  CONSTRAINT `record_ibfk_4` FOREIGN KEY (`customer`) REFERENCES `address` (`id`),
  CONSTRAINT `record_ibfk_5` FOREIGN KEY (`supplier`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('14', '采购入库', '65', null, null, '74', '嘉文四世', '2021-12-4');
INSERT INTO `record` VALUES ('15', '采购入库', '62', null, null, '71', '贾科斯', '2021-12-6');
INSERT INTO `record` VALUES ('16', '采购入库', '63', null, null, '70', '格温', '2021-12-6');
INSERT INTO `record` VALUES ('17', '生产入库', '60', null, null, null, '佛爷', '2021-12-6');
INSERT INTO `record` VALUES ('18', '销售出库', null, '60', '77', null, '塞拉斯', '2021-12-6');
INSERT INTO `record` VALUES ('19', '消耗出库', null, '60', null, null, '泽拉斯', '2021-12-6');
INSERT INTO `record` VALUES ('20', '库存调拨', '60', '63', null, null, '波比', '2021-12-6');
