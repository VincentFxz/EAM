/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syssgrp.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dc.smarteam.common.config.Global;
import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.web.BaseController;
import com.dc.smarteam.common.utils.StringUtils;
import com.dc.smarteam.modules.syssgrp.entity.EamSysgroup;
import com.dc.smarteam.modules.syssgrp.service.EamSysgroupService;

/**
 * 系统群组管理Controller
 * @author zhanghaor
 * @version 2016-01-21
 */
@Controller
@RequestMapping(value = "${adminPath}/syssgrp/eamSysgroup")
public class EamSysgroupController extends BaseController {

	@Autowired
	private EamSysgroupService eamSysgroupService;
	
	@ModelAttribute
	public EamSysgroup get(@RequestParam(required=false) String id) {
		EamSysgroup entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamSysgroupService.get(id);
		}
		if (entity == null){
			entity = new EamSysgroup();
		}
		return entity;
	}
	
	@RequiresPermissions("syssgrp:eamSysgroup:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamSysgroup eamSysgroup, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamSysgroup> page = eamSysgroupService.findPage(new Page<EamSysgroup>(request, response), eamSysgroup); 
		model.addAttribute("page", page);
		return "modules/syssgrp/eamSysgroupList";
	}

	@RequiresPermissions("syssgrp:eamSysgroup:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamSysgroup eamSysgroup = new EamSysgroup();
		Page<EamSysgroup> page = eamSysgroupService.findPage(new Page<EamSysgroup>(request, response), eamSysgroup);
		model.addAttribute("page", page);
		return "modules/syssgrp/eamSysgroupList";
	}

	@RequiresPermissions("syssgrp:eamSysgroup:view")
	@RequestMapping(value = "form")
	public String form(EamSysgroup eamSysgroup, Model model) {
		model.addAttribute("eamSysgroup", eamSysgroup);
		return "modules/syssgrp/eamSysgroupForm";
	}

	@RequiresPermissions("syssgrp:eamSysgroup:edit")
	@RequestMapping(value = "save")
	public String save(EamSysgroup eamSysgroup, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamSysgroup)){
			return form(eamSysgroup, model);
		}
		eamSysgroupService.save(eamSysgroup);
		addMessage(redirectAttributes, "保存系统群组成功");
		return "redirect:"+Global.getAdminPath()+"/syssgrp/eamSysgroup/?repage";
	}
	
	@RequiresPermissions("syssgrp:eamSysgroup:edit")
	@RequestMapping(value = "delete")
	public String delete(EamSysgroup eamSysgroup, RedirectAttributes redirectAttributes) {
		eamSysgroupService.delete(eamSysgroup);
		addMessage(redirectAttributes, "删除系统群组成功");
		return "redirect:"+Global.getAdminPath()+"/syssgrp/eamSysgroup/?repage";
	}

}