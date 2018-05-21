<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<html>
<head>
<meta charset="UTF-8">
<title>织里童装设计网 - 注册</title>
<link rel="shortcut icon" href="${ctx}/common/image/favicon.ico" type="image/x-icon" />
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
var usernameFlag = false;
var passwordFlag = false;
var password2Flag = false;
var emailFlag = true;
var mobileFlag = false;
var flagcodeFlag = false;
var interval=null;
var count=60;
//=============用户名=====================
function blurUsername(){
	hideAll("username");
	var text = $("#username").val();
	var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
	if(text==""){
		usernameFlag=false;
		$("#username_Error").text("请输入用户名！").show();
		openRegiste();
	}else if(!uPattern.test(text)){
		usernameFlag=false;
		$("#username_Error").text("用户名格式不正确，请重新输入！").show();
		openRegiste();
	}else{
		//验证用户名是否重复
		$.post("${ctx}/common/checkUsernameRepeat.json",{
			text : text
		},function (data){
			if(data.flag==true){
				usernameFlag=false;
				$("#username_Error").text("用户名已注册！").show();
			}else{
				usernameFlag=true;
				$("#username_Success").show();
			}
			openRegiste();
		},"json");
	}
}

function focusUsername(){
	usernameFlag=false;
	hideAll("username");
	$("#username_Info").show();
}
//=============用户名=====================
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
	openRegiste();
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
	openRegiste();
}

function focusPassword2(){
	password2Flag=false;
	hideAll("password2");
	$("#password2_Info").show();
}
//=============确认密码=====================
//=============邮箱=====================
function blurEmail(){
	hideAll("email");
	var text = $("#email").val();
	var uPattern = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,5}$/;
	if(text!=""){
		if(!uPattern.test(text)){
			emailFlag=false;
			$("#email_Error").text("电子邮箱格式不正确，请重新输入！").show();
			openRegiste();
		}else{
			//验证电子邮箱是否重复
			$.post("${ctx}/common/checkEmailRepeat.json",{
				text : text
			},function (data){
				if(data.flag==true){
					emailFlag=false;
					$("#email_Error").text("电子邮箱已注册！").show();
				}else{
					emailFlag=true;
					$("#email_Success").show();
				}
				openRegiste();
			},"json");
		}
	}
}

function focusEmail(){
	emailFlag=false;
	hideAll("email");
	$("#email_Info").show();
}
//=============邮箱=====================
//=============手机=====================
function blurMobile(){
	hideAll("mobile");
	var text = $("#mobile").val();
	var uPattern = /^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$/;
	if(text==""){
		mobileFlag=false;
		$("#mobile_Error").text("请输入手机号！").show();
		openRegiste();
	}else if(!uPattern.test(text)){
		mobileFlag=false;
		$("#mobile_Error").text("手机号格式不正确，请重新输入！").show();
		openRegiste();
	}else{
		//验证手机号是否重复
		$.post("${ctx}/common/checkMobileRepeat.json",{
			text : text
		},function (data){
			if(data.flag==true){
				mobileFlag=false;
				$("#mobile_Error").text("手机号已注册！").show();
			}else{
				mobileFlag=true;
				$("#getFlagCodeA").css("background-color","#1F63B1");
				$("#mobile_Success").show();
			}
			openRegiste();
		},"json");
	}
}

function focusMobile(){
	mobileFlag=false;
	hideAll("mobile");
	$("#mobile_Info").show();
}
//=============手机=====================
//=============验证码=====================
function blurFlagcode(){
	hideAll("flagcode");
	var text = $("#flagcode").val();
	if(text==""){
		flagcodeFlag=false;
		$("#flagcode_Error").text("请输入验证码！").show();
		openRegiste();
	}else{
		//验证码比对
		$.post("${ctx}/common/checkMobileFlagCode.json",{
			mobile : $("#mobile").val(),
			flagText : "registe",
			text : text
		},function (data){
			if(data.flag==true){
				flagcodeFlag=true;
				mobileFlag=true;
				$("#flagcode_Success").show();
				window.clearInterval(interval);
				$("#getFlagCodeA").hide();
				$("#flagcode").attr("disabled",true);
				$("#flagcode").attr("readonly",true);
			}else{
				flagcodeFlag=false;
				$("#flagcode_Error").text("验证码输入有误，请等待倒计时结束后重新验证！").show();
			}
			openRegiste();
		},"json");
	}
}

function focusFlagcode(){
	flagcodeFlag=false;
	hideAll("flagcode");
	$("#flagcode_Info").show();
}
//=============验证码=====================
function hideAll(text){
	$("#"+text+"_Error").hide();
	$("#"+text+"_Success").hide();
	$("#"+text+"_Info").hide();
}
function getFlagCode(){
	if(mobileFlag){
		//这里发送验证码
		$.post("${ctx}/common/sendFlagcode.json",{
			mobile : $("#mobile").val(),
			flagText : "registe"
		},function (data){
			if(data.flag==true){
				layer.alert("验证码已发送至您的手机，请稍后！");
				//===============
				$("#mobile").attr("disabled",true);
				$("#mobile").attr("readonly",true);
				$("#flagcode").attr("disabled",false);
				$("#flagcode").attr("readonly",false);
				count=60;
				interval = window.setInterval(function (){
					mobileFlag=false;
					count--;
					$("#getFlagCodeA").css("background-color","#CCCCCC").text("重新验证("+count+")");
					if(count==0){
						mobileFlag=true;
						$("#getFlagCodeA").css("background-color","#1F63B1").text("重新验证");
						$("#mobile").attr("disabled",false);
						$("#mobile").attr("readonly",false);
						$("#flagcode").attr("disabled",true);
						$("#flagcode").attr("readonly",true);
						window.clearInterval(interval);
					}
				},1000);
			}else{
				layer.alert("系统异常，暂时无法注册！");
			}
		},"json");
	}
}

function openRegiste(){
	//console.log(usernameFlag+"_"+passwordFlag+"_"+password2Flag+"_"+emailFlag+"_"+mobileFlag+"_"+flagcodeFlag+"_"+$("#agree")[0].checked);
	//console.log(usernameFlag&&passwordFlag&&password2Flag&&emailFlag&&mobileFlag&&flagcodeFlag&&$("#agree")[0].checked);
	if(usernameFlag&&passwordFlag&&password2Flag&&emailFlag&&mobileFlag&&flagcodeFlag&&$("#agree")[0].checked){
		$("#registeA").css("background-color","#1F63B1").click(function (){
			registe();
		});
	}else{
		$("#registeA").css("background-color","#CCCCCC").unbind();
	}
}

function registe(){
	$.post("${ctx}/common/registe.json",{
		username:$("#username").val(),
		password:$("#password").val(),
		email:$("#email").val(),
		mobile:$("#mobile").val()
	},function (data){
		if(data.errCode=="fail"){
			layer.alert(data.errMsg);
		}else{
			layer.alert("注册成功！",function (){
				location.href="${ctx}"+data.url;
			});
		}
	},"json");
}


</script>
</head>

<body>

	<div style="overflow: hidden;" class="qhc-main">

		<div class="login-forget">
			<span class="login-tit">注册</span>
			<div class="login-item">
				<ul>
					<li>
						<div class="login-itemL">用户名 ：</div>
						<div class="login-itemR">
							<input type="text" class="input-1" id="username" value="" onblur="blurUsername();" onfocus="focusUsername();">
						</div>
						<div class="imassage1" id="username_Error"></div>
						<div class="imassage1  zhushi" id="username_Info" style="color: #CCCCCC">支持字母、数字、"-"、"_"的组合，4-16个字符</div>
						<div class="imassage1 register_sure" id="username_Success" style="color: green;display: none;">√</div>
					</li>
					<li>
						<div class="login-itemL">密&nbsp;&nbsp;&nbsp;码 ：</div>
						<div class="login-itemR">
							<input type="password" id="password" class="input-1" value="" onblur="blurPassword();" onfocus="focusPassword();">
						</div>
						<div class="imassage1" id="password_Error"></div>
						<div class="imassage1 zhushi" id="password_Info" style="color: #CCCCCC">支持字母、数字、"-"、"_"的组合，6-20个字符</div>
						<div class="imassage1 register_sure" id="password_Success" style="color: green;display: none;">√</div>
					</li>
					<li>
						<div class="login-itemL">确认密码 ：</div>
						<div class="login-itemR">
							<input type="password" id="password2" class="input-1" value="" onblur="blurPassword2();" onfocus="focusPassword2();">
						</div>
						<div class="imassage1" id="password2_Error"></div>
						<div class="imassage1  zhushi" id="password2_Info" style="color: #CCCCCC">请再次输入密码</div>
						<div class="imassage1 register_sure" id="password2_Success" style="color: green;display: none;">√</div>
					</li>

					<li>
						<div class="login-itemL">手&nbsp;&nbsp;&nbsp;机 ：</div>
						<div class="login-itemR">
							<input type="text" id="mobile" class="input-1" value="" onblur="blurMobile();" onfocus="focusMobile();">
						</div>
						<div class="imassage1" id="mobile_Error"></div>
						<div class="imassage1  zhushi" id="mobile_Info" style="color: #CCCCCC">完成验证后，您可用该手机找回密码</div>
						<div class="imassage1 register_sure" id="mobile_Success" style="color: green;display: none;">√</div>
					</li>
					<li>
						<div class="login-itemL">验证码 ：</div>
						<div class="login-itemR">
							<input type="text" id="flagcode" class="input-2" value="" style="width: 135px;" disabled="disabled" readonly="readonly" onblur="blurFlagcode();" onfocus="focusFlagcode();">
							<div class="login-password" id="hqyzm">
								<a class="login-submit" id="getFlagCodeA" href="javascript:void(0);" onclick="getFlagCode();">获取验证码</a>
							</div>
						</div>
						<div class="imassage1" id="flagcode_Error"></div>
						<div class="imassage1  zhushi" id="flagcode_Info" style="color: #CCCCCC">请输入手机验证码</div>
						<div class="imassage1 register_sure" id="flagcode_Success" style="color: green;display: none;">√</div>
					</li>
					<div style="clear:both;"></div>
				</ul>
			</div>
			<div class="register">
				<label>
					<input type="checkbox" name="" id="agree" value="" onclick="openRegiste();">我已阅读并同意</label>
				<a class="login-deal" href="${ctx}/common/article.do?id=5">用户服务协议</a><br>
				<a class="login-submit" id="registeA" href="javascript:void(0);" style="background-color: #CCCCCC;">注册</a>
			</div>
		</div>
	</div>
	<!-- 下广告 -->
	<%--<%@ include file="/common/bottomAdv.jsp"%>
	<!-- 工具条 -->
	<%@ include file="/common/tools.jsp"%>
	<!-- 底部 -->
	<%@ include file="/common/foot.jsp"%>--%>
</body>
</html>