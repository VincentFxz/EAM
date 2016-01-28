/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysstr.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.sysstr.entity.EamAaStrategy;

/**
 * 系统决策管理DAO接口
 * @author zhanghaor
 * @version 2016-01-21
 */
@MyBatisDao
public interface EamAaStrategyDao extends CrudDao<EamAaStrategy> {
	
}