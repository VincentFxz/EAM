/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syspropertyre.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.syspropertyre.entity.EamSystemSyspropertyRe;
import com.dc.smarteam.modules.syspropertyre.dao.EamSystemSyspropertyReDao;

/**
 * 系统属性关系管理Service
 * @author zhanghaor
 * @version 2016-01-25
 */
@Service
@Transactional(readOnly = true)
public class EamSystemSyspropertyReService extends CrudService<EamSystemSyspropertyReDao, EamSystemSyspropertyRe> {

	public EamSystemSyspropertyRe get(String id) {
		return super.get(id);
	}
	
	public List<EamSystemSyspropertyRe> findList(EamSystemSyspropertyRe eamSystemSyspropertyRe) {
		return super.findList(eamSystemSyspropertyRe);
	}
	
	public Page<EamSystemSyspropertyRe> findPage(Page<EamSystemSyspropertyRe> page, EamSystemSyspropertyRe eamSystemSyspropertyRe) {
		return super.findPage(page, eamSystemSyspropertyRe);
	}
	
	@Transactional(readOnly = false)
	public void save(EamSystemSyspropertyRe eamSystemSyspropertyRe) {
		super.save(eamSystemSyspropertyRe);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamSystemSyspropertyRe eamSystemSyspropertyRe) {
		super.delete(eamSystemSyspropertyRe);
	}
	
}