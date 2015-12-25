/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysstr.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.service.CrudService;
import com.dc.smarteam.modules.sysstr.entity.EamAaStrategy;
import com.dc.smarteam.modules.sysstr.dao.EamAaStrategyDao;

/**
<<<<<<< HEAD:src/main/java/com/dc/smarteam/modules/sysstr/service/EamAaStrategyService.java
 * 应用系统决策管理Service
 * @author yangqjb
=======
 * 决策点管理Service
 * @author zhanghaor
>>>>>>> 5220b94db6a71e15f247e574d1634f41421384aa:src/main/java/com/dc/smarteam/modules/strategy/service/EamAaStrategyService.java
 * @version 2015-12-24
 */
@Service
@Transactional(readOnly = true)
public class EamAaStrategyService extends CrudService<EamAaStrategyDao, EamAaStrategy> {

	public EamAaStrategy get(String id) {
		return super.get(id);
	}
	
	public List<EamAaStrategy> findList(EamAaStrategy eamAaStrategy) {
		return super.findList(eamAaStrategy);
	}
	
	public Page<EamAaStrategy> findPage(Page<EamAaStrategy> page, EamAaStrategy eamAaStrategy) {
		return super.findPage(page, eamAaStrategy);
	}
	
	@Transactional(readOnly = false)
	public void save(EamAaStrategy eamAaStrategy) {
		super.save(eamAaStrategy);
	}
	
	@Transactional(readOnly = false)
	public void delete(EamAaStrategy eamAaStrategy) {
		super.delete(eamAaStrategy);
	}
	
}