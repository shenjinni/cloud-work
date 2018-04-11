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
			<div class="page-title">工人管理</div>
		</div>
		<ol class="breadcrumb page-breadcrumb pull-right">
			<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/work/home.do">
				主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
			<li class="hidden"><a href="#">工人管理</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
			<li class="active">工人管理</li>
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
								<div class="panel-heading">工人管理列表
									<a href="${ctx}/work/personEdit.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">新增</a>
								</div>
								<div class="panel-body">
									<div class="row" style="float:right;padding-bottom: 10px;">
										<div class="col-xs-12 col-md-12">
											<form class="form-inline" id="form_sea">
												<div class="form-group">
													<label for="person_title">工人名称</label>
													<input type="text" class="form-control" id="person_title" name="personTitle">
												</div>
												<div class="form-group">
													<label for="person_type">工人类型 </label>
													<select class="form-control" id="person_type" name="personType">
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
									<table class="table table-hover" id="personTable">
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
                title: '工人ID',
                align:'center'
            },
                {
                    field: 'workIntent',
                    title: '个人工作意向',
                    align:'center'
                },
                {
                    field: 'status',
                    title: '工人分类',
                    formatter : function(value, row, index) {
                        if (row.personType == 1) {
                            return "新闻咨询";
                        } else if (row.personType == 2) {
                            return "展会信息";
                        } else if (row.personType == 3) {
                            return "政策法规";
                        } else if (row.personType == 4) {
                            return "规格介绍";
                        } else if (row.personType == 5) {
                            return "帮助文档";
                        } else if (row.personType == 6) {
                            return "APP新闻资讯";
                        } else if (row.personType == 7) {
                            return "检测助手";
                        } else if (row.personType == 8) {
                            return "业务助手";
                        } else if (row.personType == 9) {
                            return "检测标准";
                        } else if (row.personType == 10) {
                            return "检测方法";
                        } else if (row.personType == 11) {
                            return "资质要求";
                        } else if (row.personType == 12) {
                            return "平台快讯";
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
                        var result =
                            '<a href="personEdit.do?id='+row.id+'">编辑</a>'+
                            '&nbsp;&nbsp;<a href="javascript:void(0);" onclick="delPerson('+row.personId+')">删除</a>';
                        return result;
                    },
                    align:'center'
                }]
            initTable();

            $('#button').click(function () {
                $("#personTable").bootstrapTable('refresh', {url: 'personList.json'});
            });
        });

        var initTable=function(){
            $("#personTable").bootstrapTable({
                url: 'personList.json',
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

        var delPerson = function(id){

            if (window.confirm("确认删除么？")) {
                dc(id);
            }
        }

        // 删除操作
        function dc(id){
            $.ajax({
                type : "POST",
                url : "deletePerson.json",
                dataType : "json",
                contentType : 'application/json;charset=UTF-8',
                data : JSON.stringify({"personId":id}),
                success : function(res){
                    alert(res.model.errMsg);
                    if("success" == res.model.errCode){
                        $("#personTable").bootstrapTable("destroy");
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