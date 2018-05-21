<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<link rel="stylesheet" type="text/css" href="${ctx}/common/css/qhcheaderfooter.css" />--%>
<%--<link rel="stylesheet" type="text/css" href="${ctx}/common/css/zhili.css" />--%>


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>织里童装设计网-微信【织里人才市场】,微信关注轻松设计岗位找工作!</title>
	<meta name="keywords" content="织里人才市场,织里人才网,织里童装设计网,无忧人才市场,无忧人才网,织里招聘,织里招聘网,织里设计岗位,织里找工作" />
	<meta name="description" content="织里人才市场，织里人才网，织里童装设计网官方网站，每天发布最新织里人才市场设计岗位求职信息，微信关注织里人才市场公众号，随时随地设计岗位找工作！" />
	<meta name="author" content="15801006527@163.com" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta http-equiv="Cache-control" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/zhili.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/zhiliaccount.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/admin/font-awesome.min.css" />
	<script src="${ctx}/common/js/jquery-1.10.1.min.js" type="text/javascript" ></script>
	<script src="${ctx}/common/js/jquery.validate.js" type="text/javascript" ></script>
</head>
<body>
<form>

	<div class="wap-item-header"><a href="javascript:history.back(-1)"><i class="fa fa-angle-left"></i></a><span>
		<c:if test="${article.articleId == 1}">使用帮助</c:if>
												<c:if test="${article.articleId == 2}">收费标准</c:if>
												<c:if test="${article.articleId == 3}">老板找设计师视频</c:if>
												<c:if test="${article.articleId == 4}">设计师找工作视频</c:if>
		<c:if test="${article.articleId == 5}">用户服务协议</c:if>
	</span><i class="logout"></i></div>
	<div class="login-register">
		<div class="login">
			${article.articleContent}
		</div>
	</div>
</form>

</body>
</html>

