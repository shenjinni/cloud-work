<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/zhili.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加工活信息详情页</title>
<script type="text/javascript">

</script>
</head>
<body>
	<!-- 头部 -->
	<%@ include file="/common/headnew.jsp"%>
	<div class="m-title"><strong>加工活信息详情</strong></div>
	<div id="view-content">
		<ul>
			<li><b>需要加工种类：</b>${labor.workNeed}</li>
			<li><b>姓名：</b>${labor.contactsName}</li>
			<li>
				<b>电话：</b>：
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
								<a href="tel://${labor.mobile}" style="position:relative">${labor.mobile} </a>
							</c:when>
						</c:choose>
					</c:if>
				</i>
			</li>
			<li><b>地址：</b>${labor.address}</li>
			<li><b>工厂名：</b>${labor.factoryName}</li>
			<li><b>加工数量：</b>${labor.number}</li>
			<li><b>补充说明：</b>${labor.note}</li>
			<hr />
			<li>
				<span class="description">
					<b>信息编号：</b>${labor.id}
				</span>
			</li>
			<li>
				<span class="description">
					<b>发布时间：</b> <fmt:formatDate pattern="yyyy-MM-dd" value="${labor.updateTime}" />
				</span>
			</li>
		</ul>
	</div>
</body>
</html>