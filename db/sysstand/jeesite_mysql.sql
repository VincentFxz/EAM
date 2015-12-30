
-- ----------------------------
-- Table structure for `eam_interface`
-- ----------------------------
DROP TABLE IF EXISTS `eam_interface`;
CREATE TABLE `eam_interface` (
  `id` varchar(40) not null COMMENT '编号',
  `name` text  not null COMMENT '接口名称',
  `chinese_name` varchar(255)  COMMENT '接口中文名',
  `eam_linknode_id` varchar(40)  COMMENT '所属关联节点编号',
  `req_msg_format` varchar(2047)  COMMENT '请求消息格式',
  `rsp_msg_format` varchar(2047)  COMMENT '响应消息格式',
  `start_date` varchar(10)  COMMENT '启用时间',
  `account_trade` varchar(10)  COMMENT '是否账务交易',
  `create_by` varchar(64)  COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64)  COMMENT '更新者',
  `update_date` timestamp COMMENT '更新时间',
  `remarks` text COMMENT '备注信息',
  `del_flag` char(1)  COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
)  COMMENT='接口清单管理';


-- ----------------------------
-- Table structure for `eam_msg_format`
-- ----------------------------
DROP TABLE IF EXISTS `eam_msg_format`;
CREATE TABLE `eam_msg_format` (
  `id` varchar(40)  NOT NULL COMMENT '编号',
  `name` text  NOT NULL COMMENT '报文格式名称',
  `chinese_name` varchar(255)  COMMENT '报文格式中文名',
  `format` varchar(40)  COMMENT '报文格式',
  `msg_head` varchar(255)  COMMENT '报文头',
  `msg_body` varchar(255)  COMMENT '报文体',
  `max_length` varchar(10)  COMMENT '最大长度',
  `create_by` varchar(64)  COMMENT '创建者',
  `create_date` timestamp  COMMENT '创建时间',
  `update_by` varchar(64)  COMMENT '更新者',
  `update_date` timestamp  COMMENT '更新时间',
  `remarks` text  COMMENT '备注信息',
  `del_flag` char(1)  COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
)  COMMENT='报文格式管理';


