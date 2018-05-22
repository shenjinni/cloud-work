<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../left.jsp"%>
<div id="page-wrapper">
	<!--BEGIN TITLE & BREADCRUMB PAGE-->
	<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
		<div class="page-header pull-left">
			<div class="page-title">收支管理</div>
		</div>
		<ol class="breadcrumb page-breadcrumb pull-right">
			<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">
				主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
			<li class="active">收支管理</li>
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
								<div class="panel-heading">收支列表
								</div>
								<div class="panel-body">
									<div class="row" style="float:right;padding-bottom: 10px;">
										<div class="col-xs-12 col-md-12">
											<form class="form-inline" id="form_sea">
												<div class="form-group">
													<label>业务id</label>
													<input type="text" class="form-control" name="workId">
												</div>
												<div class="form-group">
													<label>状态</label>
													<select class="form-control" name="workType">
														<option value="">--</option>
														<option value="1">正常</option>
														<option value="2">置顶</option>
														<option value="-1">关闭</option>
													</select>
												</div>
												<button type="button" class="btn btn-primary" id="button">搜索</button>
											</form>
										</div>
									</div>
									<table class="table table-hover" id="turnoverTable">
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
        $(".l-list3").show();
        $(document).ready(function(){
            cloumn=[{
                field: 'id',
                title: 'ID',
                align:'center'
            },
			{
				field: 'workId',
				title: '业务ID',
				align:'center'
			},
			{
				field: 'workName',
				title: '业务名称',
				align:'center'
			},
			{
				field: 'workType',
				title: '业务类型',
				formatter : function(value, row, index) {
					if (row.workType == 1) {
						return "设计师信息";
					} else if (row.workType == 2) {
						return "设计岗位信息";
					} else if (row.workType == 3) {
						return "设计项目信息";
					} else if (row.workType == 4) {
						return "设计工作室信息";
					}  else if (row.workType == 5) {
                        return "充值会员";
                    } else {
						return "--";
					}
				},
				align:'center'
			},
			{
				field: 'money',
				title: '收入',
				align:'center'
			},
			{
				field: 'create_time',
				title: '添加时间',
				formatter : function(value, row, index) {
					var createTime = new Date(row.createTime);
					return createTime.format('yyyy-MM-dd');
				},
				align:'center',
				sortable: true
			}]
            initTable();

            $('#button').click(function () {
                $("#turnoverTable").bootstrapTable('refresh', {url: 'turnoverList.json'});
            });
        });

        var initTable=function(){
            $("#turnoverTable").bootstrapTable({
                url: 'turnoverList.json',
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