/* Drop Tables */

DROP TABLE eam_system;

CREATE TABLE eam_system
(
	id	 	varchar2(40)	NOT NULL,
	name	 	varchar2(255)	,
	chinese_name	 	nvarchar2(255)	,
	comments	 	nvarchar2(2047)	,
	eam_bank_id	 	varchar2(40)	,
	eam_sysgroup_id	 	varchar2(40)	,
	eam_aa_layer_id	 	varchar2(40)	,
	eam_org_layer_id	 	varchar2(40)	,
	eam_build_type_id	 	varchar2(40)	,
	eam_build_state_id	 	varchar2(40)	,
	eam_trend_id	 	varchar2(40)	,
	create_by varchar2(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar2(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks nvarchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


/* Create Indexes */

CREATE INDEX eam_system_del_flag ON eam_system (del_flag);


/* Comments */

COMMENT ON TABLE eam_system IS '系统管理';
COMMENT ON COLUMN eam_system.id IS 'UUID';
COMMENT ON COLUMN eam_system.name IS '系统名称';
COMMENT ON COLUMN eam_system.chinese_name IS '中文名称';
COMMENT ON COLUMN eam_system.comments IS '描述';
COMMENT ON COLUMN eam_system.eam_bank_id IS '所属银行';
COMMENT ON COLUMN eam_system.eam_sysgroup_id IS '所属系统群组';
COMMENT ON COLUMN eam_system.eam_aa_layer_id IS '所属应用架构层次';
COMMENT ON COLUMN eam_system.eam_org_layer_id IS '机构层次代码';
COMMENT ON COLUMN eam_system.eam_build_type_id IS '建设类型代码';
COMMENT ON COLUMN eam_system.eam_build_state_id IS '建设状态代码';
COMMENT ON COLUMN eam_system.eam_trend_id IS '未来走向';

COMMENT ON COLUMN eam_system.create_by IS '创建者';
COMMENT ON COLUMN eam_system.create_date IS '创建时间';
COMMENT ON COLUMN eam_system.update_by IS '更新者';
COMMENT ON COLUMN eam_system.update_date IS '更新时间';
COMMENT ON COLUMN eam_system.remarks IS '备注信息';
COMMENT ON COLUMN eam_system.del_flag IS '删除标记（0：正常；1：删除）';


