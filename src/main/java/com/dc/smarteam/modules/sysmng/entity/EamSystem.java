/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysmng.entity;

import com.dc.smarteam.modules.syslyr.entity.EamAaLayer;
import com.dc.smarteam.modules.syssgrp.entity.EamSysgroup;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 应用系统管理Entity
 * @author zhanghaor
 * @version 2016-01-20
 */
public class EamSystem extends DataEntity<EamSystem> {
	
	private static final long serialVersionUID = 1L;
	private String no;		// 系统编号
	private String chineseName;		// 中文名称
	private String name;		// 系统名称
	private String englishName;		// 英文名
	private String englishShort;		// 英文简称
	private String alias;		// 别名
	private String eamBank;		// 所属银行
	private String eamSysgroupId;		// 所属系统群组
	private String eamAaLayerId;		// 所属应用架构层次
	private String eamOrgLayer;		// 机构层次
	private String eamBuildType;		// 建设类型
	private String eamBuildState;		// 建设状态
	private Date onlineDate;		// 初次上线日期
	private String eamTrend;		// 未来走向
	private String targetSystem;		// 目标系统

	private EamSysgroup eamSysgroup;
	private EamAaLayer eamAaLayer;

	public EamSysgroup getEamSysgroup() {
		return eamSysgroup;
	}

	public void setEamSysgroup(EamSysgroup eamSysgroup) {
		this.eamSysgroup = eamSysgroup;
	}

	public EamAaLayer getEamAaLayer() {
		return eamAaLayer;
	}

	public void setEamAaLayer(EamAaLayer eamAaLayer) {
		this.eamAaLayer = eamAaLayer;
	}

	public EamSystem() {
		super();
	}

	public EamSystem(String id){
		super(id);
	}

	@Length(min=0, max=20, message="系统编号长度必须介于 0 和 20 之间")
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=100, message="英文名长度必须介于 0 和 100 之间")
	public String getEnglishName() {
		return englishName;
	}

	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	
	@Length(min=0, max=100, message="英文简称长度必须介于 0 和 100 之间")
	public String getEnglishShort() {
		return englishShort;
	}

	public void setEnglishShort(String englishShort) {
		this.englishShort = englishShort;
	}
	
	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}
	
	@Length(min=0, max=40, message="所属银行长度必须介于 0 和 40 之间")
	public String getEamBank() {
		return eamBank;
	}

	public void setEamBank(String eamBank) {
		this.eamBank = eamBank;
	}
	
	@Length(min=1, max=40, message="所属系统群组长度必须介于 1 和 40 之间")
	public String getEamSysgroupId() {
		return eamSysgroupId;
	}

	public void setEamSysgroupId(String eamSysgroupId) {
		this.eamSysgroupId = eamSysgroupId;
	}
	
	@Length(min=1, max=40, message="所属应用架构层次长度必须介于 1 和 40 之间")
	public String getEamAaLayerId() {
		return eamAaLayerId;
	}

	public void setEamAaLayerId(String eamAaLayerId) {
		this.eamAaLayerId = eamAaLayerId;
	}
	
	@Length(min=0, max=40, message="机构层次长度必须介于 0 和 40 之间")
	public String getEamOrgLayer() {
		return eamOrgLayer;
	}

	public void setEamOrgLayer(String eamOrgLayer) {
		this.eamOrgLayer = eamOrgLayer;
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
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="初次上线日期不能为空")
	public Date getOnlineDate() {
		return onlineDate;
	}

	public void setOnlineDate(Date onlineDate) {
		this.onlineDate = onlineDate;
	}
	
	@Length(min=0, max=40, message="未来走向长度必须介于 0 和 40 之间")
	public String getEamTrend() {
		return eamTrend;
	}

	public void setEamTrend(String eamTrend) {
		this.eamTrend = eamTrend;
	}
	
	public String getTargetSystem() {
		return targetSystem;
	}

	public void setTargetSystem(String targetSystem) {
		this.targetSystem = targetSystem;
	}
	
}