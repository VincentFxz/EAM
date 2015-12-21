/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysmng.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统管理Entity
 * @author yangqjb
 * @version 2015-12-21
 */
public class EamSystem extends DataEntity<EamSystem> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 系统名称
	private String chineseName;		// 中文名称
	private String comments;		// 描述
	private String eamBankId;		// 所属银行
	private String eamSysgroupId;		// 所属系统群组
	private String eamAaLayerId;		// 所属应用架构层次
	private String eamOrgLayerId;		// 机构层次代码
	private String eamBuildTypeId;		// 建设类型代码
	private String eamBuildStateId;		// 建设状态代码
	private String eamTrendId;		// 未来走向
	
	public EamSystem() {
		super();
	}

	public EamSystem(String id){
		super(id);
	}

	@Length(min=0, max=255, message="系统名称长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

    @Length(min=0, max=255, message="系统名称长度必须介于 0 和 255 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=2047, message="描述长度必须介于 0 和 2047 之间")
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	@Length(min=0, max=40, message="所属银行长度必须介于 0 和 40 之间")
	public String getEamBankId() {
		return eamBankId;
	}

	public void setEamBankId(String eamBankId) {
		this.eamBankId = eamBankId;
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
	
	@Length(min=0, max=40, message="建设类型代码长度必须介于 0 和 40 之间")
	public String getEamBuildTypeId() {
		return eamBuildTypeId;
	}

	public void setEamBuildTypeId(String eamBuildTypeId) {
		this.eamBuildTypeId = eamBuildTypeId;
	}
	
	@Length(min=0, max=40, message="建设状态代码长度必须介于 0 和 40 之间")
	public String getEamBuildStateId() {
		return eamBuildStateId;
	}

	public void setEamBuildStateId(String eamBuildStateId) {
		this.eamBuildStateId = eamBuildStateId;
	}
	
	@Length(min=0, max=40, message="未来走向长度必须介于 0 和 40 之间")
	public String getEamTrendId() {
		return eamTrendId;
	}

	public void setEamTrendId(String eamTrendId) {
		this.eamTrendId = eamTrendId;
	}
	
}