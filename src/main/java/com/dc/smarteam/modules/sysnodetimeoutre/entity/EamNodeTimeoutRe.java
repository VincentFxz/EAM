/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodetimeoutre.entity;

import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import com.dc.smarteam.modules.timeout.entity.EamTimeoutAlg;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 节点超时算法关系管理Entity
 * @author zhanghaor
 * @version 2016-01-25
 */
public class EamNodeTimeoutRe extends DataEntity<EamNodeTimeoutRe> {
	
	private static final long serialVersionUID = 1L;
	private String eamLinknodeId;		// 节点Id
	private String eamTimeoutAlgId;		// 超时算法Id

	private EamLinknode eamLinknode;//节点
	private EamTimeoutAlg eamTimeoutAlg;//超时算法

	public EamLinknode getEamLinknode() {
		return eamLinknode;
	}

	public void setEamLinknode(EamLinknode eamLinknode) {
		this.eamLinknode = eamLinknode;
	}

	public EamTimeoutAlg getEamTimeoutAlg() {
		return eamTimeoutAlg;
	}

	public void setEamTimeoutAlg(EamTimeoutAlg eamTimeoutAlg) {
		this.eamTimeoutAlg = eamTimeoutAlg;
	}

	public EamNodeTimeoutRe() {
		super();
	}

	public EamNodeTimeoutRe(String id){
		super(id);
	}

	@Length(min=0, max=40, message="节点长度必须介于 0 和 40 之间")
	public String getEamLinknodeId() {
		return eamLinknodeId;
	}

	public void setEamLinknodeId(String eamLinknodeId) {
		this.eamLinknodeId = eamLinknodeId;
	}
	
	@Length(min=0, max=40, message="超时算法长度必须介于 0 和 40 之间")
	public String getEamTimeoutAlgId() {
		return eamTimeoutAlgId;
	}

	public void setEamTimeoutAlgId(String eamTimeoutAlgId) {
		this.eamTimeoutAlgId = eamTimeoutAlgId;
	}
	
}