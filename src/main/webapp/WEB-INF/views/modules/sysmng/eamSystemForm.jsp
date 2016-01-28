<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>应用系统管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sysmng/eamSystem/">应用系统列表</a></li>
		<li class="active"><a href="${ctx}/sysmng/eamSystem/form?id=${eamSystem.id}">应用系统<shiro:hasPermission name="sysmng:eamSystem:edit">${not empty eamSystem.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sysmng:eamSystem:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamSystem" action="${ctx}/sysmng/eamSystem/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">系统编号：</label>
			<div class="controls">
				<form:input path="no" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">中文名称：</label>
			<div class="controls">
				<form:input path="chineseName" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">系统名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">英文名：</label>
			<div class="controls">
				<form:input path="englishName" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">英文简称：</label>
			<div class="controls">
				<form:input path="englishShort" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">别名：</label>
			<div class="controls">
				<form:input path="alias" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属银行：</label>
			<div class="controls">
				<form:select path="eamBank" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_bank')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<sys:dict description="所属银行" type="eam_bank" sort="${(fns:getDictList('eam_bank').size()+1)*30}"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属系统群组：</label>
			<div class="controls">
				<form:select path="eamSysgroupId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamSysgroupIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属应用架构层次：</label>
			<div class="controls">
				<form:select path="eamAaLayerId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamAaLayerIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机构层次：</label>
			<div class="controls">
				<form:select path="eamOrgLayer" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_org_layer')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<sys:dict description="机构层次" type="eam_org_layer" sort="${(fns:getDictList('eam_org_layer').size()+1)*30}"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">建设类型：</label>
			<div class="controls">
				<form:select path="eamBuildType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_sys_build_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<sys:dict description="建设类型" type="eam_sys_build_type" sort="${(fns:getDictList('eam_sys_build_type').size()+1)*30}"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">建设状态：</label>
			<div class="controls">
				<form:select path="eamBuildState" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_sys_build_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<sys:dict description="建设状态" type="eam_sys_build_state" sort="${(fns:getDictList('eam_sys_build_state').size()+1)*30}"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">初次上线日期：</label>
			<div class="controls">
				<input name="onlineDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${eamSystem.onlineDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">未来走向：</label>
			<div class="controls">
				<form:select path="eamTrend" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_sys_trend')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<sys:dict description="未来走向" type="eam_sys_trend" sort="${(fns:getDictList('eam_sys_trend').size()+1)*30}"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">目标系统：</label>
			<div class="controls">
				<form:input path="targetSystem" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sysmng:eamSystem:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
			<ul class="nav">
				<!-- 请将 param 替换为具体参数 -->
				<li><a href="${ctx}/syssgrp/eamSysgroup/list?id=${eamSystem.eamSysgroupId}">${not empty eamSystem.eamSysgroupId?'所属系统群组':''}</a></li><br>
				<li><a href="${ctx}/syslyr/eamAaLayer/list?id=${eamSystem.eamAaLayerId}">${not empty eamSystem.eamAaLayerId?'所属架构层次':''}</a></li><br>
				<li><a href="${ctx}/sysmdl/eamSystemModule/list?eamSystemId=${eamSystem.id}">${not empty eamSystem.id?'相关系统模块':''}</a></li><br>
				<li><a href="${ctx}/sysstr/eamAaStrategy/list?eamSystemId=${eamSystem.id}">${not empty eamSystem.id?'相关系统决策':''}</a></li><br>
				<li><a href="${ctx}/sysnode/eamLinknode/list?eamSystemId=${eamSystem.id}">${not empty eamSystem.id?'相关系统节点':''}</a></li><br>
		</ul>
    </div>
</body>
</html>