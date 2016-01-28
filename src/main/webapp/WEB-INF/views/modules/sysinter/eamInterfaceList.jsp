<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接口管理</title>
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
		<li class="active"><a href="${ctx}/sysinter/eamInterface/">接口列表</a></li>
		<shiro:hasPermission name="sysinter:eamInterface:edit"><li><a href="${ctx}/sysinter/eamInterface/form">接口添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamInterface" action="${ctx}/sysinter/eamInterface/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>接口名称：</label>
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
				<th>接口名称</th>
				<th>启用时间</th>
				<th>是否账务交易</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sysinter:eamInterface:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamInterface">
			<tr>
				<td><a href="${ctx}/sysinter/eamInterface/form?id=${eamInterface.id}">
					${eamInterface.name}
				</a></td>
				<td>
					<fmt:formatDate value="${eamInterface.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(eamInterface.accountTrade, 'yes_no', '')}
				</td>
				<td>
					<fmt:formatDate value="${eamInterface.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamInterface.remarks}
				</td>
				<shiro:hasPermission name="sysinter:eamInterface:edit"><td>
    				<a href="${ctx}/sysinter/eamInterface/form?id=${eamInterface.id}">修改</a>
					<a href="${ctx}/sysinter/eamInterface/delete?id=${eamInterface.id}" onclick="return confirmx('确认要删除该接口吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>