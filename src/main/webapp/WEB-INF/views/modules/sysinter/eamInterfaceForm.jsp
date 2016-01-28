<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接口管理</title>
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
		<li><a href="${ctx}/sysinter/eamInterface/">接口列表</a></li>
		<li class="active"><a href="${ctx}/sysinter/eamInterface/form?id=${eamInterface.id}">接口<shiro:hasPermission name="sysinter:eamInterface:edit">${not empty eamInterface.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sysinter:eamInterface:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamInterface" action="${ctx}/sysinter/eamInterface/save" method="post" class="form-horizontal">
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
				<input name="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${eamInterface.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否账务交易：</label>
			<div class="controls">
				<form:select path="accountTrade" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<sys:dict description="是否账务交易" type="yes_no" sort="${(fns:getDictList('yes_no').size()+1)*30}"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sysinter:eamInterface:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
        <ul class="nav">
            <!-- 请将 param 替换为具体参数 -->
            <%--<li><a href="${ctx}/sysnode/eamLinknode/param?param=${param}&param1=param1">${not empty eamInterface.id?'相关实体':''}</a></li><br>--%>
        </ul>
    </div>
</body>
</html>