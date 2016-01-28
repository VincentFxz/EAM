/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodetimeoutre.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysnodetimeoutre.entity.EamNodeTimeoutRe;
import com.dc.smarteam.modules.sysnodetimeoutre.dao.EamNodeTimeoutReDao;

/**
 * 节点超时算法关系管理Service
 * @author zhanghaor
 * @version 2016-01-25
 */
@Service
@Transactional(readOnly = true)
public class EamNodeTimeoutReService extends CrudService<EamNodeTimeoutReDao, EamNodeTimeoutRe> {

	public EamNodeTimeoutRe get(String id) {
		return super.get(id);
	}
	
	public List<EamNodeTimeoutRe> findList(EamNodeTimeoutRe eamNodeTimeoutRe) {
		return super.findList(eamNodeTimeoutRe);
	}
	
	public Page<EamNodeTimeoutRe> findPage(Page<EamNodeTimeoutRe> page, EamNodeTimeoutRe eamNodeTimeoutRe) {
		return super.findPage(page, eamNodeTimeoutRe);
	}
	
	@Transactional(readOnly = false)
	public void save(EamNodeTimeoutRe eamNodeTimeoutRe) {
		super.save(eamNodeTimeoutRe);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamNodeTimeoutRe eamNodeTimeoutRe) {
		super.delete(eamNodeTimeoutRe);
	}
	
}