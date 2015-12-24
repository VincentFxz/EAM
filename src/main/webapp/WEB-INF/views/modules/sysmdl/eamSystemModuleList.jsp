<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>模块管理</title>
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
		<li class="active"><a href="${ctx}/sysmdl/eamSystemModule/">模块列表</a></li>
		<shiro:hasPermission name="sysmdl:eamSystemModule:edit"><li><a href="${ctx}/sysmdl/eamSystemModule/form">模块添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamSystemModule" action="${ctx}/sysmdl/eamSystemModule/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>所属系统：</label>
				<form:select path="eamSystemId" class="input-medium">
					<form:option value="" label=""/>
                    <form:options items="${sysList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>模块名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>中文名称：</label>
				<form:input path="chineseName" htmlEscape="false" maxlength="382.5" class="input-medium"/>
			</li>
			<li><label>模块负责人：</label>
                <sys:treeselect id="manager" name="manager" value="${eamSystemModule.manager.id}" labelName="eamSystemModule.manager.name" labelValue="${eamSystemModule.manager.name}"
                                title="用户" url="/sys/office/treeData?type=3" allowClear="true" notAllowSelectParent="true"/>
            </li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>模块名称</th>
				<th>中文名称</th>
				<th>模块负责人</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sysmdl:eamSystemModule:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamSystemModule">
			<tr>
				<td><a href="${ctx}/sysmdl/eamSystemModule/form?id=${eamSystemModule.id}">
					${eamSystemModule.name}
				</a></td>
				<td>
					${eamSystemModule.chineseName}
				</td>
				<td>
                    ${eamSystemModule.manager.name}
				</td>
				<td>
					<fmt:formatDate value="${eamSystemModule.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamSystemModule.remarks}
				</td>
				<shiro:hasPermission name="sysmdl:eamSystemModule:edit"><td>
    				<a href="${ctx}/sysmdl/eamSystemModule/form?id=${eamSystemModule.id}">修改</a>
					<a href="${ctx}/sysmdl/eamSystemModule/delete?id=${eamSystemModule.id}" onclick="return confirmx('确认要删除该模块吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>