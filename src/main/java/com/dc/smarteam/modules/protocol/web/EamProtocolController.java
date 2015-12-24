/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.protocol.web;

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
import com.dc.smarteam.modules.protocol.entity.EamProtocol;
import com.dc.smarteam.modules.protocol.service.EamProtocolService;

/**
 * 通讯协议管理Controller
 * @author kern
 * @version 2015-12-24
 */
@Controller
@RequestMapping(value = "${adminPath}/protocol/eamProtocol")
public class EamProtocolController extends BaseController {

	@Autowired
	private EamProtocolService eamProtocolService;
	
	@ModelAttribute
	public EamProtocol get(@RequestParam(required=false) String id) {
		EamProtocol entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamProtocolService.get(id);
		}
		if (entity == null){
			entity = new EamProtocol();
		}
		return entity;
	}
	
	@RequiresPermissions("protocol:eamProtocol:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamProtocol eamProtocol, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamProtocol> page = eamProtocolService.findPage(new Page<EamProtocol>(request, response), eamProtocol); 
		model.addAttribute("page", page);
		return "modules/protocol/eamProtocolList";
	}

	@RequiresPermissions("protocol:eamProtocol:view")
	@RequestMapping(value = "form")
	public String form(EamProtocol eamProtocol, Model model) {
		model.addAttribute("eamProtocol", eamProtocol);
		return "modules/protocol/eamProtocolForm";
	}

	@RequiresPermissions("protocol:eamProtocol:edit")
	@RequestMapping(value = "save")
	public String save(EamProtocol eamProtocol, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamProtocol)){
			return form(eamProtocol, model);
		}
		eamProtocolService.save(eamProtocol);
		addMessage(redirectAttributes, "保存协议管理成功");
		return "redirect:"+Global.getAdminPath()+"/protocol/eamProtocol/?repage";
	}
	
	@RequiresPermissions("protocol:eamProtocol:edit")
	@RequestMapping(value = "delete")
	public String delete(EamProtocol eamProtocol, RedirectAttributes redirectAttributes) {
		eamProtocolService.delete(eamProtocol);
		addMessage(redirectAttributes, "删除协议管理成功");
		return "redirect:"+Global.getAdminPath()+"/protocol/eamProtocol/?repage";
	}

}