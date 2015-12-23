/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.strategy.web;

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
import com.dc.smarteam.modules.strategy.entity.EamAaStrategy;
import com.dc.smarteam.modules.strategy.service.EamAaStrategyService;

/**
 * 决策点管理Controller
 * @author zhanghaor
 * @version 2015-12-23
 */
@Controller
@RequestMapping(value = "${adminPath}/strategy/eamAaStrategy")
public class EamAaStrategyController extends BaseController {

	@Autowired
	private EamAaStrategyService eamAaStrategyService;
	
	@ModelAttribute
	public EamAaStrategy get(@RequestParam(required=false) String id) {
		EamAaStrategy entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamAaStrategyService.get(id);
		}
		if (entity == null){
			entity = new EamAaStrategy();
		}
		return entity;
	}
	
	@RequiresPermissions("strategy:eamAaStrategy:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamAaStrategy eamAaStrategy, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamAaStrategy> page = eamAaStrategyService.findPage(new Page<EamAaStrategy>(request, response), eamAaStrategy); 
		model.addAttribute("page", page);
		return "modules/strategy/eamAaStrategyList";
	}

	@RequiresPermissions("strategy:eamAaStrategy:view")
	@RequestMapping(value = "form")
	public String form(EamAaStrategy eamAaStrategy, Model model) {
		model.addAttribute("eamAaStrategy", eamAaStrategy);
		return "modules/strategy/eamAaStrategyForm";
	}

	@RequiresPermissions("strategy:eamAaStrategy:edit")
	@RequestMapping(value = "save")
	public String save(EamAaStrategy eamAaStrategy, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamAaStrategy)){
			return form(eamAaStrategy, model);
		}
		eamAaStrategyService.save(eamAaStrategy);
		addMessage(redirectAttributes, "保存决策点成功");
		return "redirect:"+Global.getAdminPath()+"/strategy/eamAaStrategy/?repage";
	}
	
	@RequiresPermissions("strategy:eamAaStrategy:edit")
	@RequestMapping(value = "delete")
	public String delete(EamAaStrategy eamAaStrategy, RedirectAttributes redirectAttributes) {
		eamAaStrategyService.delete(eamAaStrategy);
		addMessage(redirectAttributes, "删除决策点成功");
		return "redirect:"+Global.getAdminPath()+"/strategy/eamAaStrategy/?repage";
	}

}