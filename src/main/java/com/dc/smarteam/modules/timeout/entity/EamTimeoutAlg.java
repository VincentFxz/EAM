/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.timeout.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 超时算法管理Entity
 * @author zhanghaor
 * @version 2016-01-22
 */
public class EamTimeoutAlg extends DataEntity<EamTimeoutAlg> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String chineseName;		// 中文名称
	private String delFlg;		// 删除标记
	
	public EamTimeoutAlg() {
		super();
	}

	public EamTimeoutAlg(String id){
		super(id);
	}

	@Length(min=1, max=255, message="名称长度必须介于 1 和 255 之间")
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
	
	@Length(min=1, max=1, message="删除标记长度必须介于 1 和 1 之间")
	public String getDelFlg() {
		return delFlg;
	}

	public void setDelFlg(String delFlg) {
		this.delFlg = delFlg;
	}
	
}