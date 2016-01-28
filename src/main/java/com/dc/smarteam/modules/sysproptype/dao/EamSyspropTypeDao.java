/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysproptype.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.sysproptype.entity.EamSyspropType;

/**
 * 系统属性类别管理DAO接口
 * @author zhanghaor
 * @version 2016-01-21
 */
@MyBatisDao
public interface EamSyspropTypeDao extends CrudDao<EamSyspropType> {
	
}