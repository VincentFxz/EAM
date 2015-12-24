/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.layer.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.layer.entity.EamAaLayer;
import com.dc.smarteam.modules.layer.dao.EamAaLayerDao;

/**
 * 架构层次管理Service
 * @author kern
 * @version 2015-12-24
 */
@Service
@Transactional(readOnly = true)
public class EamAaLayerService extends CrudService<EamAaLayerDao, EamAaLayer> {

	public EamAaLayer get(String id) {
		return super.get(id);
	}
	
	public List<EamAaLayer> findList(EamAaLayer eamAaLayer) {
		return super.findList(eamAaLayer);
	}
	
	public Page<EamAaLayer> findPage(Page<EamAaLayer> page, EamAaLayer eamAaLayer) {
		return super.findPage(page, eamAaLayer);
	}
	
	@Transactional(readOnly = false)
	public void save(EamAaLayer eamAaLayer) {
		super.save(eamAaLayer);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamAaLayer eamAaLayer) {
		super.delete(eamAaLayer);
	}
	
}