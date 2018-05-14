package cn.testin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.testin.bean.LocalUser;
import cn.testin.constant.Constants;
import cn.testin.service.LocalUserService;
import cn.testin.service.RegisteService;
import cn.testin.util.JavaSmsApi;
import cn.testin.util.RandomUtils;
import cn.testin.util.RedisUtil;
import cn.testin.util.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 * 前端注册控制器
 * 
 * @author guwei
 *
 */
@Controller
@RequestMapping("/common/")
public class RegisteController {

	private static Logger log = org.apache.log4j.Logger.getLogger(RegisteController.class);

	@Resource
	private RegisteService regService;
	@Resource
	private LocalUserService lus;
	/*@Resource
	private ThirdUserService thirdUserService;*/

	@RequestMapping("registe.do")
	public ModelAndView goRegiste(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/common/registe");
		return mv;
	}

	@RequestMapping(value = "registe.json")
	@ResponseBody
	public Map<String, Object> registe(HttpServletRequest req) {
		Map<String, Object> result = new HashMap<String, Object>();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile");
		String thirdId = req.getParameter("thirdId");
		String userType = req.getParameter("userType");
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "注册失败，请稍后再试！");
		if (!lus.checkUserExistByLoginName(username)) {
			if (!lus.checkUserExistByPhone(mobile)) {
				try {
					LocalUser lu = new LocalUser();
					lu.setUserLoginName(username);
					lu.setPassword(password);
					if(!StringUtil.isEmpty(email)){
						lu.setUserEmail(email);
					}
					lu.setUserPhone(mobile);
					lu.setSex("S");
					regService.registe(lu);
					/*//第三方关联
					if(!StringUtil.isEmpty(thirdId) && !StringUtil.isEmpty(userType)){
						ThirdUser tu = new ThirdUser();
						tu.setUserId(thirdId);
						tu.setLocalUserId(lu.getUserId());
						tu.setCreateTime(new Date());
						tu.setUserType(userType);
						thirdUserService.insert(tu);
						//第三方注册后，直接登录
						String code = RandomUtils.getRandomCode(4);
						req.getSession().setAttribute("checkCode", code);
						result.put("code", code);
					}*/
					result.put("errCode", Constants.result_success);
					result.put("errMsg", "注册成功！");
					result.put("url", "/common/localLogin.do");
				} catch (Exception e) {
					result.put("errMsg", e.getMessage());
					log.warn("新用户，" + e.getMessage());
				}
			} else {
				result.put("errMsg", "该手机已注册！");
			}
		} else {
			result.put("errMsg", "该用户已注册！");
		}
		return result;
	}

	@RequestMapping(value = "checkUsernameRepeat.json")
	@ResponseBody
	public Map<String, Object> checkUsernameRepeat(HttpServletRequest req, HttpSession session) {
		String text = req.getParameter("text");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("flag", lus.checkUserExistByLoginName(text));
		return result;
	}

	@RequestMapping(value = "checkEmailRepeat.json")
	@ResponseBody
	public Map<String, Object> checkEmailRepeat(HttpServletRequest req, HttpSession session) {
		String text = req.getParameter("text");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("flag", lus.checkUserExistByEmail(text));
		return result;
	}

	@RequestMapping(value = "checkMobileRepeat.json")
	@ResponseBody
	public Map<String, Object> checkMobileRepeat(HttpServletRequest req, HttpSession session) {
		String text = req.getParameter("text");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("flag", lus.checkUserExistByPhone(text));
		return result;
	}

	@RequestMapping(value = "checkMobileFlagCode.json")
	@ResponseBody
	public Map<String, Object> checkMobileFlagCode(HttpServletRequest req, HttpSession session) {
		String text = req.getParameter("text");
		String mobile = req.getParameter("mobile");
		String flagText = req.getParameter("flagText");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("flag", RedisUtil.get(mobile + "_" + flagText).toString().equals(text));
		if ("forget".equals(flagText)) {
			RedisUtil.save(mobile + "_" + flagText + "_2", true);
		}
		return result;
	}

	@RequestMapping(value = "sendFlagcode.json")
	@ResponseBody
	public Map<String, Object> sendFlagcode(HttpServletRequest req, HttpSession session) {
		// 修改为您要发送的手机号
		String mobile = req.getParameter("mobile");
		String flagText = req.getParameter("flagText");
		Map<String, Object> result = new HashMap<String, Object>();
		// 修改为您的apikey.apikey可在官网（http://www.yuanpian.com)登录后用户中心首页看到
		String random = RandomUtils.getValidCode(4);
		try {
			boolean flag = RedisUtil.save(mobile + "_" + flagText, random);
			if (flag) {
				/**************** 使用通用接口发短信(推荐) *****************/
				// 设置您要发送的内容(内容必须和某个模板匹配。以下例子匹配的是系统提供的1号模板）
				String text = Constants.msg_template + random;
				// 发短信调用示例
				log.info("使用通用接口发短信！text= " + text + ", mobile = " + mobile);
				JavaSmsApi.sendSms(text, mobile);
				result.put("flag", true);
			} else {
				result.put("flag", false);
			}
		} catch (Exception e) {
			result.put("flag", false);
		}
		return result;
	}
}
