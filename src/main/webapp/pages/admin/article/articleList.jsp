<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<%@ include file="../left.jsp"%>
	<style>
		.hidd { 
			display:absolute;
			left:-200px;
			bottom:-100px
		}
	</style>
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">文章管理</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">
						主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="hidden"><a href="#">文章管理</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">文章管理</li>
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
									<div class="panel-heading">文章管理列表
									</div>
									<div class="panel-body">
										<div class="row" style="float:right;padding-bottom: 10px;">

										</div>
										<table class="table table-hover" id="articleTable">
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
			$(".l-list4").show();
			$(document).ready(function(){
				cloumn=[{
							field: 'articleType',
						    title: '文章分类',
						    formatter : function(value, row, index) {
						    	if (row.articleType == 1) {
						    		return "使用帮助";
						    	} else if (row.articleType == 2) {
						    		return "收费标准";
						    	} else if (row.articleType == 3) {
                                    return "老板找设计师视频";
                                } else if (row.articleType == 4) {
                                    return "设计师找工作视频";
                                } else if (row.articleType == 5) {
                                    return "用户服务协议";
                                } else if (row.articleType == 6) {
                                    return "通知";
                                } else {
						    		return "--";
						    	}
							},
						    align:'center'
						},

						{
							field: 'action',
						    title: '操作',
						    width: '300',
						    formatter:function(value,row,index){
						    	var result =
						    		'<a href="articleModify.do?articleId='+row.articleId+'">编辑</a>';
						    	return result;
						    },
						    align:'center'
					}]
					initTable();
				
				$('#button').click(function () {  
					$("#articleTable").bootstrapTable('refresh', {url: 'articleList.json'});  
		        }); 
			});

			var initTable=function(){
				$("#articleTable").bootstrapTable({
					url: 'articleList.json',
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
					responseHandler:function(res) {
						return res.model;
					}
				})
			}
		</script>
	</div>
</body>
</html>