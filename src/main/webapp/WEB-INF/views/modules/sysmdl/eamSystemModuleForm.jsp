<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统模块管理</title>
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
		<li><a href="${ctx}/sysmdl/eamSystemModule/">系统模块列表</a></li>
		<li class="active"><a href="${ctx}/sysmdl/eamSystemModule/form?id=${eamSystemModule.id}">系统模块<shiro:hasPermission name="sysmdl:eamSystemModule:edit">${not empty eamSystemModule.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sysmdl:eamSystemModule:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamSystemModule" action="${ctx}/sysmdl/eamSystemModule/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">模块名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="250" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">中文名称：</label>
			<div class="controls">
				<form:input path="chineseName" htmlEscape="false" maxlength="250" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属系统：</label>
			<div class="controls">
				<form:select path="eamSystemId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamSystemIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">模块负责人：</label>
			<%--<div class="controls">--%>
				<%--<sys:treeselect id="manager" name="manager.id" value="${eamSystemModule.manager.id}" labelName="" labelValue="${eamSystemModule.}"--%>
					<%--title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>--%>
			<%--</div>--%>
			<div class="controls">
				<sys:treeselect id="manager" name="manager" value="${eamSystemModule.manager.id}" labelName="eamSystemModule.manager.name" labelValue="${eamSystemModule.manager.name}"
								title="用户" url="/sys/office/treeData?type=3" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sysmdl:eamSystemModule:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
        <ul class="nav">
            <!-- 请将 param 替换为具体参数 -->
			<li><a href="${ctx}/sysmng/eamSystem/list?id=${eamSystemModule.eamSystemId}">${not empty eamSystemModule.eamSystemId?'所属系统':''}</a></li><br>

        </ul>
    </div>
</body>
</html>