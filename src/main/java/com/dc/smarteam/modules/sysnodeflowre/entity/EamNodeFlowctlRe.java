/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodeflowre.entity;

import com.dc.smarteam.modules.flow.entity.EamFlowCtlAlg;
import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 节点流控关系管理Entity
 * @author zhanghaor
 * @version 2016-01-26
 */
public class EamNodeFlowctlRe extends DataEntity<EamNodeFlowctlRe> {
	
	private static final long serialVersionUID = 1L;
	private String eamLinknodeId;		// 节点Id
	private String eamFlowCtlAlgId;		// 流控Id

	private EamLinknode eamLinknode;//节点
	private EamFlowCtlAlg eamFlowCtlAlg;//流控

	public EamFlowCtlAlg getEamFlowCtlAlg() {
		return eamFlowCtlAlg;
	}

	public void setEamFlowCtlAlg(EamFlowCtlAlg eamFlowCtlAlg) {
		this.eamFlowCtlAlg = eamFlowCtlAlg;
	}

	public EamLinknode getEamLinknode() {
		return eamLinknode;
	}

	public void setEamLinknode(EamLinknode eamLinknode) {
		this.eamLinknode = eamLinknode;
	}

	public EamNodeFlowctlRe() {
		super();
	}

	public EamNodeFlowctlRe(String id){
		super(id);
	}

	@Length(min=0, max=40, message="节点长度必须介于 0 和 40 之间")
	public String getEamLinknodeId() {
		return eamLinknodeId;
	}

	public void setEamLinknodeId(String eamLinknodeId) {
		this.eamLinknodeId = eamLinknodeId;
	}
	
	@Length(min=0, max=40, message="流控长度必须介于 0 和 40 之间")
	public String getEamFlowCtlAlgId() {
		return eamFlowCtlAlgId;
	}

	public void setEamFlowCtlAlgId(String eamFlowCtlAlgId) {
		this.eamFlowCtlAlgId = eamFlowCtlAlgId;
	}
	
}