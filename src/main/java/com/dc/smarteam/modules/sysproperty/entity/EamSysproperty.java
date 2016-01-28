/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysproperty.entity;

import com.dc.smarteam.modules.sysproptype.entity.EamSyspropType;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统属性管理Entity
 * @author zhanghaor
 * @version 2016-01-21
 */
public class EamSysproperty extends DataEntity<EamSysproperty> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 属性名称
	private String chineseName;		// 中文名称
	private String eamSyspropTypeId;		// 系统属性类别ID

	private EamSyspropType eamSyspropType;//系统属性类别

	public EamSyspropType getEamSyspropType() {
		return eamSyspropType;
	}

	public void setEamSyspropType(EamSyspropType eamSyspropType) {
		this.eamSyspropType = eamSyspropType;
	}

	public EamSysproperty() {
		super();
	}

	public EamSysproperty(String id){
		super(id);
	}

	@Length(min=0, max=100, message="属性名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=1, max=40, message="系统属性类别长度必须介于 1 和 40 之间")
	public String getEamSyspropTypeId() {
		return eamSyspropTypeId;
	}

	public void setEamSyspropTypeId(String eamSyspropTypeId) {
		this.eamSyspropTypeId = eamSyspropTypeId;
	}
	
}