<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>节点日志关系管理</title>
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
		<li><a href="${ctx}/sysnodelogre/eamNodeLogtypeRe/">节点日志关系列表</a></li>
		<li class="active"><a href="${ctx}/sysnodelogre/eamNodeLogtypeRe/form?id=${eamNodeLogtypeRe.id}">节点日志关系<shiro:hasPermission name="sysnodelogre:eamNodeLogtypeRe:edit">${not empty eamNodeLogtypeRe.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sysnodelogre:eamNodeLogtypeRe:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamNodeLogtypeRe" action="${ctx}/sysnodelogre/eamNodeLogtypeRe/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">节点：</label>
			<div class="controls">
				<form:select path="eamLinknodeId" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${eamLinknodeIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">日志：</label>
			<div class="controls">
				<form:select path="eamLogTypeId" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${eamLogTypeIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sysnodelogre:eamNodeLogtypeRe:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
        <ul class="nav">
            <!-- 请将 param 替换为具体参数 -->
            <li><a href="${ctx}/sysnode/eamLinknode/list?id=${eamNodeLogtypeRe.eamLinknodeId}">${not empty eamNodeLogtypeRe.eamLinknodeId?'相关节点':''}</a></li><br>
            <li><a href="${ctx}/log/eamLogType/list?id=${eamNodeLogtypeRe.eamLogTypeId}">${not empty eamNodeLogtypeRe.eamLogTypeId?'相关日志':''}</a></li><br>
        </ul>
    </div>
</body>
</html>