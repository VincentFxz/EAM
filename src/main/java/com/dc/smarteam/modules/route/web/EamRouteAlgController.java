/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.route.web;

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
import com.dc.smarteam.modules.route.entity.EamRouteAlg;
import com.dc.smarteam.modules.route.service.EamRouteAlgService;

/**
 * 交易路由Controller
 * @author kern
 * @version 2015-12-24
 */
@Controller
@RequestMapping(value = "${adminPath}/route/eamRouteAlg")
public class EamRouteAlgController extends BaseController {

	@Autowired
	private EamRouteAlgService eamRouteAlgService;
	
	@ModelAttribute
	public EamRouteAlg get(@RequestParam(required=false) String id) {
		EamRouteAlg entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamRouteAlgService.get(id);
		}
		if (entity == null){
			entity = new EamRouteAlg();
		}
		return entity;
	}
	
	@RequiresPermissions("route:eamRouteAlg:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamRouteAlg eamRouteAlg, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamRouteAlg> page = eamRouteAlgService.findPage(new Page<EamRouteAlg>(request, response), eamRouteAlg); 
		model.addAttribute("page", page);
		return "modules/route/eamRouteAlgList";
	}

	@RequiresPermissions("route:eamRouteAlg:view")
	@RequestMapping(value = "form")
	public String form(EamRouteAlg eamRouteAlg, Model model) {
		model.addAttribute("eamRouteAlg", eamRouteAlg);
		return "modules/route/eamRouteAlgForm";
	}

	@RequiresPermissions("route:eamRouteAlg:edit")
	@RequestMapping(value = "save")
	public String save(EamRouteAlg eamRouteAlg, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamRouteAlg)){
			return form(eamRouteAlg, model);
		}
		eamRouteAlgService.save(eamRouteAlg);
		addMessage(redirectAttributes, "保存交易路由成功");
		return "redirect:"+Global.getAdminPath()+"/route/eamRouteAlg/?repage";
	}
	
	@RequiresPermissions("route:eamRouteAlg:edit")
	@RequestMapping(value = "delete")
	public String delete(EamRouteAlg eamRouteAlg, RedirectAttributes redirectAttributes) {
		eamRouteAlgService.delete(eamRouteAlg);
		addMessage(redirectAttributes, "删除交易路由成功");
		return "redirect:"+Global.getAdminPath()+"/route/eamRouteAlg/?repage";
	}

}