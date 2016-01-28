/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodelogre.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.log.entity.EamLogType;
import com.dc.smarteam.modules.log.service.EamLogTypeService;
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
import com.dc.smarteam.modules.sysnodelogre.entity.EamNodeLogtypeRe;
import com.dc.smarteam.modules.sysnodelogre.service.EamNodeLogtypeReService;

import java.util.List;

/**
 * 节点日志关系管理Controller
 * @author zhanghaor
 * @version 2016-01-26
 */
@Controller
@RequestMapping(value = "${adminPath}/sysnodelogre/eamNodeLogtypeRe")
public class EamNodeLogtypeReController extends BaseController {

	@Autowired
	private EamNodeLogtypeReService eamNodeLogtypeReService;
	@Autowired
	private EamLinknodeService eamLinknodeService;
	@Autowired
	private EamLogTypeService eamLogTypeService;
	
	@ModelAttribute
	public EamNodeLogtypeRe get(@RequestParam(required=false) String id) {
		EamNodeLogtypeRe entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamNodeLogtypeReService.get(id);
		}
		if (entity == null){
			entity = new EamNodeLogtypeRe();
		}
		return entity;
	}
	
	@RequiresPermissions("sysnodelogre:eamNodeLogtypeRe:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamNodeLogtypeRe eamNodeLogtypeRe, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamNodeLogtypeRe> page = eamNodeLogtypeReService.findPage(new Page<EamNodeLogtypeRe>(request, response), eamNodeLogtypeRe);
		List<EamNodeLogtypeRe> lst=page.getList();
		for(int i=0;i<lst.size();i++){
			lst.get(i).setEamLinknode(eamLinknodeService.get(lst.get(i).getEamLinknodeId()));
			lst.get(i).setEamLogType(eamLogTypeService.get(lst.get(i).getEamLogTypeId()));
		}

		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamLogTypeIdList",eamLogTypeService.findList(new EamLogType()));
		return "modules/sysnodelogre/eamNodeLogtypeReList";
	}

	@RequiresPermissions("sysnodelogre:eamNodeLogtypeRe:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	@RequestParam(value = "eamLinknodeId", required = false) String eamLinknodeId,
	@RequestParam(value = "eamLogTypeId", required = false) String eamLogTypeId,
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamNodeLogtypeRe eamNodeLogtypeRe = new EamNodeLogtypeRe();
        eamNodeLogtypeRe.setEamLinknodeId(eamLinknodeId);
        eamNodeLogtypeRe.setEamLogTypeId(eamLogTypeId);
		Page<EamNodeLogtypeRe> page = eamNodeLogtypeReService.findPage(new Page<EamNodeLogtypeRe>(request, response), eamNodeLogtypeRe);
		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList", eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamLogTypeIdList",eamLogTypeService.findList(new EamLogType()));
		return "modules/sysnodelogre/eamNodeLogtypeReList";
	}

	@RequiresPermissions("sysnodelogre:eamNodeLogtypeRe:view")
	@RequestMapping(value = "form")
	public String form(EamNodeLogtypeRe eamNodeLogtypeRe, Model model) {
		model.addAttribute("eamNodeLogtypeRe", eamNodeLogtypeRe);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamLogTypeIdList",eamLogTypeService.findList(new EamLogType()));
		return "modules/sysnodelogre/eamNodeLogtypeReForm";
	}

	@RequiresPermissions("sysnodelogre:eamNodeLogtypeRe:edit")
	@RequestMapping(value = "save")
	public String save(EamNodeLogtypeRe eamNodeLogtypeRe, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamNodeLogtypeRe)){
			return form(eamNodeLogtypeRe, model);
		}
		eamNodeLogtypeReService.save(eamNodeLogtypeRe);
		addMessage(redirectAttributes, "保存节点日志关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnodelogre/eamNodeLogtypeRe/?repage";
	}
	
	@RequiresPermissions("sysnodelogre:eamNodeLogtypeRe:edit")
	@RequestMapping(value = "delete")
	public String delete(EamNodeLogtypeRe eamNodeLogtypeRe, RedirectAttributes redirectAttributes) {
		eamNodeLogtypeReService.delete(eamNodeLogtypeRe);
		addMessage(redirectAttributes, "删除节点日志关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnodelogre/eamNodeLogtypeRe/?repage";
	}

}