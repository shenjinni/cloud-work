<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/zhili.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/admin/font-awesome.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工人信息详情页</title>
<script type="text/javascript">

</script>
</head>
<body>
	<!-- 头部 -->
	<div class="wap-item-header">
		<a href="${ctx}/b2b/personColumn.do"><i class="fa fa-angle-left"></i></a>
		<span>工人信息详情</span>
	</div>
	<div class="m-title"><strong>工人信息详情</strong></div>
	<div id="view-content">
		<ul>
			<li><b>姓名：</b> ${person.contactsName}</li>
			<li>
				<b>电话：</b>
				<i id="tel">
					<c:if test="${empty sessionScope.user}">
						<div class="contact link_lan">
							<p>收费会员才能发布信息、查看电话，请联系织里童装设计管理员办理会员。</p>
							<p>收费会员可无限发布信息、无限查看工人电话，会员期内代理招工免费，店内广告半价。</p>
							<p>会员办理热线：0572-3183669、3211091 手机/微信：15805720573</p>
							<p>如果您已经是VIP会员请登录再查看。</p>
							<p>收费标准 会员登陆</p>
						</div>
					</c:if>
					<c:if test="${not empty sessionScope.user}">
						<c:choose>
							<c:when test="${sessionScope.user.roleShortName == 'admin'}">
								<a href="tel://${person.mobile}" style="position:relative">${person.mobile} </a>
							</c:when>
						</c:choose>
					</c:if>
				</i>
			</li>
			<span id="Label1">
				<li><b>年龄：</b> ${person.age}</li>
				<li><b>生肖：</b>${person.zodiac}</li>
				<li><b>性别：</b>${person.sex}</li>
				<li><b>哪里人：</b>${person.address}</li>
			</span>
			<li><b>工种：</b>${person.workIntent}</li>
			<li><b>工资要求：</b>${person.salary}</li>
			<li><b>补充说明：</b>${person.note}</li>
			<hr />
			<li>
				<span class="description">
					<b>信息编号：</b>${person.id}
				</span>
			</li>
			<li>
				<span class="description">
					<b>发布时间：</b> <fmt:formatDate pattern="yyyy-MM-dd" value="${person.updateTime}" />
				</span>
			</li>
		</ul>
		<ul>
			<li>温馨提示：不会用的先点击下面的视频教程先学习下</li>
			<li><a href="https://v.qq.com/iframe/player.html?vid=a03792nry8z&tiny=0&auto=0" target="_blank" class="m-title"><font color="blue">老板招工人视频教程  点击查看</font></a></li>
			<li><a href="https://v.qq.com/iframe/player.html?vid=r0379vygwwx&tiny=0&auto=0" target="_blank" class="m-title"><font color="blue">工人找工作视频教程  点击查看</font></a></li>
		</ul>
	</div>
	<%@ include file="/common/bottomAdv.jsp"%>
</body>

</html>