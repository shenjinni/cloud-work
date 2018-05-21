<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

	<title>免费设计岗位登记</title>
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
						window.location.href = "${ctx}/b2b/recruitmentColumn.do";
					}
				};

				cfg.url = '${ctx}/b2b/myInfo/recruitmentPublish.json';
				$.ajax(cfg);
			}
		});

        $(function () {
            $("#form1").validate({
                rules: {
                    contactsName: "required",
                    mobile: "required",
                    workType: "required"
                },
                messages: {
                    contactsName: "请输入联系人",
                    mobile: "请输入电话",
                    workType: "请输入设计种类"
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
		<span>免费设计岗位登记</span>
	</div>
	<div class="login-register">
		<div class="login">
			<div class="group">
				<label>设计种类</label>
				<input type="text" maxlength="100" value="${recruitment.workType}" name="workType" class="text" />
			</div>
			<div class="group">
				<label>工资待遇</label>
				<input type="text" maxlength="100" name="salary" class="text" value="${recruitment.salary}" />
			</div>
			<div class="group">
				<label>设计岗位单位</label>
				<input type="text" maxlength="100" name="company" class="text" value="${recruitment.company}" />
			</div>
			<div class="group">
				<label>地址</label>
				<input type="text" maxlength="100" name="address" class="text" value="${recruitment.address}" />
			</div>
			<div class="group">
				<label>联系人</label>
				<input type="text" maxlength="30" id="realname" name="contactsName" class="text" value="${recruitment.contactsName}" />
			</div>
			<div class="group">
				<label>电话</label>
				<input type="text" maxlength="11" name="mobile" class="text" value="${recruitment.mobile}" />
			</div>
			<div class="group">
				<label>补充说明</label>
				<textarea type="text" maxlength="200" name="note" class="text" cols="18" rows="3">${recruitment.note}</textarea>
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
	<input type="hidden" name="id" value="${recruitment.id}" />
</form>
<%@ include file="/common/bottomAdv.jsp"%>
</body>
</html>