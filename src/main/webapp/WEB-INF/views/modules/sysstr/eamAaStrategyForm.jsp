<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统决策管理</title>
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
		<li><a href="${ctx}/sysstr/eamAaStrategy/">系统决策列表</a></li>
		<li class="active"><a href="${ctx}/sysstr/eamAaStrategy/form?id=${eamAaStrategy.id}">系统决策<shiro:hasPermission name="sysstr:eamAaStrategy:edit">${not empty eamAaStrategy.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sysstr:eamAaStrategy:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="eamAaStrategy" action="${ctx}/sysstr/eamAaStrategy/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">决策点名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="250" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">决策点中文名：</label>
			<div class="controls">
				<form:input path="chineseName" htmlEscape="false" maxlength="375" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">决策过程：</label>
			<div class="controls">
				<form:input path="strategyProcess" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结论：</label>
			<div class="controls">
<<<<<<< HEAD:src/main/webapp/WEB-INF/views/modules/sysstr/eamAaStrategyForm.jsp
				<form:input path="conclusion" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
=======
				<form:input path="conclusion" htmlEscape="false" maxlength="2047" class="input-xlarge "/>
>>>>>>> 5220b94db6a71e15f247e574d1634f41421384aa:src/main/webapp/WEB-INF/views/modules/strategy/eamAaStrategyForm.jsp
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="375" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sysstr:eamAaStrategy:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>