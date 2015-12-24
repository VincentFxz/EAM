/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysmng.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.syslyr.entity.EamAaLayer;
import com.dc.smarteam.modules.syslyr.service.EamAaLayerService;
import com.dc.smarteam.modules.syssgrp.entity.EamSysgroup;
import com.dc.smarteam.modules.syssgrp.service.EamSysgroupService;
import com.dc.smarteam.modules.sysstr.service.EamAaStrategyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dc.smarteam.common.config.Global;
import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.web.BaseController;
import com.dc.smarteam.common.utils.StringUtils;
import com.dc.smarteam.modules.sysmng.entity.EamSystem;
import com.dc.smarteam.modules.sysmng.service.EamSystemService;

/**
 * 系统管理Controller
 * @author yangqjb
 * @version 2015-12-24
 */
@Controller
@RequestMapping(value = "${adminPath}/sysmng/eamSystem")
public class EamSystemController extends BaseController {

	@Autowired
	private EamSystemService eamSystemService;
	@Autowired
	private EamSysgroupService eamSysgroupService;
	@Autowired
	private EamAaLayerService eamAaLayerService;

	@ModelAttribute
	public EamSystem get(@RequestParam(required=false) String id) {
		EamSystem entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamSystemService.get(id);
		}
		if (entity == null){
			entity = new EamSystem();
		}
		return entity;
	}
	
	@RequiresPermissions("sysmng:eamSystem:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamSystem eamSystem, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamSystem> page = eamSystemService.findPage(new Page<EamSystem>(request, response), eamSystem); 
		model.addAttribute("page", page);

        model.addAttribute("sysGroupList",eamSysgroupService.findList(new EamSysgroup()));
        model.addAttribute("sysAaLayerList",eamAaLayerService.findList(new EamAaLayer()));
        //机构层次？
//        model.addAttribute("sysOrgLayerList",eamSysgroupService.findList(new EamSysgroup()));
		return "modules/sysmng/eamSystemList";
	}

	@RequiresPermissions("sysmng:eamSystem:view")
	@RequestMapping(value = "form")
	public String form(EamSystem eamSystem, Model model) {
		model.addAttribute("eamSystem", eamSystem);

        model.addAttribute("sysGroupList",eamSysgroupService.findList(new EamSysgroup()));
        model.addAttribute("sysAaLayerList",eamAaLayerService.findList(new EamAaLayer()));
		return "modules/sysmng/eamSystemForm";
	}

	@RequiresPermissions("sysmng:eamSystem:edit")
	@RequestMapping(value = "save")
	public String save(EamSystem eamSystem, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamSystem)){
			return form(eamSystem, model);
		}
		eamSystemService.save(eamSystem);
		addMessage(redirectAttributes, "保存系统成功");
		return "redirect:"+Global.getAdminPath()+"/sysmng/eamSystem/?repage";
	}
	
	@RequiresPermissions("sysmng:eamSystem:edit")
	@RequestMapping(value = "delete")
	public String delete(EamSystem eamSystem, RedirectAttributes redirectAttributes) {
		eamSystemService.delete(eamSystem);
		addMessage(redirectAttributes, "删除系统成功");
		return "redirect:"+Global.getAdminPath()+"/sysmng/eamSystem/?repage";
	}

}