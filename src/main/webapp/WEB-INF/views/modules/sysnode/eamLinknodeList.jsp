<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统节点管理</title>
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
		<li class="active"><a href="${ctx}/sysnode/eamLinknode/">系统节点列表</a></li>
		<shiro:hasPermission name="sysnode:eamLinknode:edit"><li><a href="${ctx}/sysnode/eamLinknode/form">系统节点添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamLinknode" action="${ctx}/sysnode/eamLinknode/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>节点名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="250" class="input-medium"/>
			</li>
			<li><label>节点系统：</label>
				<form:select path="eamSystemId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamSystemIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</li>
			<li><label>节点类型：</label>
				<form:select path="linknodeType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('linknode_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>

			</li>
			<li><label>通讯协议：</label>
				<form:select path="eamProtocolId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamProtocolIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
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
				<th>节点名称</th>
				<th>节点系统</th>
				<th>节点类型</th>
				<th>通讯协议</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sysnode:eamLinknode:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamLinknode">
			<tr>
				<td><a href="${ctx}/sysnode/eamLinknode/form?id=${eamLinknode.id}">
					${eamLinknode.name}
				</a></td>
				<td>
					<a href="javascript:" onclick="$('#eamSystemId').val('${eamLinknode.eamSystem.id}');$('#searchForm').submit();return false;">${eamLinknode.eamSystem.name}</a>				</td>
				<td>
					${fns:getDictLabel(eamLinknode.linknodeType, 'linknode_type', '')}
				</td>
				<td>
					<a href="javascript:" onclick="$('#eamProtocolId').val('${eamLinknode.eamProtocol.id}');$('#searchForm').submit();return false;">${eamLinknode.eamProtocol.name}</a>				</td>
				<td>
					<fmt:formatDate value="${eamLinknode.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamLinknode.remarks}
				</td>
				<shiro:hasPermission name="sysnode:eamLinknode:edit"><td>
    				<a href="${ctx}/sysnode/eamLinknode/form?id=${eamLinknode.id}">修改</a>
					<a href="${ctx}/sysnode/eamLinknode/delete?id=${eamLinknode.id}" onclick="return confirmx('确认要删除该系统节点吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>