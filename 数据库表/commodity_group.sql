/*
Navicat MySQL Data Transfer

Source Server         : txyun
Source Server Version : 50734
Source Host           : 1.116.114.142:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-12-13 13:36:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `commodity_group`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_group`;
CREATE TABLE `commodity_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '货品类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity_group
-- ----------------------------
INSERT INTO `commodity_group` VALUES ('13', '普通装备');
INSERT INTO `commodity_group` VALUES ('14', '传说装备');
INSERT INTO `commodity_group` VALUES ('15', '史诗装备');
INSERT INTO `commodity_group` VALUES ('16', '神话装备');
INSERT INTO `commodity_group` VALUES ('17', '食品生鲜');
