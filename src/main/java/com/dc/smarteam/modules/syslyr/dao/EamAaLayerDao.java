/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syslyr.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.syslyr.entity.EamAaLayer;

/**
 * 架构层次管理DAO接口
 * @author zhanghaor
 * @version 2016-01-25
 */
@MyBatisDao
public interface EamAaLayerDao extends CrudDao<EamAaLayer> {
	
}