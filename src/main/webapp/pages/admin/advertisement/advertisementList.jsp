<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<%@ include file="../left.jsp"%>

	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">广告维护</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">
						主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="hidden"><a href="#">广告维护</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">广告维护</li>
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
									<div class="panel-heading">广告维护列表
										<a href="${ctx}/admin/advertisement/advertisementModify.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">新增</a>
									</div>
									<div class="panel-body">
									<div class="row" style="float:right;padding-bottom: 10px;">
										  <div class="col-xs-12 col-md-12">
										  	<form class="form-inline" id="form_sea">
											  <div class="form-group">
											    <label for="adTitle">广告名称</label>
											    <input type="text" class="form-control" id="adTitle" name="adTitle">
											  </div>
											  <div class="form-group">
											    <label for="adStatus">广告状态</label>
											    <select class="form-control" id="adStatus" name="adStatus">
											      <option value="">--</option>
												  <option value="1">显示</option>
												  <option value="0">隐藏</option>
												</select>
											  </div>
											  <%--<div class="form-group">--%>
											    <%--<label for="adLocation">广告位置</label>--%>
											    <%--<select class="form-control" id="adLocation" name="adLocation">--%>
											      <%--<option value="">--</option>--%>
												  <%--<option value="L">左侧</option>--%>
												  <%--<option value="R">右侧</option>--%>
												  <%--<option value="T">顶部</option>--%>
												  <%--<option value="B">底部</option>--%>
												<%--</select>--%>
											  <%--</div>--%>
											  <button type="button" class="btn btn-primary" id="button">搜索</button>
											</form>
										  </div>
										</div>
										<table class="table table-hover" id="advertisementTable">
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
				cloumn=[
						{
							field: 'adTitle',
						    title: '广告名称',
						    align:'center'
						},
//						{
//							field: 'adLocation',
//						    title: '广告位置',
//						    formatter : function(value, row, index) {
//						    	if (row.adLocation == 'L') {
//						    		return "左侧";
//						    	} else if (row.adLocation == 'R') {
//						    		return "右侧";
//						    	} else if (row.adLocation == 'T') {
//						    		return "顶部";
//						    	} else if (row.adLocation == 'B') {
//						    		return "底部";
//						    	} {
//						    		return "--";
//						    	}
//							},
//						    align:'center'
//						},
						{
							field: 'endTime',
						    title: '到期时间',
						    formatter : function(value, row, index) {
								var endTime = new Date(
										row.endTime);
								return endTime.format('yyyy-MM-dd hh:mm:ss');
							},
							align:'center'
						},
						{
							field: 'publishTime',
						    title: '发布时间',
						    formatter : function(value, row, index) {
								var publishTime = new Date(
										row.publishTime);
								return publishTime.format('yyyy-MM-dd hh:mm:ss');
							},
							align:'center'
						},
						{
							field: 'sort',
						    title: '排序',
						    align:'center'
						},
						{
							field: 'adUrl',
						    title: '广告链接',
						    align:'center'
						},
						{
							field: 'adStatus',
						    title: '状态',
						    formatter : function(value, row, index) {
						    	if (row.adStatus == 1) {
						    		return "显示";
						    	} else {
						    		return "隐藏";
						    	}
							},
						    align:'center'
						},
						{
							field: 'createTime',
						    title: '创建时间',
						    formatter : function(value, row, index) {
								var createTime = new Date(
										row.createTime);
								return createTime.format('yyyy-MM-dd hh:mm:ss');
							},
							align:'center'
						},
						{
							field: 'action',
						    title: '操作',
						    width: '300',
						    formatter:function(value,row,index){
						    	var result = "";
						    	if (row.adStatus == 1) {
						    		result =
							    		'<a href="advertisementModify.do?adId='+row.adId+'">编辑</a>'+
							    		'&nbsp;&nbsp;<a href="javascript:void(0);" onclick="coAdvertisement('+row.adId+', 0)">隐藏</a>';
							    	
						    	} else {
						    		result =
							    		'<a href="advertisementModify.do?adId='+row.adId+'">编辑</a>'+
							    		'&nbsp;&nbsp;<a href="javascript:void(0);" onclick="coAdvertisement('+row.adId+', 1)">显示</a>';
							    	
						    	}
						    	return result;
						    },
						    align:'center'
					}]
					initTable();
				
				$('#button').click(function () {  
					$("#advertisementTable").bootstrapTable('refresh', {url: 'advertisementList.json'});  
		        }); 
			});

			var initTable=function(){
				$("#advertisementTable").bootstrapTable({
					url: 'advertisementList.json',
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
			
			
			
			// 关闭或者开启操作
			function co(id, sta){
				$.ajax({
					type : "POST",
					url : "coAdvertisement.json",
					dataType : "json",
					contentType : 'application/json;charset=UTF-8',
					data : JSON.stringify({"adId":id, "adStatus":sta}),
					success : function(res){
						alert(res.errMsg);
						if("success" == res.errCode){
							$("#advertisementTable").bootstrapTable("destroy");
							initTable();
						}
					},
					error : function(XMLHttpRequest, textStatus,
							errorThrown) {
						alert("操作失败！");
					},
					complete : function(XMLHttpRequest, textStatus) {
					}
				});
			}
			
			function coAdvertisement(id, sta){
				
				var textCon = "";
				
				if (sta == 0) {
					textCon = "确认隐藏广告么";
				} else {
					textCon = "确认显示广告么";
				}
				
				if (window.confirm(textCon)) {
					co(id, sta);
				}
			}
			
		</script>
	</div>
</body>
</html>