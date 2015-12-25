/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.timeout.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.timeout.entity.EamTimeoutAlg;

/**
 * 超时时间管理DAO接口
 * @author kern
 * @version 2015-12-24
 */
@MyBatisDao
public interface EamTimeoutAlgDao extends CrudDao<EamTimeoutAlg> {
	
}