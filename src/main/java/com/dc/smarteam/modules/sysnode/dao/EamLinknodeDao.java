/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnode.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.sysnode.entity.EamLinknode;

/**
 * 系统节点管理DAO接口
 * @author zhanghaor
 * @version 2016-01-25
 */
@MyBatisDao
public interface EamLinknodeDao extends CrudDao<EamLinknode> {
	
}