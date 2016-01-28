<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统属性管理</title>
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
		<li><a href="${ctx}/sysproperty/eamSysproperty/">系统属性列表</a></li>
		<li class="active"><a href="${ctx}/sysproperty/eamSysproperty/form?id=${eamSysproperty.id}">系统属性<shiro:hasPermission name="sysproperty:eamSysproperty:edit">${not empty eamSysproperty.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sysproperty:eamSysproperty:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamSysproperty" action="${ctx}/sysproperty/eamSysproperty/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">属性名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">中文名称：</label>
			<div class="controls">
				<form:input path="chineseName" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">系统属性类别：</label>
			<div class="controls">
				<form:select path="eamSyspropTypeId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamSyspropTypeIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sysproperty:eamSysproperty:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
        <ul class="nav">
            <!-- 请将 param 替换为具体参数 -->
			<li><a href="${ctx}/sysproptype/eamSyspropType/list?id=${eamSysproperty.eamSyspropTypeId}">${not empty eamSysproperty.eamSyspropTypeId?'属性类别':''}</a></li><br>

		</ul>
    </div>
</body>
</html>