/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syslink.entity;

import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import org.hibernate.validator.constraints.Length;

import com.dc.smarteam.common.persistence.DataEntity;

/**
 * 系统关联关系Entity
 * @author yangqjb
 * @version 2015-12-28
 */
public class EamSyslink extends DataEntity<EamSyslink> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String chineseName;		// 中文名称
	private String linkType;		// 关联关系类型
	private String startLinknodeId;		// 起始节点
	private String endLinknodeId;		// 终止节点
	private String linkStatus;		// 关联关系状态

    public EamLinknode getStartLinknode() {
        return startLinknode;
    }

    public void setStartLinknode(EamLinknode startLinknode) {
        this.startLinknode = startLinknode;
    }

    private EamLinknode startLinknode;		// 起始节点

    public EamLinknode getEndLinknode() {
        return endLinknode;
    }

    public void setEndLinknode(EamLinknode endLinknode) {
        this.endLinknode = endLinknode;
    }

    private EamLinknode endLinknode;		// 终止节点
	
	public EamSyslink() {
		super();
	}

	public EamSyslink(String id){
		super(id);
	}

	@Length(min=0, max=250, message="名称长度必须介于 0 和 250 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=375, message="中文名称长度必须介于 0 和 375 之间")
	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	
	@Length(min=0, max=40, message="关联关系类型长度必须介于 0 和 40 之间")
	public String getLinkType() {
		return linkType;
	}

	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}
	
	@Length(min=0, max=40, message="起始节点长度必须介于 0 和 40 之间")
	public String getStartLinknodeId() {
		return startLinknodeId;
	}

	public void setStartLinknodeId(String startLinknodeId) {
		this.startLinknodeId = startLinknodeId;
	}
	
	@Length(min=0, max=40, message="终止节点长度必须介于 0 和 40 之间")
	public String getEndLinknodeId() {
		return endLinknodeId;
	}

	public void setEndLinknodeId(String endLinknodeId) {
		this.endLinknodeId = endLinknodeId;
	}
	
	@Length(min=0, max=40, message="关联关系状态长度必须介于 0 和 40 之间")
	public String getLinkStatus() {
		return linkStatus;
	}

	public void setLinkStatus(String linkStatus) {
		this.linkStatus = linkStatus;
	}
	
}