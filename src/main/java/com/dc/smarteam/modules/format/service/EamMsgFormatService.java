/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.format.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.format.entity.EamMsgFormat;
import com.dc.smarteam.modules.format.dao.EamMsgFormatDao;

/**
 * 报文格式Service
 * @author zhanghaor
 * @version 2015-12-24
 */
@Service
@Transactional(readOnly = true)
public class EamMsgFormatService extends CrudService<EamMsgFormatDao, EamMsgFormat> {

	public EamMsgFormat get(String id) {
		return super.get(id);
	}
	
	public List<EamMsgFormat> findList(EamMsgFormat eamMsgFormat) {
		return super.findList(eamMsgFormat);
	}
	
	public Page<EamMsgFormat> findPage(Page<EamMsgFormat> page, EamMsgFormat eamMsgFormat) {
		return super.findPage(page, eamMsgFormat);
	}
	
	@Transactional(readOnly = false)
	public void save(EamMsgFormat eamMsgFormat) {
		super.save(eamMsgFormat);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamMsgFormat eamMsgFormat) {
		super.delete(eamMsgFormat);
	}
	
}