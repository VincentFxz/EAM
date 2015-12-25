/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.flow.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 流控算法管理模块Entity
 * @author kern
 * @version 2015-12-24
 */
public class EamFlowCtlAlg extends DataEntity<EamFlowCtlAlg> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 流控名称
	private String chineseName;		// 中文名称
	private String delFlg;		// 删除标记
	
	public EamFlowCtlAlg() {
		super();
	}

	public EamFlowCtlAlg(String id){
		super(id);
	}

	@Length(min=1, max=255, message="流控名称长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="中文名称长度必须介于 0 和 255 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=1, message="删除标记长度必须介于 0 和 1 之间")
	public String getDelFlg() {
		return delFlg;
	}

	public void setDelFlg(String delFlg) {
		this.delFlg = delFlg;
	}
	
}