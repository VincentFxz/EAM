<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统属性关系管理</title>
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
		<li class="active"><a href="${ctx}/syspropertyre/eamSystemSyspropertyRe/">系统属性关系列表</a></li>
		<shiro:hasPermission name="syspropertyre:eamSystemSyspropertyRe:edit"><li><a href="${ctx}/syspropertyre/eamSystemSyspropertyRe/form">系统属性关系添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamSystemSyspropertyRe" action="${ctx}/syspropertyre/eamSystemSyspropertyRe/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>系统：</label>
				<form:select path="eamSystemId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamSystemIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</li>
			<li><label>属性：</label>
				<form:select path="eamSyspropertyId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamSyspropertyIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
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
				<th>系统</th>
				<th>属性</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="syspropertyre:eamSystemSyspropertyRe:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamSystemSyspropertyRe">
			<tr>
				<td><a href="${ctx}/syspropertyre/eamSystemSyspropertyRe/form?id=${eamSystemSyspropertyRe.id}">
					${eamSystemSyspropertyRe.eamSystem.name}</a>
				<td>
					<a href="javascript:" onclick="$('#eamSyspropertyId').val('${eamSystemSyspropertyRe.eamSysproperty.id}');$('#searchForm').submit();return false;">${eamSystemSyspropertyRe.eamSysproperty.name}</a>				</td>
				<td>
					<fmt:formatDate value="${eamSystemSyspropertyRe.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamSystemSyspropertyRe.remarks}
				</td>
				<shiro:hasPermission name="syspropertyre:eamSystemSyspropertyRe:edit"><td>
    				<a href="${ctx}/syspropertyre/eamSystemSyspropertyRe/form?id=${eamSystemSyspropertyRe.id}">修改</a>
					<a href="${ctx}/syspropertyre/eamSystemSyspropertyRe/delete?id=${eamSystemSyspropertyRe.id}" onclick="return confirmx('确认要删除该系统属性关系吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>