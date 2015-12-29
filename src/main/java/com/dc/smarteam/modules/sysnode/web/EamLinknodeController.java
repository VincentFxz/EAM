/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnode.web;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dc.smarteam.common.config.Global;
import com.dc.smarteam.common.persistence.Page;
import com.dc.smarteam.common.web.BaseController;
import com.dc.smarteam.common.utils.StringUtils;
import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import com.dc.smarteam.modules.sysnode.service.EamLinknodeService;

/**
 * 系统关联节点Controller
 * @author yangqjb
 * @version 2015-12-28
 */
@Controller
@RequestMapping(value = "${adminPath}/sysnode/eamLinknode")
public class EamLinknodeController extends BaseController {

	@Autowired
	private EamLinknodeService eamLinknodeService;
    @Autowired
    private EamSystemService eamSystemService;
	@ModelAttribute
	public EamLinknode get(@RequestParam(required=false) String id) {
		EamLinknode entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamLinknodeService.get(id);
		}
		if (entity == null){
			entity = new EamLinknode();
		}
		return entity;
	}
	
	@RequiresPermissions("sysnode:eamLinknode:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamLinknode eamLinknode, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamLinknode> page = eamLinknodeService.findPage(new Page<EamLinknode>(request, response), eamLinknode);
        model.addAttribute("page", page);

        model.addAttribute("systems", eamSystemService.findList(new EamSystem()));
		return "modules/sysnode/eamLinknodeList";
	}

	@RequiresPermissions("sysnode:eamLinknode:view")
	@RequestMapping(value = "form")
	public String form(EamLinknode eamLinknode, Model model) {
		model.addAttribute("eamLinknode", eamLinknode);

        model.addAttribute("systems", eamSystemService.findList(new EamSystem()));
		return "modules/sysnode/eamLinknodeForm";
	}

	@RequiresPermissions("sysnode:eamLinknode:edit")
	@RequestMapping(value = "save")
	public String save(EamLinknode eamLinknode, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamLinknode)){
			return form(eamLinknode, model);
		}
		eamLinknodeService.save(eamLinknode);
		addMessage(redirectAttributes, "保存系统节点成功");
		return "redirect:"+Global.getAdminPath()+"/sysnode/eamLinknode/?repage";
	}
	
	@RequiresPermissions("sysnode:eamLinknode:edit")
	@RequestMapping(value = "delete")
	public String delete(EamLinknode eamLinknode, RedirectAttributes redirectAttributes) {
		eamLinknodeService.delete(eamLinknode);
		addMessage(redirectAttributes, "删除系统节点成功");
		return "redirect:"+Global.getAdminPath()+"/sysnode/eamLinknode/?repage";
	}

}