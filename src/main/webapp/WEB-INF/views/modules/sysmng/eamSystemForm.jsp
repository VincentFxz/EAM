<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统管理</title>
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
		<li><a href="${ctx}/sysmng/eamSystem/">系统列表</a></li>
		<li class="active"><a href="${ctx}/sysmng/eamSystem/form?id=${eamSystem.id}">系统<shiro:hasPermission name="sysmng:eamSystem:edit">${not empty eamSystem.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sysmng:eamSystem:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="eamSystem" action="${ctx}/sysmng/eamSystem/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">系统名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="250" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">中文名称：</label>
			<div class="controls">
				<form:input path="chineseName" htmlEscape="false" maxlength="375" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属银行：</label>
			<div class="controls">
				<form:select path="eamBank" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_bank')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属系统群组：</label>
			<div class="controls">
				<form:select path="eamSysgroupId" class="input-xlarge ">
					<form:option value="" label=""/>
                    <form:options items="${sysGroupList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属应用架构层次：</label>
			<div class="controls">
				<form:select path="eamAaLayerId" class="input-xlarge ">
					<form:option value="" label=""/>
                    <form:options items="${sysAaLayerList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机构层次代码：</label>
			<div class="controls">
				<form:select path="eamOrgLayerId" class="input-xlarge ">
					<form:option value="" label=""/>
                    <form:options items="${sysOrgLayerList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">建设类型：</label>
			<div class="controls">
				<form:select path="eamBuildType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_sys_build_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">建设状态：</label>
			<div class="controls">
				<form:select path="eamBuildState" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_sys_build_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">未来走向：</label>
			<div class="controls">
				<form:select path="eamTrend" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_sys_trend')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="375" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sysmng:eamSystem:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>