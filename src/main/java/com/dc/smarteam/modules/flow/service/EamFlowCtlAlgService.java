/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.flow.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.flow.entity.EamFlowCtlAlg;
import com.dc.smarteam.modules.flow.dao.EamFlowCtlAlgDao;

/**
 * 流控算法管理模块Service
 * @author kern
 * @version 2015-12-24
 */
@Service
@Transactional(readOnly = true)
public class EamFlowCtlAlgService extends CrudService<EamFlowCtlAlgDao, EamFlowCtlAlg> {

	public EamFlowCtlAlg get(String id) {
		return super.get(id);
	}
	
	public List<EamFlowCtlAlg> findList(EamFlowCtlAlg eamFlowCtlAlg) {
		return super.findList(eamFlowCtlAlg);
	}
	
	public Page<EamFlowCtlAlg> findPage(Page<EamFlowCtlAlg> page, EamFlowCtlAlg eamFlowCtlAlg) {
		return super.findPage(page, eamFlowCtlAlg);
	}
	
	@Transactional(readOnly = false)
	public void save(EamFlowCtlAlg eamFlowCtlAlg) {
		super.save(eamFlowCtlAlg);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamFlowCtlAlg eamFlowCtlAlg) {
		super.delete(eamFlowCtlAlg);
	}
	
}