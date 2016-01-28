/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodelogre.entity;

import com.dc.smarteam.modules.log.entity.EamLogType;
import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 节点日志关系管理Entity
 * @author zhanghaor
 * @version 2016-01-26
 */
public class EamNodeLogtypeRe extends DataEntity<EamNodeLogtypeRe> {
	
	private static final long serialVersionUID = 1L;
	private String eamLinknodeId;		// 节点Id
	private String eamLogTypeId;		// 日志Id

	private EamLinknode eamLinknode;//节点
	private EamLogType eamLogType;//日志

	public EamLinknode getEamLinknode() {
		return eamLinknode;
	}

	public void setEamLinknode(EamLinknode eamLinknode) {
		this.eamLinknode = eamLinknode;
	}

	public EamLogType getEamLogType() {
		return eamLogType;
	}

	public void setEamLogType(EamLogType eamLogType) {
		this.eamLogType = eamLogType;
	}

	public EamNodeLogtypeRe() {
		super();
	}

	public EamNodeLogtypeRe(String id){
		super(id);
	}

	@Length(min=0, max=40, message="节点长度必须介于 0 和 40 之间")
	public String getEamLinknodeId() {
		return eamLinknodeId;
	}

	public void setEamLinknodeId(String eamLinknodeId) {
		this.eamLinknodeId = eamLinknodeId;
	}
	
	@Length(min=0, max=40, message="日志长度必须介于 0 和 40 之间")
	public String getEamLogTypeId() {
		return eamLogTypeId;
	}

	public void setEamLogTypeId(String eamLogTypeId) {
		this.eamLogTypeId = eamLogTypeId;
	}
	
}