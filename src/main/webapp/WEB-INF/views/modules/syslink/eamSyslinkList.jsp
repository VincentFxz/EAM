<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>节点关联管理</title>
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
		<li class="active"><a href="${ctx}/syslink/eamSyslink/">节点关联列表</a></li>
		<shiro:hasPermission name="syslink:eamSyslink:edit"><li><a href="${ctx}/syslink/eamSyslink/form">节点关联添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamSyslink" action="${ctx}/syslink/eamSyslink/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>关系名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="250" class="input-medium"/>
			</li>
			<li><label>关系类型：</label>
				<form:select path="linkType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('link_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>

			</li>
			<li><label>起始系统：</label>
				<form:select path="eamSystemStartId" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${eamSystemStartIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</li>
			<li><label>起始节点：</label>
				<form:select path="startLinknodeId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${startLinknodeIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</li>
			<li><label>终止系统：</label>
				<form:select path="eamSystemEndId" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${eamSystemEndIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</li>
			<li><label>终止节点：</label>
				<form:select path="endLinknodeId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${endLinknodeIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
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
				<th>关系名称</th>
				<th>关联关系类型</th>
				<th>起始系统</th>
				<th>起始节点</th>
				<th>终止系统</th>
				<th>终止节点</th>
				<th>关联关系状态</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="syslink:eamSyslink:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamSyslink">
			<tr>
				<td><a href="${ctx}/syslink/eamSyslink/form?id=${eamSyslink.id}">
					${eamSyslink.name}
				</a></td>
				<td>
					${fns:getDictLabel(eamSyslink.linkType, 'link_type', '')}
				</td>
				<td>
					<a href="javascript:" onclick="$('#eamSystemStartId').val('${eamSyslink.eamSystemStart.id}');$('#searchForm').submit();return false;">${eamSyslink.eamSystemStart.name}</a>				</td>
				<td>
					<a href="javascript:" onclick="$('#startLinknodeId').val('${eamSyslink.startLinknode.id}');$('#searchForm').submit();return false;">${eamSyslink.startLinknode.name}</a>				</td>
				<td>
					<a href="javascript:" onclick="$('#eamSystemEndId').val('${eamSyslink.eamSystemEnd.id}');$('#searchForm').submit();return false;">${eamSyslink.eamSystemEnd.name}</a>				</td>
				<td>
					<a href="javascript:" onclick="$('#endLinknodeId').val('${eamSyslink.endLinknode.id}');$('#searchForm').submit();return false;">${eamSyslink.endLinknode.name}</a>				</td>
				<td>
					${fns:getDictLabel(eamSyslink.linkStatus, 'link_status', '')}
				</td>
				<td>
					<fmt:formatDate value="${eamSyslink.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamSyslink.remarks}
				</td>
				<shiro:hasPermission name="syslink:eamSyslink:edit"><td>
    				<a href="${ctx}/syslink/eamSyslink/form?id=${eamSyslink.id}">修改</a>
					<a href="${ctx}/syslink/eamSyslink/delete?id=${eamSyslink.id}" onclick="return confirmx('确认要删除该节点关联吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>