<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.qhc-topbanner{width: 100%;height:62px;overflow: hidden;}
.qhc-topbanner img{float: left;}
</style>
<script type="text/javascript">
$(function (){
	loadTopAdv();//加载广告数据
});
/*
 * 广告
 */
function loadTopAdv(){
	$.post("${ctx}/common/homeGetAdv.json",{
		
	},function (data){
		if(data.flag==true){
			var topList = data.topAdv;
			if(topList!=undefined){
				$("#spanTop").css("display","block");
				var topDiv = document.getElementById("qhc-topbanner");
				for(var i=0;i<topList.length;i++){
					var img = document.createElement("img");
					img.src="${fileCtx}/"+topList[i].adImage;
					img.title=topList[i].adTitle;
					img.style.height="62px";
					img.style.width="100%";
					var a = document.createElement("a");
					a.target="_blank";
					a.href=topList[i].adUrl;
					a.appendChild(img);
					topDiv.appendChild(a);
				}
			}else{
				$("#spanTop").css("display","none");
			}
		}else{
			alert(data.msg);
		}
	},"json");
}
</script>
<div class="qhc-topbanner" id="qhc-topbanner" style="height: auto;">
	<span class="qhc-IMG-span" id="spanTop" style="display: none;">x</span>
</div>
<script>
$('.qhc-topbanner span').click(function(){
	$('.qhc-topbanner').hide();
})
</script>