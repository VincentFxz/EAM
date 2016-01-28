/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodeinre.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.sysinter.entity.EamInterface;
import com.dc.smarteam.modules.sysinter.service.EamInterfaceService;
import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import com.dc.smarteam.modules.sysnode.service.EamLinknodeService;
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
import com.dc.smarteam.modules.sysnodeinre.entity.EamNodeInterfaceRe;
import com.dc.smarteam.modules.sysnodeinre.service.EamNodeInterfaceReService;

import java.util.List;

/**
 * 节点接口关系管理Controller
 * @author zhanghaor
 * @version 2016-01-26
 */
@Controller
@RequestMapping(value = "${adminPath}/sysnodeinre/eamNodeInterfaceRe")
public class EamNodeInterfaceReController extends BaseController {

	@Autowired
	private EamNodeInterfaceReService eamNodeInterfaceReService;
	@Autowired
	private EamLinknodeService eamLinknodeService;
	@Autowired
	private EamInterfaceService eamInterfaceService;
	@ModelAttribute
	public EamNodeInterfaceRe get(@RequestParam(required=false) String id) {
		EamNodeInterfaceRe entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamNodeInterfaceReService.get(id);
		}
		if (entity == null){
			entity = new EamNodeInterfaceRe();
		}
		return entity;
	}
	
	@RequiresPermissions("sysnodeinre:eamNodeInterfaceRe:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamNodeInterfaceRe eamNodeInterfaceRe, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamNodeInterfaceRe> page = eamNodeInterfaceReService.findPage(new Page<EamNodeInterfaceRe>(request, response), eamNodeInterfaceRe);
		List<EamNodeInterfaceRe> lst=page.getList();
		for(int i=0;i<lst.size();i++){
			lst.get(i).setEamLinknode(eamLinknodeService.get(lst.get(i).getEamLinknodeId()));
			lst.get(i).setEamInterface(eamInterfaceService.get(lst.get(i).getEamInterfaceId()));

		}

		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamInterfaceIdList",eamInterfaceService.findList(new EamInterface()));
		return "modules/sysnodeinre/eamNodeInterfaceReList";
	}

	@RequiresPermissions("sysnodeinre:eamNodeInterfaceRe:view")
	@RequestMapping(value = "/param")
	 public String listbysearch(
			@RequestParam(value = "eamLinknodeId", required = false) String eamLinknodeId,
			@RequestParam(value = "eamInterfaceId", required = false) String eamInterfaceId,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		EamNodeInterfaceRe eamNodeInterfaceRe = new EamNodeInterfaceRe();
		eamNodeInterfaceRe.setEamLinknodeId(eamLinknodeId);
		eamNodeInterfaceRe.setEamInterfaceId(eamInterfaceId);
		Page<EamNodeInterfaceRe> page = eamNodeInterfaceReService.findPage(new Page<EamNodeInterfaceRe>(request, response), eamNodeInterfaceRe);
		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList", eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamInterfaceIdList",eamInterfaceService.findList(new EamInterface()));
		return "modules/sysnodeinre/eamNodeInterfaceReList";
	}

	@RequiresPermissions("sysnodeinre:eamNodeInterfaceRe:view")
	@RequestMapping(value = "form")
	public String form(EamNodeInterfaceRe eamNodeInterfaceRe, Model model) {
		model.addAttribute("eamNodeInterfaceRe", eamNodeInterfaceRe);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamInterfaceIdList",eamInterfaceService.findList(new EamInterface()));
		return "modules/sysnodeinre/eamNodeInterfaceReForm";
	}

	@RequiresPermissions("sysnodeinre:eamNodeInterfaceRe:edit")
	@RequestMapping(value = "save")
	public String save(EamNodeInterfaceRe eamNodeInterfaceRe, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamNodeInterfaceRe)){
			return form(eamNodeInterfaceRe, model);
		}
		eamNodeInterfaceReService.save(eamNodeInterfaceRe);
		addMessage(redirectAttributes, "保存节点接口关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnodeinre/eamNodeInterfaceRe/?repage";
	}
	
	@RequiresPermissions("sysnodeinre:eamNodeInterfaceRe:edit")
	@RequestMapping(value = "delete")
	public String delete(EamNodeInterfaceRe eamNodeInterfaceRe, RedirectAttributes redirectAttributes) {
		eamNodeInterfaceReService.delete(eamNodeInterfaceRe);
		addMessage(redirectAttributes, "删除节点接口关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnodeinre/eamNodeInterfaceRe/?repage";
	}

}