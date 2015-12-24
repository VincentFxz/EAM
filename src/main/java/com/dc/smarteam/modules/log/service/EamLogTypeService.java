/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.log.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.log.entity.EamLogType;
import com.dc.smarteam.modules.log.dao.EamLogTypeDao;

/**
 * 流水日志Service
 * @author kern
 * @version 2015-12-24
 */
@Service
@Transactional(readOnly = true)
public class EamLogTypeService extends CrudService<EamLogTypeDao, EamLogType> {

	public EamLogType get(String id) {
		return super.get(id);
	}
	
	public List<EamLogType> findList(EamLogType eamLogType) {
		return super.findList(eamLogType);
	}
	
	public Page<EamLogType> findPage(Page<EamLogType> page, EamLogType eamLogType) {
		return super.findPage(page, eamLogType);
	}
	
	@Transactional(readOnly = false)
	public void save(EamLogType eamLogType) {
		super.save(eamLogType);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamLogType eamLogType) {
		super.delete(eamLogType);
	}
	
}