<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接口清单管理管理</title>
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
		<li><a href="${ctx}/interfacelist/eamInterface/">接口清单管理列表</a></li>
		<li class="active"><a href="${ctx}/interfacelist/eamInterface/form?id=${eamInterface.id}">接口清单管理<shiro:hasPermission name="interfacelist:eamInterface:edit">${not empty eamInterface.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="interfacelist:eamInterface:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="eamInterface" action="${ctx}/interfacelist/eamInterface/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">接口名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">接口中文名：</label>
			<div class="controls">
				<form:input path="chineseName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属关联节点编号：</label>
			<div class="controls">
				<form:input path="eamLinknodeId" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">请求消息格式：</label>
			<div class="controls">
				<form:input path="reqMsgFormat" htmlEscape="false" maxlength="2047" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">响应消息格式：</label>
			<div class="controls">
				<form:input path="rspMsgFormat" htmlEscape="false" maxlength="2047" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">启用时间：</label>
			<div class="controls">
				<form:input path="startDate" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否账务交易：</label>
			<div class="controls">
				<form:input path="accountTrade" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="interfacelist:eamInterface:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>