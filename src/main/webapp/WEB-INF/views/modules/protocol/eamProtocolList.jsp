<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>协议管理</title>
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
		<li class="active"><a href="${ctx}/protocol/eamProtocol/">协议列表</a></li>
		<shiro:hasPermission name="protocol:eamProtocol:edit"><li><a href="${ctx}/protocol/eamProtocol/form">协议添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamProtocol" action="${ctx}/protocol/eamProtocol/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>协议名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>链接类型：</label>
				<form:select path="linkType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('eam_link_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>协议名称</th>
				<th>访问地址</th>
				<th>链接类型</th>
				<th>最大包长度</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="protocol:eamProtocol:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamProtocol">
			<tr>
				<td><a href="${ctx}/protocol/eamProtocol/form?id=${eamProtocol.id}">
					${eamProtocol.name}
				</a></td>
				<td>
					${eamProtocol.address}
				</td>
				<td>
					${fns:getDictLabel(eamProtocol.linkType, 'eam_link_type', '')}
				</td>
				<td>
					${eamProtocol.maxpackage}
				</td>
				<td>
					<fmt:formatDate value="${eamProtocol.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamProtocol.remarks}
				</td>
				<shiro:hasPermission name="protocol:eamProtocol:edit"><td>
    				<a href="${ctx}/protocol/eamProtocol/form?id=${eamProtocol.id}">修改</a>
					<a href="${ctx}/protocol/eamProtocol/delete?id=${eamProtocol.id}" onclick="return confirmx('确认要删除该协议吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>