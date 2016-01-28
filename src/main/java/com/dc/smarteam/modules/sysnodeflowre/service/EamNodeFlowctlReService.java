/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodeflowre.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysnodeflowre.entity.EamNodeFlowctlRe;
import com.dc.smarteam.modules.sysnodeflowre.dao.EamNodeFlowctlReDao;

/**
 * 节点流控关系管理Service
 * @author zhanghaor
 * @version 2016-01-26
 */
@Service
@Transactional(readOnly = true)
public class EamNodeFlowctlReService extends CrudService<EamNodeFlowctlReDao, EamNodeFlowctlRe> {

	public EamNodeFlowctlRe get(String id) {
		return super.get(id);
	}
	
	public List<EamNodeFlowctlRe> findList(EamNodeFlowctlRe eamNodeFlowctlRe) {
		return super.findList(eamNodeFlowctlRe);
	}
	
	public Page<EamNodeFlowctlRe> findPage(Page<EamNodeFlowctlRe> page, EamNodeFlowctlRe eamNodeFlowctlRe) {
		return super.findPage(page, eamNodeFlowctlRe);
	}
	
	@Transactional(readOnly = false)
	public void save(EamNodeFlowctlRe eamNodeFlowctlRe) {
		super.save(eamNodeFlowctlRe);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamNodeFlowctlRe eamNodeFlowctlRe) {
		super.delete(eamNodeFlowctlRe);
	}
	
}