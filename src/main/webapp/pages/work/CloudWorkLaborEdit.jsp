<%--
	time:2018-04-09 14:03:17
	desc:edit the cloud_work_labor
--%>
<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html"%>
<html>
<head>
	<title>编辑 cloud_work_labor</title>
	<%@include file="/commons/include/form.jsp" %>
	<script type="text/javascript" src="${ctx}/js/hotent/CustomValid.js"></script>
	<script type="text/javascript" src="${ctx}/js/hotent/formdata.js"></script>
	<script type="text/javascript">
		$(function() {
			var options={};
			if(showResponse){
				options.success=showResponse;
			}
			var frm=$('#CloudWorkLaborForm').form();
			$("a.save").click(function() {
				frm.setData();
				frm.ajaxForm(options);
				if(frm.valid()){
					form.submit();
				}
			});

		});
		
		function showResponse(responseText) {
			var obj = new com.hotent.form.ResultMessage(responseText);
			if (obj.isSuccess()) {
				$.ligerMessageBox.confirm("提示信息", obj.getMessage()+",是否继续操作", function(rtn) {
					if(rtn){
						this.close();
					}else{
						window.location.href = "${ctx}/testin/cloudWorkLabor/cloudWorkLabor/CloudWorkLabor/list.ht";
					}
				});
			} else {
				parent.layer.alert('提示信息，'+ obj.getMessage(), { skin: 'layui-layer-molv', shift: 1 });
			}
		}				
	</script>
</head>
<body>
<div class="panel">
	<div class="panel-top">
		<div class="tbar-title">
		    <c:choose>
			    <c:when test="${CloudWorkLabor.id !=null}">
			        <span class="tbar-label">编辑cloud_work_labor</span>
			    </c:when>
			    <c:otherwise>
			        <span class="tbar-label">添加cloud_work_labor</span>
			    </c:otherwise>			   
		    </c:choose>
		</div>
		<div class="panel-toolbar">
			<div class="toolBar">
				<div class="group"><a class="link save" id="dataFormSave" href="#">保存</a></div>
				<div class="l-bar-separator"></div>
				<div class="group"><a class="link back" href="list.ht">返回</a></div>
			</div>
		</div>
	</div>
	<div class="panel-body">
		<form id="CloudWorkLaborForm" method="post" action="save.ht">
			<table class="table-detail" cellpadding="0" cellspacing="0" border="0" type="main">
				<tr>
					<th width="20%">需求:  <span class="required">*</span></th>
					<td><input type="text" id="workNeed" name="workNeed" value="${CloudWorkLabor.workNeed}"  class="inputText" validate="{required:true,maxlength:765}"  /></td>
				</tr>
				<tr>
					<th width="20%">联系人:  <span class="required">*</span></th>
					<td><input type="text" id="contactsName" name="contactsName" value="${CloudWorkLabor.contactsName}"  class="inputText" validate="{required:true,maxlength:150}"  /></td>
				</tr>
				<tr>
					<th width="20%">电话:  <span class="required">*</span></th>
					<td><input type="text" id="mobile" name="mobile" value="${CloudWorkLabor.mobile}"  class="inputText" validate="{required:true,maxlength:33}"  /></td>
				</tr>
				<tr>
					<th width="20%">薪资水平:  <span class="required">*</span></th>
					<td><input type="text" id="salary" name="salary" value="${CloudWorkLabor.salary}"  class="inputText" validate="{required:true}"  /></td>
				</tr>
				<tr>
					<th width="20%">状态:  <span class="required">*</span></th>
					<td><input type="text" id="status" name="status" value="${CloudWorkLabor.status}"  class="inputText" validate="{required:true}"  /></td>
				</tr>
				<tr>
					<th width="20%">创建人:  <span class="required">*</span></th>
					<td><input type="text" id="createUser" name="createUser" value="${CloudWorkLabor.createUser}"  class="inputText" validate="{required:true,number:true }"  /></td>
				</tr>
				<tr>
					<th width="20%">发布时间:  <span class="required">*</span></th>
					<td><input type="text" id="createTime" name="createTime" value="<fmt:formatDate value='${CloudWorkLabor.createTime}' pattern='yyyy-MM-dd'/>" class="inputText mydate" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss',istime:true})" validate="{date:true,required:true}" /></td>
				</tr>
				<tr>
					<th width="20%">更新时间:  <span class="required">*</span></th>
					<td><input type="text" id="updateTime" name="updateTime" value="<fmt:formatDate value='${CloudWorkLabor.updateTime}' pattern='yyyy-MM-dd'/>" class="inputText mydate" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss',istime:true})" validate="{date:true,required:true}" /></td>
				</tr>
				<tr>
					<th width="20%">修改者:  <span class="required">*</span></th>
					<td><input type="text" id="updateUser" name="updateUser" value="${CloudWorkLabor.updateUser}"  class="inputText" validate="{required:true,number:true }"  /></td>
				</tr>
			</table>
			<input type="hidden" name="id" value="${CloudWorkLabor.id}" />
		</form>
		
	</div>
</div>
</body>
</html>
