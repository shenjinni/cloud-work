<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<c:set var="fileCtx" value="http://p2or9pg0j.bkt.clouddn.com/"></c:set>
<!DOCTYPE html>
<html>
<head>
	<title>织里童装设计网</title>
	<link rel="shortcut icon" href="${ctx}/common/image/favicon.ico" type="image/x-icon" />
    <link type="text/css" rel="stylesheet" href="${ctx}/common/css/admin/jquery-ui-1.10.4.custom.min.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/bootstrap-table/bootstrap-table.min.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/common/css/admin/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/common/css/admin/animate.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/common/css/admin/main.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/common/css/admin/style-responsive.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/common/css/admin/zabuto_calendar.min.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/common/css/admin/pace.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/common/css/admin/jquery.news-ticker.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/jquery/jquery-confirm/css/jquery-confirm.css" />
    <!-- 图片上传即使预览插件 -->
    <link type="text/css" rel="stylesheet" href="${ctx}/bootstrap-fileinput/css/fileinput.min.css">
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${ctx}/jquery/jquery-1.10.1.min.js"></script>

    <script type="text/javascript" src="${ctx}/bootstrap-fileinput/js/fileinput.min.js"></script>
    <!-- 这个是汉化-->
    <script type="text/javascript" src="${ctx}/bootstrap-fileinput/js/locales/zh.js"></script>

    <script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="${ctx}/jquery/jquery.toObject.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/form2js.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/dateFormat.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/json2.js"></script>


	<script type="text/javascript" src="${ctx}/common/js/casicT_validate.js"></script>
    <style>
    	.hh {
		    line-height: 36px;
		    padding-left: 40px;
		}
		#side-menu a:hover {
			background: #37B3E8;
		}
		.someSelectClass{
			height:30px;
    	}
    	.conditons{
    		margin-bottom: 5px;
    	}
    	textarea{ 
    		resize:none;
    	}
    </style>
 </head>
<body> 
  <!--BEGIN BACK TO TOP-->
        <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        <!--END BACK TO TOP-->
        <!--BEGIN TOPBAR-->
        <div id="header-topbar-option-demo" class="page-header-topbar">
            <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
            <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a id="logo" href="${ctx }/" class="navbar-brand" ><span class="fa fa-rocket"></span>织里童装管理后台</a></div>
            <div class="topbar-main"><a id="menu-toggle" href="#" class="hidden-xs"> </a>
                <ul class="nav navbar navbar-top-links navbar-right mbn">
                    <li class="dropdown topbar-user"><a data-hover="dropdown" href="${ctx }/common/logout.do" class="dropdown-toggle" ><span class="hidden-xs">退出</span>&nbsp;</a>
                    </li>
                </ul>
            </div>
        </nav>
             
        </div>
        <!--END TOPBAR-->
        <div id="wrapper">
            <!--BEGIN SIDEBAR MENU-->
            <nav style="min-height: 100%;" id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                data-position="right" class="navbar-default navbar-static-side">
            	<div class="sidebar-collapse menu-scroll">
                	<ul id="side-menu" class="nav">
					
						<%--拥有管理员权限才能看到后台列表 --%>
						<shiro:hasRole name="admin">
							<div class="clearfix"></div>
							<li class="">
								<div style="padding: 15px; border-bottom: 1px solid #37B3E8; cursor: pointer;">
									<a style="padding: 0px;" href="#">
										<span class="menu-title">业务管理</span><i style="float: right;" class="fa fa-angle-double-down fa-fw"><div class="icon-bg bg-orange"></div></i>
									</a>
								</div>
								<div style="display: none;" class="hh l-list1">
									<a style="padding: 0px; padding-right: 20px;" href="${ctx}/admin/person/personList.do">
										<i class="fa fa-edit fa-fw"><div class="icon-bg bg-violet"></div></i><span class="menu-title">工人管理</span>
									</a>
								</div>
                                <div style="display: none;" class="hh l-list1">
                                    <a style="padding: 0px; padding-right: 20px;" href="${ctx}/admin/recruitment/recruitmentList.do">
                                        <i class="fa fa-edit fa-fw"><div class="icon-bg bg-violet"></div></i><span class="menu-title">招工管理</span>
                                    </a>
                                </div>
                                <div style="display: none;" class="hh l-list1">
                                    <a style="padding: 0px; padding-right: 20px;" href="${ctx}/admin/labor/laborList.do">
                                        <i class="fa fa-edit fa-fw"><div class="icon-bg bg-violet"></div></i><span class="menu-title">加工活管理</span>
                                    </a>
                                </div>
                                <div style="display: none;" class="hh l-list1">
                                    <a style="padding: 0px; padding-right: 20px;" href="${ctx}/admin/factory/factoryList.do">
                                        <i class="fa fa-edit fa-fw"><div class="icon-bg bg-violet"></div></i><span class="menu-title">加工厂管理</span>
                                    </a>
                                </div>
							</li>
                            <div class="clearfix"></div>
                            <li class="">
                                <div style="padding: 15px; border-bottom: 1px solid #37B3E8; cursor: pointer;">
                                    <a style="padding: 0px;" href="#">
                                        <span class="menu-title">用户管理</span><i style="float: right;" class="fa fa-angle-double-down fa-fw"><div class="icon-bg bg-orange"></div></i>
                                    </a>
                                </div>
                                <div style="display: none;" class="hh l-list2">
                                    <a style="padding: 0px; padding-right: 20px;" href="${ctx}/admin/user/userList.do">
                                        <i class="fa fa-edit fa-fw"><div class="icon-bg bg-violet"></div></i><span class="menu-title">用户管理</span>
                                    </a>
                                </div>
							</li>
                            <div class="clearfix"></div>
                            <li class="">
                                <div style="padding: 15px; border-bottom: 1px solid #37B3E8; cursor: pointer;">
                                    <a style="padding: 0px;" href="#">
                                        <span class="menu-title">财务管理</span><i style="float: right;" class="fa fa-angle-double-down fa-fw"><div class="icon-bg bg-orange"></div></i>
                                    </a>
                                </div>
                                <div style="display: none;" class="hh l-list3">
                                    <a style="padding: 0px; padding-right: 20px;" href="${ctx}/admin/turnover/turnoverList.do">
                                        <i class="fa fa-edit fa-fw"><div class="icon-bg bg-violet"></div></i><span class="menu-title">平台收支</span>
                                    </a>
                                </div>
                            </li>
                            <div class="clearfix"></div>
                            <li class="">
                                <div style="padding: 15px; border-bottom: 1px solid #37B3E8; cursor: pointer;">
                                    <a style="padding: 0px;" href="#">
                                        <span class="menu-title">运营管理</span><i style="float: right;" class="fa fa-angle-double-down fa-fw"><div class="icon-bg bg-orange"></div></i>
                                    </a>
                                </div>
                                <div style="display: none;" class="hh l-list4">
                                    <a style="padding: 0px; padding-right: 20px;" href="${ctx}/admin/advertisement/advertisementList.do">
                                        <i class="fa fa-edit fa-fw"><div class="icon-bg bg-violet"></div></i><span class="menu-title">广告管理</span>
                                    </a>
                                </div>
                                <div style="display: none;" class="hh l-list4">
                                    <a style="padding: 0px; padding-right: 20px;" href="${ctx}/admin/article/articleList.do">
                                        <i class="fa fa-edit fa-fw"><div class="icon-bg bg-violet"></div></i><span class="menu-title">文章管理</span>
                                    </a>
                                </div>
                            </li>
						</shiro:hasRole>
                	</ul>
            	</div>
            </nav>
        <!--END SIDEBAR MENU-->
        <script type="text/javascript">
			$("#side-menu").each(function() {
				$(this).children().each(function() {
					$(this).children().eq(0).click(function() {
						var t = $(this);
						t.siblings().slideToggle(200);
					});
				});
			});
			
			var cfg ={
	            type: 'POST',
	            dataType: 'json',
	            contentType:'application/json;charset=UTF-8',
		    };
			
			$("#logout").click(function(){
				 
				cfg.success = function ret(data){
					if(data.status==0){
						window.location.href='${ctx}/admin/adminLogin.do';
					}else{
						alert("退出失败！");
					}
				};
				
				cfg.url = '${ctx}/common/user/logout.json';
				$.ajax(cfg);
			});
			var defaultUEToolbar = ['FullScreen','fontsize','fontfamily','Bold','italic','underline','|','justifyleft', 'justifycenter','justifyright','|','insertorderedlist','insertunorderedlist','|','simpleupload','removeformat','source'];
		</script>
		