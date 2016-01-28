/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.sysnodeformatre.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.sysformat.entity.EamMsgFormat;
import com.dc.smarteam.modules.sysformat.service.EamMsgFormatService;
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
import com.dc.smarteam.modules.sysnodeformatre.entity.EamNodeMsgformatRe;
import com.dc.smarteam.modules.sysnodeformatre.service.EamNodeMsgformatReService;

import java.util.List;

/**
 * 节点报文格式关系管理Controller
 * @author zhanghaor
 * @version 2016-01-25
 */
@Controller
@RequestMapping(value = "${adminPath}/sysnodeformatre/eamNodeMsgformatRe")
public class EamNodeMsgformatReController extends BaseController {

	@Autowired
	private EamNodeMsgformatReService eamNodeMsgformatReService;
	@Autowired
	private EamLinknodeService eamLinknodeService;
	@Autowired
	private EamMsgFormatService eamMsgFormatService;
	
	@ModelAttribute
	public EamNodeMsgformatRe get(@RequestParam(required=false) String id) {
		EamNodeMsgformatRe entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamNodeMsgformatReService.get(id);
		}
		if (entity == null){
			entity = new EamNodeMsgformatRe();
		}
		return entity;
	}
	
	@RequiresPermissions("sysnodeformatre:eamNodeMsgformatRe:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamNodeMsgformatRe eamNodeMsgformatRe, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EamNodeMsgformatRe> page = eamNodeMsgformatReService.findPage(new Page<EamNodeMsgformatRe>(request, response), eamNodeMsgformatRe);
		List<EamNodeMsgformatRe> lst=page.getList();
		for(int i=0;i<lst.size();i++){
			lst.get(i).setEamLinknode(eamLinknodeService.get(lst.get(i).getEamLinknodeId()));
			lst.get(i).setEamMsgFormat(eamMsgFormatService.get(lst.get(i).getEamMsgFormatId()));
		}

		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamMsgFormatIdList",eamMsgFormatService.findList(new EamMsgFormat()));
		return "modules/sysnodeformatre/eamNodeMsgformatReList";
	}

	@RequiresPermissions("sysnodeformatre:eamNodeMsgformatRe:view")
	@RequestMapping(value = "/param")
	public String listbysearch(
	@RequestParam(value = "eamLinknodeId", required = false) String eamLinknodeId,
	@RequestParam(value = "eamMsgFormatId", required = false) String eamMsgFormatId,
	HttpServletRequest request, HttpServletResponse response, Model model) {
	    EamNodeMsgformatRe eamNodeMsgformatRe = new EamNodeMsgformatRe();
        eamNodeMsgformatRe.setEamLinknodeId(eamLinknodeId);
        eamNodeMsgformatRe.setEamMsgFormatId(eamMsgFormatId);
		Page<EamNodeMsgformatRe> page = eamNodeMsgformatReService.findPage(new Page<EamNodeMsgformatRe>(request, response), eamNodeMsgformatRe);
		model.addAttribute("page", page);
		model.addAttribute("eamLinknodeIdList", eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamMsgFormatIdList",eamMsgFormatService.findList(new EamMsgFormat()));
		return "modules/sysnodeformatre/eamNodeMsgformatReList";
	}

	@RequiresPermissions("sysnodeformatre:eamNodeMsgformatRe:view")
	@RequestMapping(value = "form")
	public String form(EamNodeMsgformatRe eamNodeMsgformatRe, Model model) {
		model.addAttribute("eamNodeMsgformatRe", eamNodeMsgformatRe);
		model.addAttribute("eamLinknodeIdList",eamLinknodeService.findList(new EamLinknode()));
		model.addAttribute("eamMsgFormatIdList",eamMsgFormatService.findList(new EamMsgFormat()));
		return "modules/sysnodeformatre/eamNodeMsgformatReForm";
	}

	@RequiresPermissions("sysnodeformatre:eamNodeMsgformatRe:edit")
	@RequestMapping(value = "save")
	public String save(EamNodeMsgformatRe eamNodeMsgformatRe, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamNodeMsgformatRe)){
			return form(eamNodeMsgformatRe, model);
		}
		eamNodeMsgformatReService.save(eamNodeMsgformatRe);
		addMessage(redirectAttributes, "保存节点报文格式关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnodeformatre/eamNodeMsgformatRe/?repage";
	}
	
	@RequiresPermissions("sysnodeformatre:eamNodeMsgformatRe:edit")
	@RequestMapping(value = "delete")
	public String delete(EamNodeMsgformatRe eamNodeMsgformatRe, RedirectAttributes redirectAttributes) {
		eamNodeMsgformatReService.delete(eamNodeMsgformatRe);
		addMessage(redirectAttributes, "删除节点报文格式关系成功");
		return "redirect:"+Global.getAdminPath()+"/sysnodeformatre/eamNodeMsgformatRe/?repage";
	}

}