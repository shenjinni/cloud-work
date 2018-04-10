<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<html>
<head>
	<meta charset="UTF-8">
	<title> 登录</title>
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
	<script type="text/javascript">
		function submits(){
			$(".imassage").text("");
			var username=$("#username").val();
			var password=$("#password").val();
			var flagcode=$("#flagcode").val();
			//var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
			var pPattern = /^[a-zA-Z0-9_-]{6,20}$/;
			var fPattern = /^\d{4}$/;
			if(username==""){
				$("#usernameError").text("请输入用户名/手机号！");
			}else if(password==""){
				$("#passwordError").text("请输入密码！");
			}else if(flagcode==""){
				$("#flagcodeError").text("请输入验证码！");
			}/* else if(!uPattern.test(username)){
				$("#usernameError").text("用户名格式输入有误，请重新输入！");
			} */else if(!pPattern.test(password)){
				$("#passwordError").text("密码格式输入有误，请重新输入！");
			}else if(!fPattern.test(flagcode)){
				$("#flagcodeError").text("验证码格式输入有误，请重新输入！");
				changeFlagcode();
			}else{
				$.post("${ctx}/common/login.json",{
					username : username,
					password : password,
					flagcode : flagcode
				},function (data){
                    if(data.errCode=="fail"){
                        changeFlagcode();
                        if(data.flagcodeFlag==true){
                            $("#flagcodeError").text(data.errMsg);
                        }else if(data.passwordFlag==true){
                            $("#passwordError").text(data.errMsg);
                        }else{
                            $("#usernameError").text(data.errMsg);
                        }
                    }else{
                        location.href="${ctx}"+data.url;
                    }
				},"json");
			}
		}
		
		function changeFlagcode(){
			$("#flagcodeImg").attr("src","${ctx}/common/checkCode.do?temp="+new Date().getTime());
		}
	</script>

</head>
<body>
	<!--   main    -->
	<div style="overflow: hidden;min-height: 650px;" class="qhc-main">
		<div class="login-img">
			<img src="${ctx}/common/images/u0.png" onclick="location.href='${ctx}/index.jsp'" style="cursor: pointer;"/>
		</div>
		<div class="">
			<div class="login-item">
				<ul>
					<li>
						<div class="login-itemL">登录名 ：</div>
						<div class="login-itemR">
							<input type="text" class="input-1" id="username" value="" placeholder="登陆用户名/手机号码"/>
						</div>
						<div class="imassage" id="usernameError"></div>
					</li>
					<li>
						<div class="login-itemL">密&nbsp;&nbsp;&nbsp;码 ：</div>
						<div class="login-itemR">
							<input type="password" class="input-1" id="password" value="" placeholder="登陆密码"/>
						</div>
						<div class="imassage" id="passwordError"></div>
					</li>
					<li>
						<div class="login-itemL">验证码 ：</div>
						<div class="login-itemR">
							<input type="text" class="input-2" id="flagcode" value="" />
							<div class="login-password">
								<img id="flagcodeImg" src="${ctx}/common/checkCode.do" onclick="changeFlagcode();" style="width: 100%;height: 100%; cursor: pointer;">
							</div>
						</div>
						<div class="imassage" id="flagcodeError"></div>
					</li>
					<li>
						<a href="${ctx}/common/goForget.do" class="login-a1">忘记登录密码？</a> 
						<a href="${ctx}/common/registe.do" class="login-a2">免费注册</a>
					</li>
					<a class="login-sub" href="javascript:void(0);" onclick="submits();">登录</a>
					<%--<div class="login-team">
						合作伙伴登录：</br> 
						<a href="javascript:void(0);" onclick="loginCas();">
							<img class="login-img1" src="${ctx}/common/images/login-yw.png"/>
						</a> 
						&lt;%&ndash; <a href="javascript:void(0);">
							<img src="${ctx}/common/images/login-qq.png" />
						</a> 
						<a href="javascript:void(0);">
							<img src="${ctx}/common/images/login-wx.png" />
						</a> &ndash;%&gt;
					</div>--%>
				</ul>
			</div>
		</div>
	</div>
	<!-- 下广告 -->
	<%@ include file="/common/bottomAdv.jsp"%>
	<!-- 工具条 -->
	<%--<%@ include file="/common/tools.jsp"%>--%>
	<!-- 底部 -->
	<%--<%@ include file="/common/foot.jsp"%>--%>
	<script type="text/javascript">
	function loginCas() {
		var host = window.location.host;
		var url = "http://" + host + "/casicT/common/loginCas.do?url="
				+ "http://" + host+"/casicT/common/home.do";

		window.location.href = url;
	}
	</script>
</body>
</html>