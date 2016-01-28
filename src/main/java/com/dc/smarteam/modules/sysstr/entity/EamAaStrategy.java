/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysstr.entity;

import com.dc.smarteam.modules.sysmng.entity.EamSystem;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统决策管理Entity
 * @author zhanghaor
 * @version 2016-01-21
 */
public class EamAaStrategy extends DataEntity<EamAaStrategy> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 决策点名称
	private String chineseName;		// 决策点中文名
	private String eamSystemId;		// 所属系统
	private String strategyProcess;		// 决策过程
	private String conclusion;		// 结论

	private EamSystem eamSystem;

	public EamSystem getEamSystem() {
		return eamSystem;
	}

	public void setEamSystem(EamSystem eamSystem) {
		this.eamSystem = eamSystem;
	}

	public EamAaStrategy() {
		super();
	}

	public EamAaStrategy(String id){
		super(id);
	}

	@Length(min=1, max=250, message="决策点名称长度必须介于 1 和 250 之间")
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
	
	@Length(min=1, max=40, message="所属系统长度必须介于 1 和 40 之间")
	public String getEamSystemId() {
		return eamSystemId;
	}

	public void setEamSystemId(String eamSystemId) {
		this.eamSystemId = eamSystemId;
	}
	
	public String getStrategyProcess() {
		return strategyProcess;
	}

	public void setStrategyProcess(String strategyProcess) {
		this.strategyProcess = strategyProcess;
	}
	
	public String getConclusion() {
		return conclusion;
	}

	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}
	
}