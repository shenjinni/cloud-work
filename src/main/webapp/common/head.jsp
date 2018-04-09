<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/qhcheaderfooter.css" />
<style type="text/css">
.qhc-login a{
	color: white;
}
</style>
<script type="text/javascript">
$(function (){
	loadNav();//加载导航栏
});
/*
 * 导航栏
 */
function loadNav(){
	$.post("${ctx}/common/homeGetNav.json",{
		
	},function (data){
		if(data.flag==true){
			var navList = data.navList;
			var ul = document.getElementById("nav-list");
			//动态计算宽度
			var ulWidth = 1180;
			//确保不会出现除零异常
			var liCount = navList.length==0?1:navList.length;
			var liWidth=1180/liCount;
			for(var i=0;i<navList.length;i++){
				var li = document.createElement("li");
				li.id="navLi_"+navList[i].barId;
				var a = document.createElement("a");
				a.innerHTML=navList[i].barName;
				var urls = navList[i].barUrl;
				//alert(urls);
				if(urls==""){
					//alert(123);
					urls='${ctx}';
				}
				a.href=urls;
				a.target=navList[i].barTarget;
				a.style.overflow="hidden";
				a.style.textOverflow="ellipsis";
				a.style.whiteSpace="nowrap";
				li.appendChild(a);
				li.style.width=liWidth+"px";
				li.style.padding="0px";
				li.style.textAlign="center";
				ul.appendChild(li);
			}
			navActive();
		}else{
			alert(data.msg);
		}
	},"json");
}

function goPublish(){
	var user = "${sessionScope.user.userId}";
	if(user==""){
		//未登录
		location.href="${ctx}/common/localLogin.do?fromUrl=common/needPublish.do";
	}else{
		window.open('${ctx}/common/needPublish.do');
	}
}

function searchs(){
	var searchType = $("#searchType").val();
	var searchText = encodeURI(encodeURI($("#searchText").val()));
	var url = "${ctx}/common/search.do?type="+searchType+"&text="+searchText;
	location.href=url;
}
$(function (){
	$("#searchText").keyup(function (e) {
	    if (e.keyCode == 13) {
	    	searchs();
	    }  
	});  
});
</script>

<!--   header    -->
<div class="qhcheader">
	<div class="qhctop">
		<div class="qhc-content">
			<span class="qhc-welcome">欢迎来到全汇测!</span> 
			<span class="tel">客服电话 : 400-086-2030 &nbsp;&nbsp;&nbsp;服务时间 : 8:00-17:00</span> 
			<a href="${ctx}/common/about.do?id=1802061441120001" class="qhc-about">关于我们</a> 
			<!-- <a href="javascript:void(0);" class="qhc-app">获取APP</a> --> 
			<c:if test="${empty sessionScope.user}">
				<a href="${ctx}/admin/adminLogin.do" class="qhc-login">管理员登录</a> 
				<span class="qhc-login">
					<a href="${ctx}/common/localLogin.do?fromUrl=index.jsp">登录</a>/
					<a href="${ctx}/common/registe.do">注册</a>
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
			<div class="l">
				<a href="${ctx}/index.jsp" class="logo"></a>
			</div>
			<div class="qhc-name">全汇测，全都会测</div>
			<div class="b">
				<div class="search">
					<select name="searchType" id="searchType">
						<option <c:if test="${param.type==1}">selected="selected"</c:if> value="1">检测项目</option>
						<option <c:if test="${param.type==2}">selected="selected"</c:if> value="2">新闻</option>
						<option <c:if test="${param.type==3}">selected="selected"</c:if> value="3">实验室</option>
						<option <c:if test="${param.type==4}">selected="selected"</c:if> value="4">需求</option>
					</select> 
					<input type="text" id="searchText" placeholder="请输入搜索关键字..." value="${requestScope.text}" onkeyup="upEnterKey();" /> 
					<a href="javascript:void(0);" class="go" onclick="searchs();"></a>
				</div>
			</div>
			<a href="javascript:goPublish();" class="qhc-publish">
				<img src="${ctx}/common/images/qhc_detection.png" />
				发布需求
			</a>
		</div>
	</div>
	<div class="qhcnav">
		<div class="qhc-content">
			<ul class="nav-list" id="nav-list">

			</ul>
		</div>
	</div>
</div>