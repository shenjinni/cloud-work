<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="left.jsp"%>
<script type="text/javascript" charset="utf-8" src="${ctx}/common/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/common/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/common/ueditor/lang/zh-cn/zh-cn.js"></script>
<div>
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">新增工人信息</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="hidden"><a href="#">Tables</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">新增工人信息</li>
			</ol>
			<div class="clearfix"></div>
		</div>
		<!--END TITLE & BREADCRUMB PAGE-->
		<!--BEGIN CONTENT-->
		<form id="form">
			<div class="page-content">
				<div id="tab-general">
					<div class="row mbl">
						<div class="col-lg-12">
							<div class="col-md-12">
								<div id="area-chart-spline"
									 style="width: 100%; height: 300px; display: none;"></div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="row">
								<div class="col-lg-4" style="width: 100%">
									<div class="panel panel-azure">
										<div class="panel-heading">
											<c:choose>
												<c:when test="${not empty person}">修改工人信息</c:when>
												<c:otherwise>新增工人信息</c:otherwise>
											</c:choose>

											<a href="${ctx}/work/personList.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">返回</a>
										</div>
										<div class="panel-body pan">
											<div class="form-body pal">
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="person_title" class="control-projectel">工人信息标题：最多20字</projectel>
															<div class="input-icon right">
																<input type="text" class="form-control" id="person_title"  maxlength="20" name="personTitle" value="${person.workIntent }" placeholder="请输入工人信息名称"/>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="form-actions text-center pal">
												<button type="button" class="btn btn-primary" id="submit">保存</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="personId" value="${person.id }"/>
		</form>
	</div>
</div>

<script type="text/javascript">
	$(".l-list5").show();

	$(document).ready(function(){
		// 提交操作
		$("#submit").click(function() {
            var obj = $('#form').toObject({mode : 'first'});

            var personTitle = obj.personTitle;
            if(v_alert_isNull(personTitle, '工人信息标题')){
                return;
            }

            var personType = obj.personType;
            if(v_alert_isNull(personType, '工人信息分类')){
                return;
            }

            var personBrief = obj.personBrief;
            if(v_alert_isNull(personBrief, '工人信息简介')){
                return;
            }

            var personContent = obj.personContent;
            if(v_alert_isNull(personContent, '工人信息正文')){
                return;
            }

            var personSort = obj.personSort;
            if(v_alert_number(personSort, '序号', false)){
                return;
            }

            var personUrl = obj.personUrl;
            if(v_alert_url(personUrl, true)){
                return;
            }


            cfg.data = JSON.stringify(obj);

            cfg.success = function ret(data) {
                alert(data.model.errMsg);
                if (data.model.errCode == 'success') {
                    window.location.href = "personList.do";
                }
            };

            cfg.url = 'updatePerson.json';
            $.ajax(cfg);
		});
    });
</script>

</body>
</html>
