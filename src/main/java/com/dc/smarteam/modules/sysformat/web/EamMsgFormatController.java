/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysformat.web;

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
import com.dc.smarteam.modules.sysformat.entity.EamMsgFormat;
import com.dc.smarteam.modules.sysformat.service.EamMsgFormatService;

/**
 * 报文格式管理Controller
 * @author zhanghaor
 * @version 2016-01-22
 */
@Controller
@RequestMapping(value = "${adminPath}/sysformat/eamMsgFormat")
public class EamMsgFormatController extends BaseController {

	@Autowired
	private EamMsgFormatService eamMsgFormatService;
	
	@ModelAttribute
	public EamMsgFormat get(@RequestParam(required=false) String id) {
		EamMsgFormat entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamMsgFormatService.get(id);
		}
		if (entity == null){
			entity = new EamMsgFormat();
		}
		return entity;
	}
	
	@RequiresPermissions("sysformat:eamMsgFormat:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamMsgFormat eamMsgFormat, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamMsgFormat> page = eamMsgFormatService.findPage(new Page<EamMsgFormat>(request, response), eamMsgFormat); 
		model.addAttribute("page", page);
		return "modules/sysformat/eamMsgFormatList";
	}

	@RequiresPermissions("sysformat:eamMsgFormat:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	@RequestParam(value = "format", required = false) String format,
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamMsgFormat eamMsgFormat = new EamMsgFormat();
        eamMsgFormat.setFormat(format);
		Page<EamMsgFormat> page = eamMsgFormatService.findPage(new Page<EamMsgFormat>(request, response), eamMsgFormat);
		model.addAttribute("page", page);
		return "modules/sysformat/eamMsgFormatList";
	}

	@RequiresPermissions("sysformat:eamMsgFormat:view")
	@RequestMapping(value = "form")
	public String form(EamMsgFormat eamMsgFormat, Model model) {
		model.addAttribute("eamMsgFormat", eamMsgFormat);
		return "modules/sysformat/eamMsgFormatForm";
	}

	@RequiresPermissions("sysformat:eamMsgFormat:edit")
	@RequestMapping(value = "save")
	public String save(EamMsgFormat eamMsgFormat, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamMsgFormat)){
			return form(eamMsgFormat, model);
		}
		eamMsgFormatService.save(eamMsgFormat);
		addMessage(redirectAttributes, "保存报文格式成功");
		return "redirect:"+Global.getAdminPath()+"/sysformat/eamMsgFormat/?repage";
	}
	
	@RequiresPermissions("sysformat:eamMsgFormat:edit")
	@RequestMapping(value = "delete")
	public String delete(EamMsgFormat eamMsgFormat, RedirectAttributes redirectAttributes) {
		eamMsgFormatService.delete(eamMsgFormat);
		addMessage(redirectAttributes, "删除报文格式成功");
		return "redirect:"+Global.getAdminPath()+"/sysformat/eamMsgFormat/?repage";
	}

}