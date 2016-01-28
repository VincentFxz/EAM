<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>节点路由关系管理</title>
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
		<li><a href="${ctx}/sysnoderoutere/eamNodeRouteRe/">节点路由关系列表</a></li>
		<li class="active"><a href="${ctx}/sysnoderoutere/eamNodeRouteRe/form?id=${eamNodeRouteRe.id}">节点路由关系<shiro:hasPermission name="sysnoderoutere:eamNodeRouteRe:edit">${not empty eamNodeRouteRe.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sysnoderoutere:eamNodeRouteRe:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamNodeRouteRe" action="${ctx}/sysnoderoutere/eamNodeRouteRe/save" method="post" class="form-horizontal">
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
			<label class="control-label">路由：</label>
			<div class="controls">
				<form:select path="eamRouteAlgId" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${eamRouteAlgIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
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
			<shiro:hasPermission name="sysnoderoutere:eamNodeRouteRe:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
        <ul class="nav">
            <!-- 请将 param 替换为具体参数 -->
            <li><a href="${ctx}/sysnode/eamLinknode/list?id=${eamNodeRouteRe.eamLinknodeId}">${not empty eamNodeRouteRe.eamLinknodeId?'相关节点':''}</a></li><br>
            <li><a href="${ctx}/route/eamRouteAlg/list?id=${eamNodeRouteRe.eamRouteAlgId}">${not empty eamNodeRouteRe.eamRouteAlgId?'相关路由':''}</a></li><br>
        </ul>
    </div>
</body>
</html>