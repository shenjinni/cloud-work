<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${ctx}/common/css/normalize.css"/>
    <link rel="stylesheet" href="${ctx}/common/css/style.css"/>
    <script src="${ctx}/common/js/jquery-1.10.1.min.js" type="text/javascript" ></script>
    <script>
        $(function() {
            // 公告滚动
            $(".notice-content").textScroll();
        });

        /**
         * 从右往左滚动文字
         * @returns {undefined}
         */
        $.fn.textScroll = function() {
            // 滚动步长(步长越大速度越快)
            var step_len = 60;
            var this_obj = $(this);
            var child = this_obj.children();
            var this_width = this_obj.width();
            var child_width = child.width();
            var continue_speed = undefined;// 暂停后恢复动画速度
            // 初始文字位置
            child.css({
                left: this_width
            });

            // 初始动画速度speed
            var init_speed = (child_width + this_width) / step_len * 1000;

            // 滚动动画
            function scroll_run(continue_speed) {
                var speed = (continue_speed == undefined ? init_speed : continue_speed);
                child.animate({
                    left: -child_width
                }, speed, "linear", function() {
                    $(this).css({
                        left: this_width
                    });
                    scroll_run();
                });
            }

            // 鼠标动作
            child.on({
                mouseenter: function() {
                    var current_left = $(this).position().left;
                    $(this).stop();
                    continue_speed = (-(-child_width - current_left) / step_len) * 1000;
                },
                mouseleave: function() {
                    scroll_run(continue_speed);
                    continue_speed = undefined;
                }
            });

            // 启动滚动
            scroll_run();
        };

        function toPublish(url){
            var user = "${sessionScope.user}";
            if (user == "") {
                alert("未登录用户不能发布信息");
                return;
            }

            var sf = "${sessionScope.user.roleShortName}";

            if (sf == "normal") {
                alert("付费用户才能发布信息，充值会员，请查看收费标准～");
                return;
            }

            location.href=url;

        }

        function subSearch(type){

            if (type == 1) {
                location.href="${ctx}/b2b/recruitmentColumn.do?pageIndex=1";
            } else if (type == 2) {
                location.href="${ctx}/b2b/personColumn.do?pageIndex=1";
            } else if (type == 4) {
                location.href="${ctx}/b2b/laborColumn.do?pageIndex=1";
            } else if (type == 3) {
                location.href="${ctx}/b2b/factoryColumn.do?pageIndex=1";
            }
        }

        function subSearch1(){
            var text = $("#TextSearch").val();
            if(text==null || text==undefined){
                text="";
            }

            var type = $("#select_type").val();
            if(type==null || type==undefined){
                type=1;
            }
            if (type == 1) {
                location.href="${ctx}/b2b/recruitmentColumn.do?pageIndex=1&text="+text;
            } else if (type == 2) {
                location.href="${ctx}/b2b/factoryColumn.do?pageIndex=1&text="+text;
            } else if (type == 3) {
                location.href="${ctx}/b2b/personColumn.do?pageIndex=1&text="+text;
            } else if (type == 4) {
                location.href="${ctx}/b2b/laborColumn.do?pageIndex=1&text="+text;
            }
        }

        function alertLogin() {
            alert("未登录用户不能查看详情~");
        }

        function getDetail(id) {
            $.ajax({
                type : "POST",
                url : "${ctx}/b2b/checkLook2.json",
                dataType : "json",
                contentType : 'application/json;charset=UTF-8',
                success : function(res){
                    if("success" == res.errCode){
                        location.href="${ctx}/b2b/recruitmentDetail.do?id="+id;
                    } else {
                        var code = res.errMsg;
                        if (code == 1) {
                            alert("普通用户只能看3条");
                        } else if (code == 2) {
                            alert("未登录不能查看");
                        }
                    }
                },
                error : function(XMLHttpRequest, textStatus,
                                 errorThrown) {
                    alert("查看失败！");
                },
                complete : function(XMLHttpRequest, textStatus) {
                }
            });

        }

    </script>
</head>
<body>
<div class="zltz">
    <div class="login-box clearfix">
        <div class="left">
            <c:if test="${empty sessionScope.user}">
                <a href="${ctx}/common/localLogin.do?fromUrl=index.jsp">登录</a>
                <a href="${ctx}/common/registe.do">注册</a>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <a>
                    <c:if test="${empty sessionScope.user.realName}">${sessionScope.user.userLoginName}</c:if>
                    <c:if test="${not empty sessionScope.user.realName}">${sessionScope.user.realName}</c:if>
                    <c:if test="${sessionScope.user.roleShortName == 'admin'}">管理员</c:if>
                    <c:if test="${sessionScope.user.roleShortName == 'vip'}">付费用户</c:if>
                    <c:if test="${sessionScope.user.roleShortName == 'normal'}">普通用户</c:if>
                </a>
                <c:choose>
                    <c:when test="${sessionScope.user.roleShortName == 'admin'}">
                        <a href="${ctx}/admin/home.do">进入后台</a>
                    </c:when>
                    <c:otherwise><a href="${ctx}/b2b/myInfo/infoColumn.do">我的发布信息</a></c:otherwise>
                </c:choose>

                <a href="${ctx}/common/logout.do">退出</a>
            </c:if>
        </div>
        <div class="right">
            <a href="${ctx}/common/article.do?id=1">使用帮助</a>
            <a href="${ctx}/common/article.do?id=2">收费标准</a>
        </div>
    </div>
    <div class="search-list">
        <ul class="clearfix">
            <li>
                <a href="javascript:void(0);" onclick="subSearch(1);">
                    <span class="span1"><img src="${ctx}/common/images/02.png" alt=""/></span>
                    <span class="span2">设计岗位</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" onclick="subSearch(2);">
                    <span class="span1"><img src="${ctx}/common/images/2.png" alt=""/></span>
                    <span class="span2">设计师</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" onclick="subSearch(3);">
                    <span class="span1"><img src="${ctx}/common/images/04.png" alt=""/></span>
                    <span class="span2">设计工作室</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" onclick="subSearch(4);">
                    <span class="span1"><img src="${ctx}/common/images/05.png" alt=""/></span>
                    <span class="span2">设计项目</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="notice clearfix">
        <div class="notice-title"><span class="span1">通知:</span></div>
        <div class="notice-content">
            <div class="notice-text"><span>${article.articleTitle}</span></div>
        </div>
    </div>
    <div class="input-box clearfix">
        <div class="left">
            <input type="text" id="TextSearch" placeholder="输入工作室名称或职位"/>
            <select id="select_type">
                <option value="1">岗位</option>
                <option value="3">设计师</option>
                <option value="2">工作室</option>
                <option value="4">项目</option>
            </select>
            <%--<button><img src="${ctx}/common/images/01.png"/></button>--%>
        </div>
        <div class="right">
            <button onclick="subSearch1();">搜索</button>
        </div>
    </div>
    <div class="search-list">
        <ul class="clearfix">
            <li>
                <a href="javascript:void(0);" onclick="toPublish('${ctx}/b2b/personPublish.do');">
                    <span class="span1"><img src="${ctx}/common/images/02.png" alt=""/></span>
                    <span class="span2">求职登记</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" onclick="toPublish('${ctx}/b2b/recruitmentPublish.do');">
                    <span class="span1"><img src="${ctx}/common/images/2.png" alt=""/></span>
                    <span class="span2">招聘登记</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" onclick="toPublish('${ctx}/b2b/factoryPublish.do');">
                    <span class="span1"><img src="${ctx}/common/images/04.png" alt=""/></span>
                    <span class="span2">工作室登记</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" onclick="toPublish('${ctx}/b2b/laborPublish.do');">
                    <span class="span1"><img src="${ctx}/common/images/05.png" alt=""/></span>
                    <span class="span2">项目登记</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="post-list">
        <ul>
            <c:if test="${not empty pageBean.pageList}">

                <c:if test="${empty sessionScope.user}">
                    <c:forEach var="item" begin="0" end="3" items="${pageBean.pageList}">
                        <c:set var="mobile" value="${fn:substring(item.mobile,0,3)}****${fn:substring(item.mobile,7,11)}"></c:set>
                        <li>
                            <a onclick="alertLogin();" href="javascript:void(0);" class="clearfix">
                                <div class="post-time">
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${item.createTime}" />
                                </div>
                                <div class="post-name">
                                    <span class="span1">岗位:<i>${item.workType}</i></span>
                                    <span class="span2">${item.address}</span>
                                </div>
                                <div class="post-go"><img src="${ctx}/common/images/07.png" alt=""/></div>
                                <div class="post-phone">联系方式:<span>${mobile}</span></div>

                            </a>
                        </li>
                    </c:forEach>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <c:choose>
                        <c:when test="${sessionScope.user.roleShortName == 'normal'}">
                            <c:forEach var="item" begin="0" end="3" items="${pageBean.pageList}">
                                <c:set var="mobile" value="${fn:substring(item.mobile,0,3)}****${fn:substring(item.mobile,7,11)}"></c:set>
                                <li>
                                    <a onclick="getDetail(${item.id});" href="javascript:void(0);" class="clearfix">
                                        <div class="post-time">
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${item.createTime}" />
                                        </div>
                                        <div class="post-name">
                                            <span class="span1">岗位:<i>${item.workType}</i></span>
                                            <span class="span2">${item.address}</span>
                                        </div>
                                        <div class="post-go"><img src="${ctx}/common/images/07.png" alt=""/></div>
                                        <div class="post-phone">联系方式:<span>${mobile}</span></div>

                                    </a>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="item" items="${pageBean.pageList}">
                                <li>
                                    <a href="${ctx}/b2b/recruitmentDetail.do?id=${item.id}" class="clearfix">
                                        <div class="post-time">
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${item.createTime}" />
                                        </div>
                                        <div class="post-name">
                                            <span class="span1">岗位:<i>${item.workType}</i></span>
                                            <span class="span2">${item.address}</span>
                                        </div>
                                        <div class="post-go"><img src="${ctx}/common/images/07.png" alt=""/></div>
                                        <div class="post-phone">联系方式:<span>${item.mobile}</span></div>

                                    </a>
                                </li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </c:if>
        </ul>
    </div>
    <div class="footer">
        <p class="p1">联系方式：<a href="tel://18244913996" style="position:relative">18244913996 </a>（叶小姐）</p>
        <p class="p2">©2018 www.zhilitz-fashion.com 浙ICP备18020964号-1</p>
        <p class="p3"><a href="${ctx}">织里童装设计网</a></p>
    </div>
</div>
</body>
</html>

</html>