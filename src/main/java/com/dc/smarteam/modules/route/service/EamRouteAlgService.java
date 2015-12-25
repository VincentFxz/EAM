/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.route.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.route.entity.EamRouteAlg;
import com.dc.smarteam.modules.route.dao.EamRouteAlgDao;

/**
 * 交易路由Service
 * @author kern
 * @version 2015-12-24
 */
@Service
@Transactional(readOnly = true)
public class EamRouteAlgService extends CrudService<EamRouteAlgDao, EamRouteAlg> {

	public EamRouteAlg get(String id) {
		return super.get(id);
	}
	
	public List<EamRouteAlg> findList(EamRouteAlg eamRouteAlg) {
		return super.findList(eamRouteAlg);
	}
	
	public Page<EamRouteAlg> findPage(Page<EamRouteAlg> page, EamRouteAlg eamRouteAlg) {
		return super.findPage(page, eamRouteAlg);
	}
	
	@Transactional(readOnly = false)
	public void save(EamRouteAlg eamRouteAlg) {
		super.save(eamRouteAlg);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamRouteAlg eamRouteAlg) {
		super.delete(eamRouteAlg);
	}
	
}