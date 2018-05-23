package cn.testin.util;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map.Entry;

public class StringUtil {
	
	private static String[] imgs = {"jpg","gif","bmp","png","jpeg"};
	
	public static String userNameReg = "^[a-zA-Z0-9_-]{4,16}$";
	
	public static String passwordReg = "^[a-zA-Z0-9_-]{6,20}$";
	
	public static String phoneReg = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$";
	
	public static String emailReg = "^[A-Za-z\\d]+([-_.][A-Za-z\\d]+)*@([A-Za-z\\d]+[-.])+[A-Za-z\\d]{2,5}$";

	public static String subString(String str, int begin) {
		return str.substring(begin);
	}

	public static String subString6(String str) {
		if(null == str || str.length() > 5){
			return str.substring(6);
		}
		return str;
	}

	public static String getRandomString(int length) {
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";// 含有字符和数字的字符串
		Random random = new Random();// 随机类初始化
		StringBuffer sb = new StringBuffer();// StringBuffer类生成，为了拼接字符串

		for (int i = 0; i < length; ++i) {
			int number = random.nextInt(62);// [0,62)

			sb.append(str.charAt(number));
		}
		return sb.toString();
	}
	
	public static String getString6(String s) {
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";// 含有字符和数字的字符串
		Random random = new Random();// 随机类初始化
		StringBuffer sb = new StringBuffer();// StringBuffer类生成，为了拼接字符串
		for (int i = 0; i < 6; ++i) {
			int number = random.nextInt(62);// [0,62)

			sb.append(str.charAt(number));
		}
		return sb.toString()+s;
	}
	

	/**
	  * 
	  * @Description: 字符串为null时转换为"",不为null时不作处理
	  * @author shenjinni
	  * @return String
	  */
	public static String filterStr(String obj){
		if(null == obj || obj.toLowerCase().equals("null")){
			return "";
		}
		return obj;
	}
	
	/**
	  * 
	  * @Description: 判断字符串或者对象是否为null，或者字符串是否为""
	  * @author shenjinni
	  * @return String
	  */
	public static boolean isEmpty(Object obj){
		if(null == obj || obj.toString().isEmpty()){
			return true;
		}
		return false;
	}
	
	/**
	  * 
	  * @Description: 或则指定长度的字符串，如果为空不处理,如果小于定长也不处理
	  * @author shenjinni
	  * @return String
	  */
	public static String getSpecifyLengthStr(String str,int length){
		if(null == str || isEmpty(str) || str.length() <= length){
			return str;
		}else{
			return str.substring(0, length)+"...";
		}
	}
	
	/**
	 * 
	 * @Description: 处理异常栈信息为字符串
	 * @author shenjinni
	 * @return String
	 */
	public static String getStackTrace(Throwable t){
    	StringWriter sw = new StringWriter();
    	PrintWriter pw = new PrintWriter(sw);
    	
    	try{
    		t.printStackTrace(pw);
    		return sw.toString();
    	}finally{
    		pw.close();
    	}
    }
	
	/** 
	 * 方法名称:transMapToString 
	 * 传入参数:map 
	 * 返回值:String 形如 username'chenziwen^password'1234 
	*/  
	@SuppressWarnings({ "rawtypes"})
	public static String transMapToString(Map<String, Object> map){  
	  Entry entry;  
	  StringBuffer sb = new StringBuffer();  
	  for(Iterator iterator = map.entrySet().iterator(); iterator.hasNext();)  
	  {  
	    entry = (Entry) iterator.next();  
	      sb.append(entry.getKey().toString()).append( ":" ).append(null==entry.getValue()?"":  
	      entry.getValue().toString()).append (iterator.hasNext() ? " " : "");  
	  }  
	  return sb.toString();  
	} 
	
	/**
	 * 
	 * @Description: 去掉所有html标签
	 * @author shenjinni
	 * @return String
	 */
	public static String removeHtml(String content) {
		if(null == content || "".equals(content)){
			return content;
		}
		String txtContent = content.replaceAll("</?[^>]+>", ""); // 剔出<html>的标签
		txtContent = txtContent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");// 去除字符串中的空格,回车,换行符,制表符
		txtContent = txtContent.replaceAll("&nbsp;", "");
		txtContent = txtContent.replaceAll("\\s*", "");
		txtContent = txtContent.replaceAll(" ",""); 
		txtContent = txtContent.replace("　", "");
		txtContent = txtContent.trim();
		return txtContent;
	}
	
	/**
	 * 
	 * @Description: 根据传送的扩展名判断文件类型，上传文件归档目录使用
	 * @author shenjinni
	 * @return String
	 */
	public static String getFileType(String type){
		String fileType = "file";
		if(!isEmpty(type)){
			for(int i=0;i<imgs.length;i++){
				if(type.endsWith(imgs[i])){
					return "image";
				}
			}
		}
		return fileType;
	}
	/**
	 * 
	 * @Description: 验证字符串是否符合对应的正则规则，如果是返回true 反之false
	 * @author: shenjinni
	 * @param str
	 * @param regex
	 * @return
	 */
	public static boolean regexStr(String str, String regex){
		if(!StringUtil.isEmpty(str) && str.matches(regex)){
			return true;
		}
		return false;
	}

	/**
	 * 获取过去第几天的日期(- 操作) 或者 未来 第几天的日期( + 操作)
	 *
	 * @return
	 */
	public static String getDateAdd(int addDay) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + addDay);
		Date today = calendar.getTime();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String result = format.format(today);
		return result;

	}
	public static void main(String[] args) {

		
//		String reg = "^[1-9]\\d{5}(((18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3})|(\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}))[0-9Xx]$";
//		System.out.println("41032219880405181".matches(reg));
//		System.out.println("332621680413871".matches(reg));
		
//		String a = "http://ditu.jiangsugqt.org/qc/uploadImage/20161212/21612121144459003.jpg";
//		System.out.println(a.substring(a.lastIndexOf("/")+1));
//		System.out.println(regexStr("12345",StringUtil.passwordReg));
		System.out.println(isEmpty(null));
	}
}