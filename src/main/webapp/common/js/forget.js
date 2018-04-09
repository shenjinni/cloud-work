$(document).ready(function() {
	var cfg = {
		type : 'POST',
		dataType : 'json',
		contentType : 'application/json;charset=UTF-8'
	};
 
	$("#submit").click(function(){
		var loginName = $("#userLoginName").val();
		if(v_phone(loginName)){
			return;
		}
		var pin = $("#pin").val();
		if(v_isNull(pin, '验证码')){
			return;
		}
		var pwd = $("#pwd").val();
		if(v_password(pwd)){
			return;
		}
		
		var pwd1 = $("#pwd1").val();
		if(v_isNull(pwd1, '确认密码')){
			return;
		}
		
		if(pwd1 != pwd){
			jQAlert("两次密码输入不一致");
			return;
		}
		
		var obj=$('#form').toObject({mode: 'first'});
		 
		cfg.data = JSON.stringify(obj); 
		 
		cfg.success = function ret(data){
		 
			if(data.model.status >= 1){
				jQAlert("重置操作成功", "gotoLogin()", '成功');
			}else{
				jQAlert(data.model.msg);
			}
		};
		cfg.url = 'findPwdBack.json';
		$.ajax(cfg);
		
	});
 
  $("#confirm").click(function(){
	  var phone = $(".phone").val(); 
		var obj={};
		obj.phone =phone;
		
		cfg.data = JSON.stringify(obj); 
		 
		cfg.success = function ret(data){
		 
			if(data.model.errCode == 'success'){
				jQAlert(data.model.errMsg, null, "成功");
			}else{
				jQAlert(data.model.errMsg);
			}
		};
		cfg.url = 'sms/checkForget.json';
		$.ajax(cfg);
		
	});

});












