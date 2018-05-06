package cn.testin.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;
/**
 * 
 * @ClassName: CustomizedToken 
 * @Description: 通用token
 * @author: shenjinni
 * @date 2018年3月3日 下午6:43:16 
 *
 */
public class CustomizedToken extends UsernamePasswordToken {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4502287644383665781L;
	
	//登录类型，判断是普通用户登录，还是第三方登陆
    private String loginType;

    public CustomizedToken(final String username, final String password,String loginType) {
        super(username,password);
        this.loginType = loginType;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }
}
