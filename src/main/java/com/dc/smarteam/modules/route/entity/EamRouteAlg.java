/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.route.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 路由管理Entity
 * @author zhanghaor
 * @version 2016-01-22
 */
public class EamRouteAlg extends DataEntity<EamRouteAlg> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 路由名称
	private String chineseName;		// 路由简称
	private String routeBasis;		// 基础路由
	private String rtableMaintain;		// 路由表维护
	private String rtableStore;		// 路由表存储
	private String delFlg;		// 删除标记
	
	public EamRouteAlg() {
		super();
	}

	public EamRouteAlg(String id){
		super(id);
	}

	@Length(min=1, max=255, message="路由名称长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=255, message="基础路由长度必须介于 0 和 255 之间")
	public String getRouteBasis() {
		return routeBasis;
	}

	public void setRouteBasis(String routeBasis) {
		this.routeBasis = routeBasis;
	}
	
	@Length(min=0, max=255, message="路由表维护长度必须介于 0 和 255 之间")
	public String getRtableMaintain() {
		return rtableMaintain;
	}

	public void setRtableMaintain(String rtableMaintain) {
		this.rtableMaintain = rtableMaintain;
	}
	
	@Length(min=0, max=255, message="路由表存储长度必须介于 0 和 255 之间")
	public String getRtableStore() {
		return rtableStore;
	}

	public void setRtableStore(String rtableStore) {
		this.rtableStore = rtableStore;
	}
	
	@Length(min=1, max=1, message="删除标记长度必须介于 1 和 1 之间")
	public String getDelFlg() {
		return delFlg;
	}

	public void setDelFlg(String delFlg) {
		this.delFlg = delFlg;
	}
	
}