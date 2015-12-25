/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.format.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.format.entity.EamMsgFormat;

/**
 * 报文格式DAO接口
 * @author zhanghaor
 * @version 2015-12-24
 */
@MyBatisDao
public interface EamMsgFormatDao extends CrudDao<EamMsgFormat> {
	
}