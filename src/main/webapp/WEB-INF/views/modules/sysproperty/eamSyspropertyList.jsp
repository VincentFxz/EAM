<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统属性管理</title>
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
		<li class="active"><a href="${ctx}/sysproperty/eamSysproperty/">系统属性列表</a></li>
		<shiro:hasPermission name="sysproperty:eamSysproperty:edit"><li><a href="${ctx}/sysproperty/eamSysproperty/form">系统属性添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamSysproperty" action="${ctx}/sysproperty/eamSysproperty/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<%--<li><label>id：</label>--%>
				<%--<form:input path="id" htmlEscape="false" maxlength="100" class="input-medium"/>--%>
			<%--</li>--%>
			<li><label>属性名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>属性类别：</label>
				<form:select path="eamSyspropTypeId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamSyspropTypeIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
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
				<th>属性名称</th>
				<th>中文名称</th>
				<th>系统属性类别</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sysproperty:eamSysproperty:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamSysproperty">
			<tr>
				<td><a href="${ctx}/sysproperty/eamSysproperty/form?id=${eamSysproperty.id}">
					${eamSysproperty.name}
				</a></td>
				<td>
					${eamSysproperty.chineseName}
				</td>
				<td>
					<a href="javascript:" onclick="$('#eamSyspropTypeId').val('${eamSysproperty.eamSyspropType.id}');$('#searchForm').submit();return false;">${eamSysproperty.eamSyspropType.name}</a>
				</td>
				<td>
					<fmt:formatDate value="${eamSysproperty.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamSysproperty.remarks}
				</td>
				<shiro:hasPermission name="sysproperty:eamSysproperty:edit"><td>
    				<a href="${ctx}/sysproperty/eamSysproperty/form?id=${eamSysproperty.id}">修改</a>
					<a href="${ctx}/sysproperty/eamSysproperty/delete?id=${eamSysproperty.id}" onclick="return confirmx('确认要删除该系统属性吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>