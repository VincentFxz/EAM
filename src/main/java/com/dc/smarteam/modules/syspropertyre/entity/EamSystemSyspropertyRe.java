/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syspropertyre.entity;

import com.dc.smarteam.modules.sysmng.entity.EamSystem;
import com.dc.smarteam.modules.sysproperty.entity.EamSysproperty;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统属性关系管理Entity
 * @author zhanghaor
 * @version 2016-01-25
 */
public class EamSystemSyspropertyRe extends DataEntity<EamSystemSyspropertyRe> {
	
	private static final long serialVersionUID = 1L;
	private String eamSystemId;		// 系统Id
	private String eamSyspropertyId;		// 属性Id

	private EamSystem eamSystem;//系统
	private EamSysproperty eamSysproperty;//属性

	public EamSystem getEamSystem() {
		return eamSystem;
	}

	public void setEamSystem(EamSystem eamSystem) {
		this.eamSystem = eamSystem;
	}

	public EamSysproperty getEamSysproperty() {
		return eamSysproperty;
	}

	public void setEamSysproperty(EamSysproperty eamSysproperty) {
		this.eamSysproperty = eamSysproperty;
	}

	public EamSystemSyspropertyRe() {
		super();
	}

	public EamSystemSyspropertyRe(String id){
		super(id);
	}

	@Length(min=1, max=40, message="系统长度必须介于 1 和 40 之间")
	public String getEamSystemId() {
		return eamSystemId;
	}

	public void setEamSystemId(String eamSystemId) {
		this.eamSystemId = eamSystemId;
	}
	
	@Length(min=1, max=40, message="属性长度必须介于 1 和 40 之间")
	public String getEamSyspropertyId() {
		return eamSyspropertyId;
	}

	public void setEamSyspropertyId(String eamSyspropertyId) {
		this.eamSyspropertyId = eamSyspropertyId;
	}
	
}