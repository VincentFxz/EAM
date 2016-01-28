/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysstr.web;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dc.smarteam.common.config.Global;
import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.web.BaseController;
import com.dc.smarteam.common.utils.StringUtils;
import com.dc.smarteam.modules.sysstr.entity.EamAaStrategy;
import com.dc.smarteam.modules.sysstr.service.EamAaStrategyService;

import java.util.List;

/**
 * 系统决策管理Controller
 * @author zhanghaor
 * @version 2016-01-21
 */
@Controller
@RequestMapping(value = "${adminPath}/sysstr/eamAaStrategy")
public class EamAaStrategyController extends BaseController {

	@Autowired
	private EamAaStrategyService eamAaStrategyService;

	@Autowired
	private EamSystemService eamSystemService;
	
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
	
	@RequiresPermissions("sysstr:eamAaStrategy:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamAaStrategy eamAaStrategy, HttpServletRequest request, HttpServletResponse response, Model model) {

		Page<EamAaStrategy> page = eamAaStrategyService.findPage(new Page<EamAaStrategy>(request, response), eamAaStrategy);
		List<EamAaStrategy> lst = page.getList();
		for(int i=0;i<lst.size();i++){
			lst.get(i).setEamSystem(eamSystemService.get(lst.get(i).getEamSystemId()));
		}
		page.setList(lst);

		model.addAttribute("page", page);
		model.addAttribute("eamSystemIdList", eamSystemService.findList(new EamSystem()));
		return "modules/sysstr/eamAaStrategyList";
	}

	@RequiresPermissions("sysstr:eamAaStrategy:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	@RequestParam(value = "eamSystemId", required = false) String eamSystemId,
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamAaStrategy eamAaStrategy = new EamAaStrategy();
        eamAaStrategy.setEamSystemId(eamSystemId);
		Page<EamAaStrategy> page = eamAaStrategyService.findPage(new Page<EamAaStrategy>(request, response), eamAaStrategy);
		model.addAttribute("page", page);
		model.addAttribute("eamSystemIdList", eamSystemService.findList(new EamSystem()));
		return "modules/sysstr/eamAaStrategyList";
	}

	@RequiresPermissions("sysstr:eamAaStrategy:view")
	@RequestMapping(value = "form")
	public String form(EamAaStrategy eamAaStrategy, Model model) {
		model.addAttribute("eamAaStrategy", eamAaStrategy);
		model.addAttribute("eamSystemIdList", eamSystemService.findList(new EamSystem()));
		return "modules/sysstr/eamAaStrategyForm";
	}

	@RequiresPermissions("sysstr:eamAaStrategy:edit")
	@RequestMapping(value = "save")
	public String save(EamAaStrategy eamAaStrategy, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamAaStrategy)){
			return form(eamAaStrategy, model);
		}
		eamAaStrategyService.save(eamAaStrategy);
		addMessage(redirectAttributes, "保存系统决策成功");
		return "redirect:"+Global.getAdminPath()+"/sysstr/eamAaStrategy/?repage";
	}
	
	@RequiresPermissions("sysstr:eamAaStrategy:edit")
	@RequestMapping(value = "delete")
	public String delete(EamAaStrategy eamAaStrategy, RedirectAttributes redirectAttributes) {
		eamAaStrategyService.delete(eamAaStrategy);
		addMessage(redirectAttributes, "删除系统决策成功");
		return "redirect:"+Global.getAdminPath()+"/sysstr/eamAaStrategy/?repage";
	}

}