/*
Navicat MySQL Data Transfer

Source Server         : txyun
Source Server Version : 50734
Source Host           : 1.116.114.142:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-12-13 13:35:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(5) NOT NULL COMMENT '组别: [仓库, 供应商, 客户]',
  `name` varchar(20) NOT NULL COMMENT '对象名称',
  `address` varchar(20) NOT NULL COMMENT '地址',
  `principal` varchar(20) DEFAULT NULL COMMENT '仓库负责人',
  `telephone` varchar(15) DEFAULT NULL COMMENT '仓库负责人联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('60', '仓库', '北京仓库', '北京/北京市', '莎弥拉', '12345678911');
INSERT INTO `address` VALUES ('61', '仓库', '西安仓库', '陕西/西安市', '雷克顿', '12345678900');
INSERT INTO `address` VALUES ('62', '仓库', '正义天使仓库', '浙江/杭州市', '凯尔', '12345678978');
INSERT INTO `address` VALUES ('63', '仓库', '元素仓库', '吉林/长春市', '奇亚娜', '12345678967');
INSERT INTO `address` VALUES ('64', '仓库', '天启仓库', '青海/西宁市', '卡尔玛', '12345678955');
INSERT INTO `address` VALUES ('65', '仓库', '暴走仓库', '上海/上海市', '金克丝', '12345678911');
INSERT INTO `address` VALUES ('66', '仓库', '议员仓库', '江苏/南京市', '杰斯', '12345678999');
INSERT INTO `address` VALUES ('67', '仓库', '女警仓库', '浙江/绍兴市', '小蛋糕', '12345678966');
INSERT INTO `address` VALUES ('68', '仓库', '机械仓库', '天津/天津市', '维克托', '12345678987');
INSERT INTO `address` VALUES ('69', '仓库', '时间仓库', '黑龙江/哈尔滨市', '艾克', '12345678996');
INSERT INTO `address` VALUES ('70', '供应商', '正义巨像集团', '北京/北京市', null, null);
INSERT INTO `address` VALUES ('71', '供应商', '刀锋集团', '上海/上海市', null, null);
INSERT INTO `address` VALUES ('72', '供应商', '符文公司', '江苏/苏州市', null, null);
INSERT INTO `address` VALUES ('73', '供应商', '愁云使者', '湖北/武汉市', null, null);
INSERT INTO `address` VALUES ('74', '供应商', '戏命师', '河北/唐山市', null, null);
INSERT INTO `address` VALUES ('75', '客户', '圣枪游侠', '广东/广州市', null, null);
INSERT INTO `address` VALUES ('76', '客户', '皎月公司', '四川/成都市', null, null);
INSERT INTO `address` VALUES ('77', '客户', '生化集团', '重庆/重庆市', null, null);
INSERT INTO `address` VALUES ('78', '客户', '瓦洛兰', '内蒙古/呼和浩特市', null, null);
INSERT INTO `address` VALUES ('79', '仓库', '北京二号仓库', '北京/北京市', '张三', '13246789111');
INSERT INTO `address` VALUES ('80', '供应商', '水牛生鲜', '北京/北京市', null, null);
INSERT INTO `address` VALUES ('81', '客户', '沃尔超市', '北京/北京市', null, null);
