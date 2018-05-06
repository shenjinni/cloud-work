package cn.testin.util;

import cn.testin.bean.LocalUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 
  * @ClassName: SessionUtil 
  * @Description: 
  * @author: shenjinni
  * @date 2018年1月8日 上午10:44:33 
  *
 */
public class SessionUtil {

	/**
	 * 
	  * @Description: 获得session对象
	  * @author: shenjinni
	  *
	  * @param req
	  * @return
	 */
	public static HttpSession getSession(HttpServletRequest req){
		if(null != req){
			return req.getSession();
		}
		return null;
	}
	/**
	 * 
	  * @Description: 从session 获得user对象
	  * @author: shenjinni
	  * @param req
	  * @return
	 */
	public static LocalUser getUserFromSession(HttpServletRequest req){
		if(null != req){
			return (LocalUser) req.getSession().getAttribute("user");
		}
		return null;
	}
	
	/**
	 * 
	  * @Description: 将user对象加入到session中
	  * @author: shenjinni
	  * @param req
	  * @param u
	 */
	public static void addUserToSession(HttpServletRequest req, LocalUser u){
		if(null != req && null != u){
			req.getSession().setAttribute("user",u);
		}
	}
}
