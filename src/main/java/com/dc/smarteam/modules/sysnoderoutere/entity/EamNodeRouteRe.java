/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnoderoutere.entity;

import com.dc.smarteam.modules.route.entity.EamRouteAlg;
import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 节点路由关系管理Entity
 * @author zhanghaor
 * @version 2016-01-26
 */
public class EamNodeRouteRe extends DataEntity<EamNodeRouteRe> {
	
	private static final long serialVersionUID = 1L;
	private String eamLinknodeId;		// 节点Id
	private String eamRouteAlgId;		// 路由Id

	private EamLinknode eamLinknode;//节点
	private EamRouteAlg eamRouteAlg;//路由

	public EamLinknode getEamLinknode() {
		return eamLinknode;
	}

	public void setEamLinknode(EamLinknode eamLinknode) {
		this.eamLinknode = eamLinknode;
	}

	public EamRouteAlg getEamRouteAlg() {
		return eamRouteAlg;
	}

	public void setEamRouteAlg(EamRouteAlg eamRouteAlg) {
		this.eamRouteAlg = eamRouteAlg;
	}

	public EamNodeRouteRe() {
		super();
	}

	public EamNodeRouteRe(String id){
		super(id);
	}

	@Length(min=0, max=40, message="节点长度必须介于 0 和 40 之间")
	public String getEamLinknodeId() {
		return eamLinknodeId;
	}

	public void setEamLinknodeId(String eamLinknodeId) {
		this.eamLinknodeId = eamLinknodeId;
	}
	
	@Length(min=0, max=40, message="路由长度必须介于 0 和 40 之间")
	public String getEamRouteAlgId() {
		return eamRouteAlgId;
	}

	public void setEamRouteAlgId(String eamRouteAlgId) {
		this.eamRouteAlgId = eamRouteAlgId;
	}
	
}