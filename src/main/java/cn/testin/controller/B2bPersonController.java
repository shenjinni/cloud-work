package cn.testin.controller;

import cn.testin.bean.CloudWorkPerson;
import cn.testin.bean.LocalUser;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkPersonService;
import cn.testin.util.RandomUtils;
import cn.testin.util.RedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
 * 对象功能:前台设计师信息页面controller
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-12 14:03:17
 *</pre>
 */
@Controller
@RequestMapping("/b2b/")
public class B2bPersonController {

	private static Logger log = Logger.getLogger(B2bPersonController.class);

	@Resource
	private CloudWorkPersonService cloudWorkPersonService;


	/**
	 *
	 * @Description: 设计师信息栏目页
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("personColumn.do")
	public ModelAndView personColumn(HttpServletRequest req) throws Exception {
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

			// 设计师信息分页
			pageIndex = pageIndex == 0 ? 1 : pageIndex;// 默认设置为1
			Map<String, Object> result = cloudWorkPersonService.getPage(pageIndex, textsearch);
			result.put("pageIndex", pageIndex);
			req.setAttribute("pageBean", result);
		} catch (Exception e) {
			String msg = "设计师信息栏目页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
		ModelAndView mv = new ModelAndView("/b2b/personColumn");
		return mv;
	}

	/**
	 *
	 * @Description: 设计师信息详细页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("personDetail.do")
	public ModelAndView personDetail(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");
		if (StringUtils.isBlank(idStr)) {
			return new ModelAndView("redirect:/common/404.jsp");
		}

		CloudWorkPerson person = cloudWorkPersonService.findBeanById(Long.parseLong(idStr));
		if (person == null) {
			return new ModelAndView("redirect:/common/404.jsp");
		} else {
			req.setAttribute("person", person);
			return new ModelAndView("b2b/personDetail");
		}

	}

	/**
	 *
	 * @Description: 设计师信息编辑页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("personUpdate.do")
	public ModelAndView personUpdate(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");

		CloudWorkPerson person = null;
		try {
			person = cloudWorkPersonService.findBeanById(Long.parseLong(idStr));

			if (person == null) {
				return new ModelAndView("redirect:/common/404.jsp");
			} else {
				req.setAttribute("person", person);
				return new ModelAndView("/b2b/personUpdate");
			}
		} catch (NumberFormatException e) {
			String msg = "设计师信息明细页异常：id参数格式异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		} catch (Exception e) {
			String msg = "设计师信息明细页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
	}

	/**
	 *
	 * @Description: 设计师信息发布页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("personPublish.do")
	public ModelAndView personPublish() {
		return new ModelAndView("/b2b/personPublish");
	}

	/**
	 *
	 * @Description: 设计师信息发布
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("personPublish.json")
	@ResponseBody
	public Map<String,Object> personPublish(@RequestBody CloudWorkPerson person, HttpSession session) {
		Map<String,Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "发布设计师信息失败，请稍后再试！");

		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		if (user == null){
			result.put("errMsg", "未登录");
			return result;
		}

        person.setId(RandomUtils.g());
        person.setStatus(-1);
        person.setCreateTime(new Date());
        person.setCreateUser(user.getUserId());
        person.setUpdateTime(new Date());
        person.setUpdateUser(user.getUserId());
        int i = cloudWorkPersonService.insert(person);
        if (i == 1) {
            result.put("errCode", Constants.result_success);
            result.put("errMsg", "发布设计师信息成功！");

            log.info("发布设计师信息成功！personId= " + person.getId());
        }
        return result;
	}

	/**
	 *
	 * @Description: 设计师信息查看次数
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("checkLook1.json")
	@ResponseBody
	public Map<String,Object> checkLook1(HttpSession session) {
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
			Integer pulishtime = (Integer) RedisUtil.get("publishtime_1_" + user.getUserId());
			if (pulishtime == null) {
				pulishtime = 0;
			}
			if (pulishtime > 2) {
				result.put("errMsg", 1);
				log.info("普通用户每天只能查看3条,publishtime_1_已超出！personId= " + user.getUserId() + ", pulishtime = " + pulishtime);
				return result;
			}

			Integer vartime = RedisUtil.getRemainSecondsOneDay(new Date());

			RedisUtil.save("publishtime_1_" + user.getUserId(), pulishtime + 1, vartime);
			log.info("普通用户每天只能查看3条,publishtime_1_次数记录！personId= " + user.getUserId() + ", pulishtime = " + pulishtime + "， 有效时间 = " + vartime);
		}

		result.put("errCode", Constants.result_success);
		result.put("errMsg", 0);
		return result;
	}


}
