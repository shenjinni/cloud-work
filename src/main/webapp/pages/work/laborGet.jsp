
<%--
	time:2018-04-09 14:03:17
--%>
<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html"%>
<html>
<head>
<title>cloud_work_labor明细</title>
<%@include file="/commons/include/getById.jsp"%>
<script type="text/javascript">
	//放置脚本
</script>
</head>
<body>
	<div class="panel">
		<div class="panel-top">
			<div class="tbar-title">
				<span class="tbar-label">cloud_work_labor详细信息</span>
			</div>
			<div class="panel-toolbar">
				<div class="toolBar">
					<div class="group">
						<a class="link back" href="list.ht">返回</a>
					</div>
				</div>
			</div>
		</div>
		<div class="panel-body">
		<table class="table-detail" cellpadding="0" cellspacing="0" border="0">
			 
			<tr>
				<th width="20%">需求:</th>
				<td>${CloudWorkLabor.workNeed}</td>
			</tr>
 
			<tr>
				<th width="20%">联系人:</th>
				<td>${CloudWorkLabor.contactsName}</td>
			</tr>
 
			<tr>
				<th width="20%">电话:</th>
				<td>${CloudWorkLabor.mobile}</td>
			</tr>
 
			<tr>
				<th width="20%">薪资水平:</th>
				<td>${CloudWorkLabor.salary}</td>
			</tr>
 
			<tr>
				<th width="20%">状态:</th>
				<td>${CloudWorkLabor.status}</td>
			</tr>
 
			<tr>
				<th width="20%">创建人:</th>
				<td>${CloudWorkLabor.createUser}</td>
			</tr>
 
			<tr>
				<th width="20%">发布时间:</th>
				<td>
				<fmt:formatDate value="${CloudWorkLabor.createTime}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
 
			<tr>
				<th width="20%">更新时间:</th>
				<td>
				<fmt:formatDate value="${CloudWorkLabor.updateTime}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
 
			<tr>
				<th width="20%">修改者:</th>
				<td>${CloudWorkLabor.updateUser}</td>
			</tr>
		</table>
		</div>
		
	</div>
</body>
</html>

