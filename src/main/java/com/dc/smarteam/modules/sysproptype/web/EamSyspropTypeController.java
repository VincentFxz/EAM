/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysproptype.web;

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
import com.dc.smarteam.modules.sysproptype.entity.EamSyspropType;
import com.dc.smarteam.modules.sysproptype.service.EamSyspropTypeService;

/**
 * 系统属性类别管理Controller
 * @author zhanghaor
 * @version 2016-01-21
 */
@Controller
@RequestMapping(value = "${adminPath}/sysproptype/eamSyspropType")
public class EamSyspropTypeController extends BaseController {

	@Autowired
	private EamSyspropTypeService eamSyspropTypeService;
	
	@ModelAttribute
	public EamSyspropType get(@RequestParam(required=false) String id) {
		EamSyspropType entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamSyspropTypeService.get(id);
		}
		if (entity == null){
			entity = new EamSyspropType();
		}
		return entity;
	}
	
	@RequiresPermissions("sysproptype:eamSyspropType:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamSyspropType eamSyspropType, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamSyspropType> page = eamSyspropTypeService.findPage(new Page<EamSyspropType>(request, response), eamSyspropType); 
		model.addAttribute("page", page);
		return "modules/sysproptype/eamSyspropTypeList";
	}

	@RequiresPermissions("sysproptype:eamSyspropType:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamSyspropType eamSyspropType = new EamSyspropType();
		Page<EamSyspropType> page = eamSyspropTypeService.findPage(new Page<EamSyspropType>(request, response), eamSyspropType);
		model.addAttribute("page", page);
		return "modules/sysproptype/eamSyspropTypeList";
	}

	@RequiresPermissions("sysproptype:eamSyspropType:view")
	@RequestMapping(value = "form")
	public String form(EamSyspropType eamSyspropType, Model model) {
		model.addAttribute("eamSyspropType", eamSyspropType);
		return "modules/sysproptype/eamSyspropTypeForm";
	}

	@RequiresPermissions("sysproptype:eamSyspropType:edit")
	@RequestMapping(value = "save")
	public String save(EamSyspropType eamSyspropType, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamSyspropType)){
			return form(eamSyspropType, model);
		}
		eamSyspropTypeService.save(eamSyspropType);
		addMessage(redirectAttributes, "保存系统属性类别成功");
		return "redirect:"+Global.getAdminPath()+"/sysproptype/eamSyspropType/?repage";
	}
	
	@RequiresPermissions("sysproptype:eamSyspropType:edit")
	@RequestMapping(value = "delete")
	public String delete(EamSyspropType eamSyspropType, RedirectAttributes redirectAttributes) {
		eamSyspropTypeService.delete(eamSyspropType);
		addMessage(redirectAttributes, "删除系统属性类别成功");
		return "redirect:"+Global.getAdminPath()+"/sysproptype/eamSyspropType/?repage";
	}

}