
<%--
	time:2018-04-09 14:02:52
--%>
<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html"%>
<html>
<head>
<title>cloud_work_person明细</title>
<%@include file="/commons/include/getById.jsp"%>
<script type="text/javascript">
	//放置脚本
</script>
</head>
<body>
	<div class="panel">
		<div class="panel-top">
			<div class="tbar-title">
				<span class="tbar-label">cloud_work_person详细信息</span>
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
				<th width="20%">个人工作意向:</th>
				<td>${CloudWorkPerson.workIntent}</td>
			</tr>
 
			<tr>
				<th width="20%">address:</th>
				<td>${CloudWorkPerson.address}</td>
			</tr>
 
			<tr>
				<th width="20%">联系人:</th>
				<td>${CloudWorkPerson.contactsName}</td>
			</tr>
 
			<tr>
				<th width="20%">电话:</th>
				<td>${CloudWorkPerson.mobile}</td>
			</tr>
 
			<tr>
				<th width="20%">薪资水平:</th>
				<td>${CloudWorkPerson.salary}</td>
			</tr>
 
			<tr>
				<th width="20%">状态:</th>
				<td>${CloudWorkPerson.status}</td>
			</tr>
 
			<tr>
				<th width="20%">用户id:</th>
				<td>${CloudWorkPerson.createUser}</td>
			</tr>
 
			<tr>
				<th width="20%">发布时间:</th>
				<td>
				<fmt:formatDate value="${CloudWorkPerson.createTime}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
 
			<tr>
				<th width="20%">更新时间:</th>
				<td>
				<fmt:formatDate value="${CloudWorkPerson.updateTime}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
 
			<tr>
				<th width="20%">update_user:</th>
				<td>${CloudWorkPerson.updateUser}</td>
			</tr>
		</table>
		</div>
		
	</div>
</body>
</html>

