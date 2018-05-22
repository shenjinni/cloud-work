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
var mobileFlag = false;
var flagcodeFlag = false;
var interval=null;
var count=60;
//=============用户名=====================
function blurUsername(){
	hideAll("username");
	var text = $("#username").val();
	if(text==""){
		usernameFlag=false;
		$("#username_Error").text("请输入用户名！").show();
	}else{
		//验证用户名是否存在
		$.post("${ctx}/common/checkUsernameRepeat.json",{
			text : text
		},function (data){
			if(data.flag==true){
				usernameFlag=true;
				$("#username_Success").show();
			}else{
				usernameFlag=false;
				$("#username_Error").text("该用户名不存在！").show();
			}
		},"json");
	}
}

function focusUsername(){
	usernameFlag=false;
	hideAll("username");
	$("#username_Info").show();
}
//=============用户名=====================
//=============手机=====================
function blurMobile(){
	hideAll("mobile");
	var text = $("#mobile").val();
	var uPattern = /^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$/;
	if(text==""){
		mobileFlag=false;
		$("#mobile_Error").text("请输入手机号！").show();
	}else if(!uPattern.test(text)){
		mobileFlag=false;
		$("#mobile_Error").text("手机号格式不正确，请重新输入！").show();
	}else{
		//验证手机号是否存在
		$.post("${ctx}/common/checkMobileRepeat.json",{
			text : text
		},function (data){
			if(data.flag==true){
				//验证手机号与用户名是否匹配
				$.post("${ctx}/common/checkMobileUsername.json",{
					mobile : text,
					username : $("#username").val()
				},function (data){
					if(data.flag==true){
						mobileFlag=true;
						$("#getFlagCodeA").css("background-color","#1F63B1");
						$("#mobile_Success").show();
					}else{
						mobileFlag=false;
						$("#mobile_Error").text("用户名与手机号不匹配！").show();
					}
				},"json");
			}else{
				mobileFlag=false;
				$("#mobile_Error").text("该手机号不存在！").show();
			}
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
	}else{
		//验证码比对
		$.post("${ctx}/common/checkMobileFlagCode.json",{
			mobile : $("#mobile").val(),
			flagText : "forget",
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
			openForget();
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
			flagText : "forget"
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

function openForget(){
	//console.log(usernameFlag+"_"+passwordFlag+"_"+password2Flag+"_"+emailFlag+"_"+mobileFlag+"_"+flagcodeFlag+"_"+$("#agree")[0].checked);
	//console.log(usernameFlag&&passwordFlag&&password2Flag&&emailFlag&&mobileFlag&&flagcodeFlag&&$("#agree")[0].checked);
	if(usernameFlag&&mobileFlag&&flagcodeFlag){
		$("#forgetA").css("background-color","#1F63B1").click(function (){
			//跳转到第二个页面
			location.href="${ctx}/common/goResetPassword.do?mobile="+$("#mobile").val();
		});
	}else{
		$("#forgetA").css("background-color","#CCCCCC").unbind();
	}
}
</script>
</head>

<body>
	<!--   main    -->
	<div style="overflow: hidden;" class="qhc-main">
		<div class="login-forget">
			<span class="login-tit">忘记密码</span>
			<div class="login-item">
				<ul>
					<li>
						<div class="login-itemL">用户名 ：</div>
						<div class="login-itemR">
							<input type="text" class="input-1" id="username" value="" onblur="blurUsername();" onfocus="focusUsername();" />
						</div>
						<div class="imassage1" id="username_Error"></div>
						<div class="imassage1" id="username_Info" style="color: #CCCCCC">请输入您的用户名</div>
						<div class="imassage1 register_sure" id="username_Success" style="color: green;display: none;">√</div>
					</li>
					<li>
						<div class="login-itemL">手&nbsp;&nbsp;&nbsp;机 ：</div>
						<div class="login-itemR">
							<input type="text" id="mobile" class="input-1" value="" onblur="blurMobile();" onfocus="focusMobile();" />
						</div>
						<div class="imassage1" id="mobile_Error"></div>
						<div class="imassage1" id="mobile_Info" style="color: #CCCCCC">请输入注册时使用的手机号</div>
						<div class="imassage1 register_sure" id="mobile_Success" style="color: green;display: none;">√</div>
					</li>
					<li>
						<div class="login-itemL">验证码 ：</div>
						<div class="login-itemR">
							<input type="text" id="flagcode" class="input-2" value="" style="width: 135px;" disabled="disabled" readonly="readonly" onblur="blurFlagcode();" onfocus="focusFlagcode();"/>
							<div class="login-password">
								<a class="login-submit" id="getFlagCodeA" href="javascript:void(0);" onclick="getFlagCode();">获取验证码</a>
							</div>
						</div>
						<div class="imassage1" id="flagcode_Error"></div>
						<div class="imassage1" id="flagcode_Info" style="color: #CCCCCC">请输入手机验证码</div>
						<div class="imassage1 register_sure" id="flagcode_Success" style="color: green;display: none;">√</div>
					</li>
				</ul>
			</div>
			<div class="register">
				<a class="login-submit" id="forgetA" href="javascript:void(0);" style="background-color: #CCCCCC;">重置密码</a>
			</div>
		</div>
	</div>
	<!-- 下广告 -->
	<%--<%@ include file="/common/bottomAdv.jsp"%>--%>
	<%--<!-- 工具条 -->
	<%@ include file="/common/tools.jsp"%>
	<!-- 底部 -->
	<%@ include file="/common/foot.jsp"%>--%>
</body>
</html>