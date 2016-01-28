/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysproptype.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysproptype.entity.EamSyspropType;
import com.dc.smarteam.modules.sysproptype.dao.EamSyspropTypeDao;

/**
 * 系统属性类别管理Service
 * @author zhanghaor
 * @version 2016-01-21
 */
@Service
@Transactional(readOnly = true)
public class EamSyspropTypeService extends CrudService<EamSyspropTypeDao, EamSyspropType> {

	public EamSyspropType get(String id) {
		return super.get(id);
	}
	
	public List<EamSyspropType> findList(EamSyspropType eamSyspropType) {
		return super.findList(eamSyspropType);
	}
	
	public Page<EamSyspropType> findPage(Page<EamSyspropType> page, EamSyspropType eamSyspropType) {
		return super.findPage(page, eamSyspropType);
	}
	
	@Transactional(readOnly = false)
	public void save(EamSyspropType eamSyspropType) {
		super.save(eamSyspropType);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamSyspropType eamSyspropType) {
		super.delete(eamSyspropType);
	}
	
}