<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>架构层次管理</title>
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
		<li><a href="${ctx}/syslyr/eamAaLayer/">架构层次列表</a></li>
		<li class="active"><a href="${ctx}/syslyr/eamAaLayer/form?id=${eamAaLayer.id}">架构层次<shiro:hasPermission name="syslyr:eamAaLayer:edit">${not empty eamAaLayer.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="syslyr:eamAaLayer:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="eamAaLayer" action="${ctx}/syslyr/eamAaLayer/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">架构层次名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="250" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">架构层次简称：</label>
			<div class="controls">
				<form:input path="chineseName" htmlEscape="false" maxlength="250" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="375" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="syslyr:eamAaLayer:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>