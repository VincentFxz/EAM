/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysproperty.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysproperty.entity.EamSysproperty;
import com.dc.smarteam.modules.sysproperty.dao.EamSyspropertyDao;

/**
 * 系统属性管理Service
 * @author zhanghaor
 * @version 2016-01-21
 */
@Service
@Transactional(readOnly = true)
public class EamSyspropertyService extends CrudService<EamSyspropertyDao, EamSysproperty> {

	public EamSysproperty get(String id) {
		return super.get(id);
	}
	
	public List<EamSysproperty> findList(EamSysproperty eamSysproperty) {
		return super.findList(eamSysproperty);
	}
	
	public Page<EamSysproperty> findPage(Page<EamSysproperty> page, EamSysproperty eamSysproperty) {
		return super.findPage(page, eamSysproperty);
	}
	
	@Transactional(readOnly = false)
	public void save(EamSysproperty eamSysproperty) {
		super.save(eamSysproperty);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamSysproperty eamSysproperty) {
		super.delete(eamSysproperty);
	}
	
}