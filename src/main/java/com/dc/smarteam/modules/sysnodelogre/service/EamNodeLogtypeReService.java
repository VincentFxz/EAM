/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodelogre.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysnodelogre.entity.EamNodeLogtypeRe;
import com.dc.smarteam.modules.sysnodelogre.dao.EamNodeLogtypeReDao;

/**
 * 节点日志关系管理Service
 * @author zhanghaor
 * @version 2016-01-26
 */
@Service
@Transactional(readOnly = true)
public class EamNodeLogtypeReService extends CrudService<EamNodeLogtypeReDao, EamNodeLogtypeRe> {

	public EamNodeLogtypeRe get(String id) {
		return super.get(id);
	}
	
	public List<EamNodeLogtypeRe> findList(EamNodeLogtypeRe eamNodeLogtypeRe) {
		return super.findList(eamNodeLogtypeRe);
	}
	
	public Page<EamNodeLogtypeRe> findPage(Page<EamNodeLogtypeRe> page, EamNodeLogtypeRe eamNodeLogtypeRe) {
		return super.findPage(page, eamNodeLogtypeRe);
	}
	
	@Transactional(readOnly = false)
	public void save(EamNodeLogtypeRe eamNodeLogtypeRe) {
		super.save(eamNodeLogtypeRe);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamNodeLogtypeRe eamNodeLogtypeRe) {
		super.delete(eamNodeLogtypeRe);
	}
	
}