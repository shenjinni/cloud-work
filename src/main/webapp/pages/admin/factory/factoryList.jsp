<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../left.jsp"%>
<div id="page-wrapper">
	<!--BEGIN TITLE & BREADCRUMB PAGE-->
	<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
		<div class="page-header pull-left">
			<div class="page-title">设计工作室管理</div>
		</div>
		<ol class="breadcrumb page-breadcrumb pull-right">
			<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">
				主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>

			<li class="active">设计工作室管理</li>
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
								<div class="panel-heading">设计工作室管理列表
									<a href="${ctx}/admin/factory/factoryEdit.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">新增</a>
								</div>
								<div class="panel-body">
									<div class="row" style="float:right;padding-bottom: 10px;">
										<div class="col-xs-12 col-md-12">
											<form class="form-inline" id="form_sea">
												<div class="form-group">
													<label>设计种类</label>
													<input type="text" class="form-control" name="workNeed">
												</div>
												<div class="form-group">
													<label>联系人</label>
													<input type="text" class="form-control" name="contactsName">
												</div>
												<div class="form-group">
													<label>电话</label>
													<input type="text" class="form-control" name="mobile">
												</div>
												<div class="form-group">
													<label>状态</label>
													<select class="form-control" name="status">
														<option value="">--</option>
														<option value="1">正常</option>
														<option value="-1">关闭</option>
													</select>
												</div>
												<button type="button" class="btn btn-primary" id="button">搜索</button>
											</form>
										</div>
									</div>
									<table class="table table-hover" id="factoryTable">
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
                field: 'id',
                title: 'ID',
                align:'center'
            	},
				{
					field: 'workNeed',
					title: '设计种类',
					align:'center',
                    formatter : function(value, row, index) {
                        return '<a href="factoryGet.do?id='+row.id+'">'+row.workNeed+'</a>';
                    }
				},
                {
                    field: 'contactsName',
                    title: '联系人',
                    align:'center'
                },
                {
                    field: 'mobile',
                    title: '电话',
                    align:'center'
                },
                {
                    field: 'address',
                    title: '地址',
                    align:'center'
                },
                {
                    field: 'scale',
                    title: '规模人数',
                    align:'center',
                    sortable: true
                },
                {
                    field: 'status',
                    title: '状态',
                    formatter : function(value, row, index) {
                        if (row.status == 1) {
                            return "正常";
                        } else if (row.status == -1) {
                            return "关闭";
                        } else {
                            return "--";
                        }
                    },
                    align:'center'
                },
                {
                    field: 'weights',
                    title: '置顶等级',
                    align:'center',
                    sortable: true
                },
                {
                    field: 'validity_time',
                    title: '置顶失效时间',
                    formatter : function(value, row, index) {
                        var validityTime = new Date(row.validityTime);
                        return validityTime.format('yyyy-MM-dd');
                    },
                    align:'center',
                    sortable: true
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
                },
                {
                    field: 'update_time',
                    title: '更新时间',
                    formatter : function(value, row, index) {
                        var updateTime = new Date(row.updateTime);
                        return updateTime.format('yyyy-MM-dd');
                    },
                    align:'center',
                    sortable: true
                },
                {
                    field: 'action',
                    title: '操作',
                    width: '300',
                    formatter:function(value,row,index){
                        var result;
                        if (row.status > 0) {
                            result =
                                    '<a href="factoryEdit.do?id='+row.id+'">编辑</a>'+
                                    '&nbsp;&nbsp;<a href="javascript:void(0);" onclick="closeInfo('+row.id+')">关闭</a>'+
                                    '&nbsp;&nbsp;<a href="${ctx}/admin/turnover/turnoverEdit.do?workType=4&workId='+row.id+'&workName='+row.workNeed+'">vip设置</a>';
                        } else {
                            result =
                                    '<a href="factoryEdit.do?id='+row.id+'">编辑</a>'+
                                    '&nbsp;&nbsp;<a href="javascript:void(0);" onclick="openInfo('+row.id+')">开启</a>';
                        }
                        return result;
                    },
                    align:'center'
                }]
            initTable();

            $('#button').click(function () {
                $("#factoryTable").bootstrapTable('refresh', {url: 'factoryList.json'});
            });
        });

        var initTable=function(){
            $("#factoryTable").bootstrapTable({
                url: 'factoryList.json',
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

        // 开启此信息
        function openInfo(beanId){
            if (window.confirm("开启后将在前台显示，确认开启？")) {
                changeStatus(beanId, 1);
            }
        }

        // 关闭此信息
        function closeInfo(beanId){
            if (window.confirm("关闭后将不在前台显示，确认关闭？")) {
                changeStatus(beanId, -1);
            }
        }

        // 关闭此信息
        function changeStatus(beanId, status){
            $.ajax({
                type : "POST",
                url : "changeStatus.json",
                dataType : "json",
                contentType : 'application/json;charset=UTF-8',
                data : JSON.stringify({"id":beanId,"status":status}),
                success : function(res){
                    if("success" == res.errCode){
                        alert(res.errMsg);
                        $("#factoryTable").bootstrapTable("destroy");
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

	</script>
</div>
</body>
</html>