<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.qhc-bottombanner{
	width: 100%;
	overflow: hidden;
}
.qhc-bottombanner img{
	float: left;
}
</style>
<script type="text/javascript">
$(function (){
	loadBottomAdv();//加载广告数据
});
/*
 * 广告
 */
function loadBottomAdv(){
	$.post("${ctx}/common/homeGetAdv.json",{
		
	},function (data){
		if(data.flag==true){
			var bottomList = data.bottomAdv;
			if(bottomList!=undefined){
				$("#spanBottom").css("display","block");
				var bottomDiv = document.getElementById("qhc-bottombanner");
				for(var i=0;i<bottomList.length;i++){
					var img = document.createElement("img");
					//img.src="${fileCtx}/"+bottomList[i].adImage;
                    img.src=bottomList[i].adImage;
					img.title=bottomList[i].adTitle;
					img.style.height="128px";
					img.style.width="100%";
					var a = document.createElement("a");
					a.target="_blank";
					a.href=bottomList[i].adUrl;
					a.appendChild(img);
					bottomDiv.appendChild(a);
				}
			}else{
				$("#spanBottom").css("display","none");
			}
		}else{
			alert(data.msg);
		}
	},"json");
}
</script>
<div class="qhc-bottombanner" id="qhc-bottombanner" style="position: relative;">
	<span class="qhc-IMG-span" id="spanBottom" style="display: none;">x</span>
</div>
<script>
$('.qhc-bottombanner span').click(function(){
	$('.qhc-bottombanner').hide();
})
</script>