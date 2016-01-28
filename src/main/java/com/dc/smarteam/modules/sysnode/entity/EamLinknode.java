/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnode.entity;

import com.dc.smarteam.modules.protocol.entity.EamProtocol;
import com.dc.smarteam.modules.sysmng.entity.EamSystem;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统节点管理Entity
 * @author zhanghaor
 * @version 2016-01-25
 */
public class EamLinknode extends DataEntity<EamLinknode> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 节点名称
	private String chineseName;		// 中文名称
	private String eamSystemId;		// 节点系统
	private String linknodeType;		// 节点类型
	private String eamProtocolId;		// 通讯协议

	private EamSystem eamSystem;//所属系统
	private EamProtocol eamProtocol;//相关协议

	public EamSystem getEamSystem() {
		return eamSystem;
	}

	public void setEamSystem(EamSystem eamSystem) {
		this.eamSystem = eamSystem;
	}

	public EamProtocol getEamProtocol() {
		return eamProtocol;
	}

	public void setEamProtocol(EamProtocol eamProtocol) {
		this.eamProtocol = eamProtocol;
	}

	public EamLinknode() {
		super();
	}

	public EamLinknode(String id){
		super(id);
	}

	@Length(min=1, max=250, message="节点名称长度必须介于 1 和 250 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=250, message="中文名称长度必须介于 0 和 250 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=1, max=40, message="节点系统长度必须介于 1 和 40 之间")
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
	
	@Length(min=1, max=40, message="通讯协议长度必须介于 1 和 40 之间")
	public String getEamProtocolId() {
		return eamProtocolId;
	}

	public void setEamProtocolId(String eamProtocolId) {
		this.eamProtocolId = eamProtocolId;
	}
	
}