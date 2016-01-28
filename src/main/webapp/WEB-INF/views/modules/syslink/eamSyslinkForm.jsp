<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>节点关联管理</title>
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
		<li><a href="${ctx}/syslink/eamSyslink/">节点关联列表</a></li>
		<li class="active"><a href="${ctx}/syslink/eamSyslink/form?id=${eamSyslink.id}">节点关联<shiro:hasPermission name="syslink:eamSyslink:edit">${not empty eamSyslink.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="syslink:eamSyslink:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamSyslink" action="${ctx}/syslink/eamSyslink/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">关系名称：</label>
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
			<label class="control-label">关联关系类型：</label>
			<div class="controls">
				<form:select path="linkType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('link_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<sys:dict description="关联关系类型" type="link_type" sort="${(fns:getDictList('link_type').size()+1)*30}"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">起始系统：</label>
			<div class="controls">
				<form:select path="eamSystemStartId" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${eamSystemStartIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">起始节点：</label>
			<div class="controls">
				<form:select path="startLinknodeId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${startLinknodeIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">终止系统：</label>
			<div class="controls">
				<form:select path="eamSystemEndId" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${eamSystemEndIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">终止节点：</label>
			<div class="controls">
				<form:select path="endLinknodeId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${endLinknodeIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">关联关系状态：</label>
			<div class="controls">
				<form:select path="linkStatus" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('link_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<sys:dict description="关联关系状态" type="link_status" sort="${(fns:getDictList('link_status').size()+1)*30}"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="syslink:eamSyslink:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
        <ul class="nav">
            <!-- 请将 param 替换为具体参数 -->
            <li><a href="${ctx}/sysnode/eamLinknode/param?param=${param}">${not empty eamSyslink.id?'相关实体':''}</a></li><br>
            <li><a href="${ctx}/sysnode/eamLinknode/param?param=${param}&param1=param1">${not empty eamSyslink.id?'相关实体':''}</a></li><br>
        </ul>
    </div>
</body>
</html>