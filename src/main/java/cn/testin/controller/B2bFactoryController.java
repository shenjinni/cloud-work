package cn.testin.controller;

import cn.testin.bean.CloudWorkFactory;
import cn.testin.bean.LocalUser;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkFactoryService;
import cn.testin.util.RandomUtils;
import cn.testin.util.RedisUtil;
import cn.testin.util.SessionUtil;
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
 * 对象功能:前台设计工作室信息页面controller
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-12 14:03:17
 *</pre>
 */
@Controller
@RequestMapping("/b2b/")
public class B2bFactoryController {

	private static Logger log = Logger.getLogger(B2bFactoryController.class);

	@Resource
	private CloudWorkFactoryService cloudWorkFactoryService;


	/**
	 *
	 * @Description: 设计工作室信息栏目页
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("factoryColumn.do")
	public ModelAndView factoryColumn(HttpServletRequest req) throws Exception {
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

			// 设计工作室信息分页
			pageIndex = pageIndex == 0 ? 1 : pageIndex;// 默认设置为1
			Map<String, Object> result = cloudWorkFactoryService.getPage(pageIndex, textsearch);
			result.put("pageIndex", pageIndex);
			req.setAttribute("pageBean", result);
		} catch (Exception e) {
			String msg = "设计工作室信息栏目页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
		ModelAndView mv = new ModelAndView("/b2b/factoryColumn");
		return mv;
	}

	/**
	 *
	 * @Description: 设计工作室信息详细页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("factoryDetail.do")
	public ModelAndView factoryDetail(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");
		if (StringUtils.isBlank(idStr)) {
			return new ModelAndView("redirect:/common/404.jsp");
		}

		CloudWorkFactory factory = cloudWorkFactoryService.findBeanById(Long.parseLong(idStr));
		if (factory == null) {
			return new ModelAndView("redirect:/common/404.jsp");
		} else {
			req.setAttribute("factory", factory);
			return new ModelAndView("b2b/factoryDetail");
		}

	}

	/**
	 *
	 * @Description: 设计工作室信息编辑页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("factoryUpdate.do")
	public ModelAndView factoryUpdate(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");

		CloudWorkFactory factory = null;
		try {
			factory = cloudWorkFactoryService.findBeanById(Long.parseLong(idStr));

			if (factory == null) {
				return new ModelAndView("redirect:/common/404.jsp");
			} else {
				req.setAttribute("factory", factory);
				return new ModelAndView("/b2b/factoryUpdate");
			}
		} catch (NumberFormatException e) {
			String msg = "设计工作室信息明细页异常：id参数格式异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		} catch (Exception e) {
			String msg = "设计工作室信息明细页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
	}

	/**
	 *
	 * @Description: 设计工作室信息发布页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("factoryPublish.do")
	public ModelAndView factoryPublish() {
		return new ModelAndView("/b2b/factoryPublish");
	}

	/**
	 *
	 * @Description: 发布设计工作室信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "factoryPublish.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> factoryPublish(@RequestBody CloudWorkFactory factory
			, HttpSession session){
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "发布设计工作室信息失败，请稍后再试！");

		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		if (user == null){
			result.put("errMsg", "未登录");
			return result;
		}

		factory.setId(RandomUtils.g());
		factory.setStatus(-1);
		factory.setCreateTime(new Date());
		factory.setCreateUser(user.getUserId());
		factory.setUpdateTime(new Date());
		factory.setUpdateUser(user.getUserId());
		int i = cloudWorkFactoryService.insert(factory);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "发布设计工作室信息成功！");

			log.info("发布设计工作室信息成功！factoryId= " + factory.getId());
		}

		return result;
	}

	/**
	 *
	 * @Description: 设计师信息查看次数
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("checkLook4.json")
	@ResponseBody
	public Map<String,Object> checkLook4(HttpSession session) {
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
			Integer pulishtime = (Integer) RedisUtil.get("publishtime_4_" + user.getUserId());
			if (pulishtime == null) {
				pulishtime = 0;
			}
			if (pulishtime > 2) {
				result.put("errMsg", 1);
				log.info("普通用户每天只能查看3条,publishtime_4_已超出！personId= " + user.getUserId() + ", pulishtime = " + pulishtime);
				return result;
			}

			Integer vartime = RedisUtil.getRemainSecondsOneDay(new Date());

			RedisUtil.save("publishtime_4_" + user.getUserId(), pulishtime + 1, vartime);
			log.info("普通用户每天只能查看3条,publishtime_4_次数记录！personId= " + user.getUserId() + ", pulishtime = " + pulishtime + "， 有效时间 = " + vartime);
		}

		result.put("errCode", Constants.result_success);
		result.put("errMsg", 0);
		return result;
	}


}
