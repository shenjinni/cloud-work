/**
 *
 * 项目中常用的验证方法和验证正则表达式，以及自定义alert和confirm框
 * 【注意：此js需要放在jquery-confirm.js之下，引用了confirm的弹出框】
 *  
 * @author shenjinni
 * Date: 2017.04.10
 * Time: 17:06:30
 * 
 */
var regPhone = /^(((13[0-9]{1})|(14[5|7|9]{1})|(15[0|1|2|3|5|6|7|8|9]{1})|(17[0|1|2|3|5|6|7|8]{1})|(18[0-9]{1}))+\d{8})$/;
var regMail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
var regIdCard = /^[1-9]\d{5}(((18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3})|(\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}))[0-9Xx]$/;
var regPassword = /^[a-zA-Z0-9_]{6,22}$/;
var regEnglish = /^[A-Za-z]+$/;
var regChinese = /^[\u0391-\uFFE5]+$/;
var regUrl = /^(http|https):\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
var regDate = /^\d{4}-\d{1,2}-\d{1,2}$/;
var regTime = /^\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}:\d{1,2}$/;
var regMoney = /^\d+(\.\d+)?$/;
var regInt = /^[-\+]?\d+$/;
var regZhengInt = /^\d+$/;
var regFloat2 = /^\d+(\.\d{1,2})?$/;//保留一到两位小数


/**
 * 
 * 自定义弹出框
 * @param con 弹出框内容；
 * @param act 弹出框事件（function）此值可不输入，如果不输入将不执行事件，如果弹出框标题不为空，此处必须填写（可填写null）；
 * @param t 弹出框标题；
 * @returns
 */
function jQAlert(con,act,t){
	if(!t){
		t = "警告";
	}
	if(!act){
		$.alert({
			title: t,
			content: con,
			buttons: {
				okay: {
					text: '确认'
				}
			}
		});
	}else{
		$.alert({
			title: t,
			content: con,
			buttons: {
				okay: {
					text: '确认',
		        	action: function(){
		        		eval(act);
		        	}
				}
			}
		});
	}
	
  }

/**
 * 
 * 自定义确认框
 * @param con 确认框内容；
 * @param act 确认框事件（function）
 * @param t 确认框标题，不输不显示；
 */
function jQConfirm(con,act,t){
	if(!t){
		t = "";
	}
	
	$.confirm({
	    title: t,
	    content: con,
	    buttons: {
	        confirm:{
	        	text:"确认",
	        	action: function(){
	        		eval(act);
	        	}
	        },
	        cancel: {
	        	text:"取消"
	        }
	     }
	});
}

/**
 * 
 * 去空格
 * @param str 
 * @returns
 */
function trimStr(str){
	if(!str){
		return str;
	}else{
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}
}



/**
 * 验证手机号码合法性-弹出框使用jQAlert，验证失败返回true，验证成功返回fasle
 * @param p 手机号码
 * @param isNull 布尔值是否可以为空，此值为空时限制非空
 */
function v_jQAlert_phone(p,isNull){
	if(!isNull){
		if (!p || trimStr(p).length == 0){
			jQAlert("手机号码不能为空！");
			return true;
		}else if(!regPhone.test(p)){
			jQAlert("请输入有效手机号码！");
			return true;
		}
	}else{
		if(p && trimStr(p).length > 0 && !regPhone.test(p)){
			jQAlert("请输入有效手机号码！");
			return true;
		}
	}
	return false;
}
/**
 * 验证手机号码合法性-弹出框使用默认的alert，验证失败返回true，验证成功返回fasle
 * @param p 手机号码
 * @param isNull 布尔值是否可以为空，此值为空时限制非空
 */
function v_alert_phone(p,msg, isNull){
	if(!isNull){
		if (!p || trimStr(p).length == 0){
			alert(msg+"手机号码不能为空！");
			return true;
		}else if(!regPhone.test(p)){
			alert("请输入有效手机号码！"+msg);
			return true;
		}
	}else{
		if(p && trimStr(p).length > 0 && !regPhone.test(p)){
			alert("请输入有效手机号码！"+msg);
			return true;
		}
	}
	return false;
}


/**
 * 验证网址合法性-弹出框使用jQAlert，验证失败返回true，验证成功返回fasle
 * @param u 网址
 * @param isNull 布尔值是否可以为空，此值为空时限制非空
 */
function v_jQAlert_url(u,isNull){
	if(!isNull){
		if (!u || trimStr(u).length == 0){
			jQAlert("网址不能为空！");
			return true;
		}else if(!regUrl.test(u)){
			jQAlert("请输入合法网址！（请以http://或https://开头）");
			return true;
		}
	}else{
		if(u && trimStr(u).length > 0 && !regUrl.test(u)){
			jQAlert("请输入合法网址！（请以http://或https://开头）");
			return true;
		}
	}
	return false;
}

/**
 * 验证网址合法性-弹出框使用默认的alert，验证失败返回true，验证成功返回fasle
 * @param u 网址
 * @param isNull 布尔值是否可以为空，此值为空时限制非空
 */
function v_alert_url(u,isNull){
	if(!isNull){
		if (!u || trimStr(u).length == 0){
			alert("网址不能为空！");
			return true;
		}else if(!regUrl.test(u)){
			alert("请输入合法网址！（请以http://或https://开头）");
			return true;
		}
	}else{
		if(u && trimStr(u).length > 0 && !regUrl.test(u)){
			alert("请输入合法网址！（请以http://或https://开头）");
			return true;
		}
	}
	return false;
}

/**
 * 验证电子邮箱合法性-弹出框使用默认的jQAlert，验证失败返回true，验证成功返回fasle
 * @param m
 * @param isNull
 * @returns {Boolean}
 */
function v_jQAlert_mail(m, isNull){
	if(!isNull){
		if (!m || trimStr(m).length == 0){
			jQAlert("电子邮箱不能为空！");
			return true;
		}else if(!regMail.test(m)){
			jQAlert("请输入有效电子邮箱！");
			return true;
		}
		
	}else{
		if(m && trimStr(m).length > 0 && !regMail.test(m)){
			jQAlert("请输入有效电子邮箱！");
			return true;
		}
	}
	return false;
}

/**
 * 验证电子邮箱合法性-弹出框使用默认的alert，验证失败返回true，验证成功返回fasle
 * @param m
 * @param isNull
 * @returns {Boolean}
 */
function v_alert_mail(m, msg, isNull){
	if(!isNull){
		if (!m || trimStr(m).length == 0){
			alert(msg+"不能为空！");
			return true;
		}else if(!regMail.test(m)){
			alert("请输入有效"+msg);
			return true;
		}
		
	}else{
		if(m && trimStr(m).length > 0 && !regMail.test(m)){
			alert("请输入有效"+msg);
			return true;
		}
	}
	return false;
}


/**
 * 验证身份证号合法性-弹出框使用默认的jQAlert，验证失败返回true，验证成功返回fasle
 * @param c
 * @param isNull
 * @returns {Boolean}
 */
function v_jQAlert_idCard(c,isNull){
	if(!isNull){
		if (!c || trimStr(c).length == 0){
			jQAlert("身份证号不能为空！");
			return true;
		}else if(!regIdCard.test(c)){
			jQAlert("请输入有效身份证号！");
			return true;
		}
		
	}else{
		if(c && trimStr(c).length > 0 && !regIdCard.test(c)){
			jQAlert("请输入有效身份证号！");
			return true;
		}
	}
	return false;
}

/**
 * 验证身份证号合法性-弹出框使用默认的alert，验证失败返回true，验证成功返回fasle
 * @param c
 * @param isNull
 * @returns {Boolean}
 */
function v_alert_idCard(c,isNull){
	if(!isNull){
		if (!c || trimStr(c).length == 0){
			alert("身份证号不能为空！");
			return true;
		}else if(!regIdCard.test(c)){
			alert("请输入有效身份证号！");
			return true;
		}
		
	}else{
		if(c && trimStr(c).length > 0 && !regIdCard.test(c)){
			alert("请输入有效身份证号！");
			return true;
		}
	}
	return false;
}

/**
 * 只可以输入正数和小数点-弹出框使用默认的jQAlert
 * @param n
 * @param isNull
 * @returns {Boolean} 
 */
function v_jQAlert_number(n, msg, isNull){
	if(!msg){
		msg = "字段 ";
	}
	if(!isNull){
		if (!n || trimStr(n).length == 0){
			jQAlert(msg+"不能为空！");
			return true;
		}else if(!regMoney.test(n)){
			jQAlert("请输入有效"+msg+"！");
			return true;
		}
		
	}else{
		if(n && trimStr(n).length > 0 && !regMoney.test(n)){
			jQAlert("请输入有效"+msg+"！");
			return true;
		}
	}
	return false;
}

/**
 * 只可以输入正数和小数点-弹出框使用默认的alert
 * @param n
 * @param isNull
 * @returns {Boolean} 
 */
function v_alert_number(n, msg, isNull){
	if(!msg){
		msg = "字段 ";
	}
	if(!isNull){
		if (!n || trimStr(n).length == 0){
			alert(msg+"不能为空！");
			return true;
		}else if(!regMoney.test(n)){
			alert("请输入有效"+msg+"！");
			return true;
		}
		
	}else{
		if(n && trimStr(n).length > 0 && !regMoney.test(n)){
			alert("请输入有效"+msg+"！");
			return true;
		}
	}
	return false;
}

/**
 * 只可以输入正整数-弹出框使用默认的jQAlert
 * @param n
 * @param isNull
 * @returns {Boolean} 
 */
function v_jQAlert_zhengInt(n, msg, isNull){
	if(!msg){
		msg = "字段 ";
	}
	if(!isNull){
		if (!n || trimStr(n).length == 0){
			jQAlert(msg+"不能为空！");
			return true;
		}else if(!regZhengInt.test(n)){
			jQAlert("请输入有效"+msg+"！");
			return true;
		}
		
	}else{
		if(n && trimStr(n).length > 0 && !regZhengInt.test(n)){
			jQAlert("请输入有效"+msg+"！");
			return true;
		}
	}
	return false;
}

/**
 * 只可以输入正整数-弹出框使用默认的alert
 * @param n
 * @param isNull
 * @returns {Boolean} 
 */
function v_alert_zhengInt(n, msg, isNull){
	if(!msg){
		msg = "字段 ";
	}
	if(!isNull){
		if (!n || trimStr(n).length == 0){
			alert(msg+"不能为空！");
			return true;
		}else if(!regZhengInt.test(n)){
			alert("请输入有效"+msg+"！");
			return true;
		}
		
	}else{
		if(n && trimStr(n).length > 0 && !regZhengInt.test(n)){
			alert("请输入有效"+msg+"！");
			return true;
		}
	}
	return false;
}

/**
 * 验证密码合法性-弹出框使用默认的jQAlert，验证失败返回true，验证成功返回fasle
 * @param p
 * @param isNull
 * @returns {Boolean}
 */
function v_jQAlert_password(p){
	if (!p || trimStr(p).length == 0){
		jQAlert("密码不能为空！");
		return true;
	}else if(!regPassword.test(p)){
		jQAlert("密码必须为6-22位字母数字下划线组合！");
		return true;
	}else{
		return false;
	}
	
}

/**
 * 验证密码合法性-弹出框使用默认的alert，验证失败返回true，验证成功返回fasle
 * @param p
 * @param isNull
 * @returns {Boolean}
 */
function v_alert_password(p,isNull){
	if (!p || trimStr(p).length == 0){
		alert("密码不能为空！");
		return true;
	}else if(!regPassword.test(p)){
		alert("密码必须为6-22位字母数字下划线组合！");
		return true;
	}else{
		return false;
	}
}

/**
 * 
 * 判断值是否为空-弹出框使用默认的jQAlert，为空时返回true，非空时返回fasle 
 * @param str 值
 * @param msg 为空时的弹出框关键字
 * @returns {Boolean}
 */
function v_jQAlert_isNull(str, msg){
	if(!msg){
		msg = "字段 ";
	}
	
	if(!str || trimStr(str).length == 0){
		jQAlert(msg+"不能为空！");
		return true;
	}
	return false;
}

/**
 * 
 * 判断值是否为空-弹出框使用默认的alert，为空时返回true，非空时返回fasle 
 * @param str 值
 * @param msg 为空时的弹出框关键字
 * @returns {Boolean}
 */
function v_alert_isNull(str, msg){
	if(!msg){
		msg = "字段 ";
	}
	
	if(!str || trimStr(str).length == 0){
		alert(msg+"不能为空！");
		return true;
	}
	return false;
}
