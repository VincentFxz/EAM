/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodeinre.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysnodeinre.entity.EamNodeInterfaceRe;
import com.dc.smarteam.modules.sysnodeinre.dao.EamNodeInterfaceReDao;

/**
 * 节点接口关系管理Service
 * @author zhanghaor
 * @version 2016-01-26
 */
@Service
@Transactional(readOnly = true)
public class EamNodeInterfaceReService extends CrudService<EamNodeInterfaceReDao, EamNodeInterfaceRe> {

	public EamNodeInterfaceRe get(String id) {
		return super.get(id);
	}
	
	public List<EamNodeInterfaceRe> findList(EamNodeInterfaceRe eamNodeInterfaceRe) {
		return super.findList(eamNodeInterfaceRe);
	}
	
	public Page<EamNodeInterfaceRe> findPage(Page<EamNodeInterfaceRe> page, EamNodeInterfaceRe eamNodeInterfaceRe) {
		return super.findPage(page, eamNodeInterfaceRe);
	}
	
	@Transactional(readOnly = false)
	public void save(EamNodeInterfaceRe eamNodeInterfaceRe) {
		super.save(eamNodeInterfaceRe);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamNodeInterfaceRe eamNodeInterfaceRe) {
		super.delete(eamNodeInterfaceRe);
	}
	
}