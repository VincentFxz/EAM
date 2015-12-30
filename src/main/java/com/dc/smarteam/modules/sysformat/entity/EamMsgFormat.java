/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysformat.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 报文格式Entity
 * @author zhanghaor
 * @version 2015-12-29
 */
public class EamMsgFormat extends DataEntity<EamMsgFormat> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 报文格式名称
	private String chineseName;		// 报文格式中文名
	private String format;		// 报文格式
	private String msgHead;		// 报文头
	private String msgBody;		// 报文体
	private String maxLength;		// 最大长度
	
	public EamMsgFormat() {
		super();
	}

	public EamMsgFormat(String id){
		super(id);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="报文格式中文名长度必须介于 0 和 255 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=40, message="报文格式长度必须介于 0 和 40 之间")
	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}
	
	@Length(min=0, max=255, message="报文头长度必须介于 0 和 255 之间")
	public String getMsgHead() {
		return msgHead;
	}

	public void setMsgHead(String msgHead) {
		this.msgHead = msgHead;
	}
	
	@Length(min=0, max=255, message="报文体长度必须介于 0 和 255 之间")
	public String getMsgBody() {
		return msgBody;
	}

	public void setMsgBody(String msgBody) {
		this.msgBody = msgBody;
	}
	
	@Length(min=0, max=10, message="最大长度长度必须介于 0 和 10 之间")
	public String getMaxLength() {
		return maxLength;
	}

	public void setMaxLength(String maxLength) {
		this.maxLength = maxLength;
	}
	
}