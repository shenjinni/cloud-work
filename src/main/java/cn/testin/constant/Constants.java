package cn.testin.constant;


public class Constants {

	/** ------------------------------------------- 结果状态 ------------------------------- **/
	/**
	 * success
	 */
	public static final String result_success="success";
	/**
	 * fail
	 */
	public static final String result_fail="fail";
	/**
	 * repeat
	 */
	public static final String result_repeat="repeat";
	
	/** ------------------------------------------- 结果状态 ------------------------------- **/
	
	/** ------------------------------------------- 角色类型 ------------------------------- **/
	/**
	 * 检测用户角色
	 */
	public static final String role_normal="normal";
	/**
	 * 实验室用户角色
	 */
	public static final String role_lab="lab";
	/**
	 * 管理员用户角色
	 */
	public static final String role_admin="admin";
	
	/** ------------------------------------------- 角色类型 ------------------------------- **/
	
	/** ------------------------------------------- 每页记录数 ------------------------------- **/
	
	/**
	 * 每页数量-4
	 */
	public static final int page_size_4 = 4;
	/**
	 * 每页数量-6
	 */
	public static final int page_size_6 = 6;
	/**
	 * 每页数量-8
	 */
	public static final int page_size_8 = 8;
	/**
	 * 每页数量-12
	 */
	public static final int page_size_12 = 12;
	/**
	 * 每页数量-16
	 */
	public static final int page_size_16 = 16;
	
	/** ------------------------------------------- 每页记录数 ------------------------------- **/
	
	/** ------------------------------------------- 上传地址 ------------------------------- **/
	/**
	 * 七牛云上传空间名
	 */
	public static final String qiniu_bucket = "casic-t";


	/**
	 * 七牛云外链域名
	 */
	public static final String qiniu_outside_url="http://p2or9pg0j.bkt.clouddn.com/";
	/**
	 * 七牛云图片路径
	 */
	public static final String qiniu_upload_image_dir = "image/casic_t/";
	/**
	 * 七牛云文件路径
	 */
	public static final String qiniu_upload_file_dir = "file/casic_t/";
	
	/** ------------------------------------------- 上传地址 ------------------------------- **/
	
	/** ------------------------------------------- 文章类型 ------------------------------- **/
	/**
	 * 1-新闻咨询
	 */
	public static final String article_type_1 = "1";
	/**
	 * 2-展会信息
	 */
	public static final String article_type_2 = "2";
	/**
	 * 3-政策法规
	 */
	public static final String article_type_3 = "3";
	/**
	 * 4-规格介绍
	 */
	public static final String article_type_4 = "4";
	/**
	 *  5-帮助文档
	 */
	public static final String article_type_5 = "5";
	/**
	 *  6-APP新闻资讯
	 */
	public static final String article_type_6 = "6";
	/**
	 *  7-检测助手
	 */
	public static final String article_type_7 = "7";
	/**
	 *  8-业务助手
	 */
	public static final String article_type_8 = "8";
	
	/** ------------------------------------------- 文章类型 ------------------------------- **/
	
	/** ------------------------------------------- 规格类型 ------------------------------- **/
	
	/**
	 * aptitude - 资质要求
	 */
	public static final String spec_type_aptitude = "aptitude";
	/**
	 * method - 检测方法
	 */
	public static final String spec_type_method = "method";
	/**
	 * standard - 检测标准
	 */
	public static final String spec_type_standard = "standard";
	
	/** ------------------------------------------- 规格类型 ------------------------------- **/
	
	/** ------------------------------------------ 第三方类型 ------------------------------- **/
	
	/**
	 * 第三方用户类型-云网
	 */
	public static final String user_type_yw = "YW";
	/**
	 * 第三方用户类型-QQ
	 */
	public static final String user_type_qq = "QQ";
	/**
	 * 第三方用户类型-微信
	 */
	public static final String user_type_wx = "WX";
	
	/** ------------------------------------------ 第三方类型 ------------------------------- **/
	
	/** ------------------------------------------- 云网接口 ------------------------------- **/
	
	/**
	 * 云网注册接口
	 */
	public static final String yw_interface_regist = "http://api.casicloud.com/api/1.0/register/user";
	/**
	 * 云网登陆接口
	 */
	public static final String yw_interface_login = "http://api.casicloud.com/api/1.0/login/user";
	/**
	 * 云网修改用户信息接口
	 */
	public static final String yw_interface_update = "http://api.casicloud.com/api/1.0/register/update";
	/**
	 * 云网根据id查询用户信息接口
	 */
	public static final String yw_interface_find_id = "http://api.casicloud.com/api/1.0/register/search_id";
	/**
	 * 云网根据手机号查询用户信息接口
	 */
	public static final String yw_interface_find_phone = "http://api.casicloud.com/api/1.0/register/search_mobile";
	/**
	 * 云网根据用户名查询用户信息接口
	 */
	public static final String yw_interface_find_username = "http://api.casicloud.com/api/1.0/sys/get_user_by_name ";
	
	/**
	 * 云网注册登陆操作key
	 */
	public static final String yw_app_key = "612fe25e-ec73-4013-bf07-6008af26d085";
	/**
	 * 云网注册登陆操作密钥
	 */
	public static final String yw_app_secret = "ebac13f1-8f5d-4c2d-9ab6-ba2daef38509";
	
	/** ------------------------------------------- 云网接口 ------------------------------- **/
	
	/** ------------------------------------------- 收藏类型 ------------------------------- **/
	/**
	 * 收藏类型-新闻
	 */
	public static final String storage_type_news = "news";
	/**
	 * 收藏类型-实验室
	 */
	public static final String storage_type_lab = "lab";
	/**
	 * 收藏类型-需求
	 */
	public static final String storage_type_need = "need";
	/**
	 * 收藏类型-检测项目
	 */
	public static final String storage_type_check = "check";
	
	/** ------------------------------------------- 收藏类型 ------------------------------- **/
	
	public static final String app_version = "1.0";
	/**
	 * 短信模板
	 */
	public static final String msg_template = "【航天云网】您的验证码是";
	/**
	 * 默认检测图片
	 */
	public static final String default_project_img = "defaultCheckProject.png";
	/**
	 * 默认新闻图片
	 */
	public static final String default_news_img = "defaultNews.png";
	/**
	 * 支付状态 - 支付中
	 */
	public static final String pay_status_ing = "PAYING";
	/**
	 * 支付状态 - 支付成功
	 */
	public static final String pay_status_success = "SUCCESS";
	/**
	 * 支付状态 - 支付失败
	 */
	public static final String pay_status_fail = "FAIL";
	/**
	 * 微信app支付的appId
	 */
	public static final String app_pay_app_id = "wxb4142e8419a257b8";
	/**
	 * 微信app支付的商户号
	 */
	public static final String app_pay_mcid = "1498358082";
	/**
	 * 微信app支付key
	 */
	public static final String app_pay_key = "92342c1578804d269d44cdb6d995dce5";
	/**
	 * 测试地址
	 */
	public static final String test_url = "http://superlike.cn:11589/casicT";
	/**
	 * 线上地址
	 */
	public static final String product_url = "http://www.casic-t.com/";
	/**
	 * 交易方式-支付
	 */
	public static final String pay_type_consume = "consume";
	/**
	 * 交易方式-充值
	 */
	public static final String pay_type_recharge = "recharge";
	
	/** ------------------------------------------- 导出委托单路径 ------------------------------- **/
	
	public static final String WINDOWS_ORDER_DIC = "D://qhc/orderWord";
	
	public static final String LINUX_ORDER_DIC = "/data/tomcat_11589/ordersTemp";
	
	/** ------------------------------------------- 导出委托单路径------------------------------- **/
	
	
}
