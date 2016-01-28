/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodeformatre.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysnodeformatre.entity.EamNodeMsgformatRe;
import com.dc.smarteam.modules.sysnodeformatre.dao.EamNodeMsgformatReDao;

/**
 * 节点报文格式关系管理Service
 * @author zhanghaor
 * @version 2016-01-25
 */
@Service
@Transactional(readOnly = true)
public class EamNodeMsgformatReService extends CrudService<EamNodeMsgformatReDao, EamNodeMsgformatRe> {

	public EamNodeMsgformatRe get(String id) {
		return super.get(id);
	}
	
	public List<EamNodeMsgformatRe> findList(EamNodeMsgformatRe eamNodeMsgformatRe) {
		return super.findList(eamNodeMsgformatRe);
	}
	
	public Page<EamNodeMsgformatRe> findPage(Page<EamNodeMsgformatRe> page, EamNodeMsgformatRe eamNodeMsgformatRe) {
		return super.findPage(page, eamNodeMsgformatRe);
	}
	
	@Transactional(readOnly = false)
	public void save(EamNodeMsgformatRe eamNodeMsgformatRe) {
		super.save(eamNodeMsgformatRe);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamNodeMsgformatRe eamNodeMsgformatRe) {
		super.delete(eamNodeMsgformatRe);
	}
	
}