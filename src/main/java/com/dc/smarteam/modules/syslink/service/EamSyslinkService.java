/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syslink.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.syslink.entity.EamSyslink;
import com.dc.smarteam.modules.syslink.dao.EamSyslinkDao;

/**
 * 节点关联管理Service
 * @author zhanghaor
 * @version 2016-01-25
 */
@Service
@Transactional(readOnly = true)
public class EamSyslinkService extends CrudService<EamSyslinkDao, EamSyslink> {

	public EamSyslink get(String id) {
		return super.get(id);
	}
	
	public List<EamSyslink> findList(EamSyslink eamSyslink) {
		return super.findList(eamSyslink);
	}
	
	public Page<EamSyslink> findPage(Page<EamSyslink> page, EamSyslink eamSyslink) {
		return super.findPage(page, eamSyslink);
	}
	
	@Transactional(readOnly = false)
	public void save(EamSyslink eamSyslink) {
		super.save(eamSyslink);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamSyslink eamSyslink) {
		super.delete(eamSyslink);
	}
	
}