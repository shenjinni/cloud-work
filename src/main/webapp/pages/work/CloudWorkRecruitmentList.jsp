<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html" %>
<html>
<head>
<title>cloud_work_recruitment管理</title>
<%@include file="/commons/include/get.jsp" %>

</head>
<body>
	<div class="panel">
		<div class="panel-top">
			<div class="tbar-title">
				<span class="tbar-label">cloud_work_recruitment管理列表</span>
			</div>
			<div class="panel-toolbar">
				<div class="toolBar">
					<div class="group"><a class="link search" id="btnSearch">查询</a></div>
					<div class="l-bar-separator"></div>
					<div class="group"><a class="link add" href="edit.ht">添加</a></div>
					<div class="l-bar-separator"></div>
					<div class="group"><a class="link update" id="btnUpd" action="edit.ht">修改</a></div>
					<div class="l-bar-separator"></div>
					<div class="group"><a class="link del"  action="del.ht">删除</a></div>
				</div>	
			</div>
			<div class="panel-search">
				<form id="searchForm" method="post" action="list.ht">
					<div class="row">
						<span class="label">工种:</span><input type="text" name="Q_workType_SL"  class="inputText" />
						<span class="label">招工单位:</span><input type="text" name="Q_company_SL"  class="inputText" />
						<span class="label">电话:</span><input type="text" name="Q_mobile_SL"  class="inputText" />
						<span class="label">薪资水平:</span><input type="text" name="Q_salary_SL"  class="inputText" />
						<span class="label">状态:</span><input type="text" name="Q_status_SN"  class="inputText" />
						<span class="label">联系人:</span><input type="text" name="Q_contactsName_SL"  class="inputText" />
						<span class="label">创建人:</span><input type="text" name="Q_createUser_SL"  class="inputText" />
						<span class="label">发布时间 从:</span> <input  name="Q_begincreateTime_DL"  class="inputText mydate" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss',istime:true})" />
						<span class="label">至: </span><input  name="Q_endcreateTime_DG" class="inputText mydate" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss',istime:true})" />
						<span class="label">更新时间 从:</span> <input  name="Q_beginupdateTime_DL"  class="inputText mydate" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss',istime:true})" />
						<span class="label">至: </span><input  name="Q_endupdateTime_DG" class="inputText mydate" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss',istime:true})" />
						<span class="label">修改者:</span><input type="text" name="Q_updateUser_SL"  class="inputText" />
					</div>
				</form>
			</div>
		</div>
		<div class="panel-body">
	    	<c:set var="checkAll">
				<input type="checkbox" id="chkall"/>
			</c:set>
		    <display:table name="CloudWorkRecruitmentList" id="CloudWorkRecruitmentItem" requestURI="list.ht" sort="external" cellpadding="1" cellspacing="1" export="true"  class="table-grid">
				<display:column title="${checkAll}" media="html" style="width:30px;">
			  		<input type="checkbox" class="pk" name="id" value="${CloudWorkRecruitmentItem.id}">
				</display:column>
				<display:column property="workType" title="工种" sortable="true" sortName="workType" maxLength="80"></display:column>
				<display:column property="company" title="招工单位" sortable="true" sortName="company" maxLength="80"></display:column>
				<display:column property="mobile" title="电话" sortable="true" sortName="mobile"></display:column>
				<display:column property="salary" title="薪资水平" sortable="true" sortName="salary"></display:column>
				<display:column property="status" title="状态" sortable="true" sortName="status"></display:column>
				<display:column property="contactsName" title="联系人" sortable="true" sortName="contactsName"></display:column>
				<display:column property="createUser" title="创建人" sortable="true" sortName="createUser"></display:column>
				<display:column  title="发布时间" sortable="true" sortName="createTime">
					<fmt:formatDate value="${CloudWorkRecruitmentItem.createTime}" pattern="yyyy-MM-dd"/>
				</display:column>
				<display:column  title="更新时间" sortable="true" sortName="updateTime">
					<fmt:formatDate value="${CloudWorkRecruitmentItem.updateTime}" pattern="yyyy-MM-dd"/>
				</display:column>
				<display:column property="updateUser" title="修改者" sortable="true" sortName="updateUser"></display:column>
				<display:column title="管理" media="html" style="width:180px">
					<a href="del.ht?id=${CloudWorkRecruitmentItem.id}" class="link del">删除</a>
					<a href="edit.ht?id=${CloudWorkRecruitmentItem.id}" class="link edit">编辑</a>
					<a href="get.ht?id=${CloudWorkRecruitmentItem.id}" class="link detail">明细</a>
					
				</display:column>
			</display:table>
			<hotent:paging tableId="CloudWorkRecruitmentItem"/>
		</div><!-- end of panel-body -->				
	</div> <!-- end of panel -->
</body>
</html>


