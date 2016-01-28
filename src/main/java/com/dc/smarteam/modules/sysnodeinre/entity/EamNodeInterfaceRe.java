/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodeinre.entity;

import com.dc.smarteam.modules.sysinter.entity.EamInterface;
import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 节点接口关系管理Entity
 * @author zhanghaor
 * @version 2016-01-26
 */
public class EamNodeInterfaceRe extends DataEntity<EamNodeInterfaceRe> {
	
	private static final long serialVersionUID = 1L;
	private String eamLinknodeId;		// 节点Id
	private String eamInterfaceId;		// 接口Id

	private EamLinknode eamLinknode;//节点
	private EamInterface eamInterface;//接口

	public EamLinknode getEamLinknode() {
		return eamLinknode;
	}

	public void setEamLinknode(EamLinknode eamLinknode) {
		this.eamLinknode = eamLinknode;
	}

	public EamInterface getEamInterface() {
		return eamInterface;
	}

	public void setEamInterface(EamInterface eamInterface) {
		this.eamInterface = eamInterface;
	}

	public EamNodeInterfaceRe() {
		super();
	}

	public EamNodeInterfaceRe(String id){
		super(id);
	}

	@Length(min=1, max=40, message="节点长度必须介于 1 和 40 之间")
	public String getEamLinknodeId() {
		return eamLinknodeId;
	}

	public void setEamLinknodeId(String eamLinknodeId) {
		this.eamLinknodeId = eamLinknodeId;
	}
	
	@Length(min=1, max=40, message="接口长度必须介于 1 和 40 之间")
	public String getEamInterfaceId() {
		return eamInterfaceId;
	}

	public void setEamInterfaceId(String eamInterfaceId) {
		this.eamInterfaceId = eamInterfaceId;
	}
	
}