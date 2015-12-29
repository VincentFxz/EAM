/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syslink.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.syslink.entity.EamSyslink;

/**
 * 系统关联关系DAO接口
 * @author yangqjb
 * @version 2015-12-28
 */
@MyBatisDao
public interface EamSyslinkDao extends CrudDao<EamSyslink> {
	
}