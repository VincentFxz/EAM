<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>应用系统管理</title>
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
		<li class="active"><a href="${ctx}/sysmng/eamSystem/">应用系统列表</a></li>
		<shiro:hasPermission name="sysmng:eamSystem:edit"><li><a href="${ctx}/sysmng/eamSystem/form">应用系统添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamSystem" action="${ctx}/sysmng/eamSystem/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>系统名称：</label>
				<form:input path="name" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>所属系统群组：</label>
				<form:select path="eamSysgroupId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamSysgroupIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>

			</li>
			<li>&nbsp;&nbsp;所属应用架构层次：
				<form:select path="eamAaLayerId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${eamAaLayerIdList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
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
				<th>系统编号</th>
				<th>系统名称</th>
				<th>所属银行</th>
				<th>所属系统群组</th>
				<th>所属应用架构层次</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sysmng:eamSystem:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamSystem">
			<tr>
				<td><a href="${ctx}/sysmng/eamSystem/form?id=${eamSystem.id}">
					${eamSystem.no}
				</a></td>
				<td>
					<%--${eamSystem.name}--%>
					<a href="javascript:" onclick="$('#name').val('${eamSystem.name}');$('#searchForm').submit();return false;">${eamSystem.name}</a>
				</td>
				<td>
					${fns:getDictLabel(eamSystem.eamBank, 'eam_bank', '')}
				</td>
				<td>
					<a href="javascript:" onclick="$('#eamSysgroupId').val('${eamSystem.eamSysgroup.id}');$('#searchForm').submit();return false;">${eamSystem.eamSysgroup.name}</a>				</td>
				<td>
					<a href="javascript:" onclick="$('#eamAaLayerId').val('${eamSystem.eamAaLayer.id}');$('#searchForm').submit();return false;">${eamSystem.eamAaLayer.name}</a>
				</td>
				<td>
					<fmt:formatDate value="${eamSystem.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamSystem.remarks}
				</td>
				<shiro:hasPermission name="sysmng:eamSystem:edit"><td>
    				<a href="${ctx}/sysmng/eamSystem/form?id=${eamSystem.id}">修改</a>
					<a href="${ctx}/sysmng/eamSystem/delete?id=${eamSystem.id}" onclick="return confirmx('确认要删除该应用系统吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>