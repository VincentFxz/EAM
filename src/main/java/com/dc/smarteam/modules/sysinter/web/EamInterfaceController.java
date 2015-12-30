/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysinter.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.dc.smarteam.modules.sysinter.entity.EamInterface;
import com.dc.smarteam.modules.sysinter.service.EamInterfaceService;

/**
 * 接口清单Controller
 * @author zhanghaor
 * @version 2015-12-29
 */
@Controller
@RequestMapping(value = "${adminPath}/sysinter/eamInterface")
public class EamInterfaceController extends BaseController {

	@Autowired
	private EamInterfaceService eamInterfaceService;
	
	@ModelAttribute
	public EamInterface get(@RequestParam(required=false) String id) {
		EamInterface entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamInterfaceService.get(id);
		}
		if (entity == null){
			entity = new EamInterface();
		}
		return entity;
	}
	
	@RequiresPermissions("sysinter:eamInterface:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamInterface eamInterface, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamInterface> page = eamInterfaceService.findPage(new Page<EamInterface>(request, response), eamInterface); 
		model.addAttribute("page", page);
		return "modules/sysinter/eamInterfaceList";
	}

	@RequiresPermissions("sysinter:eamInterface:view")
	@RequestMapping(value = "form")
	public String form(EamInterface eamInterface, Model model) {
		model.addAttribute("eamInterface", eamInterface);
		return "modules/sysinter/eamInterfaceForm";
	}

	@RequiresPermissions("sysinter:eamInterface:edit")
	@RequestMapping(value = "save")
	public String save(EamInterface eamInterface, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamInterface)){
			return form(eamInterface, model);
		}
		eamInterfaceService.save(eamInterface);
		addMessage(redirectAttributes, "保存接口清单管理成功");
		return "redirect:"+Global.getAdminPath()+"/sysinter/eamInterface/?repage";
	}
	
	@RequiresPermissions("sysinter:eamInterface:edit")
	@RequestMapping(value = "delete")
	public String delete(EamInterface eamInterface, RedirectAttributes redirectAttributes) {
		eamInterfaceService.delete(eamInterface);
		addMessage(redirectAttributes, "删除接口清单管理成功");
		return "redirect:"+Global.getAdminPath()+"/sysinter/eamInterface/?repage";
	}

}