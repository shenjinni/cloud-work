<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/zhili.css" />
	<link rel="stylesheet" href="${ctx}/common/css/normalize.css"/>
	<link rel="stylesheet" href="${ctx}/common/css/style.css"/>
	<script src="${ctx}/common/js/jquery-1.10.1.min.js" type="text/javascript" ></script>
	<title>织里童装设计网</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<script type="text/javascript">
	function goPage(pageIndex){
		var text = $("#TextSearch1").val();
		if(text==null || text==undefined){
			text="";
		}
		var type = $("#info_type").val();
		location.href="${ctx}/b2b/myInfo/infoColumn.do?pageIndex="+pageIndex+"&text="+text+"&type="+type;
	}

	function subSearch1(info){
		var text = $("#TextSearch1").val();
		if(text==null || text==undefined){
			text="";
		}

		var type = $(info).val();

		location.href="${ctx}/b2b/myInfo/infoColumn.do?pageIndex=1&text="+text+"&type="+type;
	}

	function subSearch2(){
		var text = $("#TextSearch1").val();
		if(text==null || text==undefined){
			text="";
		}

		var type = $("#info_type").val();

		location.href="${ctx}/b2b/myInfo/infoColumn.do?pageIndex=1&text="+text+"&type="+type;
	}

	function refresh(id, type) {
		$.ajax({
			type : "POST",
			url : "refreshInfo.json",
			dataType : "json",
			contentType : 'application/json;charset=UTF-8',
			data : JSON.stringify({"needId":id,"queryType":type}),
			success : function(res){
				if("success" == res.errCode){
					alert(res.errMsg);
					location.reload();
				}
			},
			error : function(XMLHttpRequest, textStatus,
							 errorThrown) {
				alert("刷新失败！请联系管理员");
			},
			complete : function(XMLHttpRequest, textStatus) {
			}
		});
	}
</script>

</head>
<body>
	<!-- 头部 -->

	<div class="input-box clearfix">
		<div class="left">
			<input type="text" style="height: 39px;" onblur="subSearch2();" id="TextSearch1" placeholder="" value="${text}" />
			<select name="type"  id="info_type" onchange="subSearch1(this);" >
				<option <c:if test="${type == 1}">selected</c:if> value="1">设计师</option>
				<option <c:if test="${type == 2}">selected</c:if> value="2">设计岗位</option>
				<option <c:if test="${type == 3}">selected</c:if> value="3">设计项目</option>
				<option <c:if test="${type == 4}">selected</c:if> value="4">工作室</option>
			</select>
		</div>
	</div>
	<br/>
	<h3 class="infotitle">
		<c:if test="${type == 1}">设计师信息</c:if>
		<c:if test="${type == 2}">设计岗位信息</c:if>
		<c:if test="${type == 3}">设计项目信息</c:if>
		<c:if test="${type == 4}">设计工作室信息</c:if>
	</h3>
	<div class="section-cols clearfix">
		<c:if test="${not empty pageBean.pageList}">
			<ul>
				<li>
					<span class="cate">承接加工</span>

					<span class="tel">状态</span>
					<span class="tel">更新日期</span>
					<span class="tel">操作</span>
				</li>
			</ul>
			<c:if test="${type == 1}">
				<c:forEach var="item" items="${pageBean.pageList}">
					<ul>
						<li>
							<span class="cate"><a href="${ctx}/b2b/personDetail.do?id=${item.id}">${item.workIntent}</a></span>

							<span class="tel">
								<c:if test="${item.status == -1}">待审核</c:if>
								<c:if test="${item.status == 1}">审核通过</c:if>
							</span>
							<span class="tel"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.updateTime}" /></span>
							<span class="tel">
								<a href="infoUpdate.do?id=${item.id}&type=1">编辑</a>
								<a href="javascript:void(0);" onclick="refresh('${item.id}', 1);">刷新</a>
							</span>
						</li>

					</ul>
				</c:forEach>
			</c:if>

			<c:if test="${type == 2}">
				<c:forEach var="item" items="${pageBean.pageList}">
					<ul>
						<li>
							<span class="cate"><a href="${ctx}/b2b/recruitmentDetail.do?id=${item.id}">${item.workType}</a></span>

							<span class="tel"><c:if test="${item.status == -1}">待审核</c:if>
								<c:if test="${item.status == 1}">审核通过</c:if></span>
							<span class="tel"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.updateTime}" /></span>
							<span class="tel">
								<a href="infoUpdate.do?id=${item.id}&type=2">编辑</a>
								<a href="javascript:void(0);" onclick="refresh('${item.id}', 2);">刷新</a>
							</span>
						</li>
					</ul>
				</c:forEach>
			</c:if>

			<c:if test="${type == 3}">
				<c:forEach var="item" items="${pageBean.pageList}">
					<ul>
						<li>
							<span class="cate"><a href="${ctx}/b2b/laborDetail.do?id=${item.id}">${item.workNeed}</a></span>

							<span class="tel"><c:if test="${item.status == -1}">待审核</c:if>
								<c:if test="${item.status == 1}">审核通过</c:if></span>
							<span class="tel"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.updateTime}" /></span>
							<span class="tel">
								<a href="infoUpdate.do?id=${item.id}&type=3">编辑</a>
								<a href="javascript:void(0);" onclick="refresh('${item.id}', 3);">刷新</a>
							</span>
						</li>
					</ul>
				</c:forEach>
			</c:if>

			<c:if test="${type == 4}">
				<c:forEach var="item" items="${pageBean.pageList}">
					<ul>
						<li>
							<span class="cate"><a href="${ctx}/b2b/factoryDetail.do?id=${item.id}">${item.workNeed}</a></span>

							<span class="tel"><c:if test="${item.status == -1}">待审核</c:if>
								<c:if test="${item.status == 1}">审核通过</c:if></span>
							<span class="tel"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.updateTime}" /></span>
							<span class="tel">
								<a href="infoUpdate.do?id=${item.id}&type=4">编辑</a>
								<a href="javascript:void(0);" onclick="refresh('${item.id}', 4);">刷新</a>
							</span>
						</li>
					</ul>
				</c:forEach>
			</c:if>
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