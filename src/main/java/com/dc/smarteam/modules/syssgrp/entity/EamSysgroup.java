/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syssgrp.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 应用系统群组管理Entity
 * @author yangqjb
 * @version 2015-12-24
 */
public class EamSysgroup extends DataEntity<EamSysgroup> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 群组名称
	private String chineseName;		// 群组简称
	
	public EamSysgroup() {
		super();
	}

	public EamSysgroup(String id){
		super(id);
	}

	@Length(min=0, max=250, message="群组名称长度必须介于 0 和 250 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=250, message="群组简称长度必须介于 0 和 250 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
}