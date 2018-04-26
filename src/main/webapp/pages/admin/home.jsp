<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@ include file="left.jsp" %>       
<script src="${ctx}/common/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=hB0gDuQFvlegcFgiqwiX3kf9"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/backhome.css"/>
<script type="text/javascript" src="${ctx}/common/js/list-script.js"></script>
    <div>
         <div id="page-wrapper">
 			<!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">后台管理</div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="hidden"><a href="#">Tables</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">后台管理</li>
                </ol>
                <div class="clearfix">
                </div>
            </div>
            <div class="page-content">
                欢迎来到后台管理
            </div>
        </div>
	</div>
</body>
</html>
