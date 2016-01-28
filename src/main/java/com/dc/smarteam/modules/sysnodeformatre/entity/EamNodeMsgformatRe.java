/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodeformatre.entity;

import com.dc.smarteam.modules.sysformat.entity.EamMsgFormat;
import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 节点报文格式关系管理Entity
 * @author zhanghaor
 * @version 2016-01-25
 */
public class EamNodeMsgformatRe extends DataEntity<EamNodeMsgformatRe> {
	
	private static final long serialVersionUID = 1L;
	private String eamLinknodeId;		// 节点Id
	private String eamMsgFormatId;		// 报文格式Id

	private EamLinknode eamLinknode;//节点
	private EamMsgFormat eamMsgFormat;//报文格式

	public EamLinknode getEamLinknode() {
		return eamLinknode;
	}

	public void setEamLinknode(EamLinknode eamLinknode) {
		this.eamLinknode = eamLinknode;
	}

	public EamMsgFormat getEamMsgFormat() {
		return eamMsgFormat;
	}

	public void setEamMsgFormat(EamMsgFormat eamMsgFormat) {
		this.eamMsgFormat = eamMsgFormat;
	}

	public EamNodeMsgformatRe() {
		super();
	}

	public EamNodeMsgformatRe(String id){
		super(id);
	}

	@Length(min=0, max=40, message="节点长度必须介于 0 和 40 之间")
	public String getEamLinknodeId() {
		return eamLinknodeId;
	}

	public void setEamLinknodeId(String eamLinknodeId) {
		this.eamLinknodeId = eamLinknodeId;
	}
	
	@Length(min=0, max=40, message="报文格式长度必须介于 0 和 40 之间")
	public String getEamMsgFormatId() {
		return eamMsgFormatId;
	}

	public void setEamMsgFormatId(String eamMsgFormatId) {
		this.eamMsgFormatId = eamMsgFormatId;
	}
	
}