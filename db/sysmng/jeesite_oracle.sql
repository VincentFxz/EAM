--应用系统管理
/* Drop Tables */

DROP TABLE eam_system;

CREATE TABLE eam_system
(
id	 	varchar2(40)	NOT NULL,
name	 	varchar2(250)	,
chinese_name	 	nvarchar2(250)	,
eam_bank	 	varchar2(40)	,
eam_sysgroup_id	 	varchar2(40)	,
eam_aa_layer_id	 	varchar2(40)	,
eam_org_layer_id	 	varchar2(40)	,
eam_build_type 	varchar2(40)	,
eam_build_state	 	varchar2(40)	,
eam_trend	 	varchar2(40)	,

create_by varchar2(64) NOT NULL,
create_date timestamp NOT NULL,
update_by varchar2(64) NOT NULL,
update_date timestamp NOT NULL,
remarks nvarchar2(250),
del_flag char(1) DEFAULT '0' NOT NULL,
PRIMARY KEY (id)
);

COMMENT ON TABLE eam_system IS '系统管理';
COMMENT ON COLUMN eam_system.id IS 'UUID';
COMMENT ON COLUMN eam_system.name IS '系统名称';
COMMENT ON COLUMN eam_system.chinese_name IS '中文名称';
COMMENT ON COLUMN eam_system.eam_bank IS '所属银行';
COMMENT ON COLUMN eam_system.eam_sysgroup_id IS '所属系统群组';
COMMENT ON COLUMN eam_system.eam_aa_layer_id IS '所属应用架构层次';
COMMENT ON COLUMN eam_system.eam_org_layer_id IS '机构层次代码';
COMMENT ON COLUMN eam_system.eam_build_type IS '建设类型';
COMMENT ON COLUMN eam_system.eam_build_state IS '建设状态';
COMMENT ON COLUMN eam_system.eam_trend IS '未来走向';

COMMENT ON COLUMN eam_system.create_by IS '创建者';
COMMENT ON COLUMN eam_system.create_date IS '创建时间';
COMMENT ON COLUMN eam_system.update_by IS '更新者';
COMMENT ON COLUMN eam_system.update_date IS '更新时间';
COMMENT ON COLUMN eam_system.remarks IS '备注信息';
COMMENT ON COLUMN eam_system.del_flag IS '删除标记（0：正常；1：删除）';


--应用系统模块管理
DROP TABLE eam_system_module;

CREATE TABLE eam_system_module
(
id	 	varchar2(40)	NOT NULL,
eam_system_id	 	varchar2(40)	NOT NULL,
name	 	varchar2(250)	,
chinese_name	 	nvarchar2(250)	,
manager	 	varchar2(40)	,
create_by varchar2(64) NOT NULL,
create_date timestamp NOT NULL,
update_by varchar2(64) NOT NULL,
update_date timestamp NOT NULL,
remarks nvarchar2(250),
del_flag char(1) DEFAULT '0' NOT NULL,
PRIMARY KEY (id),
);

COMMENT ON TABLE eam_system_module IS '系统模块管理';
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



--应用系统决策管理
DROP TABLE eam_aa_strategy;

CREATE TABLE eam_aa_strategy
(
id	 	varchar2(40)	NOT NULL,
name varchar2(250) NOT NULL ,
chinese_name nvarchar2(250) ,
strategy_process nvarchar2(2000) ,
conclusion nvarchar2(2000) ,
create_by varchar2(40) ,
create_date timestamp ,
update_by varchar2(40) ,
update_date timestamp  ,
remarks nvarchar2(250) ,
del_flag char(1) DEFAULT '0' NOT NULL,
PRIMARY KEY (id)
);

COMMENT ON TABLE eam_aa_strategy IS '应用系统决策管理';
COMMENT ON COLUMN eam_aa_strategy.id IS 'UUID';
COMMENT ON COLUMN eam_aa_strategy.name IS '决策点名称';
COMMENT ON COLUMN eam_aa_strategy.chinese_name IS '决策点中文名';
COMMENT ON COLUMN eam_aa_strategy.strategy_process IS '决策过程';
COMMENT ON COLUMN eam_aa_strategy.conclusion IS '结论';

COMMENT ON COLUMN eam_aa_strategy.create_by IS '创建者';
COMMENT ON COLUMN eam_aa_strategy.create_date IS '创建时间';
COMMENT ON COLUMN eam_aa_strategy.update_by IS '更新者';
COMMENT ON COLUMN eam_aa_strategy.update_date IS '更新时间';
COMMENT ON COLUMN eam_aa_strategy.remarks IS '备注信息';
COMMENT ON COLUMN eam_aa_strategy.del_flag IS '删除标记（0：正常；1：删除）';



--   TableTABLE EAM_AA_LAYER(架构层次管理)
DROP TABLE eam_aa_layer;

CREATE TABLE eam_aa_layer
(
id VARCHAR2(40), 
name VARCHAR2(250), 
chinese_name VARCHAR2(250), 

create_by varchar2(64) NOT NULL,
create_date timestamp NOT NULL,
update_by varchar2(64) NOT NULL,
update_date timestamp NOT NULL,
remarks nvarchar2(250),
del_flag char(1) DEFAULT '0' NOT NULL,
PRIMARY KEY (id)
) ;
   
COMMENT ON TABLE eam_aa_layer IS '架构层次管理';
COMMENT ON COLUMN eam_aa_layer.id IS 'UUID';
COMMENT ON COLUMN eam_aa_layer.name IS '架构层次名称';
COMMENT ON COLUMN eam_aa_layer.chinese_name IS '架构层次简称';

COMMENT ON COLUMN EAM_AA_LAYER.create_by IS '创建者';
COMMENT ON COLUMN EAM_AA_LAYER.create_date IS '创建时间';
COMMENT ON COLUMN EAM_AA_LAYER.update_by IS '更新者';
COMMENT ON COLUMN EAM_AA_LAYER.update_date IS '更新时间';
COMMENT ON COLUMN EAM_AA_LAYER.remarks IS '备注信息';
COMMENT ON COLUMN EAM_AA_LAYER.del_flag IS '删除标记（0：正常；1：删除）';
  



--   Table EAM_SYSGROUP(应用系统群组管理)
DROP TABLE eam_sysgroup;

CREATE TABLE eam_sysgroup 
(	
id VARCHAR2(40), 
name VARCHAR2(250), 
chinese_name VARCHAR2(250), 
create_by varchar2(64) NOT NULL,
create_date timestamp NOT NULL,
update_by varchar2(64) NOT NULL,
update_date timestamp NOT NULL,
remarks nvarchar2(250),
del_flag char(1) DEFAULT '0' NOT NULL,
PRIMARY KEY (id)
) ;
 
COMMENT ON TABLE EAM_SYSGROUP IS '应用系统群组管理';
COMMENT ON COLUMN eam_sysgroup.id IS 'UUID'; 
COMMENT ON COLUMN eam_sysgroup.name IS '群组名称';
COMMENT ON COLUMN eam_sysgroup.chinese_name IS '群组简称';
 
COMMENT ON COLUMN eam_sysgroup.create_by IS '创建者';
COMMENT ON COLUMN eam_sysgroup.create_date IS '创建时间';
COMMENT ON COLUMN eam_sysgroup.update_by IS '更新者';
COMMENT ON COLUMN eam_sysgroup.update_date IS '更新时间';
COMMENT ON COLUMN eam_sysgroup.remarks IS '备注信息';
COMMENT ON COLUMN eam_sysgroup.del_flag IS '删除标记（0：正常；1：删除）';