<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
//滑动返回顶部
function rt() {
	var d = document, dd = document.documentElement, db = document.body, top = dd.scrollTop
			|| db.scrollTop, step = Math.floor(top / 20);
	(function() {
		top -= step;
		if (top > -step) {
			dd.scrollTop == 0 ? db.scrollTop = top : dd.scrollTop = top;
			setTimeout(arguments.callee, 20);
		}
	})();
}
</script>
<!--右下角菜单-->
<a href="javascript:void(0);" onclick="rt();">
	<img class="qhc-Gotop" src="${ctx}/common/images/Top01.png"/>
</a>
<div class="qhc-Share">
	<img class="qhc-show" src="${ctx}/common/images/share01.png"/>
	<div class="qhc-Share_none none">
		<div class="qhc-Share_0">
			<p><img style="top:7px;" src="${ctx}/common/images/phone.png"/>客服热线</p>
			<div style="color:#CC3300;">400-086-2030</div>
			<div>周一至周五</div>
			<div>9:00~17:00</div>
		</div>
		<div class="qhc-Share_0">
			<div><a href="tencent://Message/?Uin=3014967597&amp;websiteName=q-zone.qq.com&amp;Menu=yes">在线客服</a></div>
			<p><img src="${ctx}/common/images/qq.png"/><a href="tencent://Message/?Uin=3014967597&amp;websiteName=q-zone.qq.com&amp;Menu=yes">检测用户</a></p>
			<p><img src="${ctx}/common/images/qq.png"/><a href="tencent://Message/?Uin=3014967597&amp;websiteName=q-zone.qq.com&amp;Menu=yes">实验室用户</a></p>
			<p><img src="${ctx}/common/images/qq.png"/><a href="tencent://Message/?Uin=3014967597&amp;websiteName=q-zone.qq.com&amp;Menu=yes">联盟用户</a></p>
		</div>
		<div class="qhc-Share_1">
			<div>全汇测APP</div>
			<div><img style="width: 120px;height: 120px;" src="${ctx}/common/images/M.png"/></div>
			<div>微信公众号</div>
			<div><img style="width: 120px;height: 120px;" src="${ctx}/common/images/M.png"/></div>
		</div>
		<!--<img src="images/M.png"/>-->
	</div>
</div>
<!--右下角菜单-->