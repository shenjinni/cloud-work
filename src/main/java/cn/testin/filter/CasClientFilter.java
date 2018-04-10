package cn.testin.filter;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.jasig.cas.client.validation.Assertion;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.testin.constant.Constants;
import cn.testin.service.LocalUserService;
import cn.testin.util.StringUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.jasig.cas.client.validation.Assertion;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alibaba.fastjson.JSON;


@Component
public class CasClientFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) request).getSession();
		Object se = session.getAttribute("_const_cas_assertion_");
		/*if (se instanceof Assertion && session.getAttribute("isCASLogin") == null) {
			String companyName = "";
			String jsonObj = "";
			Assertion assertion = (Assertion) se;
			Map<String, Object> attrs = assertion.getPrincipal().getAttributes();
			String shortAccount = attrs.get("username").toString().trim();//用户名
			try {
				HttpServletRequest req = (HttpServletRequest) request;
				HttpServletResponse resp = (HttpServletResponse) response;
				jsonObj = attrs.get("jsonObject").toString().trim();//json串
				if(!StringUtil.isEmpty(jsonObj)){
					Map<String,String> map = (Map<String,String>) JSON.parse(jsonObj);
					if(map.containsKey("COM_NAME")){
						String comp = map.get("COM_NAME");
						if(!StringUtil.isEmpty(comp)){
							companyName = comp.trim();
						}
					}
				}
				String phone = "".equalsIgnoreCase(attrs.get("mobile").toString()) ? null : attrs.get("mobile").toString().trim();//电话
				String email = attrs.get("email").toString().trim();//email
				String userId = attrs.get("userId").toString().trim();//userId
				userId = "".equalsIgnoreCase(userId) ? null : userId.trim();
				BeanFactory beans = WebApplicationContextUtils.getWebApplicationContext(((HttpServletRequest) request).getSession().getServletContext());
				LocalUserService userService = (LocalUserService) beans.getBean("localUserService");
				//ThirdUserService thirdUserService = (ThirdUserService) beans.getBean("thirdUserService");
				//ThirdUser tu = thirdUserService.findBeanById(userId);
				FilterRegistration casFilter = req.getServletContext().getFilterRegistration("CASFilter");
				String serverDomain = casFilter.getInitParameter("serverName");
				*//*if(null != tu && null != tu.getLocalUserId()){
					LocalUser u = userService.findUserById(tu.getLocalUserId());
					if(null != u){//已关联账号
						Subject sbj = SecurityUtils.getSubject();
						CustomizedToken ct = new CustomizedToken(u.getUserLoginName(),u.getPassword(),"thirdLogin");
						ct.setRememberMe(false);
						sbj.login(ct);
						if (sbj.isAuthenticated()) {
							// 判断用户是否有实验室权限
							session.setAttribute("isLabFlag", "lab".equals(u.getRoleShortName()));
							//增加登陆记录
							LocalUser user1 = new LocalUser();
							user1.setUserId(u.getUserId());
							user1.setLastLoginTime(new Date());
							if(!StringUtil.isEmpty(companyName)){
								user1.setCompanyName(companyName);
							}
							int loginTimes = (u.getLoginTimes() == null? 0 : u.getLoginTimes()) + 1;
							user1.setLoginTimes(loginTimes);
							userService.update(user1);
							SessionUtil.addUserToSession(req, userService.findUserByLoginName(u.getUserLoginName()));
							resp.sendRedirect(serverDomain + "/casicT/");
							return;
						}
						
					}else{//登陆过关联的本地用户信息有误
						//删除关联记录，重新关联
						int i = thirdUserService.delete(userId);
						if(i == 1){
							resp.sendRedirect(serverDomain + "/casicT/common/thirdUserConnect.do?thirdId="+userId+"&userType=YW");
							return;
						}
					}
				}else{//第一次登陆
					resp.sendRedirect(serverDomain + "/casicT/common/thirdUserConnect.do?thirdId="+userId+"&userType=YW");
					return;
				}*//*
				
			} catch (Exception e1) {
				e1.printStackTrace();
				HttpServletResponse resp = (HttpServletResponse) response;
				resp.sendRedirect(Constants.test_url);
				return;
			}
			
		}*/
	}

	@Override
	public void destroy() {
		
	}

}
