<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%@ include file="left.jsp"%>
	<div>
		<div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
				<div class="page-header pull-left">
					<div class="page-title">用户管理</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li class="hidden"><a href="#">Tables</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li class="active">用户管理</li>
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
												修改用户信息
												<a href="${ctx}/admin/user/userList.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">返回</a>
											</div>
											<div class="panel-body pan">
												<div class="form-body pal">
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<label for="sex" class="control-label">会员ID：</label>
																<div class="input-icon right">
																	${user.userId }
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<label for="sex" class="control-label">用户名称：</label>
																<div class="input-icon right">
																	<input type="text" class="form-control" id="userLoginName" name="userLoginName" value="${user.userLoginName }" placeholder="请输入用户名称"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<label for="sex" class="control-label">电子邮箱：</label>
																<div class="input-icon right">
																	<input type="text" class="form-control" name="userEmail" value="${user.userEmail }" placeholder="请输入用户邮箱"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<label for="sex" class="control-label">联系电话：</label>
																<div class="input-icon right">
																	<input type="text" class="form-control" name="userPhone" value="${user.userPhone }" placeholder="请输入联系电话"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<label for="sex" class="control-label">真实姓名：</label>
																<div class="input-icon right">
																	<input type="text" class="form-control" name="realName" value="${user.realName }" placeholder="请输入真实姓名"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<label for="sex" class="control-label">性别：</label>
																<div class="input-icon right">
																	<select class="form-control" name="sex" >
																	  <option <c:if test="${user.sex == 'S' }">selected</c:if> value="S">保密</option>
																	  <option <c:if test="${user.sex == 'M'}">selected</c:if> value="M">男</option>
																	  <option <c:if test="${user.sex == 'F'}">selected</c:if> value="F">女</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<label for="sex" class="control-label">生日：</label>
																<div class="input-icon right">
																	<input type="text" class="form-control" name="birthday" value="${user.birthday }" placeholder="请输入生日"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<label for="sex" class="control-label">所在地区：</label>
																<div class="input-icon right">
																	<input type="text" class="form-control" name="address" value="${user.address }" placeholder="请输入地址"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<label for="qq" class="control-label">QQ：</label>
																<div class="input-icon right">
																	<input type="text" class="form-control" name="qq" value="${user.qq }" placeholder="请输入qq"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<label for="sex" class="control-label">企业名称：</label>
																<div class="input-icon right">
																	<input type="text" class="form-control" name="companyName" value="${user.companyName }" placeholder="请输入公司名称"/>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="form-actions text-right pal">
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
				<input type="hidden" name="userId" value="${user.userId }"/>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		$(".l-list1").show();
		$(document).ready(function(){
			// 提交操作
			$("#submit").click(function() {
				var userLoginName = $("#userLoginName").val();
				
				if(v_alert_isNull(userLoginName, '用户名称')){
					return;
				}
				
				var obj = $('#form').toObject({mode : 'first'});
				cfg.data = JSON.stringify(obj);
				
				cfg.success = function ret(data) {
						alert(data.model.errMsg);
					if (data.model.errCode == 'success') {
						window.location.href = "userList.do";
					}
				};
		
				cfg.url = 'updateUser.json';
				$.ajax(cfg);
			}); 
		});
			
		
		
	</script>

</body>
</html>
