/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysinter.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 接口管理Entity
 * @author zhanghaor
 * @version 2016-01-22
 */
public class EamInterface extends DataEntity<EamInterface> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 接口名称
	private String chineseName;		// 接口中文名
	private String reqMsgFormat;		// 请求消息格式
	private String rspMsgFormat;		// 响应消息格式
	private Date startDate;		// 启用时间
	private String accountTrade;		// 是否账务交易
	
	public EamInterface() {
		super();
	}

	public EamInterface(String id){
		super(id);
	}

	@Length(min=1, max=255, message="接口名称长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="接口中文名长度必须介于 0 和 255 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=2047, message="请求消息格式长度必须介于 0 和 2047 之间")
	public String getReqMsgFormat() {
		return reqMsgFormat;
	}

	public void setReqMsgFormat(String reqMsgFormat) {
		this.reqMsgFormat = reqMsgFormat;
	}
	
	@Length(min=0, max=2047, message="响应消息格式长度必须介于 0 和 2047 之间")
	public String getRspMsgFormat() {
		return rspMsgFormat;
	}

	public void setRspMsgFormat(String rspMsgFormat) {
		this.rspMsgFormat = rspMsgFormat;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	@Length(min=0, max=10, message="是否账务交易长度必须介于 0 和 10 之间")
	public String getAccountTrade() {
		return accountTrade;
	}

	public void setAccountTrade(String accountTrade) {
		this.accountTrade = accountTrade;
	}
	
}