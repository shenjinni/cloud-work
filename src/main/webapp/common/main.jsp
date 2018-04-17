<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/qhc_main.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/flexslider.css" />
<script src="${ctx}/common/js/jquery.flexslider.js" type="text/javascript"></script>
<script src="${ctx}/common/js/carousel.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/common/js/jq_scroll.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/common/js/util.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/common/js/Union_slider.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/common/js/Union.slimscroll.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/common/js/jquery.rollGallery_yeso.js" type="text/javascript" charset="utf-8"></script>
<style>
.flexslider li {
	margin-right: 20px;
}
.flexslider .slides img {
	width: 100%;
	height:135px; 
	display: block;
}
#nav-list li {
	padding: 0px;
	text-align: center;
}

.qhc-tab {
	float: left;
}

.qhc-ul1list {
	float: left;
}
</style>
<script type="text/javascript">
function navActive(){
	$("#navLi_1").addClass("active");
}
<%-- 交互样式begin --%>
$(function() {
	//能力大厅切换
	$('.qhc-Ul1 li').click(
			function() {
				$(this).addClass('qhc-active1').siblings().removeClass(
						'qhc-active1');
			});
});

<%-- 交互样式end --%>
<%-- ajax begin --%>
$(function (){
	loadNeed();//加载最新需求
});

/*
 * 最新需求
 */
function loadNeed(){
	$.post("${ctx}/common/homeGetNeedTop5.json",{
		
	},function (data){
		if(data.flag==true){
			var needTop5 = data.needTop5;
			var ul = document.getElementById("typeUl");
			for(var i=0;i<needTop5.length;i++){
				var li = document.createElement("li");
				var a = document.createElement("a");
				var span = document.createElement("span");
				a.innerHTML=needTop5[i].needTitle;
				a.className="con";
				a.target="_blank";
				a.href="${ctx}/common/needDetails.do?id="+needTop5[i].needId;
				span.className="time";
				span.innerHTML=new Date(needTop5[i].createTime).Format("yyyy-MM-dd");
				li.appendChild(span);
				li.appendChild(a);
				ul.appendChild(li);
			}
			$("#scrollDiv1").Scroll({
				line : 1,
				speed : 300,
				timer : 3000
			});
		}else{
			alert(data.msg);
		}
	},"json");
}

<%-- ajax end --%>
</script>
<div class="qhc-main">
	<div class="qhc-mainOne">
		<div class="qhc-left">
			<a href="javascript:goPublish();" class="qhc-publish">
				<img src="${ctx}/common/images/qhc_detection.png" />
				发布需求
			</a>
			<a href="javascript:goPublish();" class="qhc-publish">
				<img src="${ctx}/common/images/qhc_detection.png" />
				发布需求
			</a>
		</div>
		<!--   分割线     -->
		<div class="qhc-line"></div>

		<div class="qhc-left">
			<a href="javascript:goPublish();" class="qhc-publish">
				<img src="${ctx}/common/images/qhc_detection.png" />
				发布需求
			</a>
			<a href="javascript:goPublish();" class="qhc-publish">
				<img src="${ctx}/common/images/qhc_detection.png" />
				发布需求
			</a>
		</div>
	</div>

	<!--滚动新闻-->
	<div class="qhc-mainTwo">
		<div class="scrollBox">
			<div class="txtBox" id="demo">
				<div class="winBox">
					<div id="demo1">
						<ul class="scroll" id="newsUl">

						</ul>
					</div>
					<div id="demo2"></div>
				</div>
			</div>
		</div>
	</div>
	<!--滚动新闻-->

	<!--能力大厅-->
	<h3 class="infotitle">加工厂信息</h3>
	<div class="section-cols clearfix">
		<ul>
			<li>
				<span class="cate">承接加工</span>
				<span class="wh">联系人</span>
				<span class="tel">电话</span>
				<span class="date">日期</span>
			</li>
		</ul>
	</div>
	<br />
	<div class="clear">
	</div>
	<div class="qhc-mainThree">
		<div class="qhc-title">
			<div class="qhc-midline"></div>
			<span>招工信息</span>
		</div>
		<div class="qhc-tab">
			<ul class="qhc-Ul1" id="typeUl">

			</ul>
			<div class="qhc-line1"></div>

		</div>
	</div>
	<!--能力大厅-->
</div>