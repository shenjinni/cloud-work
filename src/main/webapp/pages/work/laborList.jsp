<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="left.jsp"%>
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
			<div class="page-title">加工活管理</div>
		</div>
		<ol class="breadcrumb page-breadcrumb pull-right">
			<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/work/home.do">
				主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
			<li class="hidden"><a href="#">加工活管理</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
			<li class="active">加工活管理</li>
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
								<div class="panel-heading">加工活管理列表
									<a href="${ctx}/work/laborEdit.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">新增</a>
								</div>
								<div class="panel-body">
									<div class="row" style="float:right;padding-bottom: 10px;">
										<div class="col-xs-12 col-md-12">
											<form class="form-inline" id="form_sea">
												<div class="form-group">
													<label for="labor_title">加工活名称</label>
													<input type="text" class="form-control" id="labor_title" name="laborTitle">
												</div>
												<div class="form-group">
													<label for="labor_type">加工活类型 </label>
													<select class="form-control" id="labor_type" name="laborType">
														<option value="">--</option>
														<option value="1">新闻咨询</option>
														<option value="2">展会信息</option>
														<option value="3">政策法规</option>
														<option value="4">规格介绍</option>
														<option value="5">帮助文档</option>
														<option value="6">APP新闻资讯</option>
														<option value="7">检测助手</option>
														<option value="8">业务助手</option>
														<option value="9">检测标准</option>
														<option value="10">检测方法</option>
														<option value="11">资质要求</option>
														<option value="12">平台快讯</option>
													</select>
												</div>
												<button type="button" class="btn btn-primary" id="button">搜索</button>
											</form>
										</div>
									</div>
									<table class="table table-hover" id="laborTable">
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
        $(".l-list5").show();
        $(document).ready(function(){
            cloumn=[{
                field: 'id',
                title: '加工活ID',
                align:'center'
            },
                {
                    field: 'contactsName',
                    title: '联系人',
                    align:'center'
                },
                {
                    field: 'address',
                    title: '地址',
                    align:'center'
                },
                {
                    field: 'mobile',
                    title: '电话',
                    align:'center'
                },
                {
                    field: 'salary',
                    title: '薪资',
                    align:'center'
                },
                {
                    field: 'workNeed',
                    title: '需求',
                    align:'center'
                },
                {
                    field: 'status',
                    title: '加工活分类',
                    formatter : function(value, row, index) {
                        if (row.status == 1) {
                            return "新闻咨询";
                        } else if (row.status == 2) {
                            return "展会信息";
                        } else if (row.status == 3) {
                            return "政策法规";
                        } else {
                            return "--";
                        }
                    },
                    align:'center'
                },
                {
                    field: 'createTime',
                    title: '添加时间',
                    formatter : function(value, row, index) {
                        var createTime = new Date(row.createTime);
                        return createTime.format('yyyy-MM-dd hh:mm:ss');
                    },
                    align:'center'
                },
                {
                    field: 'action',
                    title: '操作',
                    width: '300',
                    formatter:function(value,row,index){
                        var result =
                            '<a href="laborEdit.do?id='+row.id+'">编辑</a>'+
                            '&nbsp;&nbsp;<a href="javascript:void(0);" onclick="delLabor('+row.id+')">删除</a>';
                        return result;
                    },
                    align:'center'
                }]
            initTable();

            $('#button').click(function () {
                $("#laborTable").bootstrapTable('refresh', {url: 'laborList.json'});
            });
        });

        var initTable=function(){
            $("#laborTable").bootstrapTable({
                url: 'laborList.json',
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

        var delLabor = function(id){

            if (window.confirm("确认删除么？")) {
                dc(id);
            }
        }

        // 删除操作
        function dc(id){
            $.ajax({
                type : "POST",
                url : "deleteLabor.json",
                dataType : "json",
                contentType : 'application/json;charset=UTF-8',
                data : JSON.stringify({"laborId":id}),
                success : function(res){
                    alert(res.model.errMsg);
                    if("success" == res.model.errCode){
                        $("#laborTable").bootstrapTable("destroy");
                        initTable();
                    }
                },
                error : function(XMLHttpRequest, textStatus,
                                 errorThrown) {
                    alert("删除失败！");
                },
                complete : function(XMLHttpRequest, textStatus) {
                }
            });
        }

	</script>
</div>
</body>
</html>