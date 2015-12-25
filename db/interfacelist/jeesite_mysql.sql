/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : jeesite

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2015-12-24 10:49:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `eam_interface`
-- ----------------------------
DROP TABLE IF EXISTS `eam_interface`;
CREATE TABLE `eam_interface` (
	`id` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
	`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '接口名称',
	`chinese_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接口中文名',
	`eam_linknode_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属关联节点编号',
	`req_msg_format` varchar(2047) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请求消息格式',
	`rsp_msg_format` varchar(2047) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '响应消息格式',
	`start_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '启用时间',
	`account_trade` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否账务交易',
	`create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
	`create_date` datetime DEFAULT NULL COMMENT '创建时间',
	`update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
	`update_date` datetime DEFAULT NULL COMMENT '更新时间',
	`remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (`id`),
	KEY `eam_interface_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='接口清单表';

-- ----------------------------
-- Records of eam_interface
-- ----------------------------
