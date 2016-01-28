/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syslyr.web;

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
import com.dc.smarteam.modules.syslyr.entity.EamAaLayer;
import com.dc.smarteam.modules.syslyr.service.EamAaLayerService;

/**
 * 架构层次管理Controller
 * @author zhanghaor
 * @version 2016-01-25
 */
@Controller
@RequestMapping(value = "${adminPath}/syslyr/eamAaLayer")
public class EamAaLayerController extends BaseController {

	@Autowired
	private EamAaLayerService eamAaLayerService;
	
	@ModelAttribute
	public EamAaLayer get(@RequestParam(required=false) String id) {
		EamAaLayer entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamAaLayerService.get(id);
		}
		if (entity == null){
			entity = new EamAaLayer();
		}
		return entity;
	}
	
	@RequiresPermissions("syslyr:eamAaLayer:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamAaLayer eamAaLayer, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamAaLayer> page = eamAaLayerService.findPage(new Page<EamAaLayer>(request, response), eamAaLayer); 
		model.addAttribute("page", page);
		return "modules/syslyr/eamAaLayerList";
	}

	@RequiresPermissions("syslyr:eamAaLayer:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamAaLayer eamAaLayer = new EamAaLayer();
		Page<EamAaLayer> page = eamAaLayerService.findPage(new Page<EamAaLayer>(request, response), eamAaLayer);
		model.addAttribute("page", page);
		return "modules/syslyr/eamAaLayerList";
	}

	@RequiresPermissions("syslyr:eamAaLayer:view")
	@RequestMapping(value = "form")
	public String form(EamAaLayer eamAaLayer, Model model) {
		model.addAttribute("eamAaLayer", eamAaLayer);
		return "modules/syslyr/eamAaLayerForm";
	}

	@RequiresPermissions("syslyr:eamAaLayer:edit")
	@RequestMapping(value = "save")
	public String save(EamAaLayer eamAaLayer, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamAaLayer)){
			return form(eamAaLayer, model);
		}
		eamAaLayerService.save(eamAaLayer);
		addMessage(redirectAttributes, "保存架构层次成功");
		return "redirect:"+Global.getAdminPath()+"/syslyr/eamAaLayer/?repage";
	}
	
	@RequiresPermissions("syslyr:eamAaLayer:edit")
	@RequestMapping(value = "delete")
	public String delete(EamAaLayer eamAaLayer, RedirectAttributes redirectAttributes) {
		eamAaLayerService.delete(eamAaLayer);
		addMessage(redirectAttributes, "删除架构层次成功");
		return "redirect:"+Global.getAdminPath()+"/syslyr/eamAaLayer/?repage";
	}

}