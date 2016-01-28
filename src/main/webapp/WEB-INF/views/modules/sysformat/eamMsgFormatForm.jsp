<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>报文格式管理</title>
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
		<li><a href="${ctx}/sysformat/eamMsgFormat/">报文格式列表</a></li>
		<li class="active"><a href="${ctx}/sysformat/eamMsgFormat/form?id=${eamMsgFormat.id}">报文格式<shiro:hasPermission name="sysformat:eamMsgFormat:edit">${not empty eamMsgFormat.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sysformat:eamMsgFormat:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamMsgFormat" action="${ctx}/sysformat/eamMsgFormat/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">报文格式名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报文格式中文名：</label>
			<div class="controls">
				<form:input path="chineseName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报文格式：</label>
			<div class="controls">
				<form:select path="format" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_format')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<sys:dict description="报文格式" type="eam_format" sort="${(fns:getDictList('eam_format').size()+1)*30}"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报文头：</label>
			<div class="controls">
				<form:input path="msgHead" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报文体：</label>
			<div class="controls">
				<form:input path="msgBody" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">最大长度：</label>
			<div class="controls">
				<form:input path="maxLength" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sysformat:eamMsgFormat:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
        <ul class="nav">
            <!-- 请将 param 替换为具体参数 -->

            <%--<li><a href="${ctx}/sysnode/eamLinknode/param?param=${param}&param1=param1">${not empty eamMsgFormat.id?'相关实体':''}</a></li><br>--%>
        </ul>
    </div>
</body>
</html>