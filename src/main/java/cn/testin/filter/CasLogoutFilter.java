package cn.testin.filter;

import java.io.IOException;

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

public class CasLogoutFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		/*HttpServletRequest req = (HttpServletRequest)request;
		//登出时，首先使session失效，然后转向CAS请求单点登出
		HttpSession session = req.getSession();
		session.invalidate();
		SecurityUtils.getSubject().getSession().setTimeout(0);
		*//*CookieGenerator cg1 = new CookieGenerator();
		cg1.setCookieDomain("casicloud.com");//这里可以替换成自己的域名如.casicloud.com
		//没有设置过期时间则浏览器关闭以后即关闭 
		cg1.setCookieName("COMMONID");
		cg1.setCookieMaxAge(0);
		cg1.addCookie((HttpServletResponse)response, URLEncoder.encode(session.getId().toString(), "UTF-8"));*//*
		//获取过滤器配置参数
		FilterRegistration casFilter = req.getServletContext().getFilterRegistration("CAS Validation Filter");
		String casDomain = casFilter.getInitParameter("casServerUrlPrefix");
		String serverDomain = casFilter.getInitParameter("serverName");
		//转向cas单点登出
		String url =  casDomain + "/logout?url="+serverDomain  + "/common/home.do";
		 
		
		((HttpServletResponse)response).sendRedirect(url);
		if (!response.isCommitted()) {
			chain.doFilter(request, response);
		}*/
		
	}

	@Override
	public void destroy() {
		
	}

}
