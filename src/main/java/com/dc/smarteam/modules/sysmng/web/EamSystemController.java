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
import com.dc.smarteam.modules.sysmng.entity.EamSystem;
import com.dc.smarteam.modules.sysmng.service.EamSystemService;

import java.util.List;

/**
 * 应用系统管理Controller
 * @author zhanghaor
 * @version 2016-01-20
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

		List<EamSystem> lst = page.getList();
		for(int i=0;i<lst.size();i++){
			lst.get(i).setEamSysgroup(eamSysgroupService.get(lst.get(i).getEamSysgroupId()));
			lst.get(i).setEamAaLayer(eamAaLayerService.get(lst.get(i).getEamAaLayerId()));
		}
		page.setList(lst);
		model.addAttribute("page", page);
		model.addAttribute("eamSysgroupIdList",eamSysgroupService.findList(new EamSysgroup()));
		model.addAttribute("eamAaLayerIdList",eamAaLayerService.findList(new EamAaLayer()));
		return "modules/sysmng/eamSystemList";
	}

	@RequiresPermissions("sysmng:eamSystem:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	@RequestParam(value = "eamBank", required = false) String eamBank,
	@RequestParam(value = "eamSysgroupId", required = false) String eamSysgroupId,
	@RequestParam(value = "eamAaLayerId", required = false) String eamAaLayerId,
	@RequestParam(value = "eamOrgLayer", required = false) String eamOrgLayer,
	@RequestParam(value = "eamBuildType", required = false) String eamBuildType,
	@RequestParam(value = "eamBuildState", required = false) String eamBuildState,
	@RequestParam(value = "eamTrend", required = false) String eamTrend,
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamSystem eamSystem = new EamSystem();
        eamSystem.setEamBank(eamBank);
        eamSystem.setEamSysgroupId(eamSysgroupId);
        eamSystem.setEamAaLayerId(eamAaLayerId);
        eamSystem.setEamOrgLayer(eamOrgLayer);
        eamSystem.setEamBuildType(eamBuildType);
        eamSystem.setEamBuildState(eamBuildState);
        eamSystem.setEamTrend(eamTrend);
		Page<EamSystem> page = eamSystemService.findPage(new Page<EamSystem>(request, response), eamSystem);
		model.addAttribute("page", page);
		model.addAttribute("eamSysgroupIdList", eamSysgroupService.findList(new EamSysgroup()));
		model.addAttribute("eamAaLayerIdList",eamAaLayerService.findList(new EamAaLayer()));
		return "modules/sysmng/eamSystemList";
	}

	@RequiresPermissions("sysmng:eamSystem:view")
	@RequestMapping(value = "form")
	public String form(EamSystem eamSystem, Model model) {
		model.addAttribute("eamSystem", eamSystem);
		model.addAttribute("eamSysgroupIdList",eamSysgroupService.findList(new EamSysgroup()));
		model.addAttribute("eamAaLayerIdList",eamAaLayerService.findList(new EamAaLayer()));
		return "modules/sysmng/eamSystemForm";
	}

	@RequiresPermissions("sysmng:eamSystem:edit")
	@RequestMapping(value = "save")
	public String save(EamSystem eamSystem, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamSystem)){
			return form(eamSystem, model);
		}
		eamSystemService.save(eamSystem);
		addMessage(redirectAttributes, "保存应用系统成功");
		return "redirect:"+Global.getAdminPath()+"/sysmng/eamSystem/?repage";
	}
	
	@RequiresPermissions("sysmng:eamSystem:edit")
	@RequestMapping(value = "delete")
	public String delete(EamSystem eamSystem, RedirectAttributes redirectAttributes) {
		eamSystemService.delete(eamSystem);
		addMessage(redirectAttributes, "删除应用系统成功");
		return "redirect:"+Global.getAdminPath()+"/sysmng/eamSystem/?repage";
	}

}