<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--<link rel="stylesheet" type="text/css" href="${ctx}/common/css/qhcheaderfooter.css" />--%>
<%--<link rel="stylesheet" type="text/css" href="${ctx}/common/css/zhili.css" />--%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>织里童装设计网-微信【织里人才市场】,微信关注轻松招工找工作!</title>
	<meta name="keywords" content="织里人才市场,织里人才网,织里童装设计网,无忧人才市场,无忧人才网,织里招聘,织里招聘网,织里招工,织里找工作" />
	<meta name="description" content="织里人才市场，织里人才网，织里童装设计网官方网站，每天发布最新织里人才市场招工求职信息，微信关注织里人才市场公众号，随时随地招工找工作！" />
	<meta name="author" content="15801006527@163.com" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta http-equiv="Cache-control" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/zhili.css" />
	<link rel="stylesheet" href="${ctx}/common/css/normalize.css"/>
	<link rel="stylesheet" href="${ctx}/common/css/style.css"/>
	<script src="${ctx}/common/js/jquery-1.10.1.min.js" type="text/javascript" ></script>
</head>


<div class="zltz">
	<div class="login-box clearfix">
		<div class="left">
			<%--<a href="${ctx}/common/localLogin.do?fromUrl=index.jsp">登录</a>
			<a href="${ctx}/common/registe.do">注册</a>--%>
			<c:if test="${empty sessionScope.user}">
				<a href="${ctx}/common/localLogin.do?fromUrl=index.jsp">登录</a>
				<a href="${ctx}/common/registe.do">注册</a>
			</c:if>
			<c:if test="${not empty sessionScope.user}">
				<em class="emName" title="<c:if test="${empty sessionScope.user.realName}">您好！${sessionScope.user.userLoginName}</c:if><c:if test="${not empty sessionScope.user.realName}">您好！${sessionScope.user.realName}</c:if>" >
					<c:if test="${empty sessionScope.user.realName}">您好！${sessionScope.user.userLoginName}</c:if>
					<c:if test="${not empty sessionScope.user.realName}">您好！${sessionScope.user.realName}</c:if>
					<c:if test="${sessionScope.user.roleShortName == 'admin'}">管理员</c:if>
					<c:if test="${sessionScope.user.roleShortName == 'vip'}">付费用户</c:if>
					<c:if test="${sessionScope.user.roleShortName == 'normal'}">普通用户</c:if>
				</em>


				<a href="${ctx}/index.jsp">首页</a>
				<c:choose>
					<c:when test="${sessionScope.user.roleShortName == 'admin'}">
						<a href="${ctx}/admin/home.do" class="qhc-admin">进入后台</a>
					</c:when>
					<c:otherwise><a href="${ctx}/b2b/myInfo/infoColumn.do" class="qhc-admin">我的发布信息</a></c:otherwise>
				</c:choose>
				<a href="${ctx}/common/logout.do">退出</a>
			</c:if>
		</div>
		<div class="right">
			<a href="${ctx}/common/article.do?id=1">使用帮助</a>
			<a href="${ctx}/common/article.do?id=2">收费标准</a>
		</div>
	</div>
</div>


<div class="search">

</div>


</body>
</html>


<!--   header    -->
<%--<div class="qhcheader" style="text-align: center;">
	<div class="qhctop">
		<div class="qhc-content">
			&lt;%&ndash;<span class="qhc-welcome">欢迎来到织里童装设计网!</span>&ndash;%&gt;
			&lt;%&ndash;<span class="tel">客服电话 : 400-086-2030 &nbsp;&nbsp;&nbsp;服务时间 : 8:00-17:00</span> &ndash;%&gt;
			<a href="${ctx}/common/about.do?id=1802061441120001" class="qhc-about">使用帮助</a>
			<a href="${ctx}/common/about.do?id=1802061441120001" class="qhc-about">收费标准</a>
			<c:if test="${empty sessionScope.user}">
				<span class="qhc-login">
					<a href="${ctx}/common/localLogin.do?fromUrl=index.jsp">会员登录</a>
					<a href="${ctx}/common/registe.do">免费注册</a>
				</span>
			</c:if>
			<c:if test="${not empty sessionScope.user}">
				<span class="qhc-login">
					<em class="emName" title="<c:if test="${empty sessionScope.user.realName}">您好！${sessionScope.user.userLoginName}</c:if><c:if test="${not empty sessionScope.user.realName}">您好！${sessionScope.user.realName}</c:if>" >
					<c:if test="${empty sessionScope.user.realName}">您好！${sessionScope.user.userLoginName}</c:if>
					<c:if test="${not empty sessionScope.user.realName}">您好！${sessionScope.user.realName}</c:if></em>
					<a href="${ctx}/common/logout.do">退出登录</a>
				</span>
				<c:choose>
					<c:when test="${sessionScope.user.roleShortName == 'lab'}">
						<a href="${ctx}/labCenter/index.do" class="qhc-lab">实验室中心</a> 
						<a href="${ctx}/userCenter/index.do" class="qhc-user">用户中心</a> 
					</c:when>
					<c:when test="${sessionScope.user.roleShortName == 'normal'}">
						<a href="${ctx}/userCenter/index.do" class="qhc-user">用户中心</a>
					</c:when>
					<c:when test="${sessionScope.user.roleShortName == 'admin'}">
						<a href="${ctx}/admin/home.do" class="qhc-admin">进入后台</a>
					</c:when>
				</c:choose>
			</c:if>
		</div>
	</div>
	<div class="qhchead">
		<div class="qhc-content">
			<div class="qhc-name">织里童装设计</div>
			<div class="b">
				<div class="search">
					<select name="searchType" id="searchType">
						<option <c:if test="${param.type==1}">selected="selected"</c:if> value="1">找工作</option>
						<option <c:if test="${param.type==2}">selected="selected"</c:if> value="2">招人</option>
						<option <c:if test="${param.type==3}">selected="selected"</c:if> value="3">找加工厂</option>
						<option <c:if test="${param.type==4}">selected="selected"</c:if> value="4">找加工活</option>
					</select> 
					<input type="text" id="searchText" placeholder="请输入搜索关键字..." value="${requestScope.text}" onkeyup="upEnterKey();" /> 
					<a href="javascript:void(0);" class="go" onclick="searchs();"></a>
				</div>
			</div>

		</div>
	</div>
	<div class="qhcnav">
		<div class="qhc-content">
			<ul class="nav-list" id="nav-list">

			</ul>
		</div>
	</div>
</div>--%>
