<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%@ include file="../left.jsp"%>
	<script type="text/javascript" charset="utf-8" src="${ctx}/common/date/WdatePicker.js"></script>
	
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
																<adel  class="control-adel">广告图片：</adel>
																<div class="input-icon right">
																	<c:choose>
																		<c:when test="${not empty advertisement.adImage}">
																			<img id="ico_image_0" src="${fileCtx}${advertisement.adImage }" style="width: 200px;height: 140px;" />
																		</c:when>
																		<c:otherwise>
																			<img id="ico_image_0" src="${ctx}/common/image/defaultLeagueCarousel.png" style="width: 200px;height: 140px;" />
																		</c:otherwise>
																	</c:choose>
																	<div class="input-icon right" style="margin: 5px auto;">
																		<input type="file"  id="ico_input_0"  name="icoInput0" onchange="uploadImage(0, 'ico');"/>
																	</div>
																	<input type="hidden" id="ico_hid_0" name="adImage" value="${advertisement.adImage }"/>
																</div>
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
		</div>
	</div>
	
	<script type="text/javascript">
		$(".l-list7").show();
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
					data : {name: idStr + "Input" + index},
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
