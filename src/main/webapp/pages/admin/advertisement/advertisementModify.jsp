<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%@ include file="../left.jsp"%>
	<script type="text/javascript" charset="utf-8" src="${ctx}/common/date/WdatePicker.js"></script>
<%--<script type="text/javascript" src="${ctx}/qiniu/ajaxfileupload.js"></script>
<script type="text/javascript" src="${ctx}/qiniu/qiniuupfile.js"></script>--%>


<script type="text/javascript" src="${ctx}/bootstrap-fileinput/js/fileinput.min.js"></script>
<!-- 这个是汉化-->
<script type="text/javascript" src="${ctx}/bootstrap-fileinput/js/locales/zh.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/bootstrap-fileinput/css/fileinput.min.css">

<script type="text/javascript">
	<%--$("#myFile").fileinput({--%>
		<%--language : 'zh',--%>
		<%--uploadUrl : "${ctx}/admin/uploadPhoto.json",--%>
		<%--autoReplace : true,--%>
		<%--maxFileCount : 1,--%>
		<%--allowedFileExtensions : [ "jpg", "png", "gif" ],--%>
		<%--browseClass : "btn btn-primary", //按钮样式--%>
		<%--previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"--%>
	<%--}).on("fileuploaded", function(e, data) {--%>
		<%--var res = data.response;--%>
		<%--alert(res.success);--%>
		<%--$("#logo").attr("value", res.success);--%>
	<%--});--%>

    <%--$("#myFile").fileinput({--%>
        <%--//上传的地址--%>
        <%--uploadUrl:"${ctx}/admin/uploadPhoto.json",--%>
        <%--uploadAsync : true, //默认异步上传--%>
        <%--showUpload : false, //是否显示上传按钮,跟随文本框的那个--%>
        <%--showRemove : false, //显示移除按钮,跟随文本框的那个--%>
        <%--showCaption : true,//是否显示标题,就是那个文本框--%>
        <%--showPreview : true, //是否显示预览,不写默认为true--%>
        <%--dropZoneEnabled : false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域--%>
        <%--//minImageWidth: 50, //图片的最小宽度--%>
        <%--//minImageHeight: 50,//图片的最小高度--%>
        <%--//maxImageWidth: 1000,//图片的最大宽度--%>
        <%--//maxImageHeight: 1000,//图片的最大高度--%>
        <%--//maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小--%>
        <%--//minFileCount: 0,--%>
        <%--maxFileCount : 1, //表示允许同时上传的最大文件个数--%>
        <%--enctype : 'multipart/form-data',--%>
        <%--validateInitialCount : true,--%>
        <%--previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",--%>
        <%--msgFilesTooMany : "选择上传的文件数量({n}) 超过允许的最大数值{m}！",--%>
        <%--allowedFileTypes : [ 'image' ],//配置允许文件上传的类型--%>
        <%--allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型--%>
        <%--allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型--%>
        <%--language : 'zh'--%>
    <%--});--%>
	function initFileInput(ctrlName,uploadUrl) {
		var control = $('#' + ctrlName);
		control.fileinput({
			language: 'zh', //设置语言
			uploadUrl: uploadUrl,  //上传地址
			showUpload: false, //是否显示上传按钮
			showRemove:true,
			dropZoneEnabled: false,
			showCaption: true,//是否显示标题
			allowedPreviewTypes: ['image'],
			allowedFileTypes: ['image'],
			allowedFileExtensions:  ['jpg', 'png'],
			maxFileSize : 2000,
			maxFileCount: 1,
			//initialPreview: [
			//预览图片的设置
			//      "<img src='http://127.0.0.1:8080/NewsManageSys/plugin/umeditor1_2_2/jsp/upload/20161030/55061                       477813913474.jpg' class='file-preview-image' alt='肖像图片' title='肖像图片'>",
			//],

		}).on("filebatchselected", function(event, files) {
					$(this).fileinput("upload");
				})
				.on("fileuploaded", function(event, data) {
					var res = data.response;
					alert(res.success);
					$("#adImage").val(res.success);
                    $("#imgshow").hide();
                    $("#imgshow").attr("src", "${ctx}" + res.success);
        });
}

$(function () {
var path="${ctx}/admin/uploadPhoto.json";
initFileInput("myFile",path);

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
                                                        <label for="ad_title" class="control-label">广告名称：</label>
                                                        <div class="input-icon right">
                                                            <input type="text" class="form-control" id="ad_title" name="adTitle" value="${advertisement.adTitle }" placeholder="请输入广告名称"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6" style="width: 50%;">
                                                    <div class="form-group">
                                                        <label for="adLocation" class="control-label">排序：</label>
                                                        <div class="input-icon right">
                                                            <input type="text" class="form-control" id="adLocation" name="sort" value="${advertisement.sort }" placeholder="请输入序号"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6" style="width: 50%;">
                                                    <div class="form-group">
                                                        <label  class="control-label">广告位置：</label>
                                                        <div class="input-icon right">
                                                            <select class="form-control" name="adLocation">
                                                              <%--<option <c:if test="${advertisement.adTitle == 'L'}">selected</c:if> value="L">左侧</option>--%>
                                                              <%--<option <c:if test="${advertisement.adTitle == 'R'}">selected</c:if> value="R">右侧</option>--%>
                                                              <%--<option <c:if test="${advertisement.adTitle == 'T'}">selected</c:if> value="T">顶部</option>--%>
                                                              <option <c:if test="${advertisement.adTitle == 'B'}">selected</c:if> value="B">底部</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6" style="width: 50%;">
                                                    <div class="form-group">
                                                        <label for="adUrl" class="control-label">链接：</label>
                                                        <div class="input-icon right">
                                                            <input type="text" class="form-control" id="adUrl" name="adUrl" value="${advertisement.adUrl }" placeholder="请输入链接"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6" style="width: 50%;">
                                                    <div class="form-group">
                                                        <label  class="control-label">广告图片：</label>
                                                        <c:if test="${not empty advertisement.adImage}">
                                                            <img id="imgshow" src="${ctx}${advertisement.adImage}">
                                                        </c:if>
                                                        <input id="myFile" type="file" name="myFile" >
                                                        <input type="hidden" name="adImage" id="adImage" value="${advertisement.adImage}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6" style="width: 50%;">
                                                    <div class="form-group">
                                                        <label for="endTime" class="control-label">结束日期：</label>
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
</script>

</body>
</html>
