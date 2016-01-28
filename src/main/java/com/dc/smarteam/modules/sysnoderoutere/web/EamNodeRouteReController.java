/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnoderoutere.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.route.entity.EamRouteAlg;
import com.dc.smarteam.modules.route.service.EamRouteAlgService;
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
import com.dc.smarteam.modules.sysnoderoutere.entity.EamNodeRouteRe;
import com.dc.smarteam.modules.sysnoderoutere.service.EamNodeRouteReService;

import java.util.List;

/**
 * 节点路由关系管理Controller
 * @author zhanghaor
 * @version 2016-01-26
 */
@Controller
@RequestMapping(value = "${adminPath}/sysnoderoutere/eamNodeRouteRe")
public class EamNodeRouteReController extends BaseController {

	@Autowired
	private EamNodeRouteReService eamNodeRouteReService;
	@Autowired
	private EamLinknodeService eamLinknodeService;
	@Autowired
	private EamRouteAlgService eamRouteAlgService;
	
	@ModelAttribute
	public EamNodeRouteRe get(@RequestParam(required=false) String id) {
		EamNodeRouteRe entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamNodeRouteReService.get(id);
		}
		if (entity == null){
			entity = new EamNodeRouteRe();
		}
		return entity;
	}
	
	@RequiresPermissions("sysnoderoutere:eamNodeRouteRe:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamNodeRouteRe eamNodeRouteRe, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamNodeRouteRe> page = eamNodeRouteReService.findPage(new Page<EamNodeRouteRe>(request, response), eamNodeRouteRe);
		List<EamNodeRouteRe> lst=page.getList();
		for(int i=0;i<lst.size();i++){
			lst.get(i).setEamLinknode(eamLinknodeService.get(lst.get(i).getEamLinknodeId()));
			lst.get(i).setEamRouteAlg(eamRouteAlgService.get(lst.get(i).getEamRouteAlgId()));
		}
		page.setList(lst);
		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamRouteAlgIdList",eamRouteAlgService.findList(new EamRouteAlg()));
		return "modules/sysnoderoutere/eamNodeRouteReList";
	}

	@RequiresPermissions("sysnoderoutere:eamNodeRouteRe:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	@RequestParam(value = "eamLinknodeId", required = false) String eamLinknodeId,
	@RequestParam(value = "eamRouteAlgId", required = false) String eamRouteAlgId,
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamNodeRouteRe eamNodeRouteRe = new EamNodeRouteRe();
        eamNodeRouteRe.setEamLinknodeId(eamLinknodeId);
        eamNodeRouteRe.setEamRouteAlgId(eamRouteAlgId);
		Page<EamNodeRouteRe> page = eamNodeRouteReService.findPage(new Page<EamNodeRouteRe>(request, response), eamNodeRouteRe);
		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList", eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamRouteAlgIdList",eamRouteAlgService.findList(new EamRouteAlg()));
		return "modules/sysnoderoutere/eamNodeRouteReList";
	}

	@RequiresPermissions("sysnoderoutere:eamNodeRouteRe:view")
	@RequestMapping(value = "form")
	public String form(EamNodeRouteRe eamNodeRouteRe, Model model) {
		model.addAttribute("eamNodeRouteRe", eamNodeRouteRe);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamRouteAlgIdList",eamRouteAlgService.findList(new EamRouteAlg()));
		return "modules/sysnoderoutere/eamNodeRouteReForm";
	}

	@RequiresPermissions("sysnoderoutere:eamNodeRouteRe:edit")
	@RequestMapping(value = "save")
	public String save(EamNodeRouteRe eamNodeRouteRe, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamNodeRouteRe)){
			return form(eamNodeRouteRe, model);
		}
		eamNodeRouteReService.save(eamNodeRouteRe);
		addMessage(redirectAttributes, "保存节点路由关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnoderoutere/eamNodeRouteRe/?repage";
	}
	
	@RequiresPermissions("sysnoderoutere:eamNodeRouteRe:edit")
	@RequestMapping(value = "delete")
	public String delete(EamNodeRouteRe eamNodeRouteRe, RedirectAttributes redirectAttributes) {
		eamNodeRouteReService.delete(eamNodeRouteRe);
		addMessage(redirectAttributes, "删除节点路由关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnoderoutere/eamNodeRouteRe/?repage";
	}

}