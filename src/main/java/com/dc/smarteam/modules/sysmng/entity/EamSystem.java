/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysmng.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统管理Entity
 * @author yangqjb
 * @version 2015-12-24
 */
public class EamSystem extends DataEntity<EamSystem> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 系统名称
	private String chineseName;		// 中文名称
	private String eamBank;		// 所属银行
	private String eamSysgroupId;		// 所属系统群组
	private String eamAaLayerId;		// 所属应用架构层次
	private String eamOrgLayerId;		// 机构层次代码
	private String eamBuildType;		// 建设类型
	private String eamBuildState;		// 建设状态
	private String eamTrend;		// 未来走向
	
	public EamSystem() {
		super();
	}

	public EamSystem(String id){
		super(id);
	}

	@Length(min=0, max=250, message="系统名称长度必须介于 0 和 250 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=375, message="中文名称长度必须介于 0 和 375 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=40, message="所属银行长度必须介于 0 和 40 之间")
	public String getEamBank() {
		return eamBank;
	}

	public void setEamBank(String eamBank) {
		this.eamBank = eamBank;
	}
	
	@Length(min=0, max=40, message="所属系统群组长度必须介于 0 和 40 之间")
	public String getEamSysgroupId() {
		return eamSysgroupId;
	}

	public void setEamSysgroupId(String eamSysgroupId) {
		this.eamSysgroupId = eamSysgroupId;
	}
	
	@Length(min=0, max=40, message="所属应用架构层次长度必须介于 0 和 40 之间")
	public String getEamAaLayerId() {
		return eamAaLayerId;
	}

	public void setEamAaLayerId(String eamAaLayerId) {
		this.eamAaLayerId = eamAaLayerId;
	}
	
	@Length(min=0, max=40, message="机构层次代码长度必须介于 0 和 40 之间")
	public String getEamOrgLayerId() {
		return eamOrgLayerId;
	}

	public void setEamOrgLayerId(String eamOrgLayerId) {
		this.eamOrgLayerId = eamOrgLayerId;
	}
	
	@Length(min=0, max=40, message="建设类型长度必须介于 0 和 40 之间")
	public String getEamBuildType() {
		return eamBuildType;
	}

	public void setEamBuildType(String eamBuildType) {
		this.eamBuildType = eamBuildType;
	}
	
	@Length(min=0, max=40, message="建设状态长度必须介于 0 和 40 之间")
	public String getEamBuildState() {
		return eamBuildState;
	}

	public void setEamBuildState(String eamBuildState) {
		this.eamBuildState = eamBuildState;
	}
	
	@Length(min=0, max=40, message="未来走向长度必须介于 0 和 40 之间")
	public String getEamTrend() {
		return eamTrend;
	}

	public void setEamTrend(String eamTrend) {
		this.eamTrend = eamTrend;
	}
	
}