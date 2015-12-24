/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysmdl.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.sysmng.entity.EamSystem;
import com.dc.smarteam.modules.sysmng.service.EamSystemService;
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
import com.dc.smarteam.modules.sysmdl.entity.EamSystemModule;
import com.dc.smarteam.modules.sysmdl.service.EamSystemModuleService;

/**
 * 系统模块管理Controller
 * @author yangqjb
 * @version 2015-12-23
 */
@Controller
@RequestMapping(value = "${adminPath}/sysmdl/eamSystemModule")
public class EamSystemModuleController extends BaseController {

	@Autowired
	private EamSystemModuleService eamSystemModuleService;
    @Autowired
    private EamSystemService eamSystemService;
	@ModelAttribute
	public EamSystemModule get(@RequestParam(required=false) String id) {
		EamSystemModule entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamSystemModuleService.get(id);
		}
		if (entity == null){
			entity = new EamSystemModule();
		}
		return entity;
	}
	
	@RequiresPermissions("sysmdl:eamSystemModule:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamSystemModule eamSystemModule, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamSystemModule> page = eamSystemModuleService.findPage(new Page<EamSystemModule>(request, response), eamSystemModule); 
		model.addAttribute("page", page);
        model.addAttribute("sysList",eamSystemService.findList(new EamSystem()));
		return "modules/sysmdl/eamSystemModuleList";
	}

	@RequiresPermissions("sysmdl:eamSystemModule:view")
	@RequestMapping(value = "form")
	public String form(EamSystemModule eamSystemModule, Model model) {
		model.addAttribute("eamSystemModule", eamSystemModule);
        model.addAttribute("sysList",eamSystemService.findList(new EamSystem()));
		return "modules/sysmdl/eamSystemModuleForm";
	}

	@RequiresPermissions("sysmdl:eamSystemModule:edit")
	@RequestMapping(value = "save")
	public String save(EamSystemModule eamSystemModule, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamSystemModule)){
			return form(eamSystemModule, model);
		}
		eamSystemModuleService.save(eamSystemModule);
		addMessage(redirectAttributes, "保存模块成功");
		return "redirect:"+Global.getAdminPath()+"/sysmdl/eamSystemModule/?repage";
	}
	
	@RequiresPermissions("sysmdl:eamSystemModule:edit")
	@RequestMapping(value = "delete")
	public String delete(EamSystemModule eamSystemModule, RedirectAttributes redirectAttributes) {
		eamSystemModuleService.delete(eamSystemModule);
		addMessage(redirectAttributes, "删除模块成功");
		return "redirect:"+Global.getAdminPath()+"/sysmdl/eamSystemModule/?repage";
	}

}