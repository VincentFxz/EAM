/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dc.smarteam.modules.syslink.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dc.smarteam.modules.sys.utils.DictUtils;
import com.dc.smarteam.modules.sysnode.entity.EamLinknode;
import com.dc.smarteam.modules.sysnode.service.EamLinknodeService;
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
import com.dc.smarteam.modules.syslink.entity.EamSyslink;
import com.dc.smarteam.modules.syslink.service.EamSyslinkService;

import java.util.List;

/**
 * 系统关联关系Controller
 * @author yangqjb
 * @version 2015-12-28
 */
@Controller
@RequestMapping(value = "${adminPath}/syslink/eamSyslink")
public class EamSyslinkController extends BaseController {

    @Autowired
    private EamSyslinkService eamSyslinkService;
    @Autowired
    private EamLinknodeService eamLinknodeService;

	@ModelAttribute
	public EamSyslink get(@RequestParam(required=false) String id) {
		EamSyslink entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eamSyslinkService.get(id);
		}
		if (entity == null){
			entity = new EamSyslink();
		}
		return entity;
	}
	
	@RequiresPermissions("syslink:eamSyslink:view")
	@RequestMapping(value = {"list", ""})
	public String list(EamSyslink eamSyslink, HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<EamSyslink> page = eamSyslinkService.findPage(new Page<EamSyslink>(request, response), eamSyslink);

        List<EamSyslink> lst = page.getList();
        for(int i=0;i<lst.size();i++){
            lst.get(i).setStartLinknode(eamLinknodeService.get(lst.get(i).getStartLinknodeId()));
            lst.get(i).setEndLinknode(eamLinknodeService.get(lst.get(i).getEndLinknodeId()));
        }
        page.setList(lst);
		model.addAttribute("page", page);

		return "modules/syslink/eamSyslinkList";
	}

	@RequiresPermissions("syslink:eamSyslink:view")
	@RequestMapping(value = "form")
	public String form(EamSyslink eamSyslink, Model model) {
		model.addAttribute("eamSyslink", eamSyslink);

        EamLinknode nodes = new EamLinknode();
        model.addAttribute("start_nodes", eamLinknodeService.findList(nodes));
        model.addAttribute("end_nodes", eamLinknodeService.findList(nodes));
		return "modules/syslink/eamSyslinkForm";
	}

	@RequiresPermissions("syslink:eamSyslink:edit")
	@RequestMapping(value = "save")
	public String save(EamSyslink eamSyslink, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eamSyslink)){
			return form(eamSyslink, model);
		}
		eamSyslinkService.save(eamSyslink);
		addMessage(redirectAttributes, "保存关联关系成功");
		return "redirect:"+Global.getAdminPath()+"/syslink/eamSyslink/?repage";
	}
	
	@RequiresPermissions("syslink:eamSyslink:edit")
	@RequestMapping(value = "delete")
	public String delete(EamSyslink eamSyslink, RedirectAttributes redirectAttributes) {
		eamSyslinkService.delete(eamSyslink);
		addMessage(redirectAttributes, "删除关联关系成功");
		return "redirect:"+Global.getAdminPath()+"/syslink/eamSyslink/?repage";
	}

}