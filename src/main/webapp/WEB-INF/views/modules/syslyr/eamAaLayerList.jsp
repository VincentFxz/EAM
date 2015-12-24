<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>架构层次管理</title>
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
		<li class="active"><a href="${ctx}/syslyr/eamAaLayer/">架构层次列表</a></li>
		<shiro:hasPermission name="syslyr:eamAaLayer:edit"><li><a href="${ctx}/syslyr/eamAaLayer/form">架构层次添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamAaLayer" action="${ctx}/syslyr/eamAaLayer/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>架构层次名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="250" class="input-medium"/>
			</li>
			<li><label>架构层次简称：</label>
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
				<th>架构层次名称</th>
				<th>架构层次简称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="syslyr:eamAaLayer:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamAaLayer">
			<tr>
				<td><a href="${ctx}/syslyr/eamAaLayer/form?id=${eamAaLayer.id}">
					${eamAaLayer.name}
				</a></td>
				<td>
					${eamAaLayer.chineseName}
				</td>
				<td>
					<fmt:formatDate value="${eamAaLayer.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamAaLayer.remarks}
				</td>
				<shiro:hasPermission name="syslyr:eamAaLayer:edit"><td>
    				<a href="${ctx}/syslyr/eamAaLayer/form?id=${eamAaLayer.id}">修改</a>
					<a href="${ctx}/syslyr/eamAaLayer/delete?id=${eamAaLayer.id}" onclick="return confirmx('确认要删除该架构层次吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>