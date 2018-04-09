<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.qhc-advertisingLeft {position: fixed;top: 250px;z-index: 100;left: 50%;margin-left: -668px;}
.qhc-advertisingRight {position: fixed;top: 250px;z-index: 100;right: 50%;margin-right: -668px;}
</style>
<script type="text/javascript">
$(function (){
	loadLeftRightAdv();//加载广告数据
});
/*
 * 广告
 */
function loadLeftRightAdv(){
	$.post("${ctx}/common/homeGetAdv.json",{
		
	},function (data){
		if(data.flag==true){
			var left = data.leftAdv;
			var right = data.rightAdv;
			if(left!=null){
				$("#spanLeft").css("display","block");
				var leftTag = document.getElementById("qhc-advertisingLeftA");
				leftTag.children[0].src="${fileCtx}/"+left.adImage;
				leftTag.children[0].title=left.adTitle;
				leftTag.children[0].style.display="";
				//leftTag.href=left.adUrl;
				var url = left.adUrl;
				if(url != null && url != ""){
					leftTag.href=url;
				}
			}else{
				$("#spanLeft").css("display","none");
			}
			if(right!=null){
				$("#spanRight").css("display","block");
				var rightTag = document.getElementById("qhc-advertisingRightA");
				rightTag.children[0].src="${fileCtx}/"+right.adImage;
				rightTag.children[0].title=right.adTitle;
				rightTag.children[0].style.display="";
				//rightTag.href=right.adUrl;
				var url = right.adUrl;
				if(url != null && url != ""){
					rightTag.href=url;
				}
			}else{
				$("#spanRight").css("display","none");
			}
		}else{
			alert(data.msg);
		}
	},"json");
}
</script>
<div class="qhc-Limg">
	<a id="qhc-advertisingLeftA" target="_blank">
		<img class="qhc-advertisingLeft" id="qhc-advertisingLeft" style="display: none; width: 66px; height: 399px;" src="" />
	</a>
	<span class="qhc-IMG-span" id="spanLeft" style="display: none;">x</span>
</div>
<div class="qhc-Rimg">
	<a id="qhc-advertisingRightA" target="_blank">
		<img class="qhc-advertisingRight" id="qhc-advertisingRight" style="display: none; width: 66px; height: 399px;" src="" />
	</a>
	<span class="qhc-IMG-span" id="spanRight" style="display: none;">x</span>
</div>
<style>
.qhc-Limg{
	position: fixed;
    top: 250px;
    z-index: 100;
    left: 50%;
    margin-left: -668px;
    width: 66px;
    height: 399px;
}
.qhc-Rimg{
	position: fixed;
    top: 250px;
    z-index: 100;
    right: 50%;
    margin-right: -668px;
    width: 66px;
    height: 399px;
}
.qhc-IMG-span{
    font-size: 16px;
    z-index: 103;
    position: absolute;
    top: 0px;
    right: 0;
    line-height: 20px;
    text-align: center;
    background: white;
    opacity: 0.5;
    width: 20px;
    cursor: pointer;
    height: 20px;
}
</style>
<script>
$('.qhc-Rimg span').click(function(){
	$('.qhc-Rimg').hide();
})
$('.qhc-Limg span').click(function(){
	$('.qhc-Limg').hide();
})
</script>




