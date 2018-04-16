<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <script type="text/javascript" src="${ctx}/jquery/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript">
			$(".l-list1").show();
			$(document).ready(function(){
				cloumn=[{
							field : 'index',
							title : '序号',
							formatter : function(value, row, index) {
								var ind = index + 1;
								var ret = "<input type='checkBox' style='margin-right:2px;' name='names' idval='"+ row.userId +"' value='" + row.userLoginName + "'/>&nbsp;" + ind;
								return ret;
							},
							align:'center'
						},
						{
							field: 'userId',
						    title: '用户ID',
							align:'center'
						},
						{
							field: 'userLoginName',
						    title: '会员名称',
						    align:'center'
						}]
					initTable();
				
				$('#search').click(function () {  
					$("#userTable").bootstrapTable('refresh', {url: '${ctx}/admin/user/userListModal.json'});  
		        }); 
			});

			function initTable(){
				$("#userTable").bootstrapTable({
					url: '${ctx}/admin/user/userListModal.json',
					method:"post",
					striped: true,
					cache: false,
					pagination: true, 
					sortable: false,
					sortOrder: "asc",
					dataType: "json",
					sidePagination: "server",
					pageNumber:1,                       //初始化加载第一页，默认第一页
			        pageSize: 10,                       //每页的记录行数（*）
			        pageList: [10,20],
					columns:cloumn,
					search: false,                      //是否显示表格搜索
	                strictSearch: true,
					queryParams : function (params) {
	                    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	                    var temp = $("#form_sea").serializeJsonObject();
	                    temp["limit"] = params.limit;                        //页面大小
	                    temp["offset"] = params.offset;  //页码
	                    return temp;
	                },
					responseHandler:function(res) {
						return res.model;
					}
				})
			}
			
			$.fn.serializeJsonObject = function () {
	            var json = {};
	            var form = this.serializeArray();
	            $.each(form, function () {
	                if (json[this.name]) {
	                    if (!json[this.name].push) {
	                        json[this.name] = [json[this.name]];
	                    }
	                    json[this.name].push();
	                } else {
	                    json[this.name] = this.value || '';
	                }
	            });
	            return json;
	        }
			
			// 确定按钮操作
			function sureCheck() {
				var ids = "";
				var names = "";
				$("input[name='names']:checkbox:checked").each(function(){
					names += $(this).val() + ";";
					ids += $(this).attr("idval") + ";";
				});
					
				$("#user_names").val(names);
				$("#user_ids").val(ids);
				$('#mymodal').modal('hide');
			}
		</script>
</head>
<body>
<div class="row mbl">
	<div class="col-lg-12">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-azure">
					<div class="panel-heading">
					<form class="form-inline" id="form_sea">
					<div class="form-group">
					   	 	<label for="loginUserName">用户名</label>
					    	<input type="text" class="form-control" name="userLoginName" id="loginUserName" placeholder="Jane Doe">
					  	</div>
						<button type="button" class="btn btn-primary" id="search">搜索</button>
						<button type="button" class="btn btn-primary" onclick="sureCheck();" id="sure">确定</button>
					</form>
						
					</div>
					<div class="panel-body">
						<table class="table table-hover" id="userTable">
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>