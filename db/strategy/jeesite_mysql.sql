DROP TABLE IF EXISTS eam_aa_strategy;
CREATE TABLE eam_aa_strategy
(
	id varchar(64) NOT NULL COMMENT '编号',
	name varchar(255) NOT NULL COMMENT '决策点名称',
	chinese_name varchar(255) COMMENT '决策点中文名',
	strategy_process varchar(2047) COMMENT 	'决策过程',
	conclusion varchar(2047) COMMENT '结论',
	comments varchar(2047) COMMENT '描述',
	create_by varchar(64) COMMENT '创建者',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime  COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '决策表';
CREATE INDEX eam_aa_strategy_id ON eam_aa_strategy (id);