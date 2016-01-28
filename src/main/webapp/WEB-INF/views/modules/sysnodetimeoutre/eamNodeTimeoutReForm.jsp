<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>节点超时算法关系管理</title>
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
		<li><a href="${ctx}/sysnodetimeoutre/eamNodeTimeoutRe/">节点超时算法关系列表</a></li>
		<li class="active"><a href="${ctx}/sysnodetimeoutre/eamNodeTimeoutRe/form?id=${eamNodeTimeoutRe.id}">节点超时算法关系<shiro:hasPermission name="sysnodetimeoutre:eamNodeTimeoutRe:edit">${not empty eamNodeTimeoutRe.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sysnodetimeoutre:eamNodeTimeoutRe:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div style="position:absolute;left:0px;width:80%">
	<form:form id="inputForm" modelAttribute="eamNodeTimeoutRe" action="${ctx}/sysnodetimeoutre/eamNodeTimeoutRe/save" method="post" class="form-horizontal">
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
			<label class="control-label">超时算法：</label>
			<div class="controls">
				<form:select path="eamTimeoutAlgId" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${eamTimeoutAlgIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
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
			<shiro:hasPermission name="sysnodetimeoutre:eamNodeTimeoutRe:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	    </div>
    <div style="position:absolute;left:80%">
        <ul class="nav">
            <!-- 请将 param 替换为具体参数 -->
            <li><a href="${ctx}/sysnode/eamLinknode/list?id=${eamNodeTimeoutRe.eamLinknodeId}">${not empty eamNodeTimeoutRe.eamLinknodeId?'相关节点':''}</a></li><br>
            <li><a href="${ctx}/timeout/eamTimeoutAlg/list?id=${eamNodeTimeoutRe.eamTimeoutAlgId}">${not empty eamNodeTimeoutRe.eamTimeoutAlgId?'相关超时算法':''}</a></li><br>
        </ul>
    </div>
</body>
</html>