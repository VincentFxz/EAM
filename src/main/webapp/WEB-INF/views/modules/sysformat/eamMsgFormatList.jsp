<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>报文格式管理管理</title>
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
		<li class="active"><a href="${ctx}/sysformat/eamMsgFormat/">报文格式管理列表</a></li>
		<shiro:hasPermission name="sysformat:eamMsgFormat:edit"><li><a href="${ctx}/sysformat/eamMsgFormat/form">报文格式管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eamMsgFormat" action="${ctx}/sysformat/eamMsgFormat/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>报文格式名称：</label>
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
				<th>报文格式名称</th>
				<th>报文格式中文名</th>
				<th>报文格式</th>
				<th>报文头</th>
				<th>报文体</th>
				<th>最大长度</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sysformat:eamMsgFormat:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eamMsgFormat">
			<tr>
				<td><a href="${ctx}/sysformat/eamMsgFormat/form?id=${eamMsgFormat.id}">
					${eamMsgFormat.name}
				</a></td>
				<td>
					${eamMsgFormat.chineseName}
				</td>
				<td>
					${eamMsgFormat.format}
				</td>
				<td>
					${eamMsgFormat.msgHead}
				</td>
				<td>
					${eamMsgFormat.msgBody}
				</td>
				<td>
					${eamMsgFormat.maxLength}
				</td>
				<td>
					${eamMsgFormat.updateBy.id}
				</td>
				<td>
					<fmt:formatDate value="${eamMsgFormat.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${eamMsgFormat.remarks}
				</td>
				<shiro:hasPermission name="sysformat:eamMsgFormat:edit"><td>
    				<a href="${ctx}/sysformat/eamMsgFormat/form?id=${eamMsgFormat.id}">修改</a>
					<a href="${ctx}/sysformat/eamMsgFormat/delete?id=${eamMsgFormat.id}" onclick="return confirmx('确认要删除该报文格式管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>