<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>协议管理</title>
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
		<li><a href="${ctx}/protocol/eamProtocol/">协议列表</a></li>
		<li class="active"><a href="${ctx}/protocol/eamProtocol/form?id=${eamProtocol.id}">协议<shiro:hasPermission name="protocol:eamProtocol:edit">${not empty eamProtocol.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="protocol:eamProtocol:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamProtocol" action="${ctx}/protocol/eamProtocol/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">协议名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">中文名称：</label>
			<div class="controls">
				<form:input path="chineseName" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">访问地址：</label>
			<div class="controls">
				<form:input path="address" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">链接类型：</label>
			<div class="controls">
				<form:select path="linkType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_link_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<sys:dict description="链接类型" type="eam_link_type" sort="${(fns:getDictList('eam_link_type').size()+1)*30}"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">最大包长度：</label>
			<div class="controls">
				<form:input path="maxpackage" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="protocol:eamProtocol:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
        <ul class="nav">
            <!-- 请将 param 替换为具体参数 -->
			<li><a href="${ctx}/sysnode/eamLinknode/list?eamProtocolId=${eamProtocol.id}">${not empty eamProtocol.id?'相关系统节点':''}</a></li><br>

		</ul>
    </div>
</body>
</html>