/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.strategy.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.strategy.entity.EamAaStrategy;

/**
 * 决策点管理DAO接口
 * @author zhanghaor
 * @version 2015-12-23
 */
@MyBatisDao
public interface EamAaStrategyDao extends CrudDao<EamAaStrategy> {
	
}