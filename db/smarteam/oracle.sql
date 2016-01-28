
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
	-- �ܹ��������
	name varchar2(250 char),
	-- �ܹ���μ��
	chinese_name varchar2(250 char),
	-- ������
	create_by varchar2(64 char) NOT NULL,
	-- ����ʱ��
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	update_by varchar2(64 char) NOT NULL,
	-- ����ʱ��
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	remarks nvarchar2(2000),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- ����ϵͳ��
CREATE TABLE eam_aa_strategy
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- ���ߵ�����
	name varchar2(250 char) NOT NULL,
	-- ���ߵ�������
	chinese_name clob,
	-- ����ϵͳ
	eam_system_id varchar2(40 char) NOT NULL,
	-- ���߹���
	strategy_process clob,
	-- ����
	conclusion clob,
	-- ������
	create_by varchar2(40 char),
	-- ����ʱ��
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	update_by varchar2(40 char),
	-- ����ʱ��
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	remarks nvarchar2(2000),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_flow_ctl_alg
(
	-- UUID
	ID varchar2(40 char) NOT NULL,
	-- ��������
	NAME varchar2(255 char) NOT NULL,
	-- ��������
	CHINESE_NAME clob,
	-- ������
	CREATE_BY varchar2(64 char),
	-- ����ʱ��
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	UPDATE_BY varchar2(64 char),
	-- ����ʱ��
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	REMARKS varchar2(255 char),
	-- ɾ�����
	DEL_FLG char,
	PRIMARY KEY (ID)
);


-- �ֶδ�ȷ�ϣ�
CREATE TABLE eam_interface
(
	-- ���
	id varchar2(40 char) NOT NULL,
	-- �ӿ�����
	name clob NOT NULL,
	-- �ӿ�������
	chinese_name varchar2(255 char),
	-- ������Ϣ��ʽ
	req_msg_format varchar2(2047 char),
	-- ��Ӧ��Ϣ��ʽ
	rsp_msg_format varchar2(2047 char),
	-- ����ʱ��
	start_date varchar2(10 char),
	-- �Ƿ�������
	account_trade varchar2(10 char),
	-- ������
	create_by varchar2(64 char),
	-- ����ʱ��
	create_date timestamp,
	-- ������
	update_by varchar2(64 char),
	-- ����ʱ��
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	remarks nvarchar2(2000),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char,
	PRIMARY KEY (id)
);


CREATE TABLE eam_linknode
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- �ڵ�����
	name varchar2(250 char) NOT NULL,
	-- ��������
	chinese_name nvarchar2(250),
	-- �ڵ�ϵͳID
	eam_system_id varchar2(40 char) NOT NULL,
	-- �ڵ�����
	linknode_type varchar2(40 char),
	-- ���Э��
	eam_protocol_id varchar2(40 char) NOT NULL,
	-- ������
	create_by varchar2(40 char) NOT NULL,
	-- ����ʱ��
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	update_by varchar2(40 char) NOT NULL,
	-- ����ʱ��
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	remarks nvarchar2(2000),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_log_type
(
	-- UUID
	ID varchar2(40 char) NOT NULL,
	-- ��־����
	NAME varchar2(255 char) NOT NULL,
	-- ��־���
	CHINESE_NAME clob,
	-- ��־����
	LOG_RANGE varchar2(255 char),
	-- ��־�������
	LOG_CLEAN_TYPE varchar2(255 char),
	-- ������
	CREATE_BY varchar2(64 char),
	-- ����ʱ��
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	UPDATE_BY varchar2(64 char),
	-- ����ʱ��
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	REMARKS varchar2(255 char),
	-- ɾ�����
	DEL_FLG char,
	PRIMARY KEY (ID)
);


CREATE TABLE eam_msg_format
(
	-- ���
	id varchar2(40 char) NOT NULL,
	-- ���ĸ�ʽ����
	name clob NOT NULL,
	-- ���ĸ�ʽ������
	chinese_name varchar2(255 char),
	-- ���ĸ�ʽ
	format varchar2(40 char),
	-- ����ͷ
	msg_head varchar2(255 char),
	-- ������
	msg_body varchar2(255 char),
	-- ��󳤶�
	max_length varchar2(10 char),
	-- ������
	create_by varchar2(64 char) NOT NULL,
	-- ����ʱ��
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	update_by varchar2(64 char) NOT NULL,
	-- ����ʱ��
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	remarks nvarchar2(2000),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_flowctl_re
(
	id varchar2(40 char) NOT NULL,
	-- �ڵ�
	eam_linknode_id varchar2(40 char),
	-- ����
	eam_flow_ctl_alg_id varchar2(40 char),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- ����ʱ��
	create_date timestamp,
	-- ������
	update_by varchar2(64),
	-- ����ʱ��
	update_date timestamp,
	-- ��ע��Ϣ
	remarks varchar2(255),
	-- ������
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_interface_re
(
	id varchar2(40) NOT NULL,
	-- �ڵ�
	eam_linknode_id varchar2(40 char) NOT NULL,
	-- �ӿ�
	eam_interface_id varchar2(40 char) NOT NULL,
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- ����ʱ��
	create_date timestamp,
	-- ������
	update_by varchar2(64),
	-- ����ʱ��
	update_date timestamp,
	-- ��ע��Ϣ
	remarks varchar2(255),
	-- ������
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_logtype_re
(
	id varchar2(40 char) NOT NULL,
	-- �ڵ�
	eam_linknode_id varchar2(40 char),
	-- ��־
	eam_log_type_id varchar2(40 char),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- ����ʱ��
	create_date timestamp,
	-- ������
	update_by varchar2(64),
	-- ����ʱ��
	update_date timestamp,
	-- ��ע��Ϣ
	remarks varchar2(255),
	-- ������
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_msgformat_re
(
	id varchar2(40 char) NOT NULL,
	-- �ڵ�
	eam_linknode_id varchar2(40 char),
	-- ���ĸ�ʽ
	eam_msg_format_id varchar2(40 char),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- ����ʱ��
	create_date timestamp,
	-- ������
	update_by varchar2(64),
	-- ����ʱ��
	update_date timestamp,
	-- ��ע��Ϣ
	remarks varchar2(255),
	-- ������
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_route_re
(
	id varchar2(40 char) NOT NULL,
	-- �ڵ�
	eam_linknode_id varchar2(40 char),
	-- ·��
	eam_route_alg_id varchar2(40 char),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- ����ʱ��
	create_date timestamp,
	-- ������
	update_by varchar2(64),
	-- ����ʱ��
	update_date timestamp,
	-- ��ע��Ϣ
	remarks varchar2(255),
	-- ������
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_node_timeout_re
(
	id varchar2(40 char) NOT NULL,
	-- �ڵ�
	eam_linknode_id varchar2(40 char),
	-- ��ʱ�㷨
	eam_timeout_alg_id varchar2(40 char),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- ����ʱ��
	create_date timestamp,
	-- ������
	update_by varchar2(64),
	-- ����ʱ��
	update_date timestamp,
	-- ��ע��Ϣ
	remarks varchar2(255),
	-- ������
	create_by varchar2(64),
	PRIMARY KEY (id)
);


-- �ֶδ�ȷ�ϣ�
CREATE TABLE eam_protocol
(
	-- UUID
	ID varchar2(40 char) NOT NULL,
	-- Э������
	NAME varchar2(255 char) NOT NULL,
	-- ��������
	CHINESE_NAME clob,
	-- ���ʵ�ַ
	ADDRESS nvarchar2(2000),
	-- ��������
	LINK_TYPE varchar2(40 char),
	-- ��������
	MAXPACKAGE varchar2(40 char),
	-- ������
	CREATE_BY varchar2(64 char),
	-- ����ʱ��
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	UPDATE_BY varchar2(64 char) NOT NULL,
	-- ����ʱ��
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	REMARKS varchar2(255 char),
	-- ɾ�����
	DEL_FLG char NOT NULL,
	PRIMARY KEY (ID)
);


CREATE TABLE eam_route_alg
(
	-- UUID
	ID varchar2(40 char) NOT NULL,
	-- ·������
	NAME varchar2(255 char) NOT NULL,
	-- ·�ɼ��
	CHINESE_NAME clob,
	-- ����·��
	ROUTE_BASIS varchar2(255 char),
	-- ·�ɱ�ά��
	RTABLE_MAINTAIN varchar2(255 char),
	-- ·�ɱ�洢
	RTABLE_STORE varchar2(255 char),
	-- ������
	CREATE_BY varchar2(64 char),
	-- ����ʱ��
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	UPDATE_BY varchar2(64 char),
	-- ����ʱ��
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	REMARKS varchar2(255 char),
	-- ɾ�����
	DEL_FLG char,
	PRIMARY KEY (ID)
);


CREATE TABLE eam_sysgroup
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- Ⱥ������
	name varchar2(250 char),
	-- Ⱥ����
	chinese_name varchar2(250 char),
	-- ������
	create_by varchar2(64 char) NOT NULL,
	-- ����ʱ��
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	update_by varchar2(64 char) NOT NULL,
	-- ����ʱ��
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	remarks nvarchar2(2000),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_syslink
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- ��ϵ����
	name varchar2(250 char),
	-- ��������
	chinese_name nvarchar2(250),
	-- ������ϵ����
	link_type varchar2(40 char),
	eam_system_start_id varchar2(40 char),
	-- ��ʼ�ڵ�
	start_linknode_id varchar2(40 char) NOT NULL,
	eam_system_end_id varchar2(40 char),
	-- ��ֹ�ڵ�
	end_linknode_id varchar2(40 char) NOT NULL,
	-- ������ϵ״̬
	link_status varchar2(40 char),
	-- ������
	create_by varchar2(40 char) NOT NULL,
	-- ����ʱ��
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	update_by varchar2(40 char) NOT NULL,
	-- ����ʱ��
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	remarks nvarchar2(2000),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_sysproperty
(
	id varchar2(40 char) NOT NULL,
	name varchar2(100 char),
	chinese_name nvarchar2(200),
	eam_sysprop_type_id varchar2(40 char) NOT NULL,
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- ����ʱ��
	create_date timestamp,
	-- ������
	update_by varchar2(64),
	-- ����ʱ��
	update_date timestamp,
	-- ��ע��Ϣ
	remarks varchar2(255),
	-- ������
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_sysprop_type
(
	id varchar2(40 char) NOT NULL,
	name nvarchar2(200),
	chinese_name nvarchar2(200),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- ����ʱ��
	create_date timestamp,
	-- ������
	update_by varchar2(64),
	-- ����ʱ��
	update_date timestamp,
	-- ��ע��Ϣ
	remarks varchar2(255),
	-- ������
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_system
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- ϵͳ���
	no varchar2(20 char),
	-- ��������
	chinese_name nvarchar2(250),
	-- ϵͳ����
	name nvarchar2(200),
	english_name varchar2(100 char),
	english_short varchar2(100 char),
	alias nvarchar2(50),
	-- ��������
	eam_bank varchar2(40 char),
	-- ����ϵͳȺ��
	eam_sysgroup_id varchar2(40 char) NOT NULL,
	-- ����Ӧ�üܹ����
	eam_aa_layer_id varchar2(40 char) NOT NULL,
	-- �������(�ֵ�)
	eam_org_layer varchar2(40 char),
	-- ��������(�ֵ�)
	eam_build_type varchar2(40 char),
	-- ����״̬(�ֵ�)
	eam_build_state varchar2(40 char),
	online_date timestamp,
	-- δ������(�ֵ�)
	eam_trend varchar2(40 char),
	target_system nvarchar2(100),
	-- ������
	create_by varchar2(64 char) NOT NULL,
	-- ����ʱ��
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	update_by varchar2(64 char) NOT NULL,
	-- ����ʱ��
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	remarks varchar2(2000 char),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_system_module
(
	-- UUID
	id varchar2(40 char) NOT NULL,
	-- ����ϵͳID
	eam_system_id varchar2(40 char) NOT NULL,
	-- ģ������
	name varchar2(250 char),
	-- ��������
	chinese_name nvarchar2(250),
	-- ����
	manager varchar2(40 char),
	-- ������
	create_by varchar2(64 char) NOT NULL,
	-- ����ʱ��
	create_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	update_by varchar2(64 char) NOT NULL,
	-- ����ʱ��
	update_date timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	remarks nvarchar2(2000),
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE eam_system_sysproperty_re
(
	id varchar2(40 char) NOT NULL,
	-- UUID
	eam_system_id varchar2(40 char) NOT NULL,
	eam_sysproperty_id varchar2(40 char) NOT NULL,
	-- ɾ����ǣ�0��������1��ɾ����
	del_flag char(1) DEFAULT '0' NOT NULL,
	-- ����ʱ��
	create_date timestamp,
	-- ������
	update_by varchar2(64),
	-- ����ʱ��
	update_date timestamp,
	-- ��ע��Ϣ
	remarks varchar2(255),
	-- ������
	create_by varchar2(64),
	PRIMARY KEY (id)
);


CREATE TABLE eam_timeout_alg
(
	-- UUID
	ID varchar2(40 char) NOT NULL,
	-- ����
	NAME varchar2(255 char) NOT NULL,
	-- ��������
	CHINESE_NAME clob,
	-- ������
	CREATE_BY varchar2(64 char),
	-- ����ʱ��
	CREATE_DATE timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	-- ������
	UPDATE_BY varchar2(64 char),
	-- ����ʱ��
	UPDATE_DATE timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL,
	-- ��ע��Ϣ
	REMARKS varchar2(255 char),
	-- ɾ�����
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
COMMENT ON COLUMN eam_aa_layer.name IS '�ܹ��������';
COMMENT ON COLUMN eam_aa_layer.chinese_name IS '�ܹ���μ��';
COMMENT ON COLUMN eam_aa_layer.create_by IS '������';
COMMENT ON COLUMN eam_aa_layer.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_aa_layer.update_by IS '������';
COMMENT ON COLUMN eam_aa_layer.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_aa_layer.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_aa_layer.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON TABLE eam_aa_strategy IS '����ϵͳ��';
COMMENT ON COLUMN eam_aa_strategy.id IS 'UUID';
COMMENT ON COLUMN eam_aa_strategy.name IS '���ߵ�����';
COMMENT ON COLUMN eam_aa_strategy.chinese_name IS '���ߵ�������';
COMMENT ON COLUMN eam_aa_strategy.eam_system_id IS 'UUID';
COMMENT ON COLUMN eam_aa_strategy.strategy_process IS '���߹���';
COMMENT ON COLUMN eam_aa_strategy.conclusion IS '����';
COMMENT ON COLUMN eam_aa_strategy.create_by IS '������';
COMMENT ON COLUMN eam_aa_strategy.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_aa_strategy.update_by IS '������';
COMMENT ON COLUMN eam_aa_strategy.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_aa_strategy.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_aa_strategy.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_flow_ctl_alg.ID IS 'UUID';
COMMENT ON COLUMN eam_flow_ctl_alg.NAME IS '��������';
COMMENT ON COLUMN eam_flow_ctl_alg.CHINESE_NAME IS '��������';
COMMENT ON COLUMN eam_flow_ctl_alg.CREATE_BY IS '������';
COMMENT ON COLUMN eam_flow_ctl_alg.CREATE_DATE IS '����ʱ��';
COMMENT ON COLUMN eam_flow_ctl_alg.UPDATE_BY IS '������';
COMMENT ON COLUMN eam_flow_ctl_alg.UPDATE_DATE IS '����ʱ��';
COMMENT ON COLUMN eam_flow_ctl_alg.REMARKS IS '��ע��Ϣ';
COMMENT ON COLUMN eam_flow_ctl_alg.DEL_FLG IS 'ɾ�����';
COMMENT ON TABLE eam_interface IS '�ֶδ�ȷ�ϣ�';
COMMENT ON COLUMN eam_interface.id IS '���';
COMMENT ON COLUMN eam_interface.name IS '�ӿ�����';
COMMENT ON COLUMN eam_interface.chinese_name IS '�ӿ�������';
COMMENT ON COLUMN eam_interface.req_msg_format IS '������Ϣ��ʽ';
COMMENT ON COLUMN eam_interface.rsp_msg_format IS '��Ӧ��Ϣ��ʽ';
COMMENT ON COLUMN eam_interface.start_date IS '����ʱ��';
COMMENT ON COLUMN eam_interface.account_trade IS '�Ƿ�������';
COMMENT ON COLUMN eam_interface.create_by IS '������';
COMMENT ON COLUMN eam_interface.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_interface.update_by IS '������';
COMMENT ON COLUMN eam_interface.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_interface.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_interface.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_linknode.id IS 'UUID';
COMMENT ON COLUMN eam_linknode.name IS '�ڵ�����';
COMMENT ON COLUMN eam_linknode.chinese_name IS '��������';
COMMENT ON COLUMN eam_linknode.eam_system_id IS '�ڵ�ϵͳID';
COMMENT ON COLUMN eam_linknode.linknode_type IS '�ڵ�����';
COMMENT ON COLUMN eam_linknode.eam_protocol_id IS 'UUID';
COMMENT ON COLUMN eam_linknode.create_by IS '������';
COMMENT ON COLUMN eam_linknode.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_linknode.update_by IS '������';
COMMENT ON COLUMN eam_linknode.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_linknode.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_linknode.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_log_type.ID IS 'UUID';
COMMENT ON COLUMN eam_log_type.NAME IS '��־����';
COMMENT ON COLUMN eam_log_type.CHINESE_NAME IS '��־���';
COMMENT ON COLUMN eam_log_type.LOG_RANGE IS '��־����';
COMMENT ON COLUMN eam_log_type.LOG_CLEAN_TYPE IS '��־�������';
COMMENT ON COLUMN eam_log_type.CREATE_BY IS '������';
COMMENT ON COLUMN eam_log_type.CREATE_DATE IS '����ʱ��';
COMMENT ON COLUMN eam_log_type.UPDATE_BY IS '������';
COMMENT ON COLUMN eam_log_type.UPDATE_DATE IS '����ʱ��';
COMMENT ON COLUMN eam_log_type.REMARKS IS '��ע��Ϣ';
COMMENT ON COLUMN eam_log_type.DEL_FLG IS 'ɾ�����';
COMMENT ON COLUMN eam_msg_format.id IS '���';
COMMENT ON COLUMN eam_msg_format.name IS '���ĸ�ʽ����';
COMMENT ON COLUMN eam_msg_format.chinese_name IS '���ĸ�ʽ������';
COMMENT ON COLUMN eam_msg_format.format IS '���ĸ�ʽ';
COMMENT ON COLUMN eam_msg_format.msg_head IS '����ͷ';
COMMENT ON COLUMN eam_msg_format.msg_body IS '������';
COMMENT ON COLUMN eam_msg_format.max_length IS '��󳤶�';
COMMENT ON COLUMN eam_msg_format.create_by IS '������';
COMMENT ON COLUMN eam_msg_format.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_msg_format.update_by IS '������';
COMMENT ON COLUMN eam_msg_format.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_msg_format.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_msg_format.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_node_flowctl_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_flowctl_re.eam_flow_ctl_alg_id IS 'UUID';
COMMENT ON COLUMN eam_node_flowctl_re.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_node_flowctl_re.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_flowctl_re.update_by IS '������';
COMMENT ON COLUMN eam_node_flowctl_re.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_flowctl_re.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_node_flowctl_re.create_by IS '������';
COMMENT ON COLUMN eam_node_interface_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_interface_re.eam_interface_id IS '���';
COMMENT ON COLUMN eam_node_interface_re.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_node_interface_re.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_interface_re.update_by IS '������';
COMMENT ON COLUMN eam_node_interface_re.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_interface_re.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_node_interface_re.create_by IS '������';
COMMENT ON COLUMN eam_node_logtype_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_logtype_re.eam_log_type_id IS 'UUID';
COMMENT ON COLUMN eam_node_logtype_re.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_node_logtype_re.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_logtype_re.update_by IS '������';
COMMENT ON COLUMN eam_node_logtype_re.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_logtype_re.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_node_logtype_re.create_by IS '������';
COMMENT ON COLUMN eam_node_msgformat_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_msgformat_re.eam_msg_format_id IS 'UUID';
COMMENT ON COLUMN eam_node_msgformat_re.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_node_msgformat_re.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_msgformat_re.update_by IS '������';
COMMENT ON COLUMN eam_node_msgformat_re.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_msgformat_re.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_node_msgformat_re.create_by IS '������';
COMMENT ON COLUMN eam_node_route_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_route_re.eam_route_alg_id IS 'UUID';
COMMENT ON COLUMN eam_node_route_re.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_node_route_re.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_route_re.update_by IS '������';
COMMENT ON COLUMN eam_node_route_re.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_route_re.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_node_route_re.create_by IS '������';
COMMENT ON COLUMN eam_node_timeout_re.eam_linknode_id IS 'UUID';
COMMENT ON COLUMN eam_node_timeout_re.eam_timeout_alg_id IS 'UUID';
COMMENT ON COLUMN eam_node_timeout_re.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_node_timeout_re.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_timeout_re.update_by IS '������';
COMMENT ON COLUMN eam_node_timeout_re.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_node_timeout_re.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_node_timeout_re.create_by IS '������';
COMMENT ON TABLE eam_protocol IS '�ֶδ�ȷ�ϣ�';
COMMENT ON COLUMN eam_protocol.ID IS 'UUID';
COMMENT ON COLUMN eam_protocol.NAME IS 'Э������';
COMMENT ON COLUMN eam_protocol.CHINESE_NAME IS '��������';
COMMENT ON COLUMN eam_protocol.ADDRESS IS '���ʵ�ַ';
COMMENT ON COLUMN eam_protocol.LINK_TYPE IS '��������';
COMMENT ON COLUMN eam_protocol.MAXPACKAGE IS '��������';
COMMENT ON COLUMN eam_protocol.CREATE_BY IS '������';
COMMENT ON COLUMN eam_protocol.CREATE_DATE IS '����ʱ��';
COMMENT ON COLUMN eam_protocol.UPDATE_BY IS '������';
COMMENT ON COLUMN eam_protocol.UPDATE_DATE IS '����ʱ��';
COMMENT ON COLUMN eam_protocol.REMARKS IS '��ע��Ϣ';
COMMENT ON COLUMN eam_protocol.DEL_FLG IS 'ɾ�����';
COMMENT ON COLUMN eam_route_alg.ID IS 'UUID';
COMMENT ON COLUMN eam_route_alg.NAME IS '·������';
COMMENT ON COLUMN eam_route_alg.CHINESE_NAME IS '·�ɼ��';
COMMENT ON COLUMN eam_route_alg.ROUTE_BASIS IS '����·��';
COMMENT ON COLUMN eam_route_alg.RTABLE_MAINTAIN IS '·�ɱ�ά��';
COMMENT ON COLUMN eam_route_alg.RTABLE_STORE IS '·�ɱ�洢';
COMMENT ON COLUMN eam_route_alg.CREATE_BY IS '������';
COMMENT ON COLUMN eam_route_alg.CREATE_DATE IS '����ʱ��';
COMMENT ON COLUMN eam_route_alg.UPDATE_BY IS '������';
COMMENT ON COLUMN eam_route_alg.UPDATE_DATE IS '����ʱ��';
COMMENT ON COLUMN eam_route_alg.REMARKS IS '��ע��Ϣ';
COMMENT ON COLUMN eam_route_alg.DEL_FLG IS 'ɾ�����';
COMMENT ON COLUMN eam_sysgroup.id IS 'UUID';
COMMENT ON COLUMN eam_sysgroup.name IS 'Ⱥ������';
COMMENT ON COLUMN eam_sysgroup.chinese_name IS 'Ⱥ����';
COMMENT ON COLUMN eam_sysgroup.create_by IS '������';
COMMENT ON COLUMN eam_sysgroup.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_sysgroup.update_by IS '������';
COMMENT ON COLUMN eam_sysgroup.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_sysgroup.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_sysgroup.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_syslink.id IS 'UUID';
COMMENT ON COLUMN eam_syslink.name IS '��ϵ����';
COMMENT ON COLUMN eam_syslink.chinese_name IS '��������';
COMMENT ON COLUMN eam_syslink.link_type IS '������ϵ����';
COMMENT ON COLUMN eam_syslink.start_linknode_id IS '��ʼ�ڵ�';
COMMENT ON COLUMN eam_syslink.end_linknode_id IS '��ֹ�ڵ�';
COMMENT ON COLUMN eam_syslink.link_status IS '������ϵ״̬';
COMMENT ON COLUMN eam_syslink.create_by IS '������';
COMMENT ON COLUMN eam_syslink.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_syslink.update_by IS '������';
COMMENT ON COLUMN eam_syslink.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_syslink.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_syslink.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_sysproperty.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_sysproperty.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_sysproperty.update_by IS '������';
COMMENT ON COLUMN eam_sysproperty.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_sysproperty.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_sysproperty.create_by IS '������';
COMMENT ON COLUMN eam_sysprop_type.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_sysprop_type.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_sysprop_type.update_by IS '������';
COMMENT ON COLUMN eam_sysprop_type.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_sysprop_type.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_sysprop_type.create_by IS '������';
COMMENT ON COLUMN eam_system.id IS 'UUID';
COMMENT ON COLUMN eam_system.no IS 'ϵͳ���';
COMMENT ON COLUMN eam_system.chinese_name IS '��������';
COMMENT ON COLUMN eam_system.name IS 'ϵͳ����';
COMMENT ON COLUMN eam_system.eam_bank IS '��������';
COMMENT ON COLUMN eam_system.eam_sysgroup_id IS '����ϵͳȺ��';
COMMENT ON COLUMN eam_system.eam_aa_layer_id IS '����Ӧ�üܹ����';
COMMENT ON COLUMN eam_system.eam_org_layer IS '�������(�ֵ�)';
COMMENT ON COLUMN eam_system.eam_build_type IS '��������(�ֵ�)';
COMMENT ON COLUMN eam_system.eam_build_state IS '����״̬(�ֵ�)';
COMMENT ON COLUMN eam_system.eam_trend IS 'δ������(�ֵ�)';
COMMENT ON COLUMN eam_system.create_by IS '������';
COMMENT ON COLUMN eam_system.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_system.update_by IS '������';
COMMENT ON COLUMN eam_system.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_system.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_system.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_system_module.id IS 'UUID';
COMMENT ON COLUMN eam_system_module.eam_system_id IS '����ϵͳID';
COMMENT ON COLUMN eam_system_module.name IS 'ģ������';
COMMENT ON COLUMN eam_system_module.chinese_name IS '��������';
COMMENT ON COLUMN eam_system_module.manager IS '����';
COMMENT ON COLUMN eam_system_module.create_by IS '������';
COMMENT ON COLUMN eam_system_module.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_system_module.update_by IS '������';
COMMENT ON COLUMN eam_system_module.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_system_module.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_system_module.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_system_sysproperty_re.eam_system_id IS 'UUID';
COMMENT ON COLUMN eam_system_sysproperty_re.del_flag IS 'ɾ����ǣ�0��������1��ɾ����';
COMMENT ON COLUMN eam_system_sysproperty_re.create_date IS '����ʱ��';
COMMENT ON COLUMN eam_system_sysproperty_re.update_by IS '������';
COMMENT ON COLUMN eam_system_sysproperty_re.update_date IS '����ʱ��';
COMMENT ON COLUMN eam_system_sysproperty_re.remarks IS '��ע��Ϣ';
COMMENT ON COLUMN eam_system_sysproperty_re.create_by IS '������';
COMMENT ON COLUMN eam_timeout_alg.ID IS 'UUID';
COMMENT ON COLUMN eam_timeout_alg.NAME IS '����';
COMMENT ON COLUMN eam_timeout_alg.CHINESE_NAME IS '��������';
COMMENT ON COLUMN eam_timeout_alg.CREATE_BY IS '������';
COMMENT ON COLUMN eam_timeout_alg.CREATE_DATE IS '����ʱ��';
COMMENT ON COLUMN eam_timeout_alg.UPDATE_BY IS '������';
COMMENT ON COLUMN eam_timeout_alg.UPDATE_DATE IS '����ʱ��';
COMMENT ON COLUMN eam_timeout_alg.REMARKS IS '��ע��Ϣ';
COMMENT ON COLUMN eam_timeout_alg.DEL_FLG IS 'ɾ�����';



