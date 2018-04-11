<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@ include file="left.jsp" %>       
<c:set var="fileCtx" value="http://p2or9pg0j.bkt.clouddn.com/"></c:set>
<script src="${ctx}/common/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=hB0gDuQFvlegcFgiqwiX3kf9"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/backhome.css"/>
<script type="text/javascript" src="${ctx}/common/js/list-script.js"></script>
    <div>
         <div id="page-wrapper">
 			<!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">后台管理</div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="${ctx}/admin/home.do">主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="hidden"><a href="#">Tables</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">后台管理</li>
                </ol>
                <div class="clearfix">
                </div>
            </div>
            <div class="page-content">
            	<div class="bh-index">
					<ul class="bh-top">
						<li>
							<div class="bh-bg bh-bg1"></div>
							${tradeSum } 元</li>
						<li>
							<div class="bh-bg bh-bg2"></div>
							${labNum } 家</li>
						<li>
							<div class="bh-bg bh-bg3"></div>
							${userNum } 用户</li>
						<li>
							<div class="bh-bg bh-bg4"></div>
							需求 ${needNum }</li>
					</ul>
					<div class="bh-choose">
						<button class="bh-button">首页布局管理</button>
					</div>
					<!--首页布局管理-->
					<div class="bh-bg001 bh-one"></div>
					<div class="bh-bg002 bh-one">
						<div id="bh-select1" class="list-select " >
							<div class="bh-title">首页布局设置<span class="bh-closeOne bh-closetwo">关闭</span></div>
							<div class="L-activity-item">
								<span class="L-activity-span1">可添加</span> <span class="L-activity-span2">已添加</span>
							</div>
							<div class="list-body">
								<div class="item-box left-box" id="bj_left_div">
									<!-- 左边框初始化待选项 -->
									<c:forEach var="bjLeft" items="${bjLeftList}">
										<span class="item" data-id="${bjLeft.spanId}" data-href="${bjLeft.spanUrl}">${bjLeft.spanName}</span>
									</c:forEach>
								</div>
								<div class="center-box">
									<button class="add-one" title="添加选中项">&gt;</button>
									<button class="add-all" title="添加全部">&gt;&gt;</button>
									<button class="remove-one" title="移除选中项">&lt;</button>
									<button class="remove-all" title="移除全部">&lt;&lt;</button>
								</div>
								<div class="item-box right-box" id="bj_right_div">
									<!-- 右边框存放已选项 -->
									<c:forEach var="bjRight" items="${bjRightList}">
										<span class="item" data-id="${bjRight.spanId}" data-href="${bjRight.spanUrl}">${bjRight.spanName}</span>
									</c:forEach>
								</div>
							</div>
							<div class="list-footer">
								<button class="selected-val selected-one" title="获取选择值，输出到控制台">确定</button>
							</div>
						</div>
					</div>
					<!--首页布局管理-->
					
					<!--常用功能设置-->
					<div class="bh-bg001 bh-two"></div>
					<div class="bh-bg002 bh-two">
						<div id="bh-select2" class="list-select " >
							<div class="bh-title">常用功能设置<span class="bh-closeOne bh-closethree">关闭</span></div>
							<div class="L-activity-item">
								<span class="L-activity-span1">可添加</span> <span class="L-activity-span2">已添加</span>
							</div>
							<div class="list-body">
								<div class="item-box left-box" id="gn_left_div">
									<!-- 左边框初始化待选项 -->
									<c:forEach var="gnLeft" items="${gnLeftList}">
										<span class="item" data-id="${gnLeft.spanId}" data-href="${ctx}${gnLeft.spanUrl}">${gnLeft.spanName}</span>
									</c:forEach>
								</div>
								<div class="center-box">
									<button class="add-one" title="添加选中项">&gt;</button>
									<button class="add-all" title="添加全部">&gt;&gt;</button>
									<button class="remove-one" title="移除选中项">&lt;</button>
									<button class="remove-all" title="移除全部">&lt;&lt;</button>
								</div>
								<div class="item-box right-box" id="gn_right_div">
									<!-- 右边框存放已选项 -->
									<c:forEach var="gnRight" items="${gnRightList}">
										<span class="item" data-id="${gnRight.spanId}" data-href="${ctx}${gnRight.spanUrl}">${gnRight.spanName}</span>
									</c:forEach>
								</div>
							</div>
							<div class="list-footer">
								<button class="selected-val selected-two" title="获取选择值，输出到控制台">确定</button>
							</div>
						</div>
					</div>
					<!--常用功能设置-->
					<div class="bh-navL">
						<div class="bh-navL-1">
							<div class="bh-action">
								<span>常用功能</span>
								<em class="bh-close">关闭</em>
								<em class="bh-set">设置</em>
							</div>
							<div class="bh-list">
								<ul id="gn_ul">
									<c:forEach var="gnRight" items="${gnRightList}">
										<li>
											<a href="${ctx}${gnRight.spanUrl}"><img src="${ctx}/common/images/qhc-shezhi.png"/>
												<div>${gnRight.spanName}</div>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="bh-navL-2">
							<div class="bh-action">
								<span>统计信息</span>
								<em class="bh-close1">关闭</em>
							</div>
							<div class="bh-items"> 
								<ul>
									<li>
										<h3>业务统计数据</h3>
										<span>需求数量：<em>${needNum }</em></span>
										<span>委托数量：<em>${orderNum }</em></span>
										<span>成交数量：<em>${dealNum }</em></span>            
										<span>成交金额：<em>${tradeSum }元</em></span>
									</li>
									<li>
										<h3>站点统计数据</h3>
										<p>
											<span>用户数量：<em>${userNum }</em></span>
											<span>实验室数量：<em>${labNum }</em></span>
										</p>
										<span>今日浏览量（PV）：<em>${pvData}</em></span>            
										<span>今日独立（IP）：<em>${ipData}</em></span>
										<span>今日用户量（UV）：<em>${uvData}</em></span>
									</li>
									<li>
										<h3>运营统计数据</h3>
										<span>优惠券数量：<em>${couponNum }</em></span>
										<span>优惠券使用数量：<em>${usedCouponNum }</em></span>
										<span> 广告总数量：<em>${advertisementNum }</em></span>            
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="bh-navR">
						<div class="bh-action">
							<span>入驻实验室分布展示</span>
							<em class="bh-close2">关闭</em>
						</div>
						<div class="bh-map" id="baiduMap">
							地图
						</div>
					</div>
				
				</div>
            </div>
        </div>
	</div>
</body>
</html>

<script type="text/javascript">
		//缓存集合
		var arr = new Array();
		//百度地图API功能
		var map = new BMap.Map("baiduMap", {
			enableMapClick : false
		});
		//默认位置
		var point = new BMap.Point(116.413384, 39.910925);
		map.centerAndZoom(point, 12);
		map.enableScrollWheelZoom();
		//比例尺控件
		var top_left_control = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_TOP_RIGHT
		});// 右上角，添加比例尺
		var top_left_navigation = new BMap.NavigationControl({
			anchor : BMAP_ANCHOR_TOP_RIGHT
		}); //右上角，添加默认缩放平移控件
		//添加控件和比例尺
		map.addControl(top_left_control);
		map.addControl(top_left_navigation);
		//通过ip获取当前城市位置
		function myFun(result) {
			var cityName = result.name;
			map.setCenter(cityName);
		}
		var myCity = new BMap.LocalCity();
		myCity.get(myFun);
		//加载控件
		var size = new BMap.Size(10, 20);
		map.addControl(new BMap.CityListControl({
			anchor : BMAP_ANCHOR_TOP_LEFT,
			offset : size
		}));

		//地图加载完成事件
		map.addEventListener("tilesloaded", function() {
			changeMap(map);
		});

		function changeMap(mapParam) {
			//alert("当前地图中心点：" + map.getCenter().lng + "," + map.getCenter().lat);
			//获取可视范围
			var bs = mapParam.getBounds(); //获取可视区域
			var bssw = bs.getSouthWest(); //可视区域左下角
			var bsne = bs.getNorthEast(); //可视区域右上角
			//alert("当前地图可视范围是：" + bssw.lng + "," + bssw.lat + "到" + bsne.lng + "," + bsne.lat);
			$.post("${ctx}/common/getRangeLab.json",{
				maxLon : bsne.lng,
				minLon : bssw.lng,
				maxLat : bsne.lat,
				minLat : bssw.lat
			},function(data) {
				$("#counts").text(data.list.length);
				for (var i = 0; i < data.list.length; i++) {
					//alert($.inArray(data.list[i].labLongitude+"_"+data.list[i].labLatitude, arr));
					if ($.inArray(data.list[i].labLongitude + "_" + data.list[i].labLatitude, arr) == -1) {
						arr.push(data.list[i].labLongitude + "_" + data.list[i].labLatitude);
					} else {
						continue;
					}
					var point = new BMap.Point(data.list[i].labLongitude,data.list[i].labLatitude);
					var marker = new BMap.Marker(point);
					var sContent = "<h4 style='margin:0 0 5px 0;padding:0.2em 0;overflow: hidden;text-overflow:ellipsis;white-space: nowrap; width:200px;' title='"+data.list[i].labName+"'><a target='_blank' href='${ctx}/common/labInfoColumn.do?labId="+data.list[i].labId+"'>"
							+ data.list[i].labName
							+ "</a></h4>"
							+ "<img style='margin:4px auto;' id='imgDemo' src='${fileCtx}/"+data.list[i].labCompanyImages+"' width='110' height='75' title='"+data.list[i].labName+"'/>"
							+ "</div>";
					var infoWindow = new BMap.InfoWindow(sContent); // 创建信息窗口对象
					mapParam.addOverlay(marker);
					marker.test = infoWindow;
					marker.addEventListener("click",function() {
						this.openInfoWindow(this.test);
						//图片加载完毕重绘infowindow
						document.getElementById('imgDemo').onload = function() {
							infoWindow.redraw(); //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
						}
					});
				}
			}, "json");
		}
	</script>
<script type="text/javascript" >
	//	布局管理弹框显示
	$('.bh-button').click(function(){
		$('.bh-one').show();
		$('.bh-one').show();
	})
	// 布局管理弹层，点击确定，控制页面显示，保存布局信息
	$('.selected-one').click(function(){
		$('.bh-one').hide();
		$('.bh-one').hide();
		
		var _list = new Array();
		// 左边显示
		$("#bj_left_div >span").each(function(){
	          var showClass = $(this).attr("data-href");
	          $('.' + showClass).hide();
	          var hp = {"spanId":$(this).attr("data-id"),"spanStatus":0};
	          _list.push(hp);
		});
		
		// 右边隐藏
		$("#bj_right_div >span").each(function(){
	          var hideClass = $(this).attr("data-href");
	          $('.' + hideClass).show();
	          var hp = {"spanId":$(this).attr("data-id"),"spanStatus":1};
	          _list.push(hp);
		});
		 
		// 保存布局信息
		saveHomepage(_list);
		
	})
	//	布局管理弹框内容
	$(function(){
		$('#bh-select1').initList();
		// 左边显示
		$("#bj_left_div >span").each(function(){
	          var showClass = $(this).attr("data-href");
	          $('.' + showClass).hide();
		});
	})
	//	布局管理弹框右上角关闭
	$('.bh-closetwo').click(function(){
		$('.bh-one').hide();
	})
	//常用功能设置弹框右上角关闭	
	$('.bh-closethree').click(function(){
		$('.bh-two').hide();
	})
	//常用功能关闭按钮
	$('.bh-close').click(function(){
		$('.bh-navL-1').hide();
	})
	//常用功能设置弹框	
	$('.bh-set').click(function(){
		$('.bh-two').show();
		$('.bh-two').show();
	})
	// 常用功能设置点击确定
	$('.selected-two').click(function(){
		var gnSpan = $("#gn_right_div >span");
		if (gnSpan.length > 5) {
			alert("最多设置五个常用功能");
			return;
		}
		
		$('.bh-two').hide();
		$('.bh-two').hide();
		
		$("#gn_ul").html("");
		
		var _list = new Array();
		var a = "";
		// 右边显示
		$("#gn_right_div >span").each(function(){
	          var dataHref = $(this).attr("data-href");
	          var dataVal = $(this).text();
	          a += '<li><a href="'+dataHref+'"><img src="${ctx}/common/images/qhc-shezhi.png"/> <div>'+dataVal+'</div> </a></li>';
	          var hp = {"spanId":$(this).attr("data-id"),"spanStatus":1};
	          _list.push(hp);
	         
		});
		 $("#gn_ul").html(a);
		 
		// 左边
		$("#gn_left_div >span").each(function(){
	          var hp = {"spanId":$(this).attr("data-id"),"spanStatus":0};
	          _list.push(hp);
		});
		 
		 // 保存设置
		saveHomepage(_list);
	})
	//	布局管理弹框内容
	$(function(){
		$('#bh-select2').initList();
	})
	
	//统计信息关闭按钮
	$('.bh-close1').click(function(){
		$('.bh-navL-2').hide();
	})
	
	
	//入驻实验室分布展示关闭按钮
	$('.bh-close2').click(function(){
		$('.bh-navR').hide();
	})
	
	// 保存首页布局设置、常用功能设置
	function saveHomepage(dataArray) {
/* 		var obj = $('#form').toObject({mode : 'first'});
		obj.details = dataArray;
 */		
		cfg.data = JSON.stringify(dataArray);
		
		cfg.success = function ret(data) {
			if (data.model.errCode == 'success') {
				//alert(data.model.errMsg);
			}
		};

		cfg.url = 'saveHomepage.json';
		$.ajax(cfg);
	}
</script>
