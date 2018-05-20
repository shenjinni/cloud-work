<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../left.jsp"%>
<div>
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">设计师管理</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li>
					<i class="fa fa-home"></i>&nbsp;
					<a href="${ctx}/admin/home.do">主页</a>&nbsp;&nbsp;
					<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
				</li>
				<li class="active">设计师管理</li>
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
												<c:when test="${not empty person}">修改设计师信息</c:when>
												<c:otherwise>新增设计师信息</c:otherwise>
											</c:choose>

											<a href="${ctx}/admin/person/personList.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">返回</a>
										</div>
										<div class="panel-body pan">
											<div class="form-body pal">
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">工种</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="100" name="workIntent" value="${person.workIntent }" placeholder="请输入工种"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">薪资要求</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="100" name="salary" value="${person.salary }" placeholder="请输入薪资要求"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">姓名</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="30" name="contactsName" value="${person.contactsName }" placeholder="请输入姓名"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">电话</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="11" name="mobile" value="${person.mobile }" placeholder="请输入电话"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">年龄</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="20" name="age" value="${person.age}" placeholder="请输入年龄"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">生肖</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="10" name="zodiac" value="${person.zodiac}" placeholder="请输入生肖"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">性别</label>
															<div class="input-icon right">
																<select class="form-control" name="sex">
																	<option value="1" <c:if test="${person.sex == 1}">selected</c:if>>男</option>
																	<option value="2" <c:if test="${person.sex == 2}">selected</c:if>>女</option>
																</select>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">哪里人</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="100" name="address" value="${person.address}" placeholder="请输入哪里人"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6" style="width: 50%;">
														<div class="form-group">
															<label class="control-label">补充说明</label>
															<div class="input-icon right">
																<input type="text" class="form-control" maxlength="200" name="note" value="${person.note}" placeholder="请输入补充说明"/>
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
			<input type="hidden" name="id" value="${person.id }"/>
			<input type="hidden" name="status" value="${person.status}"/>
		</form>
	</div>
</div>

<script type="text/javascript">
	$(".l-list2").show();

	$(document).ready(function(){
		// 提交操作
		$("#submit").click(function() {
            var obj = $('#form').toObject({mode : 'first'});

            var workIntent = obj.workIntent;
            if(v_alert_isNull(workIntent, '工种')){
                return;
            }

            var contactsName = obj.contactsName;
            if(v_alert_isNull(contactsName, '姓名')){
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
