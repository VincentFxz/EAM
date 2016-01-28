/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodetimeoutre.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import com.dc.smarteam.modules.sysnode.service.EamLinknodeService;
import com.dc.smarteam.modules.timeout.entity.EamTimeoutAlg;
import com.dc.smarteam.modules.timeout.service.EamTimeoutAlgService;
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
import com.dc.smarteam.modules.sysnodetimeoutre.entity.EamNodeTimeoutRe;
import com.dc.smarteam.modules.sysnodetimeoutre.service.EamNodeTimeoutReService;

import java.util.List;

/**
 * 节点超时算法关系管理Controller
 * @author zhanghaor
 * @version 2016-01-25
 */
@Controller
@RequestMapping(value = "${adminPath}/sysnodetimeoutre/eamNodeTimeoutRe")
public class EamNodeTimeoutReController extends BaseController {

	@Autowired
	private EamNodeTimeoutReService eamNodeTimeoutReService;
	@Autowired
	private EamLinknodeService eamLinknodeService;
	@Autowired
	private EamTimeoutAlgService eamTimeoutAlgService;
	
	@ModelAttribute
	public EamNodeTimeoutRe get(@RequestParam(required=false) String id) {
		EamNodeTimeoutRe entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamNodeTimeoutReService.get(id);
		}
		if (entity == null){
			entity = new EamNodeTimeoutRe();
		}
		return entity;
	}
	
	@RequiresPermissions("sysnodetimeoutre:eamNodeTimeoutRe:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamNodeTimeoutRe eamNodeTimeoutRe, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamNodeTimeoutRe> page = eamNodeTimeoutReService.findPage(new Page<EamNodeTimeoutRe>(request, response), eamNodeTimeoutRe);
		List<EamNodeTimeoutRe> lst=page.getList();
		for(int i=0;i<lst.size();i++){
			lst.get(i).setEamLinknode(eamLinknodeService.get(lst.get(i).getEamLinknodeId()));
			lst.get(i).setEamTimeoutAlg(eamTimeoutAlgService.get(lst.get(i).getEamTimeoutAlgId()));
		}
		page.setList(lst);
		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamTimeoutAlgIdList",eamTimeoutAlgService.findList(new EamTimeoutAlg()));
		return "modules/sysnodetimeoutre/eamNodeTimeoutReList";
	}

	@RequiresPermissions("sysnodetimeoutre:eamNodeTimeoutRe:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	@RequestParam(value = "eamLinknodeId", required = false) String eamLinknodeId,
	@RequestParam(value = "eamTimeoutAlgId", required = false) String eamTimeoutAlgId,
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamNodeTimeoutRe eamNodeTimeoutRe = new EamNodeTimeoutRe();
        eamNodeTimeoutRe.setEamLinknodeId(eamLinknodeId);
        eamNodeTimeoutRe.setEamTimeoutAlgId(eamTimeoutAlgId);
		Page<EamNodeTimeoutRe> page = eamNodeTimeoutReService.findPage(new Page<EamNodeTimeoutRe>(request, response), eamNodeTimeoutRe);
		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList", eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamTimeoutAlgIdList",eamTimeoutAlgService.findList(new EamTimeoutAlg()));
		return "modules/sysnodetimeoutre/eamNodeTimeoutReList";
	}

	@RequiresPermissions("sysnodetimeoutre:eamNodeTimeoutRe:view")
	@RequestMapping(value = "form")
	public String form(EamNodeTimeoutRe eamNodeTimeoutRe, Model model) {
		model.addAttribute("eamNodeTimeoutRe", eamNodeTimeoutRe);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamTimeoutAlgIdList",eamTimeoutAlgService.findList(new EamTimeoutAlg()));
		return "modules/sysnodetimeoutre/eamNodeTimeoutReForm";
	}

	@RequiresPermissions("sysnodetimeoutre:eamNodeTimeoutRe:edit")
	@RequestMapping(value = "save")
	public String save(EamNodeTimeoutRe eamNodeTimeoutRe, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamNodeTimeoutRe)){
			return form(eamNodeTimeoutRe, model);
		}
		eamNodeTimeoutReService.save(eamNodeTimeoutRe);
		addMessage(redirectAttributes, "保存节点超时算法关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnodetimeoutre/eamNodeTimeoutRe/?repage";
	}
	
	@RequiresPermissions("sysnodetimeoutre:eamNodeTimeoutRe:edit")
	@RequestMapping(value = "delete")
	public String delete(EamNodeTimeoutRe eamNodeTimeoutRe, RedirectAttributes redirectAttributes) {
		eamNodeTimeoutReService.delete(eamNodeTimeoutRe);
		addMessage(redirectAttributes, "删除节点超时算法关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnodetimeoutre/eamNodeTimeoutRe/?repage";
	}

}