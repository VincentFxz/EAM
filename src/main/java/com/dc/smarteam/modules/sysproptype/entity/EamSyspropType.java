/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysproptype.entity;


import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统属性类别管理Entity
 * @author zhanghaor
 * @version 2016-01-21
 */
public class EamSyspropType extends DataEntity<EamSyspropType> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 属性分类名称
	private String chineseName;		// 中文名称
	
	public EamSyspropType() {
		super();
	}

	public EamSyspropType(String id){
		super(id);
	}

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
	
}