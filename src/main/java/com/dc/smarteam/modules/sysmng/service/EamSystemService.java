/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysmng.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysmng.entity.EamSystem;
import com.dc.smarteam.modules.sysmng.dao.EamSystemDao;

/**
 * 系统管理Service
 * @author yangqjb
 * @version 2015-12-21
 */
@Service
@Transactional(readOnly = true)
public class EamSystemService extends CrudService<EamSystemDao, EamSystem> {

	public EamSystem get(String id) {
		return super.get(id);
	}
	
	public List<EamSystem> findList(EamSystem eamSystem) {
		return super.findList(eamSystem);
	}
	
	public Page<EamSystem> findPage(Page<EamSystem> page, EamSystem eamSystem) {
		return super.findPage(page, eamSystem);
	}
	
	@Transactional(readOnly = false)
	public void save(EamSystem eamSystem) {
		super.save(eamSystem);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamSystem eamSystem) {
		super.delete(eamSystem);
	}
	
}