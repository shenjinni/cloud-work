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
	loadNews();//加载最新新闻
	loadParentCheckType();//加载能力分类
	loadLabSum();//加载实验室数量
	loadNewLab();//加载最新入驻实验室
	loadHotLab();//加载最热实验室
	loadLeagueData();//加载联盟专区数据
	loadBanner();//加载banner
});

/*
 * 最新需求
 */
function loadNeed(){
	$.post("${ctx}/common/homeGetNeedTop5.json",{
		
	},function (data){
		if(data.flag==true){
			var needTop5 = data.needTop5;
			var ul = document.getElementById("needUl");
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
/*
 * 最新新闻
 */
function loadNews(){
	$.post("${ctx}/common/homeGetArticleTop6.json",{
		
	},function (data){
		if(data.flag==true){
			var articleTop6 = data.articleTop6;
			var ul = document.getElementById("newsUl");
			for(var i=0;i<articleTop6.length;i++){
				var li = document.createElement("li");
				var text = "<a target='_blank' href='${ctx}/common/checkDetails.do?id="+articleTop6[i].articleId+"'><i>"+new Date(articleTop6[i].createTime).Format("yyyy-MM-dd")+"</i>&nbsp;"+articleTop6[i].articleTitle+"</a><em>|</em>"
				li.innerHTML=text;
				ul.appendChild(li);
			}
			// 横向文字滚动 begin
			var demo = document.getElementById("demo");
			var demo1 = document.getElementById("demo1");
			var demo2 = document.getElementById("demo2");
			demo2.innerHTML = document.getElementById("demo1").innerHTML;
			function Marquee() {
				if (demo.scrollLeft - demo2.offsetWidth >= 0) {
					demo.scrollLeft -= demo1.offsetWidth;
				} else {
					demo.scrollLeft++;
				}
			}
			var myvar = setInterval(Marquee, 10);
			demo.onmouseout = function() {
				myvar = setInterval(Marquee, 10);
			}
			demo.onmouseover = function() {
				clearInterval(myvar);
			}
			// 文字滚动 end
		}else{
			alert(data.msg);
		}
	},"json");
}
/*
 * 分类父级加载
 */
function loadParentCheckType(){
	$.post("${ctx}/common/homeGetCheckTypeChildren.json",{
		pid : -1
	},function (data){
		if(data.flag==true){
			var checkTypeChildrenList = data.checkTypeChildrenList;
			var ul = document.getElementById("typeUl");
			for(var i=0;i<checkTypeChildrenList.length;i++){
				var li = document.createElement("li");
				li.id="pcheck_"+checkTypeChildrenList[i].checkId;
				li.onclick=function (){
					loadCheckType(this);
				}
				var a = document.createElement("a");
				a.href="javascript:void(0);";
				var img = document.createElement("img");
				img.style.width="61px";
				img.style.height="61px";
				if(checkTypeChildrenList[i].checkIco==""||checkTypeChildrenList[i].checkIco==null){
					img.src="${ctx}/common/images/qhc-tab.png";
				}else{
					img.src="${fileCtx}"+checkTypeChildrenList[i].checkIco;
				}
				var div = document.createElement("div");
				div.className="qhc-tabname";
				div.innerHTML=checkTypeChildrenList[i].checkName;
				a.appendChild(img);
				a.appendChild(div);
				li.appendChild(a);
				ul.appendChild(li);
				if(i==0){
					li.className="qhc-active1";
					li.click();
				}
			}
		}else{
			alert(data.msg);
		}
	},"json");
}

/*
 * 分类二级加载
 */
function loadCheckType(tag){
	var pid=tag.id.split("_")[1];
	$.post("${ctx}/common/homeGetCheckTypeChildren.json",{
		pid : pid
	},function (data){
		if(data.flag==true){
			var checkTypeChildrenList = data.checkTypeChildrenList;
			var titleImg = document.getElementById("childTypeTitle").children[0];
			titleImg.style.width="61px";
			titleImg.style.height="61px";
			var titleText = document.getElementById("childTypeTitle").children[1];
			$("#typeUl li").attr("class","");
			var titleTag = document.getElementById("pcheck_"+pid);
			titleTag.className="qhc-active1";
			titleImg.src=titleTag.children[0].children[0].src;
			titleText.innerHTML=titleTag.children[0].children[1].innerHTML;
			var ul = document.getElementById("typeSubUl");
			ul.innerHTML="";
			for(var i=0;i<checkTypeChildrenList.length;i++){
				var li = document.createElement("li");
				var a = document.createElement("a");
				a.href="${ctx}/common/abilityColumn.do?subType="+checkTypeChildrenList[i].checkId+"#mao";
				a.target="_blank";
				a.innerHTML=checkTypeChildrenList[i].checkName;
				li.appendChild(a);
				ul.appendChild(li);
			}
		}else{
			alert(data.msg);
		}
	},"json");
}

/*
 * 实验室数量
 */
function loadLabSum(){
	$.post("${ctx}/common/homeGetLabSum.json",{
		
	},function (data){
		if(data.flag==true){
			$("#labSumSpan").text(data.labSum);
		}else{
			alert(data.msg);
		}
	},"json");
}

/*
 * 最新入驻实验室
 */
function loadNewLab(){
	$.post("${ctx}/common/homeGetLabTop4.json",{
		
	},function (data){
		if(data.flag==true){
			var labTop4 = data.labTop4;
			var ul = document.getElementById("NewLabUl");
			for(var i=0;i<labTop4.length;i++){
				var li = document.createElement("li");
				var a = document.createElement("a");
				a.target="_blank";
				a.href="${ctx}/common/labInfoColumn.do?labId="+labTop4[i].labId;
				a.innerHTML=labTop4[i].labName;
				li.appendChild(a);	
				ul.appendChild(li);
			}
			// 入驻横向文字滚动 begin
			var demolist = document.getElementById("demolist");
			var demolist1 = document.getElementById("demolist1");
			var demolist2 = document.getElementById("demolist2");
			demolist2.innerHTML = document.getElementById("demolist1").innerHTML;
			function Marquee1() {
				if (demolist.scrollLeft - demolist2.offsetWidth >= 0) {
					demolist.scrollLeft -= demolist1.offsetWidth;
				} else {
					demolist.scrollLeft++;
				}
			}
			var myvar1 = setInterval(Marquee1, 10);
			demolist.onmouseout = function() {
				myvar1 = setInterval(Marquee1, 10);
			}
			demolist.onmouseover = function() {
				clearInterval(myvar1);
			}
			// 入驻文字滚动 end
		}else{
			alert(data.msg);
		}
	},"json");
}

/*
 * 最热实验室
 */
function loadHotLab(){
	$.post("${ctx}/common/homeGetLabHot8.json",{
		
	},function (data){
		if(data.flag==true){
			var labHot8 = data.labHot8;
			var ul = document.getElementById("hotUl");
			for(var i=0;i<labHot8.length;i++){
				var li = document.createElement("li");
				var a = document.createElement("a");
				a.title=labHot8[i].labName;
				a.href="${ctx}/common/labInfoColumn.do?labId="+labHot8[i].labId;
				//a.target="_blank";
				var img = document.createElement("img");
// 				img.style.width="100%";
// 				img.style.height="135px";
				if(labHot8[i].labCompanyImages==""||labHot8[i].labCompanyImages==null){
					img.src="${ctx}/common/images/qhc_banner.jpg";
				}else{
					img.src="${fileCtx}"+labHot8[i].labCompanyImages.split(";")[0];
				}
				a.appendChild(img);
				li.appendChild(a)
				ul.appendChild(li);
			}
			$(".flexslider").flexslider({
				animation : "slide",
				animationLoop : false,
				controlNav : false,
				itemWidth : 235,
				itemMargin : 20,
				minItems : 4,
				maxItems : 4
			});
		}else{
			alert(data.msg);
		}
	},"json");
}

/*
 * 联盟专区
 */
function loadLeagueData(){
	$.post("${ctx}/common/homeGetLeagueData.json",{
		
	},function (data){
		if(data.flag==true){
			var list = data.leagueList;
			for(var i=0;i<list.length;i++){
				//联盟
				document.getElementById("lm"+(i+1)).style.display="";
				document.getElementById("lmName"+(i+1)).innerHTML=list[i].leagueName;
				document.getElementById("lmNames"+(i+1)).innerHTML=list[i].leagueName;
				//动态
				var newsUl = document.getElementById("lmNewsUl"+(i+1));
				var newsMainUl = document.getElementById("lmNewsMainUl"+(i+1));
				var newsList = data['activityList'+i];
				for(var j=0;j<newsList.length;j++){
					//小滚动
					var li = document.createElement("li");
					var a = document.createElement("a");
					a.href="${ctx}/common/activityDetails.do?id="+newsList[j].leagueActivityId;
					a.target="_blank";
					a.innerHTML=newsList[j].activityTitle;
					li.appendChild(a);
					newsUl.appendChild(li);
					//模块
					var liMain = document.createElement("li");
					var aMain = document.createElement("a");
					aMain.href="${ctx}/common/activityDetails.do?id="+newsList[j].leagueActivityId;
					aMain.target="_blank";
					aMain.className="clearfix";
					var iMain = document.createElement("i");
					iMain.className="state_icon";
					iMain.innerHTML=j+1;
					var h5Main = document.createElement("h5");
					h5Main.className="tit";
					h5Main.innerHTML=newsList[j].activityTitle;
					var pMain = document.createElement("p");
					pMain.className="desc";
					pMain.innerHTML=newsList[j].activityContent.stripHTML();
					aMain.appendChild(iMain);
					aMain.appendChild(h5Main);
					aMain.appendChild(pMain);
					liMain.appendChild(aMain);
					newsMainUl.appendChild(liMain);
				}
				//banner
				var bannerDiv = document.getElementById("lmBanner"+(i+1));
				var bannerIndexDiv = document.getElementById("lmBannerIndex"+(i+1));
				var bannerList = data['bannerList'+i];
				for(var j=0;j<bannerList.length;j++){
					var div = document.createElement("div");
					div.className="child";
					div.style.backgroundImage="url('${fileCtx}/"+bannerList[j].carouselUrl+"')";
					var a = document.createElement("a");
					a.href="javascript:void(0);";
					div.appendChild(a);
					bannerDiv.appendChild(div);
					var indexA = document.createElement("a");
					indexA.href="javascript:void(0);";
					bannerIndexDiv.appendChild(indexA);
				}
				//成员
				var itemList = data['applyList'+i];
				var itemUl = document.getElementById("lmItemUl"+(i+1));
				for(var j=0;j<itemList.length;j++){
					var itemLi = document.createElement("li");
					var itemIText = "";
					if(itemList[j].applyDuties=="1"){
						itemIText="<i class='state-icon red'>理事长</i>";
					}else if(itemList[j].applyDuties=="2"){
						itemIText="<i class='state-icon org'>副理事</i>";
					}else{
						itemIText="<i class='state-icon'>成员</i>";
					}
					var itemAText = "<a target='_blank' href='${ctx}/common/labInfoColumn.do?labId="+itemList[j].labId+"'>"+itemList[j].companyName+"</a>";
					itemLi.innerHTML=itemIText+itemAText;
					itemUl.appendChild(itemLi);
				}
				//轮播
			    $('.Union_slider.Union_slider'+(i+1)+' .frame').mScroll({
			          nav : ".Union_slider.Union_slider"+(i+1)+" .nav a",     //导航按钮
			    });
			}
			//切换  
			$('.UnionCut_cap i.btnIcon').click(function(){
				$('.UnionZ .UnionCut').eq($(this).index(".UnionCut_cap i.btnIcon")).addClass('cur').siblings('.UnionCut').removeClass('cur');
			})
			//滚动列表
		    $(".member-list").slimScroll({
		        height: '230px'
		    });
			 // 消息滚动列表
	        $(".slidertop_list").rollGallery({
	            direction:"top",
	            speed:3000,
	            showNum:1
	        }); 
		}else{
			alert(data.msg);
		}
	},"json");
}

/*
 * banner
 */
 function loadBanner(){
 	$.post("${ctx}/common/homeGetBannerList.json",{
 		
 	},function (data){
 		if(data.flag==true){
 			var bannerList = data.bannerList;
 			var bannerDiv = document.getElementById("bannerDiv");
 			var bannerIndexDiv = document.getElementById("bannerIndexDiv");
 			for(var i=0;i<bannerList.length;i++){
 				var div = document.createElement("div");
 				div.className="child";
 				div.style.backgroundImage="url('${fileCtx}"+bannerList[i].bannerImage+"')";
 				div.style.backgroundSize="cover";
 				var a = document.createElement("a");
				if(bannerList[i].bannerUrl!=null&&bannerList[i].bannerUrl!=""){
					div.pid=bannerList[i].bannerUrl;
 				}
 				div.onclick=function (){
 					if(this.pid!=null&&this.pid!=""){
 						window.open(this.pid);
 					}
 				}
 				div.appendChild(a);
 				bannerDiv.appendChild(div);
 				
 				var indexA = document.createElement("a");
 				a.href="javascript:void(0);";
 				bannerIndexDiv.appendChild(indexA);
 			}
 			$('.CASICloud_banner .frame').mScroll({
 				nav : ".CASICloud_banner .nav a",
 				title : ".CASICloud_banner .title",
 				speed : 300
 			});
 		}else{
 			alert(data.msg+"1");
 		}
 	},"json");
 }


<%-- ajax end --%>
</script>
<div class="qhc-main">
	<div class="qhc-mainOne">
		<div class="qhc-left">
			<!--------------banner-------------->
			<div class="CASICloud_banner">
				<a href="javascript:;" class="prev"></a>
				<div class="frame" id="bannerDiv">

				</div>
				<a href="javascript:;" class="next"></a>
				<div class="nav" id="bannerIndexDiv">
					
				</div>
				<!--<div class="title"></div>-->
			</div>
			<!--------------banner-------------->
		</div>
		<!--   分割线     -->
		<div class="qhc-line"></div>
		<!--   需求列表     -->
		<div class="qhc-middle">
			<div class="qhc-middle-title">
				<span>最新需求</span> <a href="${ctx}/common/needColumn.do" class="">更多</a>
			</div>
			<div id="scrollDiv1">
				<ul id="needUl">

				</ul>
			</div>
		</div>
		<!--   分割线     -->
		<div class="qhc-line"></div>
		<div class="qhc-right">
			<div class="qhc-rightone">
				<a href="javascript:goPublish();" class="qhc-publishone"><img src="${ctx}/common/images/qhc_detection.png" /><span>发布检测需求</span></a>
			</div>
			<div class="qhc-rightone qhc-righttwo">
				<a href="${ctx}/common/skipLabEnterColumn.do" class="qhc-publishone qhc-publishtwo"><img src="${ctx}/common/images/qhc_detection.png" /><span>实验室入驻</span></a>
			</div>
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
	<div class="qhc-mainThree">
		<div class="qhc-title">
			<div class="qhc-midline"></div>
			<span>能力大厅</span>
		</div>
		<div class="qhc-tab">
			<ul class="qhc-Ul1" id="typeUl">

			</ul>
			<div class="qhc-line1"></div>
			<div class="qhc-ul1list">
				<div class="qhc-ul1list-left" id="childTypeTitle">
					<img src="${ctx}/common/images/qhc-tab.png" alt="" />
					<div class="qhc-tabname">机械设计与制造</div>
				</div>
				<div class="qhc-ul1list-right">
					<ul id="typeSubUl">

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--能力大厅-->
	<!--热门实验室-->
	<div class="qhc-mainFour">
		<div class="qhc-Tit">
			<span>热门实验室</span> 
			<a href="${ctx}/common/labListColumn.do?pageNumber=1">更多</a>
		</div>
		<div class="qhc-flexslider">
			<div class="flexslider">
				<ul class="slides" id="hotUl">

				</ul>
			</div>
		</div>
	</div>
	<!--热门实验室-->
	<!--入驻公司-->
	<div class="qhc-mainFive">
		<div class="scrollBox" id="scrollBox">
			<div class="qhc-enterL">最新入驻</div>
			<div class="qhc-enterR">
				已入驻实验室:<span id="labSumSpan"></span>家
			</div>
			<div style="width: 860px;" class="txtBox" id="demolist">
				<div class="winBox">
					<div id="demolist1">
						<ul class="scroll" id="NewLabUl">

						</ul>
					</div>
					<div id="demolist2"></div>
				</div>
			</div>
		</div>
	</div>
	<!--入驻公司-->
	<!--联盟专区-->
	<div class="UnionZ">
		<div class="qhc-Tit">
			<span>联盟专区</span> <a href="${ctx }/common/leagueColumn.do">更多</a>
		</div>
		<div class="UnionCut cur" style="display: none;" id="lm1">
			<div class="UnionCut_cap">
				<h4 class="tit" id="lmName1"></h4>
				<div class="slidertop">
					<ul class="slidertop_list" id="lmNewsUl1">
					</ul>
				</div>
				<i class="btnIcon"></i>
			</div>
			<div class="UnionCut_con">
				<div class="UnionCut_slider">
					<h2 class="slider_tit" id="lmNames1"></h2>
					<!-- slider内容 Begin -->
					<div class="Union_slider Union_slider1">
						<div class="frame" id="lmBanner1">
							
						</div>
						<div class="nav" id="lmBannerIndex1">
							
						</div>
					</div>
					<!-- slider内容 End -->
				</div>
				<!-- 动态 -->
				<div class="UnionCut_state">
					<div class="list_cap">
						<h3 class="cap">联盟动态</h3>
					</div>
					<ul class="state_list" id="lmNewsMainUl1">
						
					</ul>
				</div>
				<!-- 联盟成员 -->
				<div class="sqbt-member">
					<div class="list-cap">
						<h3 class="cap">联盟成员</h3>
					</div>
					<div class="clearfix">
						<ul class="member-list" id="lmItemUl1">
							
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="UnionCut" style="display: none;" id="lm2">
			<div class="clearfix UnionCut_cap">
				<h4 class="tit" id="lmName2"></h4>
				<div class="slidertop">
					<ul class="slidertop_list" id="lmNewsUl2">
					</ul>
				</div>
				<i class="btnIcon"></i>
			</div>
			<div class="UnionCut_con">
				<div class="UnionCut_slider">
					<h2 class="slider_tit" id="lmNames2"></h2>
					<!-- slider内容 Begin -->
					<div class="Union_slider Union_slider2">
						<div class="frame" id="lmBanner2">
							
						</div>
						<div class="nav" id="lmBannerIndex2">
							
						</div>
					</div>
					<!-- slider内容 End -->
				</div>
				<!-- 动态 -->
				<div class="UnionCut_state">
					<div class="list_cap">
						<h3 class="cap">联盟动态</h3>
					</div>
					<ul class="state_list" id="lmNewsMainUl2">
						
					</ul>
				</div>
				<!-- 联盟成员 -->
				<div class="sqbt-member">
					<div class="list-cap">
						<h3 class="cap">联盟成员</h3>
					</div>
					<div class="clearfix">
						<ul class="member-list" id="lmItemUl2">
							
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="UnionCut" style="display: none;" id="lm3">
			<div class="clearfix UnionCut_cap">
				<h4 class="tit" id="lmName3"></h4>
				<div class="slidertop">
					<ul class="slidertop_list" id="lmNewsUl3">
					</ul>
				</div>
				<i class="btnIcon"></i>
			</div>
			<div class="UnionCut_con">
				<div class="UnionCut_slider">
					<h2 class="slider_tit" id="lmNames3"></h2>
					<!-- slider内容 Begin -->
					<div class="Union_slider Union_slider3">
						<div class="frame" id="lmBanner3">
							
						</div>
						<div class="nav" id="lmBannerIndex3">
							
						</div>
					</div>
					<!-- slider内容 End -->
				</div>
				<!-- 动态 -->
				<div class="UnionCut_state">
					<div class="list_cap">
						<h3 class="cap">联盟动态</h3>
					</div>
					<ul class="state_list" id="lmNewsMainUl3">
						
					</ul>
				</div>
				<!-- 联盟成员 -->
				<div class="sqbt-member">
					<div class="list-cap">
						<h3 class="cap">联盟成员</h3>
					</div>
					<div class="clearfix">
						<ul class="member-list" id="lmItemUl3">
							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--联盟专区-->

	<!--物联网实验室-->
	<%-- <div class="qhc-mainSeven">
			<div class="qhc-Tit">
				<span>物联网实验室</span>
			</div>
			<div class="qhc-mainSeven-padding">
				<div class="qhc-Img">
					<img src="${ctx}/common/images/qhc_banner.jpg" />
				</div>
				<div class="qhc-Img">
					<img src="${ctx}/common/images/qhc_banner.jpg" />
				</div>
				<!--   分割线     -->
				<div class="qhc-line3"></div>
				<!--实验室工单-->
				<div style="float: right;">
					<div class="qhc-middle-title">
						<span>实验室工单</span> <a href="javascript:;" class="">更多</a>
					</div>
					<div id="scrollDiv3">
						<ul>
							<li><span class="time">2017-04-25</span> <a href="javascript:;" class="con"> 最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动... </a></li>
							<li><span class="time">2017-04-25</span> <a href="javascript:;" class="con"> 最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动... </a></li>
							<li><span class="time">2017-04-25</span> <a href="javascript:;" class="con"> 最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动... </a></li>
							<li><span class="time">2017-04-25</span> <a href="javascript:;" class="con"> 最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动态最新动... </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div> --%>

	<!--未知需求-->
	 <div>
		<ul class="foot">
			<li>
				<img src="${ctx}/common/images/main1.png"/><p>专业解答</p>
			</li>
			<li>
				<img src="${ctx}/common/images/main3.png"/><p>精准对接</p>
			</li>
			<li>
				<img src="${ctx}/common/images/main4.png"/><p>免费入驻</p>
			</li>
			<li>
				<img src="${ctx}/common/images/main2.png"/><p>高效推广</p>
			</li>
		</ul>
		
	</div>
</div>