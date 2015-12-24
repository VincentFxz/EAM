<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统群组管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/syssgrp/eamSysgroup/">系统群组列表</a></li>
		<shiro:hasPermission name="syssgrp:eamSysgroup:edit"><li><a href="${ctx}/syssgrp/eamSysgroup/form">系统群组添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamSysgroup" action="${ctx}/syssgrp/eamSysgroup/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>群组名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="250" class="input-medium"/>
			</li>
			<li><label>群组简称：</label>
				<form:input path="chineseName" htmlEscape="false" maxlength="250" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>群组名称</th>
				<th>群组简称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="syssgrp:eamSysgroup:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamSysgroup">
			<tr>
				<td><a href="${ctx}/syssgrp/eamSysgroup/form?id=${eamSysgroup.id}">
					${eamSysgroup.name}
				</a></td>
				<td>
					${eamSysgroup.chineseName}
				</td>
				<td>
					<fmt:formatDate value="${eamSysgroup.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamSysgroup.remarks}
				</td>
				<shiro:hasPermission name="syssgrp:eamSysgroup:edit"><td>
    				<a href="${ctx}/syssgrp/eamSysgroup/form?id=${eamSysgroup.id}">修改</a>
					<a href="${ctx}/syssgrp/eamSysgroup/delete?id=${eamSysgroup.id}" onclick="return confirmx('确认要删除该系统群组吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>