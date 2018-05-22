<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<html>
<head>
<meta charset="UTF-8">
<title>织里童装设计网 - 注册</title>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/qhcheaderfooter.css?v=1" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/flexslider.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/qhc_main.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/capacity.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/login.css" />
<script src="${ctx}/common/js/jquery-1.10.1.min.js" type="text/javascript" ></script>
<script src="${ctx}/common/js/jquery.flexslider.js" type="text/javascript" ></script>
<script src="${ctx}/common/js/carousel.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/common/js/jq_scroll.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/common/js/Union.slimscroll.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/common/js/layer.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
//全局变量
var passwordFlag = false;
var password2Flag = false;
//=============密码=====================
function blurPassword(){
	hideAll("password");
	var text = $("#password").val();
	var uPattern = /^[a-zA-Z0-9_-]{6,20}$/;
	if(text==""){
		passwordFlag=false;
		$("#password_Error").text("请输入密码！").show();
	}else if(!uPattern.test(text)){
		passwordFlag=false;
		$("#password_Error").text("密码格式不正确，请重新输入！").show();
	}else{
		passwordFlag=true;
		$("#password_Success").show();
	}
}

function focusPassword(){
	passwordFlag=false;
	hideAll("password");
	$("#password_Info").show();
}
//=============密码=====================
//=============确认密码=====================
function blurPassword2(){
	hideAll("password2");
	var text = $("#password2").val();
	var uPattern = /^[a-zA-Z0-9_-]{6,20}$/;
	if(text==""){
		password2Flag=false;
		$("#password2_Error").text("请再次输入密码！").show();
	}else if(text!=$("#password").val()){
		password2Flag=false;
		$("#password2_Error").text("两次输入不一致，请重新输入！").show();
	}else{
		password2Flag=true;
		$("#password2_Success").show();
	}
}

function focusPassword2(){
	password2Flag=false;
	hideAll("password2");
	$("#password2_Info").show();
}
//=============确认密码=====================


function submits(){
	if(passwordFlag&&password2Flag){
		$.post("${ctx}/common/resetPassword.json",{
			password:$("#password").val(),
			mobile:"${param.mobile}"
		},function (data){
			if(data.flag==false){
				layer.alert(data.msg,function (){
					location.href="${ctx}/index.jsp";
				});
			}else{
				layer.alert("密码重置成功！",function (){
					location.href="${ctx}/common/localLogin.do";
				});
			}
		},"json");
	}
}

function hideAll(text){
	$("#"+text+"_Error").hide();
	$("#"+text+"_Success").hide();
	$("#"+text+"_Info").hide();
}
</script>
</head>

<body>
	<!--   main    -->
	<div style="overflow: hidden;" class="qhc-main">
		<div class="login-forget">
			<span class="login-tit">重置密码</span>
			<div class="login-item">
				<ul>
					<li>
						<div class="login-itemL">新密码 ：</div>
						<div class="login-itemR">
							<input type="password" id="password" class="input-1" value="" onblur="blurPassword();" onfocus="focusPassword();" />
						</div>
						<div class="imassage1" id="password_Error"></div>
						<div class="imassage1" id="password_Info" style="color: #CCCCCC">建议使用字母、数字、"-"、"_"两种及以上的组合，6-20个字符</div>
						<div class="imassage1 register_sure" id="password_Success" style="color: green;display: none;">√</div>
					</li>
					<li>
						<div class="login-itemL">确认密码 ：</div>
						<div class="login-itemR">
							<input type="password" id="password2" class="input-1" value="" onblur="blurPassword2();" onfocus="focusPassword2();" />
						</div>
						<div class="imassage1" id="password2_Error"></div>
						<div class="imassage1" id="password2_Info" style="color: #CCCCCC">请再次输入密码</div>
						<div class="imassage1 register_sure" id="password2_Success" style="color: green;display: none;">√</div>
					</li>
				</ul>
			</div>
			<div class="register">
				<a class="login-submit" id="submitsA" href="javascript:void(0);" onclick="submits();">确认</a>
			</div>
		</div>
	</div>
	<%--<!-- 下广告 -->
	<%@ include file="/common/bottomAdv.jsp"%>
	<!-- 工具条 -->
	<%@ include file="/common/tools.jsp"%>
	<!-- 底部 -->
	<%@ include file="/common/foot.jsp"%>--%>
</body>
</html>