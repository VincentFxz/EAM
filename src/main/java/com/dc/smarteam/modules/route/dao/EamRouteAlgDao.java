/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.route.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.route.entity.EamRouteAlg;

/**
 * 路由管理DAO接口
 * @author zhanghaor
 * @version 2016-01-22
 */
@MyBatisDao
public interface EamRouteAlgDao extends CrudDao<EamRouteAlg> {
	
}