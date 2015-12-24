/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysmdl.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysmdl.entity.EamSystemModule;
import com.dc.smarteam.modules.sysmdl.dao.EamSystemModuleDao;

/**
 * 系统模块管理Service
 * @author yangqjb
 * @version 2015-12-23
 */
@Service
@Transactional(readOnly = true)
public class EamSystemModuleService extends CrudService<EamSystemModuleDao, EamSystemModule> {

	public EamSystemModule get(String id) {
		return super.get(id);
	}
	
	public List<EamSystemModule> findList(EamSystemModule eamSystemModule) {
		return super.findList(eamSystemModule);
	}
	
	public Page<EamSystemModule> findPage(Page<EamSystemModule> page, EamSystemModule eamSystemModule) {
		return super.findPage(page, eamSystemModule);
	}
	
	@Transactional(readOnly = false)
	public void save(EamSystemModule eamSystemModule) {
		super.save(eamSystemModule);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamSystemModule eamSystemModule) {
		super.delete(eamSystemModule);
	}
	
}