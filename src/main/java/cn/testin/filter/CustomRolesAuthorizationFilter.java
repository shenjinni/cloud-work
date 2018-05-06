package cn.testin.filter;

import cn.testin.bean.LocalUser;
import cn.testin.util.SessionUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Set;

/** 
 * @ClassName: CustomRolesAuthorizationFilter 
 * @Description: 实现AuthorizationFilter抽象类，配置角色校验
 * @author shenjinni
 * @date 2017年3月12日 下午12:32:12 
 *  
 */
public class CustomRolesAuthorizationFilter extends AuthorizationFilter {

	private static Logger logger = LogManager.getLogger(CustomRolesAuthorizationFilter.class);
	/**
	 * 角色校验配置，若当前用户是rolesArray中的任何一个，则有权限访问
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest req, ServletResponse resp, Object mappedValue) throws Exception {
		Subject subject = getSubject(req, resp);
		
		HttpServletRequest req1 = (HttpServletRequest) req;
		LocalUser u = SessionUtil.getUserFromSession(req1);
		
		String[] rolesArray = (String[]) mappedValue;
		if (rolesArray == null || rolesArray.length == 0) { //没有角色限制，有权限访问  
			return true;  
		} 
		
		Set<String> roles = CollectionUtils.asSet(rolesArray);
		for (String role : roles) {  //若当前用户是rolesArray中的任何一个，则有权限访问
            if (subject.hasRole(role)) {  
                return true;  
            }  
        }  
		logger.warn((u == null?"未登录或登录超时用户":"用户"+u.getUserLoginName())+"，无访问权限！本地址所允许的访问权限："+Arrays.toString(rolesArray));
		return false;
	}

}
