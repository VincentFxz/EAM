/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.log.entity;

import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 流水日志Entity
 * @author kern
 * @version 2015-12-24
 */
public class EamLogType extends DataEntity<EamLogType> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 日志名称
	private String chineseName;		// 日志简称
	private String logRange;		// 日志级别
	private String logCleanType;		// 日志清理规则
	private String delFlg;		// 删除标记
	
	public EamLogType() {
		super();
	}

	public EamLogType(String id){
		super(id);
	}

	@Length(min=0, max=255, message="日志名称长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="日志简称长度必须介于 0 和 255 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=255, message="日志级别长度必须介于 0 和 255 之间")
	public String getLogRange() {
		return logRange;
	}

	public void setLogRange(String logRange) {
		this.logRange = logRange;
	}
	
	@Length(min=0, max=255, message="日志清理规则长度必须介于 0 和 255 之间")
	public String getLogCleanType() {
		return logCleanType;
	}

	public void setLogCleanType(String logCleanType) {
		this.logCleanType = logCleanType;
	}
	
	@Length(min=0, max=1, message="删除标记长度必须介于 0 和 1 之间")
	public String getDelFlg() {
		return delFlg;
	}

	public void setDelFlg(String delFlg) {
		this.delFlg = delFlg;
	}
	
}