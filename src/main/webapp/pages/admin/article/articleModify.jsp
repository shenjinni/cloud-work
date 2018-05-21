<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%@ include file="../left.jsp"%>
	<script type="text/javascript" charset="utf-8" src="${ctx}/common/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${ctx}/common/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${ctx}/common/ueditor/lang/zh-cn/zh-cn.js"></script>


	<div>
		<div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
				<div class="page-header pull-left">
					<div class="page-title">文章编辑</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li class="hidden"><a href="#">Tables</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li class="active">文章编辑</li>
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
												修改文章
												<c:if test="${article.articleId == 1}">-使用帮助</c:if>
												<c:if test="${article.articleId == 2}">-收费标准</c:if>
												<c:if test="${article.articleId == 3}">-老板找设计师视频</c:if>
												<c:if test="${article.articleId == 4}">-设计师找工作视频</c:if>
												<c:if test="${article.articleId == 5}">-用户服务协议</c:if>
												<c:if test="${article.articleId == 6}">-通知</c:if>
												<a href="${ctx}/admin/article/articleList.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">返回</a>
											</div>
											<div class="panel-body pan">
												<div class="form-body pal">
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<projectel class="control-projectel">设计种类</projectel>
																<div class="input-icon right">
																	<input type="text" class="form-control" maxlength="100" name="articleTitle" value="${article.articleTitle }" placeholder="请输入设计种类"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12" style="width: 100%;">
															<div class="form-group">
																<label for="article_c" class="control-projectel">文章正文：</label>
																<div class="input-icon right">
																	<script id="article_c" type="text/plain"  style="width:99%;"></script>
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
				<input type="hidden" name="articleId" value="${article.articleId }"/>
				<input type="hidden" id="article_content" name="articleContent" value='${article.articleContent}' />	
			</form>
		</div>
																	</div>
	
	<script type="text/javascript">
		$(".l-list4").show();
		
		UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
		UE.Editor.prototype.getActionUrl = function(action) {
			if (action == 'uploadimage' || action == 'uploadscrawl') {
				return '${ctx}/admin/qnUploadImage.json';
			} else if(action=='uploadfile'){
				return '${ctx}/admin/qnUploadFile.json';
			} else if (action == 'imageup') {
				return '${ctx}/admin/qnUploadImage.json';
			} else {
				return this._bkGetActionUrl.call(this, action);
			}
		};
		
		var du = UE.getEditor('article_c',{
		    toolbars:[defaultUEToolbar],
		    labelMap:{'insertimage':'上传图片'},
		    wordCount:false,
		    elementPathEnabled:false,
		    initialFrameHeight:400,
		    autoFloatEnabled:false
		});
		var d = $("#article_content").val();
		du.ready(function(){
			du.setContent(d);    
		});
		
		
		$(document).ready(function(){
			// 提交操作
			$("#submit").click(function() {
				var d = UE.getEditor('article_c').getContent();
				$("#article_content").val(d);
				var obj = $('#form').toObject({mode : 'first'});

				cfg.data = JSON.stringify(obj);
				
				cfg.success = function ret(data) {
						alert(data.errMsg);
					if (data.errCode == 'success') {
						window.location.href = "articleList.do";
					}
				};
		
				cfg.url = 'updateArticle.json';
				$.ajax(cfg);
			}); 
			
			
			$("#check_id").change(function() {
				if ($("#check_id").val() == "") {
					$("#check_sub_id").html("");
				} else {
					getCheckSub($("#check_id").val());
				}
			});
		});
	</script>

</body>
</html>
