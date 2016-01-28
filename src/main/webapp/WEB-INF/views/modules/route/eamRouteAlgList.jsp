<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>路由管理</title>
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
		<li class="active"><a href="${ctx}/route/eamRouteAlg/">路由列表</a></li>
		<shiro:hasPermission name="route:eamRouteAlg:edit"><li><a href="${ctx}/route/eamRouteAlg/form">路由添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamRouteAlg" action="${ctx}/route/eamRouteAlg/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>路由名称：</label>
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
				<th>路由名称</th>
				<th>基础路由</th>
				<th>路由表维护</th>
				<th>路由表存储</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="route:eamRouteAlg:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamRouteAlg">
			<tr>
				<td><a href="${ctx}/route/eamRouteAlg/form?id=${eamRouteAlg.id}">
					${eamRouteAlg.name}
				</a></td>
				<td>
					${eamRouteAlg.routeBasis}
				</td>
				<td>
					${eamRouteAlg.rtableMaintain}
				</td>
				<td>
					${eamRouteAlg.rtableStore}
				</td>
				<td>
					<fmt:formatDate value="${eamRouteAlg.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamRouteAlg.remarks}
				</td>
				<shiro:hasPermission name="route:eamRouteAlg:edit"><td>
    				<a href="${ctx}/route/eamRouteAlg/form?id=${eamRouteAlg.id}">修改</a>
					<a href="${ctx}/route/eamRouteAlg/delete?id=${eamRouteAlg.id}" onclick="return confirmx('确认要删除该路由吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>