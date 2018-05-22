<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

	<title>设计师登记</title>
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
                        window.location.href = "${ctx}/b2b/personColumn.do";
                    } else {
						//alert("普通用户每天只能发布三条信息，会员可无限发布～");
					}
                };

                cfg.url = '${ctx}/b2b/personPublish.json';
                $.ajax(cfg);
            }
        });

        $(function () {
            $("#form1").validate({
                rules: {
                    contactsName: "required",
                    mobile: "required",
                    workIntent: "required"
                },
                messages: {
                    contactsName: "请输入姓名",
                    mobile: "请输入电话号码",
                    workIntent: "请输入设计种类"
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
		<span>设计师登记</span>
	</div>
	<div class="login-register">
		<div class="login">
			<div class="group">
				<label>设计种类</label>
				<input type="text" maxlength="100" name="workIntent" class="text" />
			</div>
			<div class="group">
				<label>工资要求</label>
				<input type="text" maxlength="100" name="salary" class="text" />
			</div>
			<div class="group">
				<label>姓名</label>
				<input type="text" maxlength="30" id="realname" name="contactsName" class="text" value="" />
			</div>
			<div class="group">
				<label>电话</label>
				<input type="text" maxlength="11" name="mobile" class="text" value="" />
			</div>
			<div class="group">
				<label>年龄</label>
				<input type="text" maxlength="20" name="age" class="text" value="" />
			</div>
			<div class="group">
				<label>生肖</label>
				<input type="text" maxlength="10" name="zodiac" class="text" value="" />
			</div>
			<div class="group">
				<label>性别</label>
				<select class="form-control" style="margin-left: 17px;margin-top: -25px;" name="sex">
					<option value="1">男</option>
					<option value="2">女</option>
				</select>
			</div>
			<div class="group">
				<label>哪里人</label>
				<input maxlength="100" type="text" name="address" class="text" value="" />
			</div>

			<div class="group">
				<label>补充说明</label>
				<textarea type="text" maxlength="200" name="note" class="text" cols="18" rows="3"></textarea>
			</div>
			<%--<div class="group">--%>
				<%--<label>验证码</label>--%>
				<%--<input type="text" class="input-2" id="flagcode" name="flagcode" value="" />--%>
				<%--<div style="float: right;padding-right: 0px;padding-top: 6px;height: 30px;">--%>
					<%--<img id="flagcodeImg" src="${ctx}/common/checkCode.do" onclick="changeFlagcode();" style="width: 100%;height: 100%; cursor: pointer;">--%>
				<%--</div>--%>
			<%--</div>--%>
			<div class="group">
				<input type="submit" name="btnSave" value="发布" id="submit" class="input-button blue-button" />
			</div>
		</div>
	</div>
</form>
<%--<%@ include file="/common/bottomAdv.jsp"%>--%>
</body>
</html>