/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysmdl.entity;

import com.dc.smarteam.modules.sys.utils.UserUtils;
import org.hibernate.validator.constraints.Length;
import com.dc.smarteam.modules.sys.entity.User;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统模块管理Entity
 * @author yangqjb
 * @version 2015-12-23
 */
public class EamSystemModule extends DataEntity<EamSystemModule> {
	
	private static final long serialVersionUID = 1L;
	private String eamSystemId;		// 所属系统
	private String name;		// 模块名称
	private String chineseName;		// 中文名称
	private User manager;		// 模块负责人
	
	public EamSystemModule() {
		super();
	}

	public EamSystemModule(String id){
		super(id);
	}

	@Length(min=1, max=40, message="所属系统长度必须介于 1 和 40 之间")
	public String getEamSystemId() {
		return eamSystemId;
	}

	public void setEamSystemId(String eamSystemId) {
		this.eamSystemId = eamSystemId;
	}
	
	@Length(min=0, max=255, message="模块名称长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

    @Length(min=0, max=255, message="模块名称长度必须介于 0 和 255 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
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