<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<c:set var="fileCtx" value="http://p2or9pg0j.bkt.clouddn.com/"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="${ctx}/common/image/favicon.ico" type="image/x-icon" />
<script src="${ctx}/common/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
if (window != top)
top.location.href = location.href;
</script>
<title>全汇测</title>
</head>
<body class="qhc-headfoot">
	<%--<!-- 左右广告 -->
	<%@ include file="/common/leftRightAdv.jsp"%>
	<!-- 上广告 -->
	<%@ include file="/common/topAdv.jsp"%>
	<!-- 头部 -->
	<%@ include file="/common/head.jsp"%>
	<!-- main -->
	<%@ include file="/common/main.jsp"%>
	<!-- 下广告 -->
	<%@ include file="/common/bottomAdv.jsp"%>
	<!-- 工具条 -->
	<%@ include file="/common/tools.jsp"%>--%>
	<!-- 底部 -->
	<%@ include file="/common/foot.jsp"%>
</body>
</html>