SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS eam_aa_strategy;
DROP TABLE IF EXISTS eam_node_flowctl_re;
DROP TABLE IF EXISTS eam_node_interface_re;
DROP TABLE IF EXISTS eam_node_logtype_re;
DROP TABLE IF EXISTS eam_node_msgformat_re;
DROP TABLE IF EXISTS eam_node_route_re;
DROP TABLE IF EXISTS eam_node_timeout_re;
DROP TABLE IF EXISTS eam_syslink;
DROP TABLE IF EXISTS eam_linknode;
DROP TABLE IF EXISTS eam_system_module;
DROP TABLE IF EXISTS eam_system_sysproperty_re;
DROP TABLE IF EXISTS eam_system;
DROP TABLE IF EXISTS eam_aa_layer;
DROP TABLE IF EXISTS eam_flow_ctl_alg;
DROP TABLE IF EXISTS eam_interface;
DROP TABLE IF EXISTS eam_log_type;
DROP TABLE IF EXISTS eam_msg_format;
DROP TABLE IF EXISTS eam_protocol;
DROP TABLE IF EXISTS eam_route_alg;
DROP TABLE IF EXISTS eam_sysgroup;
DROP TABLE IF EXISTS eam_sysproperty;
DROP TABLE IF EXISTS eam_sysprop_type;
DROP TABLE IF EXISTS eam_timeout_alg;




/* Create Tables */

CREATE TABLE eam_aa_layer
(
	-- UUID
	id varchar(40) NOT NULL COMMENT 'UUID',
	-- 架构层次名称
	name varchar(250) COMMENT '架构层次名称',
	-- 架构层次简称
	chinese_name varchar(250) COMMENT '架构层次简称',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(2000) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


-- 关联系统吗？
CREATE TABLE eam_aa_strategy
(
	-- UUID
	id varchar(40) NOT NULL COMMENT 'UUID',
	-- 决策点名称
	name varchar(250) NOT NULL COMMENT '决策点名称',
	-- 决策点中文名
	chinese_name text COMMENT '决策点中文名',
	-- UUID
	eam_system_id varchar(40) NOT NULL COMMENT '所属系统',
	-- 决策过程
	strategy_process text COMMENT '决策过程',
	-- 结论
	conclusion text COMMENT '结论',
	-- 创建者
	create_by varchar(40) COMMENT '创建者',
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(40) COMMENT '更新者',
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(2000) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '关联系统吗？';


CREATE TABLE eam_flow_ctl_alg
(
	-- UUID
	ID varchar(40) NOT NULL COMMENT 'UUID',
	-- 流控名称
	NAME varchar(255) NOT NULL COMMENT '流控名称',
	-- 中文名称
	CHINESE_NAME text COMMENT '中文名称',
	-- 创建者
	CREATE_BY varchar(64) COMMENT '创建者',
	-- 创建时间
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	-- 更新者
	UPDATE_BY varchar(64) COMMENT '更新者',
	-- 更新时间
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	REMARKS varchar(255) COMMENT '备注信息',
	-- 删除标记
	DEL_FLG char COMMENT '删除标记',
	PRIMARY KEY (ID)
);


-- 字段待确认？
CREATE TABLE eam_interface
(
	-- 编号
	id varchar(40) NOT NULL COMMENT '编号',
	-- 接口名称
	name text NOT NULL COMMENT '接口名称',
	-- 接口中文名
	chinese_name varchar(255) COMMENT '接口中文名',
	-- 请求消息格式
	req_msg_format varchar(2047) COMMENT '请求消息格式',
	-- 响应消息格式
	rsp_msg_format varchar(2047) COMMENT '响应消息格式',
	-- 启用时间
	start_date varchar(10) COMMENT '启用时间',
	-- 是否账务交易
	account_trade varchar(10) COMMENT '是否账务交易',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	-- 创建时间
	create_date timestamp COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(2000) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '字段待确认？';


CREATE TABLE eam_linknode
(
	-- UUID
	id varchar(40) NOT NULL COMMENT 'UUID',
	-- 节点名称
	name varchar(250) NOT NULL COMMENT '节点名称',
	-- 中文名称
	chinese_name varchar(250) COMMENT '中文名称',
	-- 节点系统ID
	eam_system_id varchar(40) NOT NULL COMMENT '节点系统',
	-- 节点类型
	linknode_type varchar(40) COMMENT '节点类型',
	-- UUID
	eam_protocol_id varchar(40) NOT NULL COMMENT '通讯协议',
	-- 创建者
	create_by varchar(40) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(40) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(2000) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE eam_log_type
(
	-- UUID
	ID varchar(40) NOT NULL COMMENT 'UUID',
	-- 日志名称
	NAME varchar(255) NOT NULL COMMENT '日志名称',
	-- 日志简称
	CHINESE_NAME text COMMENT '日志简称',
	-- 日志级别
	LOG_RANGE varchar(255) COMMENT '日志级别',
	-- 日志清理规则
	LOG_CLEAN_TYPE varchar(255) COMMENT '日志清理规则',
	-- 创建者
	CREATE_BY varchar(64) COMMENT '创建者',
	-- 创建时间
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	-- 更新者
	UPDATE_BY varchar(64) COMMENT '更新者',
	-- 更新时间
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	REMARKS varchar(255) COMMENT '备注信息',
	-- 删除标记
	DEL_FLG char COMMENT '删除标记',
	PRIMARY KEY (ID)
);


CREATE TABLE eam_msg_format
(
	-- 编号
	id varchar(40) NOT NULL COMMENT '编号',
	-- 报文格式名称
	name text NOT NULL COMMENT '报文格式名称',
	-- 报文格式中文名
	chinese_name varchar(255) COMMENT '报文格式中文名',
	-- 报文格式
	format varchar(40) COMMENT '报文格式',
	-- 报文头
	msg_head varchar(255) COMMENT '报文头',
	-- 报文体
	msg_body varchar(255) COMMENT '报文体',
	-- 最大长度
	max_length varchar(10) COMMENT '最大长度',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(2000) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_flowctl_re
(
	id varchar(40) NOT NULL,
	-- UUID
	eam_linknode_id varchar(40) COMMENT '节点',
	-- UUID
	eam_flow_ctl_alg_id varchar(40) COMMENT '流控',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_interface_re
(
	id varchar(40) NOT NULL,
	-- UUID
	eam_linknode_id varchar(40) NOT NULL COMMENT 'UUID',
	-- 编号
	eam_interface_id varchar(40) NOT NULL COMMENT '编号',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_logtype_re
(
	id varchar(40) NOT NULL,
	-- UUID
	eam_linknode_id varchar(40) COMMENT '节点',
	-- UUID
	eam_route_alg_id varchar(40) COMMENT '路由',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_msgformat_re
(
	id varchar(40) NOT NULL,
	-- UUID
	eam_linknode_id varchar(40) COMMENT '节点',
	-- UUID
	eam_msg_format_id varchar(40) COMMENT '报文格式',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_route_re
(
	id varchar(40) NOT NULL,
	-- UUID
	eam_linknode_id varchar(40) COMMENT '节点',
	-- UUID
	eam_log_type_id varchar(40) COMMENT '日志',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_timeout_re
(
	id varchar(40) NOT NULL,
	-- UUID
	eam_linknode_id varchar(40) COMMENT '节点',
	-- UUID
	eam_timeout_alg_id varchar(40) COMMENT '超时算法',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	PRIMARY KEY (id)
);


-- 字段待确认？
CREATE TABLE eam_protocol
(
	-- UUID
	ID varchar(40) NOT NULL COMMENT 'UUID',
	-- 协议名称
	NAME varchar(255) NOT NULL COMMENT '协议名称',
	-- 中文名称
	CHINESE_NAME text COMMENT '中文名称',
	-- 访问地址
	ADDRESS varchar(2000) COMMENT '访问地址',
	-- 链接类型
	LINK_TYPE varchar(40) COMMENT '链接类型',
	-- 最大包长度
	MAXPACKAGE varchar(40) COMMENT '最大包长度',
	-- 创建者
	CREATE_BY varchar(64) COMMENT '创建者',
	-- 创建时间
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	-- 更新者
	UPDATE_BY varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	REMARKS varchar(255) COMMENT '备注信息',
	-- 删除标记
	DEL_FLG char  COMMENT '删除标记',
	PRIMARY KEY (ID)
) COMMENT = '字段待确认？';


CREATE TABLE eam_route_alg
(
	-- UUID
	ID varchar(40) NOT NULL COMMENT 'UUID',
	-- 路由名称
	NAME varchar(255) NOT NULL COMMENT '路由名称',
	-- 路由简称
	CHINESE_NAME text COMMENT '路由简称',
	-- 基础路由
	ROUTE_BASIS varchar(255) COMMENT '基础路由',
	-- 路由表维护
	RTABLE_MAINTAIN varchar(255) COMMENT '路由表维护',
	-- 路由表存储
	RTABLE_STORE varchar(255) COMMENT '路由表存储',
	-- 创建者
	CREATE_BY varchar(64) COMMENT '创建者',
	-- 创建时间
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	-- 更新者
	UPDATE_BY varchar(64) COMMENT '更新者',
	-- 更新时间
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	REMARKS varchar(255) COMMENT '备注信息',
	-- 删除标记
	DEL_FLG char COMMENT '删除标记',
	PRIMARY KEY (ID)
);


CREATE TABLE eam_sysgroup
(
	-- UUID
	id varchar(40) NOT NULL COMMENT 'UUID',
	-- 群组名称
	name varchar(250) COMMENT '群组名称',
	-- 群组简称
	chinese_name varchar(250) COMMENT '群组简称',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(2000) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE eam_syslink
(
	-- UUID
	id varchar(40) NOT NULL COMMENT 'UUID',
	-- 关系名称
	name varchar(250) COMMENT '关系名称',
	-- 中文名称
	chinese_name varchar(250) COMMENT '中文名称',
	-- 关联关系类型
	link_type varchar(40) COMMENT '关联关系类型',
	eam_system_start_id varchar(40),
	-- 起始节点
	start_linknode_id varchar(40) NOT NULL COMMENT '起始节点',
	eam_system_end_id varchar(40),
	-- 终止节点
	end_linknode_id varchar(40) NOT NULL COMMENT '终止节点',
	-- 关联关系状态
	link_status varchar(40) COMMENT '关联关系状态',
	-- 创建者
	create_by varchar(40) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(40) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(2000) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE eam_sysproperty
(
	id varchar(40) NOT NULL,
	name varchar(100),
	chinese_name varchar(200),
	eam_sysprop_type_id varchar(40) NOT NULL,
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	PRIMARY KEY (id)
);


CREATE TABLE eam_sysprop_type
(
	id varchar(40) NOT NULL,
	name varchar(200),
	chinese_name varchar(200),
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	PRIMARY KEY (id)
);


CREATE TABLE eam_system
(
	-- UUID
	id varchar(40) NOT NULL COMMENT 'UUID',
	-- 系统编号
	no varchar(20) COMMENT '系统编号',
	-- 中文名称
	chinese_name varchar(250) COMMENT '中文名称',
	-- 系统名称
	name varchar(200) COMMENT '系统名称',
	english_name varchar(100),
	english_short varchar(100),
	alias varchar(50),
	-- 所属银行
	eam_bank varchar(40) COMMENT '所属银行',
	-- 所属系统群组
	eam_sysgroup_id varchar(40) NOT NULL COMMENT '所属系统群组',
	-- 所属应用架构层次
	eam_aa_layer_id varchar(40) NOT NULL COMMENT '所属应用架构层次',
	-- 机构层次(字典)
	eam_org_layer varchar(40) COMMENT '机构层次(字典)',
	-- 建设类型(字典)
	eam_build_type varchar(40) COMMENT '建设类型(字典)',
	-- 建设状态(字典)
	eam_build_state varchar(40) COMMENT '建设状态(字典)',
	online_date timestamp,
	-- 未来走向(字典)
	eam_trend varchar(40) COMMENT '未来走向(字典)',
	target_system varchar(100),
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date timestamp  NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(2000) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE eam_system_module
(
	-- UUID
	id varchar(40) NOT NULL COMMENT 'UUID',
	-- 所属系统ID
	eam_system_id varchar(40) NOT NULL COMMENT '所属系统',
	-- 模块名称
	name varchar(250) COMMENT '模块名称',
	-- 中文名称
	chinese_name varchar(250) COMMENT '中文名称',
	-- 描述
	manager varchar(40) COMMENT '描述',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date timestamp  NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(2000) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE eam_system_sysproperty_re
(
	id varchar(40) NOT NULL,
	-- UUID
	eam_system_id varchar(40) NOT NULL COMMENT '系统',
	eam_sysproperty_id varchar(40) NOT NULL COMMENT '属性',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	PRIMARY KEY (id)
);


CREATE TABLE eam_timeout_alg
(
	-- UUID
	ID varchar(40) NOT NULL COMMENT 'UUID',
	-- 名称
	NAME varchar(255) NOT NULL COMMENT '名称',
	-- 中文名称
	CHINESE_NAME text COMMENT '中文名称',
	-- 创建者
	CREATE_BY varchar(64) COMMENT '创建者',
	-- 创建时间
	CREATE_DATE timestamp  NOT NULL COMMENT '创建时间',
	-- 更新者
	UPDATE_BY varchar(64) COMMENT '更新者',
	-- 更新时间
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '更新时间',
	-- 备注信息
	REMARKS varchar(255) COMMENT '备注信息',
	-- 删除标记
	DEL_FLG char COMMENT '删除标记',
	PRIMARY KEY (ID)
);



/* Create Foreign Keys */

ALTER TABLE eam_system
	ADD FOREIGN KEY (eam_aa_layer_id)
	REFERENCES eam_aa_layer (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_flowctl_re
	ADD FOREIGN KEY (eam_flow_ctl_alg_id)
	REFERENCES eam_flow_ctl_alg (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_interface_re
	ADD FOREIGN KEY (eam_interface_id)
	REFERENCES eam_interface (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_flowctl_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_interface_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_logtype_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_msgformat_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_route_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_timeout_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_syslink
	ADD FOREIGN KEY (end_linknode_id)
	REFERENCES eam_linknode (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_syslink
	ADD FOREIGN KEY (start_linknode_id)
	REFERENCES eam_linknode (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_route_re
	ADD FOREIGN KEY (eam_log_type_id)
	REFERENCES eam_log_type (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_msgformat_re
	ADD FOREIGN KEY (eam_msg_format_id)
	REFERENCES eam_msg_format (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_linknode
	ADD FOREIGN KEY (eam_protocol_id)
	REFERENCES eam_protocol (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_logtype_re
	ADD FOREIGN KEY (eam_route_alg_id)
	REFERENCES eam_route_alg (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_system
	ADD FOREIGN KEY (eam_sysgroup_id)
	REFERENCES eam_sysgroup (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_system_sysproperty_re
	ADD FOREIGN KEY (eam_sysproperty_id)
	REFERENCES eam_sysproperty (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_sysproperty
	ADD FOREIGN KEY (eam_sysprop_type_id)
	REFERENCES eam_sysprop_type (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_aa_strategy
	ADD FOREIGN KEY (eam_system_id)
	REFERENCES eam_system (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_linknode
	ADD FOREIGN KEY (eam_system_id)
	REFERENCES eam_system (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_system_module
	ADD FOREIGN KEY (eam_system_id)
	REFERENCES eam_system (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_system_sysproperty_re
	ADD FOREIGN KEY (eam_system_id)
	REFERENCES eam_system (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE eam_node_timeout_re
	ADD FOREIGN KEY (eam_timeout_alg_id)
	REFERENCES eam_timeout_alg (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



