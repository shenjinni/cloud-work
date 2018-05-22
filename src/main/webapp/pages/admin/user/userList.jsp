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
			$(".l-list2").show();
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
							field: 'userPhone',
						    title: '联系电话',
						    align:'center'
						},
						{
							field: 'roleName',
							title: '角色',
							align:'center'
						},
						{
							field: 'validityTime',
							title: '失效时间',
							formatter : function(value, row, index) {
								var validityTime = new Date(row.validityTime);
								return validityTime.format('yyyy-MM-dd');
							},
							align:'center'
						},
						{
							field: 'create_time',
							title: '创建时间',
							formatter : function(value, row, index) {
								var createTime = new Date(row.createTime);
								return createTime.format('yyyy-MM-dd');
							},
							align:'center',
							sortable: true
						},
						{
							field: 'action',
						    title: '操作',
						    width: '300',
						    formatter:function(value,row,index){
						    	var result=
						    		'<a href="userModify.do?id='+row.userId+'">设置角色</a>';
						    	
						    	return result;
						    },
						    align:'center'
					}]
					initTable();

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
					sortable: true,
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
						temp["sortName"] = params.sort;
						temp["orderName"] = params.order;
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
		</script>
	</div>
</body>
</html>