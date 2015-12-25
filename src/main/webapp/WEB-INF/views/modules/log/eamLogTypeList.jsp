<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>流水日志管理</title>
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
		<li class="active"><a href="${ctx}/log/eamLogType/">流水日志列表</a></li>
		<shiro:hasPermission name="log:eamLogType:edit"><li><a href="${ctx}/log/eamLogType/form">流水日志添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamLogType" action="${ctx}/log/eamLogType/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>日志名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>日志名称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="log:eamLogType:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamLogType">
			<tr>
				<td><a href="${ctx}/log/eamLogType/form?id=${eamLogType.id}">
					${eamLogType.name}
				</a></td>
				<td>
					<fmt:formatDate value="${eamLogType.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamLogType.remarks}
				</td>
				<shiro:hasPermission name="log:eamLogType:edit"><td>
    				<a href="${ctx}/log/eamLogType/form?id=${eamLogType.id}">修改</a>
					<a href="${ctx}/log/eamLogType/delete?id=${eamLogType.id}" onclick="return confirmx('确认要删除该流水日志吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>