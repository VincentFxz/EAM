/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysstr.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
<<<<<<< HEAD:src/main/java/com/dc/smarteam/modules/sysstr/entity/EamAaStrategy.java
 * 应用系统决策管理Entity
 * @author yangqjb
=======
 * 决策点管理Entity
 * @author zhanghaor
>>>>>>> 5220b94db6a71e15f247e574d1634f41421384aa:src/main/java/com/dc/smarteam/modules/strategy/entity/EamAaStrategy.java
 * @version 2015-12-24
 */
public class EamAaStrategy extends DataEntity<EamAaStrategy> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 决策点名称
	private String chineseName;		// 决策点中文名
	private String strategyProcess;		// 决策过程
	private String conclusion;		// 结论
	
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
	
	@Length(min=0, max=375, message="决策点中文名长度必须介于 0 和 375 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=2000, message="决策过程长度必须介于 0 和 2000 之间")
	public String getStrategyProcess() {
		return strategyProcess;
	}

	public void setStrategyProcess(String strategyProcess) {
		this.strategyProcess = strategyProcess;
	}
	
	@Length(min=0, max=2000, message="结论长度必须介于 0 和 2000 之间")
	public String getConclusion() {
		return conclusion;
	}

	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}
	
}