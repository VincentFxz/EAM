<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>流控算法管理模块管理</title>
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
		<li class="active"><a href="${ctx}/flow/eamFlowCtlAlg/">流控算法管理模块列表</a></li>
		<shiro:hasPermission name="flow:eamFlowCtlAlg:edit"><li><a href="${ctx}/flow/eamFlowCtlAlg/form">流控算法管理模块添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamFlowCtlAlg" action="${ctx}/flow/eamFlowCtlAlg/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>流控名称：</label>
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
				<th>流控名称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="flow:eamFlowCtlAlg:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamFlowCtlAlg">
			<tr>
				<td><a href="${ctx}/flow/eamFlowCtlAlg/form?id=${eamFlowCtlAlg.id}">
					${eamFlowCtlAlg.name}
				</a></td>
				<td>
					<fmt:formatDate value="${eamFlowCtlAlg.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamFlowCtlAlg.remarks}
				</td>
				<shiro:hasPermission name="flow:eamFlowCtlAlg:edit"><td>
    				<a href="${ctx}/flow/eamFlowCtlAlg/form?id=${eamFlowCtlAlg.id}">修改</a>
					<a href="${ctx}/flow/eamFlowCtlAlg/delete?id=${eamFlowCtlAlg.id}" onclick="return confirmx('确认要删除该流控算法管理模块吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>