/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodeflowre.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.flow.entity.EamFlowCtlAlg;
import com.dc.smarteam.modules.flow.service.EamFlowCtlAlgService;
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
import com.dc.smarteam.modules.sysnodeflowre.entity.EamNodeFlowctlRe;
import com.dc.smarteam.modules.sysnodeflowre.service.EamNodeFlowctlReService;

import java.util.List;

/**
 * 节点流控关系管理Controller
 * @author zhanghaor
 * @version 2016-01-26
 */
@Controller
@RequestMapping(value = "${adminPath}/sysnodeflowre/eamNodeFlowctlRe")
public class EamNodeFlowctlReController extends BaseController {

	@Autowired
	private EamNodeFlowctlReService eamNodeFlowctlReService;
	@Autowired
	private EamLinknodeService eamLinknodeService;
	@Autowired
	private EamFlowCtlAlgService eamFlowCtlAlgService;
	
	@ModelAttribute
	public EamNodeFlowctlRe get(@RequestParam(required=false) String id) {
		EamNodeFlowctlRe entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamNodeFlowctlReService.get(id);
		}
		if (entity == null){
			entity = new EamNodeFlowctlRe();
		}
		return entity;
	}
	
	@RequiresPermissions("sysnodeflowre:eamNodeFlowctlRe:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamNodeFlowctlRe eamNodeFlowctlRe, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamNodeFlowctlRe> page = eamNodeFlowctlReService.findPage(new Page<EamNodeFlowctlRe>(request, response), eamNodeFlowctlRe);
		List<EamNodeFlowctlRe> lst=page.getList();
		for(int i=0;i<lst.size();i++){
			lst.get(i).setEamLinknode(eamLinknodeService.get(lst.get(i).getEamLinknodeId()));
			lst.get(i).setEamFlowCtlAlg(eamFlowCtlAlgService.get(lst.get(i).getEamFlowCtlAlgId()));
		}

		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamFlowCtlAlgIdList",eamFlowCtlAlgService.findList(new EamFlowCtlAlg()));
		return "modules/sysnodeflowre/eamNodeFlowctlReList";
	}

	@RequiresPermissions("sysnodeflowre:eamNodeFlowctlRe:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	@RequestParam(value = "eamLinknodeId", required = false) String eamLinknodeId,
	@RequestParam(value = "eamFlowCtlAlgId", required = false) String eamFlowCtlAlgId,
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamNodeFlowctlRe eamNodeFlowctlRe = new EamNodeFlowctlRe();
        eamNodeFlowctlRe.setEamLinknodeId(eamLinknodeId);
        eamNodeFlowctlRe.setEamFlowCtlAlgId(eamFlowCtlAlgId);
		Page<EamNodeFlowctlRe> page = eamNodeFlowctlReService.findPage(new Page<EamNodeFlowctlRe>(request, response), eamNodeFlowctlRe);
		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList", eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamFlowCtlAlgIdList",eamFlowCtlAlgService.findList(new EamFlowCtlAlg()));
		return "modules/sysnodeflowre/eamNodeFlowctlReList";
	}

	@RequiresPermissions("sysnodeflowre:eamNodeFlowctlRe:view")
	@RequestMapping(value = "form")
	public String form(EamNodeFlowctlRe eamNodeFlowctlRe, Model model) {
		model.addAttribute("eamNodeFlowctlRe", eamNodeFlowctlRe);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamFlowCtlAlgIdList",eamFlowCtlAlgService.findList(new EamFlowCtlAlg()));
		return "modules/sysnodeflowre/eamNodeFlowctlReForm";
	}

	@RequiresPermissions("sysnodeflowre:eamNodeFlowctlRe:edit")
	@RequestMapping(value = "save")
	public String save(EamNodeFlowctlRe eamNodeFlowctlRe, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamNodeFlowctlRe)){
			return form(eamNodeFlowctlRe, model);
		}
		eamNodeFlowctlReService.save(eamNodeFlowctlRe);
		addMessage(redirectAttributes, "保存节点流控关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnodeflowre/eamNodeFlowctlRe/?repage";
	}
	
	@RequiresPermissions("sysnodeflowre:eamNodeFlowctlRe:edit")
	@RequestMapping(value = "delete")
	public String delete(EamNodeFlowctlRe eamNodeFlowctlRe, RedirectAttributes redirectAttributes) {
		eamNodeFlowctlReService.delete(eamNodeFlowctlRe);
		addMessage(redirectAttributes, "删除节点流控关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnodeflowre/eamNodeFlowctlRe/?repage";
	}

}