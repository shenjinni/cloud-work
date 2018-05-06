package cn.testin.shiro;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.realm.Realm;
/**
 * 
 * @ClassName: CustomizedModularRealmAuthenticator 
 * @Description: 自定义Authenticator
 * 			注意，当需要分别定义处理普通用户和管理员验证的Realm时，对应Realm的全类名应该包含字符串“User”，或者“Admin”。
 * 			并且，他们不能相互包含，例如，处理普通用户验证的Realm的全类名中不应该包含字符串"Admin"。
 * @author: shenjinni
 * @date 2018年3月3日 下午6:45:15 
 *
 */
public class CustomizedModularRealmAuthenticator extends ModularRealmAuthenticator {
	 @Override
	    protected AuthenticationInfo doAuthenticate(AuthenticationToken authenticationToken)
	            throws AuthenticationException {
	        // 判断getRealms()是否返回为空
	        assertRealmsConfigured();
	        // 强制转换回自定义的CustomizedToken
	        CustomizedToken customizedToken = (CustomizedToken) authenticationToken;
	        // 登录类型
	        String loginType = customizedToken.getLoginType();
	        // 所有Realm
	        Collection<Realm> realms = getRealms();
	        // 登录类型对应的所有Realm
	        Collection<Realm> typeRealms = new ArrayList<Realm>();
	        int i = 0;
	        for (Realm realm : realms) {
	        	if("localLogin".equals(loginType) && i == 0){
	        		typeRealms.add(realm);
	        	}
	        	if("thirdLogin".equals(loginType) && i == 1){
	        		typeRealms.add(realm);
	        	}
	        	i++;
	        }

	        // 判断是单Realm还是多Realm
	        if (typeRealms.size() == 1)
	            return doSingleRealmAuthentication(typeRealms.iterator().next(), customizedToken);
	        else
	            return doMultiRealmAuthentication(typeRealms, customizedToken);
	    }
}
