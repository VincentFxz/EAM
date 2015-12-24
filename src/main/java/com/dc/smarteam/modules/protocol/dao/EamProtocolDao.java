/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.protocol.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.protocol.entity.EamProtocol;

/**
 * 通讯协议管理DAO接口
 * @author kern
 * @version 2015-12-24
 */
@MyBatisDao
public interface EamProtocolDao extends CrudDao<EamProtocol> {
	
}