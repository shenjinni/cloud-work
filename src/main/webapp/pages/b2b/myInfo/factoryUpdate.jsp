<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

	<title>设计工作室登记</title>
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
                        window.location.href = "${ctx}/b2b/myInfo/infoColumn.do?type=4";
					}
				};

				cfg.url = '${ctx}/b2b/myInfo/factoryPublish.json';
				$.ajax(cfg);
			}
		});

        $(function () {
			$("#form1").validate({
				rules: {
					contactsName: "required",
					mobile: {required:true, phone:true},
					scale:{digits:true,min:1},
					workNeed: "required"
				},
				messages: {
					contactsName: "请输入联系人",
					mobile: {
						required:"请输入电话号码",
						phone:"电话号码格式错误，请重新输入11位有效手机号"
					},
					scale:"规模人数错误，请输入正整数",
					workNeed: "请输入设计种类"
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
		<span>设计工作室登记</span>
	</div>
	<div class="login-register">
		<div class="login">
			<div class="group">
				<label>设计种类</label>
				<input type="text" name="workNeed" value="${factory.workNeed}" maxlength="100" class="text" />
			</div>
			<div class="group">
				<label>联系人</label>
				<input type="text" id="realname" value="${factory.contactsName}" maxlength="30" name="contactsName" class="text"/>
			</div>
			<div class="group">
				<label>电话</label>
				<input type="text" name="mobile" value="${factory.mobile}" maxlength="11" class="text"/>
			</div>
			<div class="group">
				<label>地址</label>
				<input type="text" name="address" value="${factory.address}" maxlength="100" class="text"/>
			</div>
			<div class="group">
				<label>规模人数</label>
				<input type="text" name="scale" value="${factory.scale}" maxlength="20" class="text"/>
			</div>
			<div class="group">
				<label>补充说明</label>
				<textarea type="text" name="note"  maxlength="200" class="text" cols="18" rows="3">${factory.note}</textarea>
			</div>
			<%--<div class="group">--%>
				<%--<label>验证码</label>--%>
				<%--<input type="text" class="input-2" id="flagcode" name="flagcode" value="" />--%>
				<%--<div style="float: right;padding-right: 0px;padding-top: 6px;height: 30px;">--%>
					<%--<img id="flagcodeImg" src="${ctx}/common/checkCode.do" onclick="changeFlagcode();" style="width: 100%;height: 100%; cursor: pointer;">--%>
				<%--</div>--%>
			<%--</div>--%>
			<div class="group">
				<input type="submit" name="btnSave" value="重新发布" id="btnSave" class="input-button blue-button" />
			</div>
		</div>
	</div>
	<input type="hidden" name="id" value="${factory.id}" />
</form>
<%@ include file="/common/bottomAdv.jsp"%>
</body>
</html>