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
        location.href = "${ctx}/common/home.do";
        if (window != top)
            top.location.href = "${ctx}/common/home.do";
    </script>
    <title>织里童装设计网</title>
</head>

</html>