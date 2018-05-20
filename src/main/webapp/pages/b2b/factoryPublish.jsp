<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
	<meta charset="UTF-8">
	<title>免费设计工作室登记</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/zhili.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/zhiliaccount.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/admin/font-awesome.min.css" />
	<script src="${ctx}/common/js/jquery-1.10.1.min.js" type="text/javascript" ></script>
	<script type="text/javascript" src="${ctx}/jquery/jquery.toObject.js"></script>
	<script type="text/javascript" src="${ctx}/common/js/form2js.js"></script>
	<script src="${ctx}/common/js/jquery.validate.js" type="text/javascript" ></script>
	<script type="text/javascript">
		var cfg = {
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
		};
		$.validator.setDefaults({
			submitHandler: function () {
				var obj = $('#form1').toObject({mode : 'first'});

				cfg.data = JSON.stringify(obj);

				cfg.success = function ret(data) {
					alert(data.errMsg);
					if (data.errCode == 'success') {
						window.location.href = "${ctx}/b2b/factoryColumn.do";
					}else {
						//alert("普通用户每天只能发布三条信息，会员可无限发布～");
					}
				};

				cfg.url = '${ctx}/b2b/factoryPublish.json';
				$.ajax(cfg);
			}
		});

        $(function () {
            $("#form1").validate({
                rules: {
                    contactsName: "required",
                    mobile: "required",
                    workNeed: "required"
                },
                messages: {
                    contactsName: "请输入联系人",
                    mobile: "请输入电话",
                    workNeed: "请输入承接加工种类"
                }
            });

        })

        function changeFlagcode(){
            $("#flagcodeImg").attr("src","${ctx}/common/checkCode.do?temp="+new Date().getTime());
        }
	</script>
</head>
<body>
<form method="post" id="form1">
	<div class="wap-item-header">
		<a href="javascript:history.back(-1)"><i class="fa fa-angle-left"></i></a>
		<span>免费设计工作室登记</span>
	</div>
	<div class="login-register">
		<div class="login">
			<div class="group">
				<label>承接加工种类</label>
				<input type="text" name="workNeed" maxlength="100" class="text" />
			</div>
			<div class="group">
				<label>联系人</label>
				<input type="text" id="realname" maxlength="30" name="contactsName" class="text" value="" />
			</div>
			<div class="group">
				<label>电话</label>
				<input type="text" name="mobile" maxlength="11" class="text" value="" />
			</div>
			<div class="group">
				<label>地址</label>
				<input type="text" name="address" maxlength="100" class="text" value="" />
			</div>
			<div class="group">
				<label>规模人数</label>
				<input type="text" name="scale" maxlength="20" class="text" value="" />
			</div>
			<div class="group">
				<label>补充说明</label>
				<textarea type="text" name="note" maxlength="200" class="text" cols="18" rows="3"></textarea>
			</div>
			<%--<div class="group">--%>
				<%--<label>验证码</label>--%>
				<%--<input type="text" class="input-2" id="flagcode" name="flagcode" value="" />--%>
				<%--<div style="float: right;padding-right: 0px;padding-top: 6px;height: 30px;">--%>
					<%--<img id="flagcodeImg" src="${ctx}/common/checkCode.do" onclick="changeFlagcode();" style="width: 100%;height: 100%; cursor: pointer;">--%>
				<%--</div>--%>
			<%--</div>--%>
			<div class="group">
				<input type="submit" name="btnSave" value="免费发布" id="btnSave" class="input-button blue-button" />
			</div>
		</div>
	</div>
</form>
<%@ include file="/common/bottomAdv.jsp"%>
</body>
</html>