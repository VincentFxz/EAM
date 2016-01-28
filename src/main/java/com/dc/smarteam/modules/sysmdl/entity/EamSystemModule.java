/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysmdl.entity;

import com.dc.smarteam.modules.sys.utils.UserUtils;
import com.dc.smarteam.modules.sysmng.entity.EamSystem;
import org.hibernate.validator.constraints.Length;
import com.dc.smarteam.modules.sys.entity.User;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统模块管理Entity
 * @author zhanghaor
 * @version 2016-01-21
 */
public class EamSystemModule extends DataEntity<EamSystemModule> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 模块名称
	private String chineseName;		// 中文名称
	private String eamSystemId;		// 所属系统
	private User manager;		// 模块负责人

	private EamSystem eamSystem;

	public EamSystem getEamSystem() {
		return eamSystem;
	}

	public void setEamSystem(EamSystem eamSystem) {
		this.eamSystem = eamSystem;
	}

	public EamSystemModule() {
		super();
	}

	public EamSystemModule(String id){
		super(id);
	}

	@Length(min=0, max=250, message="模块名称长度必须介于 0 和 250 之间")
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
	
	@Length(min=1, max=40, message="所属系统长度必须介于 1 和 40 之间")
	public String getEamSystemId() {
		return eamSystemId;
	}

	public void setEamSystemId(String eamSystemId) {
		this.eamSystemId = eamSystemId;
	}
	
	public User getManager() {

		if(null != manager){
		manager = UserUtils.get(manager.getId());
	}
	return manager;
}

	public void setManager(User manager) {
		this.manager = manager;
	}
	
}