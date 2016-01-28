<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统属性类别管理</title>
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
		<li class="active"><a href="${ctx}/sysproptype/eamSyspropType/">系统属性类别列表</a></li>
		<shiro:hasPermission name="sysproptype:eamSyspropType:edit"><li><a href="${ctx}/sysproptype/eamSyspropType/form">系统属性类别添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamSyspropType" action="${ctx}/sysproptype/eamSyspropType/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>属性分类名称：</label>
				<form:input path="name" htmlEscape="false" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>属性分类名称</th>
				<th>中文名称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sysproptype:eamSyspropType:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamSyspropType">
			<tr>
				<td><a href="${ctx}/sysproptype/eamSyspropType/form?id=${eamSyspropType.id}">
					${eamSyspropType.name}
				</a></td>
				<td>
					${eamSyspropType.chineseName}
				</td>
				<td>
					<fmt:formatDate value="${eamSyspropType.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamSyspropType.remarks}
				</td>
				<shiro:hasPermission name="sysproptype:eamSyspropType:edit"><td>
    				<a href="${ctx}/sysproptype/eamSyspropType/form?id=${eamSyspropType.id}">修改</a>
					<a href="${ctx}/sysproptype/eamSyspropType/delete?id=${eamSyspropType.id}" onclick="return confirmx('确认要删除该系统属性类别吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>