
/* Drop Tables */

DROP TABLE eam_aa_strategy CASCADE CONSTRAINTS;
DROP TABLE eam_node_flowctl_re CASCADE CONSTRAINTS;
DROP TABLE eam_node_interface_re CASCADE CONSTRAINTS;
DROP TABLE eam_node_logtype_re CASCADE CONSTRAINTS;
DROP TABLE eam_node_msgformat_re CASCADE CONSTRAINTS;
DROP TABLE eam_node_route_re CASCADE CONSTRAINTS;
DROP TABLE eam_node_timeout_re CASCADE CONSTRAINTS;
DROP TABLE eam_syslink CASCADE CONSTRAINTS;
DROP TABLE eam_linknode CASCADE CONSTRAINTS;
DROP TABLE eam_system_module CASCADE CONSTRAINTS;
DROP TABLE eam_system_sysproperty_re CASCADE CONSTRAINTS;
DROP TABLE eam_system CASCADE CONSTRAINTS;
DROP TABLE eam_aa_layer CASCADE CONSTRAINTS;
DROP TABLE eam_flow_ctl_alg CASCADE CONSTRAINTS;
DROP TABLE eam_interface CASCADE CONSTRAINTS;
DROP TABLE eam_log_type CASCADE CONSTRAINTS;
DROP TABLE eam_msg_format CASCADE CONSTRAINTS;
DROP TABLE eam_protocol CASCADE CONSTRAINTS;
DROP TABLE eam_route_alg CASCADE CONSTRAINTS;
DROP TABLE eam_sysgroup CASCADE CONSTRAINTS;
DROP TABLE eam_sysproperty CASCADE CONSTRAINTS;
DROP TABLE eam_sysprop_type CASCADE CONSTRAINTS;
DROP TABLE eam_timeout_alg CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE eam_aa_layer
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- 架构层次名称
	name varchar2(250 char),
	-- 架构层次简称
	chinese_name varchar2(250 char),
	-- 创建者
	create_by varchar2(64 char) NOT NULL,
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	update_by varchar2(64 char) NOT NULL,
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	remarks nvarchar2(2000),
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 关联系统吗？
CREATE TABLE eam_aa_strategy
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- 决策点名称
	name varchar2(250 char) NOT NULL,
	-- 决策点中文名
	chinese_name clob,
	-- 所属系统
	eam_system_id varchar2(40 char) NOT NULL,
	-- 决策过程
	strategy_process clob,
	-- 结论
	conclusion clob,
	-- 创建者
	create_by varchar2(40 char),
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	update_by varchar2(40 char),
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	remarks nvarchar2(2000),
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_flow_ctl_alg
(
	-- UUID
	ID varchar2(40 char) NOT NULL,
	-- 流控名称
	NAME varchar2(255 char) NOT NULL,
	-- 中文名称
	CHINESE_NAME clob,
	-- 创建者
	CREATE_BY varchar2(64 char),
	-- 创建时间
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	UPDATE_BY varchar2(64 char),
	-- 更新时间
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	REMARKS varchar2(255 char),
	-- 删除标记
	DEL_FLG char,
	PRIMARY KEY (ID)
);


-- 字段待确认？
CREATE TABLE eam_interface
(
	-- 编号
	id varchar2(40 char) NOT NULL,
	-- 接口名称
	name clob NOT NULL,
	-- 接口中文名
	chinese_name varchar2(255 char),
	-- 请求消息格式
	req_msg_format varchar2(2047 char),
	-- 响应消息格式
	rsp_msg_format varchar2(2047 char),
	-- 启用时间
	start_date varchar2(10 char),
	-- 是否账务交易
	account_trade varchar2(10 char),
	-- 创建者
	create_by varchar2(64 char),
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64 char),
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	remarks nvarchar2(2000),
	-- 删除标记（0：正常；1：删除）
	del_flag char,
	PRIMARY KEY (id)
);


CREATE TABLE eam_linknode
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- 节点名称
	name varchar2(250 char) NOT NULL,
	-- 中文名称
	chinese_name nvarchar2(250),
	-- 节点系统ID
	eam_system_id varchar2(40 char) NOT NULL,
	-- 节点类型
	linknode_type varchar2(40 char),
	-- 相关协议
	eam_protocol_id varchar2(40 char) NOT NULL,
	-- 创建者
	create_by varchar2(40 char) NOT NULL,
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	update_by varchar2(40 char) NOT NULL,
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	remarks nvarchar2(2000),
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_log_type
(
	-- UUID
	ID varchar2(40 char) NOT NULL,
	-- 日志名称
	NAME varchar2(255 char) NOT NULL,
	-- 日志简称
	CHINESE_NAME clob,
	-- 日志级别
	LOG_RANGE varchar2(255 char),
	-- 日志清理规则
	LOG_CLEAN_TYPE varchar2(255 char),
	-- 创建者
	CREATE_BY varchar2(64 char),
	-- 创建时间
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	UPDATE_BY varchar2(64 char),
	-- 更新时间
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	REMARKS varchar2(255 char),
	-- 删除标记
	DEL_FLG char,
	PRIMARY KEY (ID)
);


CREATE TABLE eam_msg_format
(
	-- 编号
	id varchar2(40 char) NOT NULL,
	-- 报文格式名称
	name clob NOT NULL,
	-- 报文格式中文名
	chinese_name varchar2(255 char),
	-- 报文格式
	format varchar2(40 char),
	-- 报文头
	msg_head varchar2(255 char),
	-- 报文体
	msg_body varchar2(255 char),
	-- 最大长度
	max_length varchar2(10 char),
	-- 创建者
	create_by varchar2(64 char) NOT NULL,
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	update_by varchar2(64 char) NOT NULL,
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	remarks nvarchar2(2000),
	-- 删除标记（0：正常；1：删除）
	del_flag char NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_flowctl_re
(
	id varchar2(40 char) NOT NULL,
	-- 节点
	eam_linknode_id varchar2(40 char),
	-- 流控
	eam_flow_ctl_alg_id varchar2(40 char),
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks varchar2(255),
	-- 创建者
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_interface_re
(
	id varchar2(40) NOT NULL,
	-- 节点
	eam_linknode_id varchar2(40 char) NOT NULL,
	-- 接口
	eam_interface_id varchar2(40 char) NOT NULL,
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks varchar2(255),
	-- 创建者
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_logtype_re
(
	id varchar2(40 char) NOT NULL,
	-- 节点
	eam_linknode_id varchar2(40 char),
	-- 日志
	eam_log_type_id varchar2(40 char),
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks varchar2(255),
	-- 创建者
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_msgformat_re
(
	id varchar2(40 char) NOT NULL,
	-- 节点
	eam_linknode_id varchar2(40 char),
	-- 报文格式
	eam_msg_format_id varchar2(40 char),
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks varchar2(255),
	-- 创建者
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_route_re
(
	id varchar2(40 char) NOT NULL,
	-- 节点
	eam_linknode_id varchar2(40 char),
	-- 路由
	eam_route_alg_id varchar2(40 char),
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks varchar2(255),
	-- 创建者
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_timeout_re
(
	id varchar2(40 char) NOT NULL,
	-- 节点
	eam_linknode_id varchar2(40 char),
	-- 超时算法
	eam_timeout_alg_id varchar2(40 char),
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks varchar2(255),
	-- 创建者
	create_by varchar2(64),
	PRIMARY KEY (id)
);


-- 字段待确认？
CREATE TABLE eam_protocol
(
	-- UUID
	ID varchar2(40 char) NOT NULL,
	-- 协议名称
	NAME varchar2(255 char) NOT NULL,
	-- 中文名称
	CHINESE_NAME clob,
	-- 访问地址
	ADDRESS nvarchar2(2000),
	-- 链接类型
	LINK_TYPE varchar2(40 char),
	-- 最大包长度
	MAXPACKAGE varchar2(40 char),
	-- 创建者
	CREATE_BY varchar2(64 char),
	-- 创建时间
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	UPDATE_BY varchar2(64 char) NOT NULL,
	-- 更新时间
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	REMARKS varchar2(255 char),
	-- 删除标记
	DEL_FLG char NOT NULL,
	PRIMARY KEY (ID)
);


CREATE TABLE eam_route_alg
(
	-- UUID
	ID varchar2(40 char) NOT NULL,
	-- 路由名称
	NAME varchar2(255 char) NOT NULL,
	-- 路由简称
	CHINESE_NAME clob,
	-- 基础路由
	ROUTE_BASIS varchar2(255 char),
	-- 路由表维护
	RTABLE_MAINTAIN varchar2(255 char),
	-- 路由表存储
	RTABLE_STORE varchar2(255 char),
	-- 创建者
	CREATE_BY varchar2(64 char),
	-- 创建时间
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	UPDATE_BY varchar2(64 char),
	-- 更新时间
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	REMARKS varchar2(255 char),
	-- 删除标记
	DEL_FLG char,
	PRIMARY KEY (ID)
);


CREATE TABLE eam_sysgroup
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- 群组名称
	name varchar2(250 char),
	-- 群组简称
	chinese_name varchar2(250 char),
	-- 创建者
	create_by varchar2(64 char) NOT NULL,
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	update_by varchar2(64 char) NOT NULL,
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	remarks nvarchar2(2000),
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_syslink
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- 关系名称
	name varchar2(250 char),
	-- 中文名称
	chinese_name nvarchar2(250),
	-- 关联关系类型
	link_type varchar2(40 char),
	eam_system_start_id varchar2(40 char),
	-- 起始节点
	start_linknode_id varchar2(40 char) NOT NULL,
	eam_system_end_id varchar2(40 char),
	-- 终止节点
	end_linknode_id varchar2(40 char) NOT NULL,
	-- 关联关系状态
	link_status varchar2(40 char),
	-- 创建者
	create_by varchar2(40 char) NOT NULL,
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	update_by varchar2(40 char) NOT NULL,
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	remarks nvarchar2(2000),
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_sysproperty
(
	id varchar2(40 char) NOT NULL,
	name varchar2(100 char),
	chinese_name nvarchar2(200),
	eam_sysprop_type_id varchar2(40 char) NOT NULL,
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks varchar2(255),
	-- 创建者
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_sysprop_type
(
	id varchar2(40 char) NOT NULL,
	name nvarchar2(200),
	chinese_name nvarchar2(200),
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks varchar2(255),
	-- 创建者
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_system
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- 系统编号
	no varchar2(20 char),
	-- 中文名称
	chinese_name nvarchar2(250),
	-- 系统名称
	name nvarchar2(200),
	english_name varchar2(100 char),
	english_short varchar2(100 char),
	alias nvarchar2(50),
	-- 所属银行
	eam_bank varchar2(40 char),
	-- 所属系统群组
	eam_sysgroup_id varchar2(40 char) NOT NULL,
	-- 所属应用架构层次
	eam_aa_layer_id varchar2(40 char) NOT NULL,
	-- 机构层次(字典)
	eam_org_layer varchar2(40 char),
	-- 建设类型(字典)
	eam_build_type varchar2(40 char),
	-- 建设状态(字典)
	eam_build_state varchar2(40 char),
	online_date timestamp,
	-- 未来走向(字典)
	eam_trend varchar2(40 char),
	target_system nvarchar2(100),
	-- 创建者
	create_by varchar2(64 char) NOT NULL,
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	update_by varchar2(64 char) NOT NULL,
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	remarks varchar2(2000 char),
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_system_module
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- 所属系统ID
	eam_system_id varchar2(40 char) NOT NULL,
	-- 模块名称
	name varchar2(250 char),
	-- 中文名称
	chinese_name nvarchar2(250),
	-- 描述
	manager varchar2(40 char),
	-- 创建者
	create_by varchar2(64 char) NOT NULL,
	-- 创建时间
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	update_by varchar2(64 char) NOT NULL,
	-- 更新时间
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	remarks nvarchar2(2000),
	-- 删除标记（0：正常；1：删除）
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_system_sysproperty_re
(
	id varchar2(40 char) NOT NULL,
	-- UUID
	eam_system_id varchar2(40 char) NOT NULL,
	eam_sysproperty_id varchar2(40 char) NOT NULL,
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks varchar2(255),
	-- 创建者
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_timeout_alg
(
	-- UUID
	ID varchar2(40 char) NOT NULL,
	-- 名称
	NAME varchar2(255 char) NOT NULL,
	-- 中文名称
	CHINESE_NAME clob,
	-- 创建者
	CREATE_BY varchar2(64 char),
	-- 创建时间
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- 更新者
	UPDATE_BY varchar2(64 char),
	-- 更新时间
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- 备注信息
	REMARKS varchar2(255 char),
	-- 删除标记
	DEL_FLG char,
	PRIMARY KEY (ID)
);



/* Create Foreign Keys */

ALTER TABLE eam_system
	ADD FOREIGN KEY (eam_aa_layer_id)
	REFERENCES eam_aa_layer (id)
;


ALTER TABLE eam_node_flowctl_re
	ADD FOREIGN KEY (eam_flow_ctl_alg_id)
	REFERENCES eam_flow_ctl_alg (ID)
;


ALTER TABLE eam_node_interface_re
	ADD FOREIGN KEY (eam_interface_id)
	REFERENCES eam_interface (id)
;


ALTER TABLE eam_node_flowctl_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
;


ALTER TABLE eam_node_interface_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
;


ALTER TABLE eam_node_logtype_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
;


ALTER TABLE eam_node_msgformat_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
;


ALTER TABLE eam_node_route_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
;


ALTER TABLE eam_node_timeout_re
	ADD FOREIGN KEY (eam_linknode_id)
	REFERENCES eam_linknode (id)
;


ALTER TABLE eam_syslink
	ADD FOREIGN KEY (end_linknode_id)
	REFERENCES eam_linknode (id)
;


ALTER TABLE eam_syslink
	ADD FOREIGN KEY (start_linknode_id)
	REFERENCES eam_linknode (id)
;


ALTER TABLE eam_node_logtype_re
	ADD FOREIGN KEY (eam_log_type_id)
	REFERENCES eam_log_type (ID)
;


ALTER TABLE eam_node_msgformat_re
	ADD FOREIGN KEY (eam_msg_format_id)
	REFERENCES eam_msg_format (id)
;


ALTER TABLE eam_linknode
	ADD FOREIGN KEY (eam_protocol_id)
	REFERENCES eam_protocol (ID)
;


ALTER TABLE eam_node_route_re
	ADD FOREIGN KEY (eam_route_alg_id)
	REFERENCES eam_route_alg (ID)
;


ALTER TABLE eam_system
	ADD FOREIGN KEY (eam_sysgroup_id)
	REFERENCES eam_sysgroup (id)
;


ALTER TABLE eam_system_sysproperty_re
	ADD FOREIGN KEY (eam_sysproperty_id)
	REFERENCES eam_sysproperty (id)
;


ALTER TABLE eam_sysproperty
	ADD FOREIGN KEY (eam_sysprop_type_id)
	REFERENCES eam_sysprop_type (id)
;


ALTER TABLE eam_aa_strategy
	ADD FOREIGN KEY (eam_system_id)
	REFERENCES eam_system (id)
;


ALTER TABLE eam_linknode
	ADD FOREIGN KEY (eam_system_id)
	REFERENCES eam_system (id)
;


ALTER TABLE eam_system_module
	ADD FOREIGN KEY (eam_system_id)
	REFERENCES eam_system (id)
;


ALTER TABLE eam_system_sysproperty_re
	ADD FOREIGN KEY (eam_system_id)
	REFERENCES eam_system (id)
;


ALTER TABLE eam_node_timeout_re
	ADD FOREIGN KEY (eam_timeout_alg_id)
	REFERENCES eam_timeout_alg (ID)
;



/* Comments */

COMMENT ON COLUMN eam_aa_layer.id IS 'UUID';
COMMENT ON COLUMN eam_aa_layer.name IS '架构层次名称';
COMMENT ON COLUMN eam_aa_layer.chinese_name IS '架构层次简称';
COMMENT ON COLUMN eam_aa_layer.create_by IS '创建者';
COMMENT ON COLUMN eam_aa_layer.create_date IS '创建时间';
COMMENT ON COLUMN eam_aa_layer.update_by IS '更新者';
COMMENT ON COLUMN eam_aa_layer.update_date IS '更新时间';
COMMENT ON COLUMN eam_aa_layer.remarks IS '备注信息';
COMMENT ON COLUMN eam_aa_layer.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON TABLE eam_aa_strategy IS '关联系统吗？';
COMMENT ON COLUMN eam_aa_strategy.id IS 'UUID';
COMMENT ON COLUMN eam_aa_strategy.name IS '决策点名称';
COMMENT ON COLUMN eam_aa_strategy.chinese_name IS '决策点中文名';
COMMENT ON COLUMN eam_aa_strategy.eam_system_id IS 'UUID';
COMMENT ON COLUMN eam_aa_strategy.strategy_process IS '决策过程';
COMMENT ON COLUMN eam_aa_strategy.conclusion IS '结论';
COMMENT ON COLUMN eam_aa_strategy.create_by IS '创建者';
COMMENT ON COLUMN eam_aa_strategy.create_date IS '创建时间';
COMMENT ON COLUMN eam_aa_strategy.update_by IS '更新者';
COMMENT ON COLUMN eam_aa_strategy.update_date IS '更新时间';
COMMENT ON COLUMN eam_aa_strategy.remarks IS '备注信息';
COMMENT ON COLUMN eam_aa_strategy.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_flow_ctl_alg.ID IS 'UUID';
COMMENT ON COLUMN eam_flow_ctl_alg.NAME IS '流控名称';
COMMENT ON COLUMN eam_flow_ctl_alg.CHINESE_NAME IS '中文名称';
COMMENT ON COLUMN eam_flow_ctl_alg.CREATE_BY IS '创建者';
COMMENT ON COLUMN eam_flow_ctl_alg.CREATE_DATE IS '创建时间';
COMMENT ON COLUMN eam_flow_ctl_alg.UPDATE_BY IS '更新者';
COMMENT ON COLUMN eam_flow_ctl_alg.UPDATE_DATE IS '更新时间';
COMMENT ON COLUMN eam_flow_ctl_alg.REMARKS IS '备注信息';
COMMENT ON COLUMN eam_flow_ctl_alg.DEL_FLG IS '删除标记';
COMMENT ON TABLE eam_interface IS '字段待确认？';
COMMENT ON COLUMN eam_interface.id IS '编号';
COMMENT ON COLUMN eam_interface.name IS '接口名称';
COMMENT ON COLUMN eam_interface.chinese_name IS '接口中文名';
COMMENT ON COLUMN eam_interface.req_msg_format IS '请求消息格式';
COMMENT ON COLUMN eam_interface.rsp_msg_format IS '响应消息格式';
COMMENT ON COLUMN eam_interface.start_date IS '启用时间';
COMMENT ON COLUMN eam_interface.account_trade IS '是否账务交易';
COMMENT ON COLUMN eam_interface.create_by IS '创建者';
COMMENT ON COLUMN eam_interface.create_date IS '创建时间';
COMMENT ON COLUMN eam_interface.update_by IS '更新者';
COMMENT ON COLUMN eam_interface.update_date IS '更新时间';
COMMENT ON COLUMN eam_interface.remarks IS '备注信息';
COMMENT ON COLUMN eam_interface.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_linknode.id IS 'UUID';
COMMENT ON COLUMN eam_linknode.name IS '节点名称';
COMMENT ON COLUMN eam_linknode.chinese_name IS '中文名称';
COMMENT ON COLUMN eam_linknode.eam_system_id IS '节点系统ID';
COMMENT ON COLUMN eam_linknode.linknode_type IS '节点类型';
COMMENT ON COLUMN eam_linknode.eam_protocol_id IS 'UUID';
COMMENT ON COLUMN eam_linknode.create_by IS '创建者';
COMMENT ON COLUMN eam_linknode.create_date IS '创建时间';
COMMENT ON COLUMN eam_linknode.update_by IS '更新者';
COMMENT ON COLUMN eam_linknode.update_date IS '更新时间';
COMMENT ON COLUMN eam_linknode.remarks IS '备注信息';
COMMENT ON COLUMN eam_linknode.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_log_type.ID IS 'UUID';
COMMENT ON COLUMN eam_log_type.NAME IS '日志名称';
COMMENT ON COLUMN eam_log_type.CHINESE_NAME IS '日志简称';
COMMENT ON COLUMN eam_log_type.LOG_RANGE IS '日志级别';
COMMENT ON COLUMN eam_log_type.LOG_CLEAN_TYPE IS '日志清理规则';
COMMENT ON COLUMN eam_log_type.CREATE_BY IS '创建者';
COMMENT ON COLUMN eam_log_type.CREATE_DATE IS '创建时间';
COMMENT ON COLUMN eam_log_type.UPDATE_BY IS '更新者';
COMMENT ON COLUMN eam_log_type.UPDATE_DATE IS '更新时间';
COMMENT ON COLUMN eam_log_type.REMARKS IS '备注信息';
COMMENT ON COLUMN eam_log_type.DEL_FLG IS '删除标记';
COMMENT ON COLUMN eam_msg_format.id IS '编号';
COMMENT ON COLUMN eam_msg_format.name IS '报文格式名称';
COMMENT ON COLUMN eam_msg_format.chinese_name IS '报文格式中文名';
COMMENT ON COLUMN eam_msg_format.format IS '报文格式';
COMMENT ON COLUMN eam_msg_format.msg_head IS '报文头';
COMMENT ON COLUMN eam_msg_format.msg_body IS '报文体';
COMMENT ON COLUMN eam_msg_format.max_length IS '最大长度';
COMMENT ON COLUMN eam_msg_format.create_by IS '创建者';
COMMENT ON COLUMN eam_msg_format.create_date IS '创建时间';
COMMENT ON COLUMN eam_msg_format.update_by IS '更新者';
COMMENT ON COLUMN eam_msg_format.update_date IS '更新时间';
COMMENT ON COLUMN eam_msg_format.remarks IS '备注信息';
COMMENT ON COLUMN eam_msg_format.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_node_flowctl_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_flowctl_re.eam_flow_ctl_alg_id IS 'UUID';
COMMENT ON COLUMN eam_node_flowctl_re.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_node_flowctl_re.create_date IS '创建时间';
COMMENT ON COLUMN eam_node_flowctl_re.update_by IS '更新者';
COMMENT ON COLUMN eam_node_flowctl_re.update_date IS '更新时间';
COMMENT ON COLUMN eam_node_flowctl_re.remarks IS '备注信息';
COMMENT ON COLUMN eam_node_flowctl_re.create_by IS '创建者';
COMMENT ON COLUMN eam_node_interface_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_interface_re.eam_interface_id IS '编号';
COMMENT ON COLUMN eam_node_interface_re.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_node_interface_re.create_date IS '创建时间';
COMMENT ON COLUMN eam_node_interface_re.update_by IS '更新者';
COMMENT ON COLUMN eam_node_interface_re.update_date IS '更新时间';
COMMENT ON COLUMN eam_node_interface_re.remarks IS '备注信息';
COMMENT ON COLUMN eam_node_interface_re.create_by IS '创建者';
COMMENT ON COLUMN eam_node_logtype_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_logtype_re.eam_log_type_id IS 'UUID';
COMMENT ON COLUMN eam_node_logtype_re.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_node_logtype_re.create_date IS '创建时间';
COMMENT ON COLUMN eam_node_logtype_re.update_by IS '更新者';
COMMENT ON COLUMN eam_node_logtype_re.update_date IS '更新时间';
COMMENT ON COLUMN eam_node_logtype_re.remarks IS '备注信息';
COMMENT ON COLUMN eam_node_logtype_re.create_by IS '创建者';
COMMENT ON COLUMN eam_node_msgformat_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_msgformat_re.eam_msg_format_id IS 'UUID';
COMMENT ON COLUMN eam_node_msgformat_re.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_node_msgformat_re.create_date IS '创建时间';
COMMENT ON COLUMN eam_node_msgformat_re.update_by IS '更新者';
COMMENT ON COLUMN eam_node_msgformat_re.update_date IS '更新时间';
COMMENT ON COLUMN eam_node_msgformat_re.remarks IS '备注信息';
COMMENT ON COLUMN eam_node_msgformat_re.create_by IS '创建者';
COMMENT ON COLUMN eam_node_route_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_route_re.eam_route_alg_id IS 'UUID';
COMMENT ON COLUMN eam_node_route_re.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_node_route_re.create_date IS '创建时间';
COMMENT ON COLUMN eam_node_route_re.update_by IS '更新者';
COMMENT ON COLUMN eam_node_route_re.update_date IS '更新时间';
COMMENT ON COLUMN eam_node_route_re.remarks IS '备注信息';
COMMENT ON COLUMN eam_node_route_re.create_by IS '创建者';
COMMENT ON COLUMN eam_node_timeout_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_timeout_re.eam_timeout_alg_id IS 'UUID';
COMMENT ON COLUMN eam_node_timeout_re.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_node_timeout_re.create_date IS '创建时间';
COMMENT ON COLUMN eam_node_timeout_re.update_by IS '更新者';
COMMENT ON COLUMN eam_node_timeout_re.update_date IS '更新时间';
COMMENT ON COLUMN eam_node_timeout_re.remarks IS '备注信息';
COMMENT ON COLUMN eam_node_timeout_re.create_by IS '创建者';
COMMENT ON TABLE eam_protocol IS '字段待确认？';
COMMENT ON COLUMN eam_protocol.ID IS 'UUID';
COMMENT ON COLUMN eam_protocol.NAME IS '协议名称';
COMMENT ON COLUMN eam_protocol.CHINESE_NAME IS '中文名称';
COMMENT ON COLUMN eam_protocol.ADDRESS IS '访问地址';
COMMENT ON COLUMN eam_protocol.LINK_TYPE IS '链接类型';
COMMENT ON COLUMN eam_protocol.MAXPACKAGE IS '最大包长度';
COMMENT ON COLUMN eam_protocol.CREATE_BY IS '创建者';
COMMENT ON COLUMN eam_protocol.CREATE_DATE IS '创建时间';
COMMENT ON COLUMN eam_protocol.UPDATE_BY IS '更新者';
COMMENT ON COLUMN eam_protocol.UPDATE_DATE IS '更新时间';
COMMENT ON COLUMN eam_protocol.REMARKS IS '备注信息';
COMMENT ON COLUMN eam_protocol.DEL_FLG IS '删除标记';
COMMENT ON COLUMN eam_route_alg.ID IS 'UUID';
COMMENT ON COLUMN eam_route_alg.NAME IS '路由名称';
COMMENT ON COLUMN eam_route_alg.CHINESE_NAME IS '路由简称';
COMMENT ON COLUMN eam_route_alg.ROUTE_BASIS IS '基础路由';
COMMENT ON COLUMN eam_route_alg.RTABLE_MAINTAIN IS '路由表维护';
COMMENT ON COLUMN eam_route_alg.RTABLE_STORE IS '路由表存储';
COMMENT ON COLUMN eam_route_alg.CREATE_BY IS '创建者';
COMMENT ON COLUMN eam_route_alg.CREATE_DATE IS '创建时间';
COMMENT ON COLUMN eam_route_alg.UPDATE_BY IS '更新者';
COMMENT ON COLUMN eam_route_alg.UPDATE_DATE IS '更新时间';
COMMENT ON COLUMN eam_route_alg.REMARKS IS '备注信息';
COMMENT ON COLUMN eam_route_alg.DEL_FLG IS '删除标记';
COMMENT ON COLUMN eam_sysgroup.id IS 'UUID';
COMMENT ON COLUMN eam_sysgroup.name IS '群组名称';
COMMENT ON COLUMN eam_sysgroup.chinese_name IS '群组简称';
COMMENT ON COLUMN eam_sysgroup.create_by IS '创建者';
COMMENT ON COLUMN eam_sysgroup.create_date IS '创建时间';
COMMENT ON COLUMN eam_sysgroup.update_by IS '更新者';
COMMENT ON COLUMN eam_sysgroup.update_date IS '更新时间';
COMMENT ON COLUMN eam_sysgroup.remarks IS '备注信息';
COMMENT ON COLUMN eam_sysgroup.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_syslink.id IS 'UUID';
COMMENT ON COLUMN eam_syslink.name IS '关系名称';
COMMENT ON COLUMN eam_syslink.chinese_name IS '中文名称';
COMMENT ON COLUMN eam_syslink.link_type IS '关联关系类型';
COMMENT ON COLUMN eam_syslink.start_linknode_id IS '起始节点';
COMMENT ON COLUMN eam_syslink.end_linknode_id IS '终止节点';
COMMENT ON COLUMN eam_syslink.link_status IS '关联关系状态';
COMMENT ON COLUMN eam_syslink.create_by IS '创建者';
COMMENT ON COLUMN eam_syslink.create_date IS '创建时间';
COMMENT ON COLUMN eam_syslink.update_by IS '更新者';
COMMENT ON COLUMN eam_syslink.update_date IS '更新时间';
COMMENT ON COLUMN eam_syslink.remarks IS '备注信息';
COMMENT ON COLUMN eam_syslink.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_sysproperty.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_sysproperty.create_date IS '创建时间';
COMMENT ON COLUMN eam_sysproperty.update_by IS '更新者';
COMMENT ON COLUMN eam_sysproperty.update_date IS '更新时间';
COMMENT ON COLUMN eam_sysproperty.remarks IS '备注信息';
COMMENT ON COLUMN eam_sysproperty.create_by IS '创建者';
COMMENT ON COLUMN eam_sysprop_type.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_sysprop_type.create_date IS '创建时间';
COMMENT ON COLUMN eam_sysprop_type.update_by IS '更新者';
COMMENT ON COLUMN eam_sysprop_type.update_date IS '更新时间';
COMMENT ON COLUMN eam_sysprop_type.remarks IS '备注信息';
COMMENT ON COLUMN eam_sysprop_type.create_by IS '创建者';
COMMENT ON COLUMN eam_system.id IS 'UUID';
COMMENT ON COLUMN eam_system.no IS '系统编号';
COMMENT ON COLUMN eam_system.chinese_name IS '中文名称';
COMMENT ON COLUMN eam_system.name IS '系统名称';
COMMENT ON COLUMN eam_system.eam_bank IS '所属银行';
COMMENT ON COLUMN eam_system.eam_sysgroup_id IS '所属系统群组';
COMMENT ON COLUMN eam_system.eam_aa_layer_id IS '所属应用架构层次';
COMMENT ON COLUMN eam_system.eam_org_layer IS '机构层次(字典)';
COMMENT ON COLUMN eam_system.eam_build_type IS '建设类型(字典)';
COMMENT ON COLUMN eam_system.eam_build_state IS '建设状态(字典)';
COMMENT ON COLUMN eam_system.eam_trend IS '未来走向(字典)';
COMMENT ON COLUMN eam_system.create_by IS '创建者';
COMMENT ON COLUMN eam_system.create_date IS '创建时间';
COMMENT ON COLUMN eam_system.update_by IS '更新者';
COMMENT ON COLUMN eam_system.update_date IS '更新时间';
COMMENT ON COLUMN eam_system.remarks IS '备注信息';
COMMENT ON COLUMN eam_system.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_system_module.id IS 'UUID';
COMMENT ON COLUMN eam_system_module.eam_system_id IS '所属系统ID';
COMMENT ON COLUMN eam_system_module.name IS '模块名称';
COMMENT ON COLUMN eam_system_module.chinese_name IS '中文名称';
COMMENT ON COLUMN eam_system_module.manager IS '描述';
COMMENT ON COLUMN eam_system_module.create_by IS '创建者';
COMMENT ON COLUMN eam_system_module.create_date IS '创建时间';
COMMENT ON COLUMN eam_system_module.update_by IS '更新者';
COMMENT ON COLUMN eam_system_module.update_date IS '更新时间';
COMMENT ON COLUMN eam_system_module.remarks IS '备注信息';
COMMENT ON COLUMN eam_system_module.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_system_sysproperty_re.eam_system_id IS 'UUID';
COMMENT ON COLUMN eam_system_sysproperty_re.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN eam_system_sysproperty_re.create_date IS '创建时间';
COMMENT ON COLUMN eam_system_sysproperty_re.update_by IS '更新者';
COMMENT ON COLUMN eam_system_sysproperty_re.update_date IS '更新时间';
COMMENT ON COLUMN eam_system_sysproperty_re.remarks IS '备注信息';
COMMENT ON COLUMN eam_system_sysproperty_re.create_by IS '创建者';
COMMENT ON COLUMN eam_timeout_alg.ID IS 'UUID';
COMMENT ON COLUMN eam_timeout_alg.NAME IS '名称';
COMMENT ON COLUMN eam_timeout_alg.CHINESE_NAME IS '中文名称';
COMMENT ON COLUMN eam_timeout_alg.CREATE_BY IS '创建者';
COMMENT ON COLUMN eam_timeout_alg.CREATE_DATE IS '创建时间';
COMMENT ON COLUMN eam_timeout_alg.UPDATE_BY IS '更新者';
COMMENT ON COLUMN eam_timeout_alg.UPDATE_DATE IS '更新时间';
COMMENT ON COLUMN eam_timeout_alg.REMARKS IS '备注信息';
COMMENT ON COLUMN eam_timeout_alg.DEL_FLG IS '删除标记';



