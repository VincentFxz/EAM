/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.protocol.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.protocol.entity.EamProtocol;
import com.dc.smarteam.modules.protocol.dao.EamProtocolDao;

/**
 * 协议管理Service
 * @author zhanghaor
 * @version 2016-01-25
 */
@Service
@Transactional(readOnly = true)
public class EamProtocolService extends CrudService<EamProtocolDao, EamProtocol> {

	public EamProtocol get(String id) {
		return super.get(id);
	}
	
	public List<EamProtocol> findList(EamProtocol eamProtocol) {
		return super.findList(eamProtocol);
	}
	
	public Page<EamProtocol> findPage(Page<EamProtocol> page, EamProtocol eamProtocol) {
		return super.findPage(page, eamProtocol);
	}
	
	@Transactional(readOnly = false)
	public void save(EamProtocol eamProtocol) {
		super.save(eamProtocol);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamProtocol eamProtocol) {
		super.delete(eamProtocol);
	}
	
}