<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<c:set var="fileCtx" value="http://p2or9pg0j.bkt.clouddn.com/"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求栏目页</title>
<link rel="shortcut icon" href="${ctx}/common/image/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/personmain.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/qhc_main.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/flexslider.css" />
<script type="text/javascript" src="${ctx}/common/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var type = "${type}";
$(function(){
    $('.m-typeLst li').click(function(){
        $(this).addClass('z-now').siblings().removeClass('z-now');
    });
    $('.xqdt-demandLst th .u-main').click(function(){
        $(this).siblings('.m-hideLst').toggleClass('z-show');
    })
    $('.xqdt-demandLst .m-hideLst .m-types .m-btns>a').click(function(){
        $(this).parent().parent().parent().removeClass('z-show');
    })
})

function goPage(pageIndex){
	var text = $("#subSearchText").val();
	if(text==null || text==undefined){
		text="";
	}
	location.href="${ctx}/common/needColumn.do?pageIndex="+pageIndex+"&type="+type+"&text="+text;
}
function navActive(){
	$("#navLi_2").addClass("active");
}
function changeType(id){
	$("#subSearchText").val("");
	type=id;
	goPage(1);
}
function subSearch(){
	var text = $("#subSearchText").val();
	if(text==null || text==undefined){
		text="";
	}
	location.href="${ctx}/common/needColumn.do?pageIndex=1&type="+type+"&text="+text;
}
</script>
<style type="text/css">
/*分页插件*/
.WList_pages{margin:40px 0 60px 0;}
.WList_pages .page{list-style: none;display:table;margin:0 auto;}
.WList_pages .page>li{float: left;padding: 5px 10px;cursor: pointer;}
.WList_pages .page .pageItem{border: solid thin #DDDDDD;margin: 5px;}
.WList_pages .page .pageItemActive{border: solid thin #3a82d4;margin: 5px;background-color: #3a82d4;color:white;}
.WList_pages .page .pageItem:hover{border: solid thin #3a82d4;background-color: #3a82d4;color:white;}
.WList_pages .page .pageItemDisable{border: solid thin #ebebeb;margin: 5px;background-color: #efefef;}
</style>
</head>
<body>
	<!-- 左右广告 -->
	<%@ include file="/common/leftRightAdv.jsp"%>
	<!-- 上广告 -->
	<%@ include file="/common/topAdv.jsp"%>
	<!-- 头部 -->
	<%@ include file="/common/head.jsp"%>
	
	<div class="xqdt-con">
		<div class="xqdt-typeLst">
			<div class="u-qhc-tt">需求大厅<span style="color: #3a82d4;font-size: 14px;margin-left: 20px;font-weight: initial;">需求总量${count}个</span></div>
			<div class="m-typeLst">
				<ul class="clearfix">
					<c:forEach var="item" items="${checkTypeList}" varStatus="status">
						<li <c:if test="${type==item.checkId}">class="z-now"</c:if>>
							<a href="javascript:void(0);" onclick="changeType(${item.checkId});"> 
								<img src="${fileCtx}${item.checkIco}" alt="" />
								<div class="qhc-tabname">${item.checkName}</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="xqdt-demandLst">
			<h3 class="m-subhead">
				需求列表
				<c:if test="${not empty pageBean.pageList}">
					<div class="m-search">
						<input type="text" id="subSearchText" placeholder="在结果中继续搜索" value="${text}" /> <a href="javascript:void(0);" onclick="subSearch();" class="u-btn"></a>
					</div>
				</c:if>
			</h3>
			<c:if test="${not empty pageBean.pageList}">
			<table class="m-listDtl">
				<tr>
					<th style="width: 25%; text-align: left;">&nbsp;&nbsp;标题</th>
					<th style="width: 30%; text-align: left;">检测项目名称</th>
					<th style="width: 10%; text-align: left;">状态</th>
					<th style="width: 15%; text-align: left;">发布日期</th>
					<th style="width: 25%; text-align: left;">位置</th>
				</tr>
				<c:forEach var="item" items="${pageBean.pageList}">
					<tr>
						<td class="u-td1" style="text-align: left;"><a href="${ctx}/common/needDetails.do?id=${item.needId}">${item.needTitle}</a></td>
						<td style="text-align: left;">${item.projectName}</td>
						<%-- <td>${item.typeName}</td> --%>
						<c:if test="${item.needStatus=='0'}">
							<td style="color: red;text-align: left;">待报价</td>
						</c:if>
						<c:if test="${item.needStatus=='1' or item.needStatus=='2'}">
							<td style="color: #FF6347;text-align: left;">报价中</td>
						</c:if>
						<c:if test="${item.needStatus=='3' or item.needStatus=='4'}">
							<td style="color: blue;text-align: left;">检测中</td>
						</c:if>
						<c:if test="${item.needStatus=='5'}">
							<td style="color: black;text-align: left;">检测完成</td>
						</c:if>
						<td style="text-align: left;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.createTime}" /></td>
						<td style="text-align: left;">${item.needAddr}</td>
					</tr>
				</c:forEach>
			</table>
			</c:if>
		</div>
		<c:if test="${not empty pageBean.pageList}">
			<div class="WList_pages">
	            <ul class="page clearfix" id="page">
	            	<li <c:if test="${pageBean.pageIndex==1}"> class="pageItemDisable" </c:if> <c:if test="${pageBean.pageIndex!=1}"> class="pageItem"  onclick="goPage(1)"</c:if>>首页</li>
	            	<li <c:if test="${pageBean.pageIndex==1}"> class="pageItemDisable" </c:if> <c:if test="${pageBean.pageIndex!=1}"> class="pageItem"  onclick="goPage(${pageBean.pageIndex-1})"</c:if>>&lt;上一页</li>
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
	            		<li
	            			<c:if test="${pageBean.pageIndex==item}">class="pageItemActive"</c:if> 
	            			<c:if test="${pageBean.pageIndex!=item}">class="pageItem" onclick="goPage(${item})"</c:if>>
	            			${item}
	            		</li>
	            	</c:forEach>
	            	<li <c:if test="${pageBean.pageIndex==pageBean.pageSum}"> class="pageItemDisable" </c:if> <c:if test="${pageBean.pageIndex!=pageBean.pageSum}"> class="pageItem"  onclick="goPage(${pageBean.pageIndex+1})"</c:if>>下一页&gt;</li>
	            	<li <c:if test="${pageBean.pageIndex==pageBean.pageSum}"> class="pageItemDisable" </c:if> <c:if test="${pageBean.pageIndex!=pageBean.pageSum}"> class="pageItem"  onclick="goPage(${pageBean.pageSum})"</c:if>>尾页</li>
	            </ul>
	        </div>
        </c:if>
        <c:if test="${empty pageBean.pageList}">
        	<div style="width: 100%; height: 300px; text-align: center; line-height: 300px;">暂无数据</div>
        </c:if>
	</div>
	<!-- 下广告 -->
	<%@ include file="/common/bottomAdv.jsp"%>
	<!-- 工具条 -->
	<%@ include file="/common/tools.jsp"%>
	<!-- 底部 -->
	<%@ include file="/common/foot.jsp"%>
</body>
</html>