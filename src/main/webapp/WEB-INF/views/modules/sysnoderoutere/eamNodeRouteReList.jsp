<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>节点路由关系管理</title>
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
		<li class="active"><a href="${ctx}/sysnoderoutere/eamNodeRouteRe/">节点路由关系列表</a></li>
		<shiro:hasPermission name="sysnoderoutere:eamNodeRouteRe:edit"><li><a href="${ctx}/sysnoderoutere/eamNodeRouteRe/form">节点路由关系添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamNodeRouteRe" action="${ctx}/sysnoderoutere/eamNodeRouteRe/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>节点：</label>
				<form:select path="eamLinknodeId" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${eamLinknodeIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</li>
			<li><label>路由：</label>
				<form:select path="eamRouteAlgId" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${eamRouteAlgIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>节点</th>
				<th>路由</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sysnoderoutere:eamNodeRouteRe:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamNodeRouteRe">
			<tr>
				<td><a href="${ctx}/sysnoderoutere/eamNodeRouteRe/form?id=${eamNodeRouteRe.id}">
					${eamNodeRouteRe.eamLinknode.name}</a>

				<td>
					<a href="javascript:" onclick="$('#eamRouteAlgId').val('${eamNodeRouteRe.eamRouteAlg.id}');$('#searchForm').submit();return false;">${eamNodeRouteRe.eamRouteAlg.name}</a>
				</td>
				<td>
					<fmt:formatDate value="${eamNodeRouteRe.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamNodeRouteRe.remarks}
				</td>
				<shiro:hasPermission name="sysnoderoutere:eamNodeRouteRe:edit"><td>
    				<a href="${ctx}/sysnoderoutere/eamNodeRouteRe/form?id=${eamNodeRouteRe.id}">修改</a>
					<a href="${ctx}/sysnoderoutere/eamNodeRouteRe/delete?id=${eamNodeRouteRe.id}" onclick="return confirmx('确认要删除该节点路由关系吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>