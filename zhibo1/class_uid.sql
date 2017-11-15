/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : 65001

 Date: 11/11/2017 07:01:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class_uid
-- ----------------------------
DROP TABLE IF EXISTS `class_uid`;
CREATE TABLE `class_uid`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `pid` int(11) NOT NULL COMMENT '课程名字',
  `uid` int(11) NULL DEFAULT NULL,
  `homework` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of class_uid
-- ----------------------------
INSERT INTO `class_uid` VALUES (1, 74, 7, NULL);

-- ----------------------------
-- Table structure for classinfo
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '开课人uid',
  `pid` int(11) NULL DEFAULT NULL COMMENT '课程名',
  `uuid` int(11) NULL DEFAULT NULL COMMENT '选课人的id',
  `fileaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业文件地址',
  `grade` int(3) NULL DEFAULT NULL COMMENT '课程分数',
  `state` int(2) NULL DEFAULT NULL COMMENT '课程状态字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES (1, 7, 74, 11, NULL, NULL, NULL);
INSERT INTO `classinfo` VALUES (2, NULL, 75, 2, NULL, NULL, NULL);
INSERT INTO `classinfo` VALUES (3, 7, 74, 11, NULL, NULL, NULL);
INSERT INTO `classinfo` VALUES (4, 7, 75, 11, NULL, NULL, NULL);
INSERT INTO `classinfo` VALUES (5, 7, 76, 11, NULL, NULL, NULL);
INSERT INTO `classinfo` VALUES (6, 7, 74, 11, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
