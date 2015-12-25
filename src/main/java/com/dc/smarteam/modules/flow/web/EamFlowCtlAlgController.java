/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.flow.web;

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
import com.dc.smarteam.modules.flow.entity.EamFlowCtlAlg;
import com.dc.smarteam.modules.flow.service.EamFlowCtlAlgService;

/**
 * 流控算法管理模块Controller
 * @author kern
 * @version 2015-12-24
 */
@Controller
@RequestMapping(value = "${adminPath}/flow/eamFlowCtlAlg")
public class EamFlowCtlAlgController extends BaseController {

	@Autowired
	private EamFlowCtlAlgService eamFlowCtlAlgService;
	
	@ModelAttribute
	public EamFlowCtlAlg get(@RequestParam(required=false) String id) {
		EamFlowCtlAlg entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamFlowCtlAlgService.get(id);
		}
		if (entity == null){
			entity = new EamFlowCtlAlg();
		}
		return entity;
	}
	
	@RequiresPermissions("flow:eamFlowCtlAlg:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamFlowCtlAlg eamFlowCtlAlg, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamFlowCtlAlg> page = eamFlowCtlAlgService.findPage(new Page<EamFlowCtlAlg>(request, response), eamFlowCtlAlg); 
		model.addAttribute("page", page);
		return "modules/flow/eamFlowCtlAlgList";
	}

	@RequiresPermissions("flow:eamFlowCtlAlg:view")
	@RequestMapping(value = "form")
	public String form(EamFlowCtlAlg eamFlowCtlAlg, Model model) {
		model.addAttribute("eamFlowCtlAlg", eamFlowCtlAlg);
		return "modules/flow/eamFlowCtlAlgForm";
	}

	@RequiresPermissions("flow:eamFlowCtlAlg:edit")
	@RequestMapping(value = "save")
	public String save(EamFlowCtlAlg eamFlowCtlAlg, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamFlowCtlAlg)){
			return form(eamFlowCtlAlg, model);
		}
		eamFlowCtlAlgService.save(eamFlowCtlAlg);
		addMessage(redirectAttributes, "保存流控算法管理模块成功");
		return "redirect:"+Global.getAdminPath()+"/flow/eamFlowCtlAlg/?repage";
	}
	
	@RequiresPermissions("flow:eamFlowCtlAlg:edit")
	@RequestMapping(value = "delete")
	public String delete(EamFlowCtlAlg eamFlowCtlAlg, RedirectAttributes redirectAttributes) {
		eamFlowCtlAlgService.delete(eamFlowCtlAlg);
		addMessage(redirectAttributes, "删除流控算法管理模块成功");
		return "redirect:"+Global.getAdminPath()+"/flow/eamFlowCtlAlg/?repage";
	}

}