<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../left.jsp"%>
<div>
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">加工厂管理</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">
					主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>

				<li class="active">加工厂管理</li>
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
												<c:when test="${not empty factory}">修改加工厂信息</c:when>
												<c:otherwise>新增加工厂信息</c:otherwise>
											</c:choose>

											<a href="${ctx}/admin/factory/factoryList.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">返回</a>
										</div>
										<div class="panel-body pan">
											<div class="form-body pal">
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="factory_title" class="control-projectel">承接加工种类</projectel>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="100" name="workNeed" value="${factory.workNeed }" placeholder="请输入承接加工种类"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="factory_title" class="control-projectel">联系人</projectel>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="30" name="contactsName" value="${factory.contactsName }" placeholder="请输入联系人"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="factory_title" class="control-projectel">电话</projectel>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="11" name="mobile" value="${factory.mobile }" placeholder="请输入电话"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="factory_title" class="control-projectel">地址</projectel>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="100" name="address" value="${factory.address}" placeholder="请输入地址"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="factory_title" class="control-projectel">规模人数</projectel>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="20" name="scale" value="${factory.scale }" placeholder="请输入规模人数"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="factory_title" class="control-projectel">补充说明</projectel>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="200" name="note" value="${factory.note }" placeholder="请输入补充说明"/>
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
			<input type="hidden" name="id" value="${factory.id }"/>
			<input type="hidden" name="status" value="${factory.status}"/>
		</form>
	</div>
</div>

<script type="text/javascript">
    $(".l-list5").show();

    $(document).ready(function(){
        // 提交操作
        $("#submit").click(function() {
            var obj = $('#form').toObject({mode : 'first'});

            var workNeed = obj.workNeed;
            if(v_alert_isNull(workNeed, '承接加工种类')){
                return;
            }

            var contactsName = obj.contactsName;
            if(v_alert_isNull(contactsName, '联系人')){
                return;
            }

            var address = obj.address;
            if(v_alert_isNull(address, '地址')){
                return;
            }

            cfg.data = JSON.stringify(obj);

            cfg.success = function ret(data) {
                alert(data.errMsg);
                if (data.errCode == 'success') {
                    window.location.href = "factoryList.do";
                }
            };

            cfg.url = 'updateFactory.json';
            $.ajax(cfg);
        });
    });
</script>

</body>
</html>
