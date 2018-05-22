package cn.testin.controller;

import cn.testin.bean.CloudWorkRecruitment;
import cn.testin.bean.LocalUser;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkRecruitmentService;
import cn.testin.util.RandomUtils;
import cn.testin.util.RedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *<pre>
 * 对象功能:前台设计岗位信息页面controller
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-12 14:03:17
 *</pre>
 */
@Controller
@RequestMapping("/b2b/")
public class B2bRecruitmentController {

	private static Logger log = Logger.getLogger(B2bRecruitmentController.class);

	@Resource
	private CloudWorkRecruitmentService cloudWorkRecruitmentService;


	/**
	 *
	 * @Description: 设计岗位信息栏目页
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("recruitmentColumn.do")
	public ModelAndView recruitmentColumn(HttpServletRequest req) throws Exception {
		try {
			String pageIndexStr = req.getParameter("pageIndex");
			String text = req.getParameter("text");
			String textsearch = "";
			if (StringUtils.isNotBlank(text)) {
				try {
					byte[] bytes= text.getBytes("ISO-8859-1");
					textsearch = new String(bytes,"utf-8");
					req.setAttribute("text", textsearch);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			// pageIndex不是数字或为null时，重置为1
			if (!StringUtils.isNumeric(pageIndexStr)) {
				pageIndexStr = "1";
			}
			int pageIndex = Integer.parseInt(pageIndexStr);

			// 设计岗位信息分页
			pageIndex = pageIndex == 0 ? 1 : pageIndex;// 默认设置为1
			Map<String, Object> result = cloudWorkRecruitmentService.getPage(pageIndex, textsearch);
			result.put("pageIndex", pageIndex);
			req.setAttribute("pageBean", result);
		} catch (Exception e) {
			String msg = "设计岗位信息栏目页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
		ModelAndView mv = new ModelAndView("/b2b/recruitmentColumn");
		return mv;
	}

	/**
	 *
	 * @Description: 设计岗位信息详细页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("recruitmentDetail.do")
	public ModelAndView recruitmentDetail(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");
		if (StringUtils.isBlank(idStr)) {
			return new ModelAndView("redirect:/common/404.jsp");
		}

		CloudWorkRecruitment recruitment = cloudWorkRecruitmentService.findBeanById(Long.parseLong(idStr));
		if (recruitment == null) {
			return new ModelAndView("redirect:/common/404.jsp");
		} else {
			req.setAttribute("recruitment", recruitment);
			return new ModelAndView("b2b/recruitmentDetail");
		}

	}

	/**
	 *
	 * @Description: 设计岗位信息编辑页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("recruitmentUpdate.do")
	public ModelAndView recruitmentUpdate(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");

		CloudWorkRecruitment recruitment = null;
		try {
			recruitment = cloudWorkRecruitmentService.findBeanById(Long.parseLong(idStr));

			if (recruitment == null) {
				return new ModelAndView("redirect:/common/404.jsp");
			} else {
				req.setAttribute("recruitment", recruitment);
				return new ModelAndView("/b2b/recruitmentUpdate");
			}
		} catch (NumberFormatException e) {
			String msg = "设计岗位信息明细页异常：id参数格式异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		} catch (Exception e) {
			String msg = "设计岗位信息明细页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
	}

	/**
	 *
	 * @Description: 设计岗位信息发布页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("recruitmentPublish.do")
	public ModelAndView recruitmentPublish() {
		return new ModelAndView("/b2b/recruitmentPublish");
	}

	/**
	 *
	 * @Description: 发布设计岗位信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "recruitmentPublish.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> recruitmentPublish(@RequestBody CloudWorkRecruitment recruitment, HttpSession session){
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "发布设计岗位信息信息失败，请稍后再试！");

		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		if (user == null){
			result.put("errMsg", "未登录");
			return result;
		}

		recruitment.setId(RandomUtils.g());
		recruitment.setStatus(-1);
		recruitment.setCreateTime(new Date());
		recruitment.setCreateUser(user.getUserId());
		recruitment.setUpdateTime(new Date());
		recruitment.setUpdateUser(user.getUserId());
		int i = cloudWorkRecruitmentService.insert(recruitment);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "发布设计岗位信息信息成功！");

			log.info("发布设计岗位信息信息成功！recruitmentId= " + recruitment.getId());
		}

		return result;
	}

	/**
	 *
	 * @Description: 设计师信息查看次数
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("checkLook2.json")
	@ResponseBody
	public Map<String,Object> checkLook2(HttpSession session) {
		Map<String,Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", 1);

		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		if (user == null){
			result.put("errMsg", 2);
			return result;
		}

		// 查看是否是普通用户，并且发布条数超过3条
		if (user.getRoleShortName().equals("normal")) {
			Integer pulishtime = (Integer) RedisUtil.get("publishtime_2_" + user.getUserId());
			if (pulishtime == null) {
				pulishtime = 0;
			}
			if (pulishtime > 2) {
				result.put("errMsg", 1);
				log.info("普通用户每天只能查看3条,publishtime_2_已超出！personId= " + user.getUserId() + ", pulishtime = " + pulishtime);
				return result;
			}

			Integer vartime = RedisUtil.getRemainSecondsOneDay(new Date());

			RedisUtil.save("publishtime_2_" + user.getUserId(), pulishtime + 1, vartime);
			log.info("普通用户每天只能查看3条,publishtime_2_次数记录！personId= " + user.getUserId() + ", pulishtime = " + pulishtime + "， 有效时间 = " + vartime);
		}

		result.put("errCode", Constants.result_success);
		result.put("errMsg", 0);
		return result;
	}
}
