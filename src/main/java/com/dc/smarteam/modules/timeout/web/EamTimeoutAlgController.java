/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.timeout.web;

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
import com.dc.smarteam.modules.timeout.entity.EamTimeoutAlg;
import com.dc.smarteam.modules.timeout.service.EamTimeoutAlgService;

/**
 * 超时时间管理Controller
 * @author kern
 * @version 2015-12-24
 */
@Controller
@RequestMapping(value = "${adminPath}/timeout/eamTimeoutAlg")
public class EamTimeoutAlgController extends BaseController {

	@Autowired
	private EamTimeoutAlgService eamTimeoutAlgService;
	
	@ModelAttribute
	public EamTimeoutAlg get(@RequestParam(required=false) String id) {
		EamTimeoutAlg entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamTimeoutAlgService.get(id);
		}
		if (entity == null){
			entity = new EamTimeoutAlg();
		}
		return entity;
	}
	
	@RequiresPermissions("timeout:eamTimeoutAlg:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamTimeoutAlg eamTimeoutAlg, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamTimeoutAlg> page = eamTimeoutAlgService.findPage(new Page<EamTimeoutAlg>(request, response), eamTimeoutAlg); 
		model.addAttribute("page", page);
		return "modules/timeout/eamTimeoutAlgList";
	}

	@RequiresPermissions("timeout:eamTimeoutAlg:view")
	@RequestMapping(value = "form")
	public String form(EamTimeoutAlg eamTimeoutAlg, Model model) {
		model.addAttribute("eamTimeoutAlg", eamTimeoutAlg);
		return "modules/timeout/eamTimeoutAlgForm";
	}

	@RequiresPermissions("timeout:eamTimeoutAlg:edit")
	@RequestMapping(value = "save")
	public String save(EamTimeoutAlg eamTimeoutAlg, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamTimeoutAlg)){
			return form(eamTimeoutAlg, model);
		}
		eamTimeoutAlgService.save(eamTimeoutAlg);
		addMessage(redirectAttributes, "保存超时时间管理成功");
		return "redirect:"+Global.getAdminPath()+"/timeout/eamTimeoutAlg/?repage";
	}
	
	@RequiresPermissions("timeout:eamTimeoutAlg:edit")
	@RequestMapping(value = "delete")
	public String delete(EamTimeoutAlg eamTimeoutAlg, RedirectAttributes redirectAttributes) {
		eamTimeoutAlgService.delete(eamTimeoutAlg);
		addMessage(redirectAttributes, "删除超时时间管理成功");
		return "redirect:"+Global.getAdminPath()+"/timeout/eamTimeoutAlg/?repage";
	}

}