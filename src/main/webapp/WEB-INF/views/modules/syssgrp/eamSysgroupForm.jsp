<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统群组管理</title>
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
		<li><a href="${ctx}/syssgrp/eamSysgroup/">系统群组列表</a></li>
		<li class="active"><a href="${ctx}/syssgrp/eamSysgroup/form?id=${eamSysgroup.id}">系统群组<shiro:hasPermission name="syssgrp:eamSysgroup:edit">${not empty eamSysgroup.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="syssgrp:eamSysgroup:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamSysgroup" action="${ctx}/syssgrp/eamSysgroup/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">群组名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="250" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">群组简称：</label>
			<div class="controls">
				<form:input path="chineseName" htmlEscape="false" maxlength="250" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="syssgrp:eamSysgroup:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
        <ul class="nav">
            <!-- 请将 param 替换为具体参数 -->
			<li><a href="${ctx}/sysmng/eamSystem/list?eamSysgroupId=${eamSysgroup.id}">${not empty eamSysgroup.id?'相关系统':''}</a></li><br>
        </ul>
    </div>
</body>
</html>