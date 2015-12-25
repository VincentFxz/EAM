/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.layer.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 架构层次管理Entity
 * @author kern
 * @version 2015-12-24
 */
public class EamAaLayer extends DataEntity<EamAaLayer> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 架构层次名称
	private String chineseName;		// 架构层次简称
	private String delFlg;		// 删除标记
	
	public EamAaLayer() {
		super();
	}

	public EamAaLayer(String id){
		super(id);
	}

	@Length(min=1, max=255, message="架构层次名称长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="架构层次简称长度必须介于 0 和 255 之间")
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