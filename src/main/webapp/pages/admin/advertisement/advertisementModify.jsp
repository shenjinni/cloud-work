<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%@ include file="../left.jsp"%>
	<script type="text/javascript" charset="utf-8" src="${ctx}/common/date/WdatePicker.js"></script>
<%--<script type="text/javascript" src="${ctx}/qiniu/ajaxfileupload.js"></script>
<script type="text/javascript" src="${ctx}/qiniu/qiniuupfile.js"></script>--%>



<script type="text/javascript">

	//初始化fileinput控件（第一次初始化）
	function initFileInput(ctrlName, uploadUrl) {
		var control = $('#' + ctrlName);
		control.fileinput({
			uploadUrl:uploadUrl,
			uploadAsync : true, //默认异步上传
			showUpload : false, //是否显示上传按钮,跟随文本框的那个
			showRemove : false, //显示移除按钮,跟随文本框的那个
			showCaption : true,//是否显示标题,就是那个文本框
			showPreview : true, //是否显示预览,不写默认为true
			dropZoneEnabled : false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
			//minImageWidth: 50, //图片的最小宽度
			//minImageHeight: 50,//图片的最小高度
			//maxImageWidth: 1000,//图片的最大宽度
			//maxImageHeight: 1000,//图片的最大高度
			//maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
			//minFileCount: 0,
			maxFileCount : 1, //表示允许同时上传的最大文件个数
			enctype : 'multipart/form-data',
			allowedFileTypes : [ 'image' ],//配置允许文件上传的类型
			allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
			allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型
			language : 'zh'
		}).on("fileuploaded", function(event, data) {
			//上传图片后的回调函数，可以在这做一些处理
			alert(data);
		});
	}


	$(function(){
		//指定上传controller访问地址
		var path = 'uploadImg.json';
		//页面初始化加载initFileInput()方法传入ID名和上传地址
		initFileInput("itemImage", path);
	})
</script>
	<div>
		<div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
				<div class="page-header pull-left">
					<div class="page-title">广告管理</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li class="hidden"><a href="#">Tables</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li class="active">广告管理</li>
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
												修改广告信息
												<a href="${ctx}/admin/advertisement/advertisementList.do" style="color: white;font-size: 14px;float: right;" class="exportBtn">返回</a>
											</div>
											<div class="panel-body pan">
												<div class="form-body pal">
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<adel for="ad_title" class="control-adel">广告名称：</adel>
																<div class="input-icon right">
																	<input type="text" class="form-control" id="ad_title" name="adTitle" value="${advertisement.adTitle }" placeholder="请输入广告名称"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<adel for="sort" class="control-adel">排序：</adel>
																<div class="input-icon right">
																	<input type="text" class="form-control" id="adLocation" name="sort" value="${advertisement.sort }" placeholder="请输入序号"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<adel for="adLocation" class="control-adel">广告位置：</adel>
																<div class="input-icon right">
																	<select class="form-control" id="adLocation" name="adLocation">
																	  <option <c:if test="${advertisement.adTitle == 'L'}">selected</c:if> value="L">左侧</option>
																	  <option <c:if test="${advertisement.adTitle == 'R'}">selected</c:if> value="R">右侧</option>
																	  <option <c:if test="${advertisement.adTitle == 'T'}">selected</c:if> value="T">顶部</option>
																	  <option <c:if test="${advertisement.adTitle == 'B'}">selected</c:if> value="B">底部</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<adel for="adUrl" class="control-adel">链接：</adel>
																<div class="input-icon right">
																	<input type="text" class="form-control" id="adUrl" name="adUrl" value="${advertisement.adUrl }" placeholder="请输入链接"/>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<adel for="itemImagers" class="control-adel">广告图片：</adel>
																<input id="itemImagers" name="itemImagers" type="file" class="file">
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6" style="width: 50%;">
															<div class="form-group">
																<adel for="endTime" class="control-adel">结束日期：</adel>
																<div class="input-icon right">
																	<input id="endTime" class="Wdate form-control" name="endTime" placeholder="选择失效日期" 
                                    									style="border: 1px solid #ccc;width:50%;height: 37px;" type="text" onClick="WdatePicker({minDate:currentDate()})" 
                                    									value="<fmt:formatDate  value='${advertisement.endTime}' pattern="yyyy-MM-dd"/>">
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
				<input type="hidden" name="adId" value="${advertisement.adId }"/>
			</form>
			<%--<input id="itemImage" name="itemImagers" type="file" class="file" />--%>
		</div>
	</div>

	<script type="text/javascript">
		$(".l-list4").show();
		$(document).ready(function(){
			// 提交操作
			$("#submit").click(function() {
				var obj = $('#form').toObject({mode : 'first'});
				
				var adTitle = obj.adTitle;
				if(v_alert_isNull(adTitle, '广告标题')){
					return;
				}
				var adLocation = obj.adLocation;
				if(v_alert_isNull(adLocation, '广告位置')){
					return;
				}
				var adImage = obj.adImage;
				if(v_alert_isNull(adImage, '图片')){
					return;
				}
				
				var sort = obj.sort;
				if(v_alert_number(sort, '序号', false)){
					return;
				}
				
				var adUrl = obj.adUrl;
				if(v_alert_url(adUrl, true)){
					return;
				}
				var endTime = obj.endTime;
				if(v_alert_isNull(endTime, '结束时间')){
					return;
				}
				
				cfg.data = JSON.stringify(obj);
				
				cfg.success = function ret(data) {
						alert(data.errMsg);
					if (data.errCode == 'success') {
						window.location.href = "advertisementList.do";
					}
				};
		
				cfg.url = 'updateAdvertisement.json';
				$.ajax(cfg);
			}); 
		});

		function uploadImage(index, idStr){
			var file = $("#"+ idStr +"_input_"+index).val();
			var fileName = getFileName(file);
			if(isPicture(fileName)==true){
				$.ajaxFileUpload({
					url : '${ctx}/common/uploadFileByDS.json', //用于文件上传的服务器端请求地址
					fileElementId : idStr +"_input_"+index, //文件上传域的ID
					dataType : 'text',
					data : {name: 'uploadFile'},
					success : function(data, status){ //服务器成功响应处理函数
						var urlStr = eval("(" + data + ")").url;
						var pos = urlStr.lastIndexOf("/");
						var filename = urlStr.substring(pos + 1);
						console.log(filename);
						$("#" + idStr +"_hid_" + index).val(urlStr);
						document.getElementById(idStr +"_image_"+index).src="${fileCtx}"+urlStr;
					},
					error : function(data, status, e){// 服务器响应失败处理函数
						alert("图片上传失败");
					},
					complete : function(XMLHttpRequest, textStatus) {
					}
				})
			}
		}
	</script>

</body>
</html>
