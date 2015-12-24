/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syssgrp.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.syssgrp.entity.EamSysgroup;
import com.dc.smarteam.modules.syssgrp.dao.EamSysgroupDao;

/**
 * 应用系统群组管理Service
 * @author yangqjb
 * @version 2015-12-24
 */
@Service
@Transactional(readOnly = true)
public class EamSysgroupService extends CrudService<EamSysgroupDao, EamSysgroup> {

	public EamSysgroup get(String id) {
		return super.get(id);
	}
	
	public List<EamSysgroup> findList(EamSysgroup eamSysgroup) {
		return super.findList(eamSysgroup);
	}
	
	public Page<EamSysgroup> findPage(Page<EamSysgroup> page, EamSysgroup eamSysgroup) {
		return super.findPage(page, eamSysgroup);
	}
	
	@Transactional(readOnly = false)
	public void save(EamSysgroup eamSysgroup) {
		super.save(eamSysgroup);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamSysgroup eamSysgroup) {
		super.delete(eamSysgroup);
	}
	
}