/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysproperty.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.sysproptype.entity.EamSyspropType;
import com.dc.smarteam.modules.sysproptype.service.EamSyspropTypeService;
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
import com.dc.smarteam.modules.sysproperty.entity.EamSysproperty;
import com.dc.smarteam.modules.sysproperty.service.EamSyspropertyService;

import java.util.List;

/**
 * 系统属性管理Controller
 * @author zhanghaor
 * @version 2016-01-21
 */
@Controller
@RequestMapping(value = "${adminPath}/sysproperty/eamSysproperty")
public class EamSyspropertyController extends BaseController {

	@Autowired
	private EamSyspropertyService eamSyspropertyService;
	@Autowired
	private EamSyspropTypeService eamSyspropTypeService;
	
	@ModelAttribute
	public EamSysproperty get(@RequestParam(required=false) String id) {
		EamSysproperty entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamSyspropertyService.get(id);
		}
		if (entity == null){
			entity = new EamSysproperty();
		}
		return entity;
	}
	
	@RequiresPermissions("sysproperty:eamSysproperty:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamSysproperty eamSysproperty, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamSysproperty> page = eamSyspropertyService.findPage(new Page<EamSysproperty>(request, response), eamSysproperty);

		List<EamSysproperty> lst = page.getList();
		for(int i=0;i<lst.size();i++){
			lst.get(i).setEamSyspropType(eamSyspropTypeService.get(lst.get(i).getEamSyspropTypeId()));
		}
		page.setList(lst);
		model.addAttribute("page", page);
		model.addAttribute("eamSyspropTypeIdList",eamSyspropTypeService.findList(new EamSyspropType()));
		return "modules/sysproperty/eamSyspropertyList";
	}

	@RequiresPermissions("sysproperty:eamSysproperty:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	@RequestParam(value = "eamSyspropTypeId", required = false) String eamSyspropTypeId,
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamSysproperty eamSysproperty = new EamSysproperty();
        eamSysproperty.setEamSyspropTypeId(eamSyspropTypeId);
		Page<EamSysproperty> page = eamSyspropertyService.findPage(new Page<EamSysproperty>(request, response), eamSysproperty);
		model.addAttribute("page", page);
		model.addAttribute("eamSyspropTypeIdList",eamSyspropTypeService.findList(new EamSyspropType()));
		return "modules/sysproperty/eamSyspropertyList";
	}

	@RequiresPermissions("sysproperty:eamSysproperty:view")
	@RequestMapping(value = "form")
	public String form(EamSysproperty eamSysproperty, Model model) {
		model.addAttribute("eamSysproperty", eamSysproperty);
		model.addAttribute("eamSyspropTypeIdList",eamSyspropTypeService.findList(new EamSyspropType()));
		return "modules/sysproperty/eamSyspropertyForm";
	}

	@RequiresPermissions("sysproperty:eamSysproperty:edit")
	@RequestMapping(value = "save")
	public String save(EamSysproperty eamSysproperty, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamSysproperty)){
			return form(eamSysproperty, model);
		}
		eamSyspropertyService.save(eamSysproperty);
		addMessage(redirectAttributes, "保存系统属性成功");
		return "redirect:"+Global.getAdminPath()+"/sysproperty/eamSysproperty/?repage";
	}
	
	@RequiresPermissions("sysproperty:eamSysproperty:edit")
	@RequestMapping(value = "delete")
	public String delete(EamSysproperty eamSysproperty, RedirectAttributes redirectAttributes) {
		eamSyspropertyService.delete(eamSysproperty);
		addMessage(redirectAttributes, "删除系统属性成功");
		return "redirect:"+Global.getAdminPath()+"/sysproperty/eamSysproperty/?repage";
	}

}