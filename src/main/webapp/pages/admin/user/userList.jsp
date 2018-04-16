<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<%@ include file="../left.jsp"%>

	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">用户管理</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">
						主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="hidden"><a href="#">用户管理</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">用户管理</li>
			</ol>
			<div class="clearfix"></div>
		</div>
		<!--END TITLE & BREADCRUMB PAGE-->
		<!--BEGIN CONTENT-->
		<div class="page-content">
			
			<div id="tab-general">
				<div class="row mbl">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-azure">
									<div class="panel-heading">用户管理列表
									</div>
									<div class="panel-body">
									<div class="row" style="float:right;padding-bottom: 10px;">
										  <div class="col-xs-12 col-md-12">
										  	<form class="form-inline" id="form_sea">
											  <div class="form-group">
											  	<select class="form-control" id="sel_sea">
												  <option value="userLoginName" selected>会员名称</option>
												  <option value="companyName">公司名称</option>
												  <option value="userPhone">电话</option>
												  <option value="address">地址</option>
												  <option value="userEmail">邮箱</option>
												</select>
											    <input type="text" class="form-control" id="inp_sea" name="userLoginName"/>
											    <button id="button" class="btn btn-primary" type="button">搜索</button>
											  </div>
											</form>
										  </div>
										</div>
										<table class="table table-hover" id="userTable">
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			$(".l-list1").show();
			$(document).ready(function(){
				cloumn=[{
							field: 'userId',
						    title: '会员ID',
						    align:'center'
						},
						{
							field: 'userLoginName',
						    title: '用户名称',
						    align:'center'
						},
						{
							field: 'userScore',
						    title: '用户积分',
						    align:'center'
						},
						{
							field: 'loginTimes',
						    title: '登录次数',
						    align:'center'
						},
						{
							field: 'lastLoginTime',
						    title: '最后登录',
						    formatter : function(value, row, index) {
								var lastLoginTime = new Date(
										row.lastLoginTime);
								return lastLoginTime.format('yyyy-MM-dd hh:mm:ss');
							},
							align:'center'
						},
						{
							field: 'walletAmount',
						    title: '预存款',
						    align:'center'
						},
						{
							field: 'userPhone',
						    title: '联系电话',
						    align:'center'
						},
						{
							field: 'address',
						    title: '地址',
						    align:'center'
						},
						{
							field: 'action',
						    title: '操作',
						    width: '300',
						    formatter:function(value,row,index){
						    	var result=
						    		'<a href="userModify.do?id='+row.userId+'">修改</a>'+
						    		'&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deleteUser('+row.userId+')">删除</a>';
						    	
						    	return result;
						    },
						    align:'center'
					}]
					initTable();
				
				$("#sel_sea").change(function(){
					$("#inp_sea").attr("name", $("#sel_sea").val());
				});
				
				$('#button').click(function () {  
					$("#userTable").bootstrapTable('refresh', {url: 'userList.json'});  
		        }); 
			});

			var initTable=function(){
				$("#userTable").bootstrapTable({
					url: 'userList.json',
					method:"post",
					striped: true,
					cache: false,
					pagination: true, 
					sortable: false,
					sortOrder: "asc",
					dataType: "json",
					sidePagination: "server",
					pageNumber:1,                       //初始化加载第一页，默认第一页
			        pageSize: 20,                       //每页的记录行数（*）
			        pageList: [20,50],
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
			
			var deleteUser=function(id){
				
				if (window.confirm("确认删除用户么？")) {
					dc(id);
				}
			}
			
			// 删除操作
			function dc(id){
				alert(id);
				$.ajax({
					type : "POST",
					url : "deleteUser.json",
					dataType : "json",
					contentType : 'application/json;charset=UTF-8',
					data : JSON.stringify({"userId":id}),
					success : function(res){
						alert(res.model.errMsg);
						if("success" == res.model.errCode){
							$("#userTable").bootstrapTable("destroy");
							initTable();
						}
					},
					error : function(XMLHttpRequest, textStatus,
							errorThrown) {
						alert("删除通知失败！");
					},
					complete : function(XMLHttpRequest, textStatus) {
					}
				});
			}
		</script>
	</div>
</body>
</html>