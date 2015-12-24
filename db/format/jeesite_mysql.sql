/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : jeesite

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2015-12-24 10:56:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `eam_msg_format`
-- ----------------------------
DROP TABLE IF EXISTS `eam_msg_format`;
CREATE TABLE `eam_msg_format` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '报文格式名称',
  `chinese_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报文格式中文名',
  `format` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报文格式',
  `msg_head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报文头',
  `msg_body` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报文体',
  `max_length` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最大长度',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `eam_msg_format_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='报文格式表';

-- ----------------------------
-- Records of eam_msg_format
-- ----------------------------
