/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnoderoutere.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysnoderoutere.entity.EamNodeRouteRe;
import com.dc.smarteam.modules.sysnoderoutere.dao.EamNodeRouteReDao;

/**
 * 节点路由关系管理Service
 * @author zhanghaor
 * @version 2016-01-26
 */
@Service
@Transactional(readOnly = true)
public class EamNodeRouteReService extends CrudService<EamNodeRouteReDao, EamNodeRouteRe> {

	public EamNodeRouteRe get(String id) {
		return super.get(id);
	}
	
	public List<EamNodeRouteRe> findList(EamNodeRouteRe eamNodeRouteRe) {
		return super.findList(eamNodeRouteRe);
	}
	
	public Page<EamNodeRouteRe> findPage(Page<EamNodeRouteRe> page, EamNodeRouteRe eamNodeRouteRe) {
		return super.findPage(page, eamNodeRouteRe);
	}
	
	@Transactional(readOnly = false)
	public void save(EamNodeRouteRe eamNodeRouteRe) {
		super.save(eamNodeRouteRe);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamNodeRouteRe eamNodeRouteRe) {
		super.delete(eamNodeRouteRe);
	}
	
}