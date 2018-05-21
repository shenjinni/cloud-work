<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

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
<title>设计工作室信息详情页</title>
<script type="text/javascript">

</script>
</head>
<body>
	<!-- 头部 -->
	<div class="wap-item-header">
		<a href="javascript:history.back(-1)"><i class="fa fa-angle-left"></i></a>
		<span>设计工作室信息详情</span>
	</div>
	<div class="m-title"><strong>设计工作室信息详情</strong></div>
	<div id="view-content">
		<ul>
			<li><b>设计种类：</b>${factory.workNeed}</li>
			<li><b>联系人： </b>${factory.contactsName}</li>
			<li>
				<b>电话：</b>
				<i id="tel">
					<c:if test="${empty sessionScope.user}">
						<div class="contact link_lan">
							<p>收费会员才能发布信息、查看电话，请联系织里童装设计管理员办理会员。</p>
							<p>收费会员可无限发布信息、无限查看设计师电话，会员期内代理设计岗位免费，店内广告半价。</p>
							<p>会员办理热线：0572-3183669、3211091 手机/微信：15805720573</p>
							<p>如果您已经是VIP会员,请登录再查看。</p>
							<p>
								<a href="${ctx}/common/article.do?id=2">收费标准</a>
								<a href="${ctx}/common/localLogin.do?fromUrl=index.jsp">会员登录</a>
							</p>
						</div>
					</c:if>
					<c:if test="${not empty sessionScope.user}">
						<c:choose>
							<c:when test="${sessionScope.user.roleShortName == 'normal'}">
								<div class="contact link_lan">
									<p>收费会员才能发布信息、查看电话，请联系织里童装设计管理员办理会员。</p>
									<p>收费会员可无限发布信息、无限查看设计师电话，会员期内代理设计岗位免费，店内广告半价。</p>
									<p>会员办理热线：0572-3183669、3211091 手机/微信：15805720573</p>
									<p>
										<a href="${ctx}/common/article.do?id=2">收费标准</a>
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<a href="tel://${factory.mobile}" style="position:relative">${factory.mobile} </a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</i>
			</li>
			<li><b>地址：</b>${factory.address}</li>
			<li><b>规模人数：</b>${factory.scale}</li>
			<li><b>补充说明：</b>${factory.note}</li>
			<hr />
			<li>
				<span class="description">
					<b>信息编号：</b>${factory.id}
				</span>
			</li>
			<li>
				<span class="description">
					<b>发布时间：</b> <fmt:formatDate pattern="yyyy-MM-dd" value="${factory.updateTime}" />
				</span>
			</li>
		</ul>
		<%@ include file="/common/foot.jsp"%>
	</div>
	<%--<%@ include file="/common/bottomAdv.jsp"%>--%>
</body>
</html>