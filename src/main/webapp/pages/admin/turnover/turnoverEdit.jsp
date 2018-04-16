<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../left.jsp"%>
<script type="text/javascript" charset="utf-8" src="${ctx}/common/date/WdatePicker.js"></script>

<div>
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">财务管理</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">
					主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>

				<li class="active">财务管理</li>
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
											新增业务置顶、财务流水
											<a href="${ctx}/admin/turnover/turnoverList.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">返回</a>
										</div>
										<div class="panel-body pan">
											<div class="form-body pal">
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="turnover_title" class="control-projectel">业务ID：</projectel>
															${workId }
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="turnover_title" class="control-projectel">业务名称：</projectel>
															${workName }
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="turnover_title" class="control-projectel">业务类型：</projectel>
															${workType }
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="turnover_title" class="control-projectel">金额</projectel>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="10" name="money" placeholder="请输入金额"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="turnover_title" class="control-projectel">vip等级</projectel>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="4" name="weights" placeholder="请输入vip等级"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<adel for="validityTime" class="control-adel">失效日期：</adel>
															<div class="input-icon right">
																<input id="validityTime" class="Wdate form-control" name="validityTime" placeholder="选择失效日期"
																	   style="border: 1px solid #ccc;width:50%;height: 37px;" type="text" onClick="WdatePicker({minDate:currentDate()})"
																	  pattern="yyyy-MM-dd"/>
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
			<input type="hidden" name="workType" value="${workType}"/>
			<input type="hidden" name="workId" value="${workId}"/>
			<input type="hidden" name="workName" value="${workName}"/>
		</form>
	</div>
</div>

<script type="text/javascript">
    $(".l-list1").show();

    $(document).ready(function(){
        // 提交操作
        $("#submit").click(function() {
            var obj = $('#form').toObject({mode : 'first'});

            var money = obj.money;
            if(v_alert_isNull(money, '金额')){
                return;
            }

            var weights = obj.weights;
            if(v_alert_isNull(weights, 'vip等级')){
                return;
            }

            var validityTime = obj.validityTime;
            if(v_alert_isNull(validityTime, '失效日期')){
                return;
            }

            cfg.data = JSON.stringify(obj);

            cfg.success = function ret(data) {
                alert(data.errMsg);
                if (data.errCode == 'success') {
                    window.location.href = "turnoverList.do";
                }
            };

            cfg.url = 'addVip.json';
            $.ajax(cfg);
        });
    });
</script>

</body>
</html>
