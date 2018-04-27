<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>织里童装设计网</title>
	<script type="text/javascript">


        function goPage(pageIndex){
            var text = $("#TextSearch").val();
            if(text==null || text==undefined){
                text="";
            }
            location.href="${ctx}/b2b/recruitmentColumn.do?pageIndex="+pageIndex+"&text="+text;
        }
        function navActive(){
            $("#navLi_2").addClass("active");
        }

	</script>

</head>
<body>
<!-- 头部 -->
<%@ include file="/common/headnew.jsp"%>
<div class="search">
	<h3>
		<a>织里童装设计网</a></h3>

	<div id="SearchPanel" onkeypress="javascript:return WebForm_FireDefaultButton(event, &#39;btnSearch&#39;)">
		<input name="TextSearch" type="text" id="TextSearch" value="${text}" />
		<input type="submit" name="btnSearch" onclick="subSearch(1);" value="找工作" id="btnSearch" class="so-btn" />
		<input type="submit" name="btnSearch2" onclick="subSearch(2);" value="找工人" id="btnSearch2" class="so-btn" />
	</div>
	<br/>
	<div class="quickbtn">
		<a title="无忧人才市场" href="${ctx}/b2b/personColumn.do" class="yellow">人才市场</a>
		<a title="无忧加工市场" href="${ctx}/b2b/factoryColumn.do" class="yellow">加工市场</a>
	</div>
	<div class="quickbtn">
		<a title="免费工人求职登记" href="${ctx}/b2b/personPublish.do">工人登记</a>
		<a title="免费工厂招工登记" href="${ctx}/b2b/recruitmentPublish.do">招工登记</a>
		<a title="工人信息" href="${ctx}/b2b/personColumn.do">工人信息</a>
		<a title="招工信息" href="${ctx}/b2b/recruitmentColumn.do">招工信息</a>
	</div>
	<br/>
	加工市场电话：0572-3183669、3211091、15805720573
</div>
<h3 class="infotitle">招工信息</h3>
<div class="section-cols clearfix">
	<c:if test="${not empty pageBean.pageList}">
		<ul>
			<li>
				<span class="cate">承接加工</span>
				<span class="wh">联系人</span>
				<span class="tel">电话</span>
				<span class="date">日期</span>
			</li>
		</ul>
		<c:forEach var="item" items="${pageBean.pageList}">
			<ul>
				<li>
					<span class="cate"><a href="${ctx}/b2b/recruitmentDetail.do?id=${item.id}">${item.workType}</a></span>
					<span class="wh">${item.address}</span>
					<span class="tel">${item.mobile}</span>
					<span class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.createTime}" /></span>
				</li>
			</ul>
		</c:forEach>
	</c:if>
</div>
<br />
<div class="clear">
</div>
<c:if test="${not empty pageBean.pageList}">
	<div class="pages">
		<div class="xspace-page">
			<div id="AspNetPager" style="text-align:center;white-space:nowrap;">
				<div class="info" align="center" style="width:40%;float:left;width:100%;float:none">
					当前 ${pageBean.pageIndex} 页,总计${pageBean.pageSum} 页
				</div>
				<div align="center" style="width:60%;float:left;">
					<a <c:if test="${pageBean.pageIndex==1}"> disabled="disabled" </c:if> <c:if test="${pageBean.pageIndex!=1}"> onclick="goPage(1)"</c:if> style="margin-right:5px;">首页</a>
					<a <c:if test="${pageBean.pageIndex==1}"> disabled="disabled" </c:if> <c:if test="${pageBean.pageIndex!=1}"> class="pageItem"  onclick="goPage(${pageBean.pageIndex-1})"</c:if>style="margin-right:5px;">上一页</a>
					<c:if test="${pageBean.pageIndex-4<=0}">
						<c:set var="begins" value="1"/>
						<c:set var="ends" value="8"/>
					</c:if>
					<c:if test="${pageBean.pageIndex-4>0}">
						<c:set var="begins" value="${pageBean.pageIndex-4}"/>
						<c:set var="ends" value="${begins+8-1}"/>
					</c:if>
					<c:if test="${ends>pageBean.pageSum}">
						<c:set var="begins" value="${pageBean.pageSum-8+1}"/>
						<c:set var="ends" value="${pageBean.pageSum}"/>
					</c:if>
					<c:if test="${begins<1}">
						<c:set var="begins" value="1"/>
					</c:if>
					<c:forEach
							begin="${begins}"
							end="${ends}"
							var="item" step="1">
							<span <c:if test="${pageBean.pageIndex==item}">style="margin-right:5px;font-weight:Bold;color:red;"</c:if>
								  <c:if test="${pageBean.pageIndex!=item}">onclick="goPage(${item})"</c:if>
							>${item}</span>
					</c:forEach>
					<a <c:if test="${pageBean.pageIndex==pageBean.pageSum}"> disabled="disabled" </c:if> <c:if test="${pageBean.pageIndex!=pageBean.pageSum}"> class="pageItem"  onclick="goPage(${pageBean.pageIndex+1})"</c:if>style="margin-right:5px;">下一页</a>
					<a <c:if test="${pageBean.pageIndex==pageBean.pageSum}"> disabled="disabled" </c:if> <c:if test="${pageBean.pageIndex!=pageBean.pageSum}"> class="pageItem"  onclick="goPage(${pageBean.pageSum})"</c:if>style="margin-right:5px;">尾页</a>
				</div>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${empty pageBean.pageList}">
	<div style="width: 100%; height: 300px; text-align: center; line-height: 300px;">暂无数据</div>
</c:if>
<%@ include file="/common/bottomAdv.jsp"%>
<%--<!-- 下广告 -->
<%@ include file="/common/bottomAdv.jsp"%>
<!-- 工具条 -->
<%@ include file="/common/tools.jsp"%>
<!-- 底部 -->
<%@ include file="/common/foot.jsp"%>--%>
</body>
</html>