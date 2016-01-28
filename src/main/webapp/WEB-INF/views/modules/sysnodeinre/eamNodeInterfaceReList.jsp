<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>节点接口关系管理</title>
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
		<li class="active"><a href="${ctx}/sysnodeinre/eamNodeInterfaceRe/">节点接口关系列表</a></li>
		<shiro:hasPermission name="sysnodeinre:eamNodeInterfaceRe:edit"><li><a href="${ctx}/sysnodeinre/eamNodeInterfaceRe/form">节点接口关系添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamNodeInterfaceRe" action="${ctx}/sysnodeinre/eamNodeInterfaceRe/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>节点：</label>
				<form:select path="eamLinknodeId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamLinknodeIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</li>
			<li><label>接口：</label>
				<form:select path="eamInterfaceId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamInterfaceIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
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
				<th>接口</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sysnodeinre:eamNodeInterfaceRe:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamNodeInterfaceRe">
			<tr>
				<td><a href="${ctx}/sysnodeinre/eamNodeInterfaceRe/form?id=${eamNodeInterfaceRe.id}">
					${eamNodeInterfaceRe.eamLinknode.name}</a>

				<td>
					<a href="javascript:" onclick="$('#eamInterfaceId').val('${eamNodeInterfaceRe.eamInterface.id}');$('#searchForm').submit();return false;">${eamNodeInterfaceRe.eamInterface.name}</a>
				</td>
				<td>
					<fmt:formatDate value="${eamNodeInterfaceRe.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamNodeInterfaceRe.remarks}
				</td>
				<shiro:hasPermission name="sysnodeinre:eamNodeInterfaceRe:edit"><td>
    				<a href="${ctx}/sysnodeinre/eamNodeInterfaceRe/form?id=${eamNodeInterfaceRe.id}">修改</a>
					<a href="${ctx}/sysnodeinre/eamNodeInterfaceRe/delete?id=${eamNodeInterfaceRe.id}" onclick="return confirmx('确认要删除该节点接口关系吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>