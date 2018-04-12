<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<c:set var="fileCtx" value="http://p2or9pg0j.bkt.clouddn.com/"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工人信息详情页</title>
<link rel="shortcut icon" href="${ctx}/common/image/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/personmain.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/qhc_main.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/flexslider.css" />
<script src="${ctx}/common/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="${ctx}/common/js/layer-v3.0.3/layer/layer.js" type="text/javascript"></script>
<script src="${ctx}/common/js/layer.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
function navActive(){
	$("#navLi_2").addClass("active");
}
function back() {
	var ref = document.referrer;
	//如果从栏目页来
	if (ref.indexOf('personColumn') >= 0) {
		history.go(-1);
	} else {
		//否则跳转到栏目页第一页
		location.href = "${ctx}/common/personColumn.do";
	}
}

function goOffer() {
	$.post("${ctx}/common/goOfferCheck.json",{
		personId : "${person.id}"
	},function(data) {
		if (data.flag == true) {
			location.href="${ctx}/common/goOffer.do?personId=${person.id}&userId=${sessionScope.user.userId}";
		} else {
			layer.alert(data.msg,function (){
				var errorCode = data.errorCode;
				if (errorCode == "1" || errorCode == "2") {
					//异常
					location.reload();
				} else if (errorCode == "3") {
					//未登录
					location.href = "${ctx}/common/localLogin.do?fromUrl=common/personDetails.do?id=${person.id}";
				} else if (errorCode == "4") {
					//没有权限
					location.href = "${ctx}/common/personDetails.do?id=${person.id}";
				} else if (errorCode == "6") {
					//重复报价
					location.href = "${ctx}/common/personDetails.do?id=${person.id}";
				} else if (errorCode == "5") {
					//自身报价
					location.href = "${ctx}/common/personDetails.do?id=${person.id}";
				}
			});
		}
	}, "json");
}
</script>
</head>
<body>
	<%--<!-- 左右广告 -->
	<%@ include file="/common/leftRightAdv.jsp"%>
	<!-- 上广告 -->
	<%@ include file="/common/topAdv.jsp"%>--%>
	<!-- 头部 -->
	<%@ include file="/common/head.jsp"%>
	<div class="xqdt-demandDtl">
		<div class="m-crumbs">
			<a href="${ctx}/index.jsp">首页</a> \ <a href="${ctx}/common/personColumn.do">工人信息</a> \ <span>${person.workIntent}</span>
		</div>
		<div class="m-demandDtl">
			<div class="m-main-ct">
				<h3 class="u-sub-tt">${person.workIntent}</h3>
				<div class="m-sub-ct clearfix">
					<span>发布时间：</span>
					<p><fmt:formatDate pattern="yyyy-MM-dd" value="${person.updateTime}" /></p>
				</div>
				<div class="m-sub-ct clearfix">
					<span>姓名：</span>
					<p>${person.contactsName}</p>
				</div>
				<div class="m-sub-ct clearfix">
					<span>电话：</span>
					<p>收费会员才能发布信息、查看电话，请联系织里童装设计管理员办理会员。</p>
					<p>收费会员可无限发布信息、无限查看工人电话，会员期内代理招工免费，店内广告半价。</p>
					<p>会员办理热线：0572-3183669、3211091 手机/微信：15805720573</p>
					<p>如果您已经是VIP会员请登录再查看。</p>
					<p>收费标准 会员登陆</p>
					<p>${person.mobile}</p>
				</div>
				<div class="m-sub-ct clearfix">
					<span>性别：</span>
					<p>${person.mobile}</p>
				</div>
				<div class="m-sub-ct clearfix">
					<span>年龄：</span>
					<p>${person.contactsName}</p>
				</div>
				<div class="m-sub-ct clearfix">
					<span>地址：</span>
					<p>${person.address}</p>
				</div>
				<div class="m-sub-ct clearfix">
					<span>工种：</span>
					<p>${person.workIntent}</p>
				</div>
				<div class="m-sub-ct clearfix">
					<span>工资要求：</span>
					<p>${person.salary}</p>
				</div>
				<div class="m-sub-ct clearfix">
					<span>补充说明：</span>
					<p>${person.workIntent}</p>
				</div>
				<div class="m-sub-ct clearfix">
					<span>信息状态：</span>
					<p>
						<c:if test="${person.status==0}">待报价</c:if>
						<c:if test="${person.status==1 or person.status==2}">报价中</c:if>
						<c:if test="${person.status==3 or person.status==4}">检测中</c:if>
						<c:if test="${person.status==5}">检测完成</c:if>
					</p>
				</div>
			</div>
		</div>
	</div>
	<%--<!-- 下广告 -->
	<%@ include file="/common/bottomAdv.jsp"%>
	<!-- 工具条 -->
	<%@ include file="/common/tools.jsp"%>--%>
	<!-- 底部 -->
	<%@ include file="/common/foot.jsp"%>
</body>
</html>