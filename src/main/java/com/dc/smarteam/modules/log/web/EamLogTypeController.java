/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.log.web;

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
import com.dc.smarteam.modules.log.entity.EamLogType;
import com.dc.smarteam.modules.log.service.EamLogTypeService;

/**
 * 日志管理Controller
 * @author zhanghaor
 * @version 2016-01-22
 */
@Controller
@RequestMapping(value = "${adminPath}/log/eamLogType")
public class EamLogTypeController extends BaseController {

	@Autowired
	private EamLogTypeService eamLogTypeService;
	
	@ModelAttribute
	public EamLogType get(@RequestParam(required=false) String id) {
		EamLogType entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamLogTypeService.get(id);
		}
		if (entity == null){
			entity = new EamLogType();
		}
		return entity;
	}
	
	@RequiresPermissions("log:eamLogType:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamLogType eamLogType, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamLogType> page = eamLogTypeService.findPage(new Page<EamLogType>(request, response), eamLogType); 
		model.addAttribute("page", page);
		return "modules/log/eamLogTypeList";
	}

	@RequiresPermissions("log:eamLogType:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamLogType eamLogType = new EamLogType();
		Page<EamLogType> page = eamLogTypeService.findPage(new Page<EamLogType>(request, response), eamLogType);
		model.addAttribute("page", page);
		return "modules/log/eamLogTypeList";
	}

	@RequiresPermissions("log:eamLogType:view")
	@RequestMapping(value = "form")
	public String form(EamLogType eamLogType, Model model) {
		model.addAttribute("eamLogType", eamLogType);
		return "modules/log/eamLogTypeForm";
	}

	@RequiresPermissions("log:eamLogType:edit")
	@RequestMapping(value = "save")
	public String save(EamLogType eamLogType, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamLogType)){
			return form(eamLogType, model);
		}
		eamLogTypeService.save(eamLogType);
		addMessage(redirectAttributes, "保存日志成功");
		return "redirect:"+Global.getAdminPath()+"/log/eamLogType/?repage";
	}
	
	@RequiresPermissions("log:eamLogType:edit")
	@RequestMapping(value = "delete")
	public String delete(EamLogType eamLogType, RedirectAttributes redirectAttributes) {
		eamLogTypeService.delete(eamLogType);
		addMessage(redirectAttributes, "删除日志成功");
		return "redirect:"+Global.getAdminPath()+"/log/eamLogType/?repage";
	}

}