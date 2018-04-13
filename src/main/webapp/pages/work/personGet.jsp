<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="left.jsp"%>
<style type="text/css">
	label{
		font-weight:bold;
	}
</style>
<div>
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">工人信息详情</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="hidden"><a href="#">Tables</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">工人信息详情</li>
			</ol>
			<div class="clearfix"></div>
		</div>
		<!--END TITLE & BREADCRUMB PAGE-->
		<!--BEGIN CONTENT-->
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
										工人信息详情
										<a href="${ctx}/work/personList.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">返回</a>
									</div>
									<div class="panel-body pan">
										<div class="form-body pal">
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">ID：</label>
														<div class="input-icon right">
															${person.id}
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">工种：</label>
														<div class="input-icon right">
															${person.workIntent }
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">薪资要求：</label>
														<div class="input-icon right">
															${person.salary }
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">姓名：</label>
														<div class="input-icon right">
															${person.contactsName }
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">电话：</label>
														<div class="input-icon right">
															${person.mobile }
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">年龄：</label>
														<div class="input-icon right">
															${person.age}
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">生肖：</label>
														<div class="input-icon right">
															${person.zodiac}
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">性别：</label>
														<div class="input-icon right">
															<c:if test="${person.sex == 1}">男</c:if>
															<c:if test="${person.sex == 2}">女</c:if>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">哪里人：</label>
														<div class="input-icon right">
															${person.address}
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">补充说明：</label>
														<div class="input-icon right">
															${person.note}
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">创建时间：</label>
														<div class="input-icon right">
															<fmt:formatDate value="${person.createTime}" pattern="yyyy-MM-dd"/>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">最后更新时间：</label>
														<div class="input-icon right">
															<fmt:formatDate value="${person.updateTime}" pattern="yyyy-MM-dd"/>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6" style="width: 50%;">
													<div class="form-group">
														<label class="control-label">更新操作人：</label>
														<div class="input-icon right">
															${person.updateUser}
														</div>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>


