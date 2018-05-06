package cn.testin.util;

import java.util.Map;

public class AppUserTokenUtil {
	
	 /**
	  * 
	  * @Description: 根据请求参数获得用户token
	  * @author: shenjinni
	  * @param params
	  * @return
	 */
	public static String getUserToken(Map<String,Object> params){
		Map<String,Object> data = (Map<String, Object>) params.get("data");
		String userToken = (String) data.get("userToken");
		return userToken;
	}
	
	 /**
	  * 
	  * @Description: 生成用户token=3个随机码+uuid+3个随机码，共38位
	  * @author: shenjinni
	  * @return
	 */
	public static String createUserToken(){
		String uuid = RandomUtils.getUUID();
		return uuid;
	}
	
	public static void main(String[] args) {
		String token = createUserToken();
		System.out.println(token);
	}
}
