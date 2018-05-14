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


	/**
	 * 短信模板
	 */
	public static final String msg_template = "【织里童装设计网】您的验证码是";

	/** ------------------------------------------- 导出委托单路径 ------------------------------- **/
	
	public static final String WINDOWS_ORDER_DIC = "D://cloudwork/imgTemp";
	
	public static final String LINUX_ORDER_DIC = "/usr/local/images";

	public static final String NGINX_URL = "http://47.106.130.125:8090";
	
	/** ------------------------------------------- 导出委托单路径------------------------------- **/
	
	
}
