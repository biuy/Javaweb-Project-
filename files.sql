/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : users

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-15 17:48:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `filename` varchar(255) DEFAULT NULL,
  `filedir` varchar(255) DEFAULT NULL,
  `filetype` varchar(255) DEFAULT NULL,
  `filesort` varchar(255) DEFAULT NULL,
  `fileintro` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `useremail` varchar(255) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES ('9.c', '/upload/doc', 'doc', '考试资料', '迷宫问题c语言', 'host', 'test@ustc', '2018-05-15 16:16:01');
INSERT INTO `files` VALUES ('Emmet使用.docx', '/upload/doc', 'doc', '实验报告', 'Emmet使用笔记', 'host', 'test@ustc', '2018-05-15 16:26:07');
INSERT INTO `files` VALUES ('sql笔记.txt', '/upload/doc', 'doc', '实验报告', 'sql简单笔记', 'host', 'test@ustc', '2018-05-15 16:26:52');
INSERT INTO `files` VALUES ('用户登录注册注销案例分析.png', '/upload/pic', 'pic', '其他', '图片测试', 'host', 'test@ustc', '2018-05-15 16:27:10');
INSERT INTO `files` VALUES ('登录与注销.pptx', '/upload/doc', 'doc', '考试资料', '测试', 'host', 'test@ustc', '2018-05-15 16:28:34');
