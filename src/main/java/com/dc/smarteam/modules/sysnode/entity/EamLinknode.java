/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnode.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统关联节点Entity
 * @author yangqjb
 * @version 2015-12-28
 */
public class EamLinknode extends DataEntity<EamLinknode> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String chineseName;		// 中文名称
	private String eamSystemId;		// 节点系统ID
	private String linknodeType;		// 节点类型
	
	public EamLinknode() {
		super();
	}

	public EamLinknode(String id){
		super(id);
	}

	@Length(min=1, max=250, message="名称长度必须介于 1 和 250 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=375, message="中文名称长度必须介于 0 和 375 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=40, message="节点系统ID长度必须介于 0 和 40 之间")
	public String getEamSystemId() {
		return eamSystemId;
	}

	public void setEamSystemId(String eamSystemId) {
		this.eamSystemId = eamSystemId;
	}
	
	@Length(min=0, max=40, message="节点类型长度必须介于 0 和 40 之间")
	public String getLinknodeType() {
		return linknodeType;
	}

	public void setLinknodeType(String linknodeType) {
		this.linknodeType = linknodeType;
	}
	
}