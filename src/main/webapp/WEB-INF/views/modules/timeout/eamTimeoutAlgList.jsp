<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>超时算法管理</title>
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
		<li class="active"><a href="${ctx}/timeout/eamTimeoutAlg/">超时算法列表</a></li>
		<shiro:hasPermission name="timeout:eamTimeoutAlg:edit"><li><a href="${ctx}/timeout/eamTimeoutAlg/form">超时算法添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamTimeoutAlg" action="${ctx}/timeout/eamTimeoutAlg/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
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
				<th>名称</th>
				<th>中文名称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="timeout:eamTimeoutAlg:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamTimeoutAlg">
			<tr>
				<td><a href="${ctx}/timeout/eamTimeoutAlg/form?id=${eamTimeoutAlg.id}">
					${eamTimeoutAlg.name}
				</a></td>
				<td>
					${eamTimeoutAlg.chineseName}
				</td>
				<td>
					<fmt:formatDate value="${eamTimeoutAlg.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamTimeoutAlg.remarks}
				</td>
				<shiro:hasPermission name="timeout:eamTimeoutAlg:edit"><td>
    				<a href="${ctx}/timeout/eamTimeoutAlg/form?id=${eamTimeoutAlg.id}">修改</a>
					<a href="${ctx}/timeout/eamTimeoutAlg/delete?id=${eamTimeoutAlg.id}" onclick="return confirmx('确认要删除该超时算法吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>