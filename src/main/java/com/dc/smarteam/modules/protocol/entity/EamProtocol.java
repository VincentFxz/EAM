/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.protocol.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 协议管理Entity
 * @author zhanghaor
 * @version 2016-01-25
 */
public class EamProtocol extends DataEntity<EamProtocol> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 协议名称
	private String chineseName;		// 中文名称
	private String address;		// 访问地址
	private String linkType;		// 链接类型
	private String maxpackage;		// 最大包长度
	private String delFlg;		// 删除标记（0：正常；1：删除）
	
	public EamProtocol() {
		super();
	}

	public EamProtocol(String id){
		super(id);
	}

	@Length(min=1, max=255, message="协议名称长度必须介于 1 和 255 之间")
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
	
	@Length(min=0, max=40, message="访问地址长度必须介于 0 和 40 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=40, message="链接类型长度必须介于 0 和 40 之间")
	public String getLinkType() {
		return linkType;
	}

	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}
	
	@Length(min=0, max=40, message="最大包长度长度必须介于 0 和 40 之间")
	public String getMaxpackage() {
		return maxpackage;
	}

	public void setMaxpackage(String maxpackage) {
		this.maxpackage = maxpackage;
	}
	
	@Length(min=0, max=1, message="删除标记（0：正常；1：删除）长度必须介于 0 和 1 之间")
	public String getDelFlg() {
		return delFlg;
	}

	public void setDelFlg(String delFlg) {
		this.delFlg = delFlg;
	}
	
}