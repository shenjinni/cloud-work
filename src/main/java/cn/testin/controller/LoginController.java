package cn.testin.controller;

import cn.testin.bean.LocalUser;
import cn.testin.constant.Constants;
import cn.testin.service.LocalUserService;
import cn.testin.shiro.CustomizedToken;
import cn.testin.util.MD5Util;
import cn.testin.util.RedisUtil;
import cn.testin.util.SessionUtil;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 前端登录控制器
 * 
 * @author guwei
 *
 */
@Controller
@RequestMapping("/common/")
public class LoginController {

	private static Logger log = Logger.getLogger(LoginController.class);

	@Resource
	private LocalUserService luService;


	@RequestMapping("localLogin.do")
	public ModelAndView localLogin(HttpServletRequest request, HttpSession session) {
		String fromUrl = request.getParameter("fromUrl");
		System.out.println(fromUrl);
		if (!"".equals(fromUrl)) {
			session.setAttribute("fromUrl", fromUrl);
		}
		ModelAndView mv = new ModelAndView("/common/login");
		return mv;
	}

	@RequestMapping("checkCode.do")
	public ModelAndView checkCode(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/common/checkCode");
		return mv;
	}

	@RequestMapping(value = "login.json")
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest req, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String flagcode = req.getParameter("flagcode");
		String thirdId = req.getParameter("thirdId");
		String userType = req.getParameter("userType");
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "登录失败，请稍后再试！");
		if (session.getAttribute("checkCode").equals(flagcode)) {
			try {
				Subject sbj = SecurityUtils.getSubject();
				CustomizedToken ct = new CustomizedToken(username,password,"localLogin");
				ct.setRememberMe(false);
				/**
				 * 先查询是否是以手机号登陆
				 */
				LocalUser u1 = luService.findUserByPhone(username);
				if(null != u1){
					ct = new CustomizedToken(u1.getUserLoginName(), password,"localLogin");
					username = u1.getUserLoginName();
				}
				sbj.login(ct);
				if (sbj.isAuthenticated()) {
					LocalUser lu = luService.findUserByLoginName(username);
					/*//第三方关联
					if(!StringUtil.isEmpty(thirdId) && !StringUtil.isEmpty(userType)){
						ThirdUser tu = new ThirdUser();
						tu.setUserId(thirdId);
						tu.setLocalUserId(lu.getUserId());
						tu.setCreateTime(new Date());
						tu.setUserType(userType);
						thirdUserService.insert(tu);
					}*/
					SessionUtil.addUserToSession(req, lu);
					result.put("errCode", Constants.result_success);
					result.put("errMsg", "登录成功！");
					// 判断用户是否有实验室权限
					session.setAttribute("isLabFlag", "lab".equals(lu.getRoleShortName()));
					Object fromUrl = session.getAttribute("fromUrl");
					if (fromUrl == null || "".equals(fromUrl.toString())) {
						result.put("url", "/index.jsp");
					} else {
						session.setAttribute("fromUrl", "");
						result.put("url", "/" + fromUrl.toString());
					}
					//增加登陆记录
					/*LocalUser user1 = new LocalUser();
					user1.setUserId(u1.getUserId());
					user1.setLastLoginTime(new Date());
					int loginTimes = (u1.getLoginTimes() == null? 0 : u1.getLoginTimes()) + 1;
					user1.setLoginTimes(loginTimes);
					luService.update(user1);*/
				}
			} catch (IncorrectCredentialsException e) {
				result.put("errMsg", "用户名或密码错误，请重新输入！");
				result.put("passwordFlag", true);
				log.warn("用户：" + username + "，登录系统失败：登录密码错误！");
			} catch (ExcessiveAttemptsException e) {
				result.put("errMsg", "登录失败次数过多！");
				log.warn("用户：" + username + "，登录系统失败：登录失败次数过多！");
			} catch (LockedAccountException e) {
				result.put("errMsg", "登录失败，帐号已被锁定！");
				log.warn("用户：" + username + "，登录系统失败：帐号已被锁定！");
			} catch (DisabledAccountException e) {
				result.put("errMsg", "登录失败，帐号已被禁用！");
				log.warn("用户：" + username + "，登录系统失败：帐号已被禁用！");
			} catch (ExpiredCredentialsException e) {
				result.put("errMsg", "登录失败，帐号已过期！");
				log.warn("用户：" + username + "，登录系统失败：帐号已过期！");
			} catch (UnknownAccountException e) {
				result.put("errMsg", "该用户名不存在，请重新输入！");
				log.warn("用户：" + username + "，登录系统失败：账号不存在！");
			} catch (UnauthorizedException e) {
				result.put("errMsg", "登录失败，您没有得到相应的授权！");
				log.warn("用户：" + username + "，登录系统失败：您没有得到相应的授权！");
			} catch (Exception e) {
				result.put("errMsg", "登录失败，其他异常！");
				log.warn("用户：" + username + "，登录系统失败：其他异常！");
			}
		} else {
			result.put("errMsg", "验证码输入有误，请重新输入！");
			result.put("flagcodeFlag", true);
			log.warn("用户：" + username + "，登录系统失败：验证码有误！");
		}
		return result;
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		SessionUtil.addUserToSession(request, null);
		Subject sbj = SecurityUtils.getSubject();
		sbj.logout();
		return "redirect:/common/localLogin.do";
	}
	
	@RequestMapping("goForget.do")
	public ModelAndView goForget(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/common/forget");
		return mv;
	}
	
	@RequestMapping("goResetPassword.do")
	public ModelAndView goResetPassword(HttpServletRequest request) throws Exception{
		String mobile = request.getParameter("mobile");
		if(RedisUtil.get(mobile+"_forget_2")!=null&&(!"".equals(RedisUtil.get(mobile+"_forget_2").toString()))){
			RedisUtil.save(mobile+"_forget_3", true);
			ModelAndView mv = new ModelAndView("/common/resetPassword");
			return mv;
		}else{
			String msg = "重置密码页面：手机号异常，该手机号并未通过短信验证！";
			log.warn(msg);
			throw new Exception(msg);
		}		
	}
	
	@RequestMapping(value = "resetPassword.json")
	@ResponseBody
	public Map<String,Object> resetPassword(HttpServletRequest req, HttpSession session) {
		Map<String,Object> result = new HashMap<String,Object>();
		String password = req.getParameter("password");
		String mobile = req.getParameter("mobile");
		if(RedisUtil.get(mobile+"_forget_3")!=null&&(!"".equals(RedisUtil.get(mobile+"_forget_3").toString()))){
			result.put("flag", true);
			result.put("msg", "密码重置成功");
			boolean hasFlag = luService.checkUserExistByPhone(mobile);
			if(hasFlag){
				//获取该用户
				LocalUser lu = luService.findUserByPhone(mobile);
				//修改该用户密码
				lu.setPassword(MD5Util.getMD5(password));
				//保存
				luService.update(lu);
				result.put("flag", true);
				result.put("msg", "重置密码成功！");
			}else{
				result.put("flag", false);
				result.put("msg", "该手机号不存在！");
				log.warn("重置密码页面：该手机号不存在！");
			}
		}else{
			result.put("flag", false);
			result.put("msg", "手机号异常，该手机号并未通过短信验证！");
			log.warn("重置密码页面：手机号异常，该手机号并未通过短信验证！");
		}
		return result;
	}
	
	@RequestMapping(value = "checkMobileUsername.json")
	@ResponseBody
	public Map<String, Object> checkMobileUsername(HttpServletRequest req, HttpSession session) {
		String mobile = req.getParameter("mobile");
		String username = req.getParameter("username");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("mobile", mobile);
		params.put("username", username);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("flag", luService.checkUserExistByUsernamePhone(params));
		return result;
	}
	
	@RequestMapping(value = "thirdUserConnect.do")
	public ModelAndView thirdUserConnect(HttpServletRequest req, @RequestParam("thirdId") String thirdId,@RequestParam("userType") String userType) {
		ModelAndView mv = new ModelAndView("/common/thirdUserConnect");
		mv.addObject("thirdId", thirdId);
		mv.addObject("userType", userType);//用户类型 QQ-QQ用户 WX-微信用户 YW-云网用户
		return mv;
	}
	
}
