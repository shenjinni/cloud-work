<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../left.jsp"%>
<script type="text/javascript" charset="utf-8" src="${ctx}/common/date/WdatePicker.js"></script>

<div>
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">用户角色管理</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">
					主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>

				<li class="active">用户角色管理</li>
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
											用户角色修改
											<a href="${ctx}/admin/user/userList.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">返回</a>
										</div>
										<div class="panel-body pan">
											<div class="form-body pal">
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="turnover_title" class="control-projectel">用户ID：</projectel>
															${user.userId }
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="turnover_title" class="control-projectel">用户名称：</projectel>
															${user.userLoginName }
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="turnover_title" class="control-projectel">电话：</projectel>
															${user.userPhone }
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<projectel for="turnover_title" class="control-projectel">角色</projectel>
															<div class="input-icon right">
																<select class="form-control" id="role_id" name="roleId">
																	<c:forEach items="${roles}" var="role">
																		<option
																				<c:if test="${role.roleId == user.roleId}">selected</c:if>
																				value="${role.roleId}">${role.roleName}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
												</div>
												<div class="row" id="money_div" <c:if test="${user.roleId != '1801031821250000'}">style="display: none;"</c:if>>
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
															<adel for="validityTime" class="control-adel">失效时间：</adel>
															<div class="input-icon right">
																<input id="validityTime" class="Wdate form-control" name="validityTime" placeholder="选择失效时间"
																	   style="border: 1px solid #ccc;width:50%;height: 37px;" type="text" onClick="WdatePicker({minDate:currentDate(),qsEnabled:true,quickSel:['${day7}','${day30}','${day60}','${day90}','${dayBn}']})"
																	   pattern="yyyy-MM-dd"
																	   value="<fmt:formatDate value='${user.validityTime}' pattern="yyyy-MM-dd"/>"/>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="form-actions text-center pal">
												<button type="submit" class="btn btn-primary" id="submit">保存</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="userId" value="${user.userId }"/>
		</form>
	</div>
</div>

<script type="text/javascript">
	$(".l-list2").show();


    $.validator.setDefaults({
        submitHandler: function () {
            var obj = $('#form').toObject({mode : 'first'});

            var money = obj.money;
            if (!$("#money_div").is(":hidden")) {
                if(v_alert_isNull(money, '金额')){
                    return;
                }
			}

            cfg.data = JSON.stringify(obj);

            cfg.success = function ret(data) {
                alert(data.errMsg);
                if (data.errCode == 'success') {
                    window.location.href = "userList.do";
                }
            };

            cfg.url = 'updateUser.json';
            $.ajax(cfg);
        }
    });

    $(function () {
        $("#form").validate({
            rules: {
                money:{ number:true}
            },
            messages: {

                money:{
                    number:"金额格式错误，请输入合法的数字"

                }
            }
        });

        $("#role_id").change(function(){
            var roletype = $("#role_id").val();
            if (roletype == '1801031821250000') {
                $("#money_div").show();
            } else {
                $("#money_div").hide();
            }

        });

    })


</script>

</body>
</html>
