<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统决策管理</title>
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
		<li class="active"><a href="${ctx}/sysstr/eamAaStrategy/">系统决策列表</a></li>
		<shiro:hasPermission name="sysstr:eamAaStrategy:edit"><li><a href="${ctx}/sysstr/eamAaStrategy/form">系统决策添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamAaStrategy" action="${ctx}/sysstr/eamAaStrategy/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="250" class="input-medium"/>
			</li>
			<li><label>中文名：</label>
				<form:input path="chineseName" htmlEscape="false" maxlength="375" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>决策点名称</th>
				<th>决策点中文名</th>
				<th>决策过程</th>
				<th>结论</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sysstr:eamAaStrategy:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamAaStrategy">
			<tr>
				<td><a href="${ctx}/sysstr/eamAaStrategy/form?id=${eamAaStrategy.id}">
					${eamAaStrategy.name}
				</a></td>
				<td>
					${eamAaStrategy.chineseName}
				</td>
				<td>
					${eamAaStrategy.strategyProcess}
				</td>
				<td>
					${eamAaStrategy.conclusion}
				</td>
				<td>
					${eamAaStrategy.updateBy.id}
				</td>
				<td>
					<fmt:formatDate value="${eamAaStrategy.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamAaStrategy.remarks}
				</td>
				<shiro:hasPermission name="sysstr:eamAaStrategy:edit"><td>
    				<a href="${ctx}/sysstr/eamAaStrategy/form?id=${eamAaStrategy.id}">修改</a>
					<a href="${ctx}/sysstr/eamAaStrategy/delete?id=${eamAaStrategy.id}" onclick="return confirmx('确认要删除该系统决策吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>