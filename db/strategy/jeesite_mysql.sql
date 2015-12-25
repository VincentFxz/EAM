/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : jeesite

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2015-12-24 10:49:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `eam_aa_strategy`
-- ----------------------------
DROP TABLE IF EXISTS `eam_aa_strategy`;
CREATE TABLE `eam_aa_strategy` (
	`id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
	`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '架构决策点名称',
	`chinese_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '架构决策中文名',
	`strategy_process` varchar(2047) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '决策过程',
	`conclusion` varchar(2047) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '结论',
	`create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
	`create_date` datetime DEFAULT NULL COMMENT '创建时间',
	`update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
	`update_date` datetime DEFAULT NULL COMMENT '更新时间',
	`remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
	`del_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (`id`),
	KEY `eam_aa_strategy_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='决策表';

-- ----------------------------
-- Records of eam_aa_strategy
-- ----------------------------

