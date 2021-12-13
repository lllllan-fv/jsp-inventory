/*
Navicat MySQL Data Transfer

Source Server         : txyun
Source Server Version : 50734
Source Host           : 1.116.114.142:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-12-13 13:36:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `record_details`
-- ----------------------------
DROP TABLE IF EXISTS `record_details`;
CREATE TABLE `record_details` (
  `record` int(11) NOT NULL,
  `commodity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  KEY `record` (`record`),
  KEY `commodity` (`commodity`),
  CONSTRAINT `record_details_ibfk_1` FOREIGN KEY (`record`) REFERENCES `record` (`id`),
  CONSTRAINT `record_details_ibfk_2` FOREIGN KEY (`commodity`) REFERENCES `commodity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record_details
-- ----------------------------
INSERT INTO `record_details` VALUES ('14', '9', '3400', '17');
INSERT INTO `record_details` VALUES ('14', '19', '3400', '12');
INSERT INTO `record_details` VALUES ('15', '5', '450', '20');
INSERT INTO `record_details` VALUES ('16', '8', '2800', '2');
INSERT INTO `record_details` VALUES ('17', '6', '450', '20');
INSERT INTO `record_details` VALUES ('18', '6', '450', '10');
INSERT INTO `record_details` VALUES ('19', '6', '450', '5');
INSERT INTO `record_details` VALUES ('20', '8', '2800', '1');
