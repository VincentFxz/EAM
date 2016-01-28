/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syspropertyre.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.sysmng.entity.EamSystem;
import com.dc.smarteam.modules.sysmng.service.EamSystemService;
import com.dc.smarteam.modules.sysproperty.entity.EamSysproperty;
import com.dc.smarteam.modules.sysproperty.service.EamSyspropertyService;
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
import com.dc.smarteam.modules.syspropertyre.entity.EamSystemSyspropertyRe;
import com.dc.smarteam.modules.syspropertyre.service.EamSystemSyspropertyReService;

import java.util.List;

/**
 * 系统属性关系管理Controller
 * @author zhanghaor
 * @version 2016-01-25
 */
@Controller
@RequestMapping(value = "${adminPath}/syspropertyre/eamSystemSyspropertyRe")
public class EamSystemSyspropertyReController extends BaseController {

	@Autowired
	private EamSystemSyspropertyReService eamSystemSyspropertyReService;
	@Autowired
	private EamSystemService eamSystemService;
	@Autowired
	private EamSyspropertyService eamSyspropertyService;

	@ModelAttribute
	public EamSystemSyspropertyRe get(@RequestParam(required=false) String id) {
		EamSystemSyspropertyRe entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamSystemSyspropertyReService.get(id);
		}
		if (entity == null){
			entity = new EamSystemSyspropertyRe();
		}
		return entity;
	}
	
	@RequiresPermissions("syspropertyre:eamSystemSyspropertyRe:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamSystemSyspropertyRe eamSystemSyspropertyRe, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamSystemSyspropertyRe> page = eamSystemSyspropertyReService.findPage(new Page<EamSystemSyspropertyRe>(request, response), eamSystemSyspropertyRe);

		List<EamSystemSyspropertyRe> lst = page.getList();
		for(int i=0;i<lst.size();i++){
			lst.get(i).setEamSystem(eamSystemService.get(lst.get(i).getEamSystemId()));
			lst.get(i).setEamSysproperty(eamSyspropertyService.get(lst.get(i).getEamSyspropertyId()));
		}
		model.addAttribute("page", page);
		model.addAttribute("eamSystemIdList",eamSystemService.findList(new EamSystem()));
		model.addAttribute("eamSyspropertyIdList",eamSyspropertyService.findList(new EamSysproperty()));
		return "modules/syspropertyre/eamSystemSyspropertyReList";
	}

	@RequiresPermissions("syspropertyre:eamSystemSyspropertyRe:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	@RequestParam(value = "eamSystemId", required = false) String eamSystemId,
	@RequestParam(value = "eamSyspropertyId", required = false) String eamSyspropertyId,
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamSystemSyspropertyRe eamSystemSyspropertyRe = new EamSystemSyspropertyRe();
        eamSystemSyspropertyRe.setEamSystemId(eamSystemId);
        eamSystemSyspropertyRe.setEamSyspropertyId(eamSyspropertyId);
		Page<EamSystemSyspropertyRe> page = eamSystemSyspropertyReService.findPage(new Page<EamSystemSyspropertyRe>(request, response), eamSystemSyspropertyRe);
		model.addAttribute("page", page);
		model.addAttribute("eamSystemIdList", eamSystemService.findList(new EamSystem()));
		model.addAttribute("eamSyspropertyIdList",eamSyspropertyService.findList(new EamSysproperty()));
		return "modules/syspropertyre/eamSystemSyspropertyReList";
	}

	@RequiresPermissions("syspropertyre:eamSystemSyspropertyRe:view")
	@RequestMapping(value = "form")
	public String form(EamSystemSyspropertyRe eamSystemSyspropertyRe, Model model) {
		model.addAttribute("eamSystemSyspropertyRe", eamSystemSyspropertyRe);
		model.addAttribute("eamSystemIdList",eamSystemService.findList(new EamSystem()));
		model.addAttribute("eamSyspropertyIdList",eamSyspropertyService.findList(new EamSysproperty()));
		return "modules/syspropertyre/eamSystemSyspropertyReForm";
	}

	@RequiresPermissions("syspropertyre:eamSystemSyspropertyRe:edit")
	@RequestMapping(value = "save")
	public String save(EamSystemSyspropertyRe eamSystemSyspropertyRe, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamSystemSyspropertyRe)){
			return form(eamSystemSyspropertyRe, model);
		}
		eamSystemSyspropertyReService.save(eamSystemSyspropertyRe);
		addMessage(redirectAttributes, "保存系统属性关系成功");
		return "redirect:"+Global.getAdminPath()+"/syspropertyre/eamSystemSyspropertyRe/?repage";
	}
	
	@RequiresPermissions("syspropertyre:eamSystemSyspropertyRe:edit")
	@RequestMapping(value = "delete")
	public String delete(EamSystemSyspropertyRe eamSystemSyspropertyRe, RedirectAttributes redirectAttributes) {
		eamSystemSyspropertyReService.delete(eamSystemSyspropertyRe);
		addMessage(redirectAttributes, "删除系统属性关系成功");
		return "redirect:"+Global.getAdminPath()+"/syspropertyre/eamSystemSyspropertyRe/?repage";
	}

}