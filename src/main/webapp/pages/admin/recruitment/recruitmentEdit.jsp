<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../left.jsp"%>
<div>
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">设计岗位管理</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li>
					<i class="fa fa-home"></i>&nbsp;
					<a href="${ctx}/admin/home.do">主页</a>&nbsp;&nbsp;
					<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
				</li>
				<li class="active">设计岗位管理</li>
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
												<c:when test="${not empty recruitment}">修改设计岗位信息</c:when>
												<c:otherwise>新增设计岗位信息</c:otherwise>
											</c:choose>

											<a href="${ctx}/admin/recruitment/recruitmentList.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">返回</a>
										</div>
										<div class="panel-body pan">
											<div class="form-body pal">
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">设计种类</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="100" name="workType" value="${recruitment.workType }" placeholder="请输入设计种类"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">工资待遇</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="100" name="salary" value="${recruitment.salary }" placeholder="请输入工资待遇"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">设计岗位单位</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="100" name="company" value="${recruitment.company }" placeholder="请输入设计岗位单位"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">地址</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="100" name="address" value="${recruitment.address}" placeholder="请输入地址"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">联系人</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="30" name="contactsName" value="${recruitment.contactsName }" placeholder="请输入联系人"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">电话</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="11" name="mobile" value="${recruitment.mobile }" placeholder="请输入电话"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">补充说明</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="200" name="note" value="${recruitment.note }" placeholder="请输入补充说明"/>
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
			<input type="hidden" name="id" value="${recruitment.id }"/>
			<input type="hidden" name="status" value="${recruitment.status}"/>
		</form>
	</div>
</div>

<script type="text/javascript">
    $(".l-list1").show();

    $(document).ready(function(){
        // 提交操作
        $("#submit").click(function() {
            var obj = $('#form').toObject({mode : 'first'});

            var workType = obj.workType;
            if(v_alert_isNull(workType, '设计种类')){
                return;
            }

            var company = obj.company;
            if(v_alert_isNull(company, '联系人')){
                return;
            }

            var mobile = obj.mobile;
            if(v_alert_isNull(mobile, '电话')){
                return;
            }

            cfg.data = JSON.stringify(obj);

            cfg.success = function ret(data) {
                alert(data.errMsg);
                if (data.errCode == 'success') {
                    window.location.href = "recruitmentList.do";
                }
            };

            cfg.url = 'updateRecruitment.json';
            $.ajax(cfg);
        });
    });
</script>

</body>
</html>
