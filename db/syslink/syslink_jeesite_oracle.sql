/* 关联节点管理 */
/* Drop Tables */

DROP TABLE eam_linknode;

CREATE TABLE eam_linknode
(
id	 	varchar2(40)	NOT NULL,
name	 	varchar2(250)	NOT NULL,
chinese_name	 	nvarchar2(250)	,

eam_system_id	 	varchar2(40)	,
linknode_type	 	varchar2(40)	,


create_by varchar2(40) NOT NULL,
create_date timestamp NOT NULL,
update_by varchar2(40) NOT NULL,
update_date timestamp NOT NULL,
remarks nvarchar2(2000),
del_flag char(1) DEFAULT '0' NOT NULL,
PRIMARY KEY (id)
);

COMMENT ON TABLE eam_linknode IS '关联节点管理';
COMMENT ON COLUMN eam_linknode.id IS 'UUID';
COMMENT ON COLUMN eam_linknode.name IS '系统名称';
COMMENT ON COLUMN eam_linknode.chinese_name IS '中文名称';

COMMENT ON COLUMN eam_linknode.eam_system_id IS '节点系统ID';
COMMENT ON COLUMN eam_linknode.linknode_type IS '节点类型';

COMMENT ON COLUMN eam_linknode.create_by IS '创建者';
COMMENT ON COLUMN eam_linknode.create_date IS '创建时间';
COMMENT ON COLUMN eam_linknode.update_by IS '更新者';
COMMENT ON COLUMN eam_linknode.update_date IS '更新时间';
COMMENT ON COLUMN eam_linknode.remarks IS '备注信息';
COMMENT ON COLUMN eam_linknode.del_flag IS '删除标记（0：正常；1：删除）';


/* 节点关联关系管理 */
DROP TABLE eam_syslink;

CREATE TABLE eam_syslink
(
id	 	varchar2(40)	NOT NULL,
name	 	varchar2(250)	,
chinese_name	 	nvarchar2(250)	,

link_type	 	varchar2(40)	,
start_linknode_id	 	varchar2(40)	,
end_linknode_id	 	varchar2(40)	,
link_status	 	varchar2(40)	,

create_by varchar2(40) NOT NULL,
create_date timestamp NOT NULL,
update_by varchar2(40) NOT NULL,
update_date timestamp NOT NULL,
remarks nvarchar2(2000),
del_flag char(1) DEFAULT '0' NOT NULL,
PRIMARY KEY (id)
);

COMMENT ON TABLE eam_syslink IS '节点关联关系';
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


