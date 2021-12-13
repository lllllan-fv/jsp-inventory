/*
Navicat MySQL Data Transfer

Source Server         : txyun
Source Server Version : 50734
Source Host           : 1.116.114.142:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-12-13 13:35:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `commodity`
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '货品类别-外键',
  `name` varchar(20) NOT NULL COMMENT '货品名称',
  PRIMARY KEY (`id`),
  KEY `group` (`type`),
  CONSTRAINT `group` FOREIGN KEY (`type`) REFERENCES `commodity_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('5', '13', '多兰之盾');
INSERT INTO `commodity` VALUES ('6', '13', '多兰之刃');
INSERT INTO `commodity` VALUES ('7', '13', '多兰之戒');
INSERT INTO `commodity` VALUES ('8', '14', '守护天使');
INSERT INTO `commodity` VALUES ('9', '14', '无尽之刃');
INSERT INTO `commodity` VALUES ('10', '14', '死亡之舞');
INSERT INTO `commodity` VALUES ('11', '14', '狂徒铠甲');
INSERT INTO `commodity` VALUES ('12', '14', '公理圆瓜');
INSERT INTO `commodity` VALUES ('13', '15', '巨人腰带');
INSERT INTO `commodity` VALUES ('14', '15', '吸血鬼节杖');
INSERT INTO `commodity` VALUES ('15', '15', '提亚马特');
INSERT INTO `commodity` VALUES ('16', '16', '三相之力');
INSERT INTO `commodity` VALUES ('17', '16', '帝国指令');
INSERT INTO `commodity` VALUES ('18', '16', '兰德里的苦楚');
INSERT INTO `commodity` VALUES ('19', '16', '不朽盾该');
INSERT INTO `commodity` VALUES ('20', '17', '三文鱼');
