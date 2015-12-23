/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.strategy.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 决策点管理Entity
 * @author zhanghaor
 * @version 2015-12-23
 */
public class EamAaStrategy extends DataEntity<EamAaStrategy> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 决策点名称
	private String chineseName;		// 决策点中文名
	private String strategyProcess;		// 决策过程
	private String conclusion;		// 结论
	private String comments;		// 描述
	
	public EamAaStrategy() {
		super();
	}

	public EamAaStrategy(String id){
		super(id);
	}

	@Length(min=1, max=255, message="决策点名称长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="决策点中文名长度必须介于 0 和 255 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=2047, message="决策过程长度必须介于 0 和 2047 之间")
	public String getStrategyProcess() {
		return strategyProcess;
	}

	public void setStrategyProcess(String strategyProcess) {
		this.strategyProcess = strategyProcess;
	}
	
	@Length(min=0, max=2047, message="结论长度必须介于 0 和 2047 之间")
	public String getConclusion() {
		return conclusion;
	}

	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}
	
	@Length(min=0, max=2047, message="描述长度必须介于 0 和 2047 之间")
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
}