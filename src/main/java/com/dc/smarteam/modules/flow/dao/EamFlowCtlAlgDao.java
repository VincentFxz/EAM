/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.flow.dao;

import com.dc.smarteam.common.persistence.CrudDao;
import com.dc.smarteam.common.persistence.annotation.MyBatisDao;
import com.dc.smarteam.modules.flow.entity.EamFlowCtlAlg;

/**
 * 流控算法管理模块DAO接口
 * @author kern
 * @version 2015-12-24
 */
@MyBatisDao
public interface EamFlowCtlAlgDao extends CrudDao<EamFlowCtlAlg> {
	
}