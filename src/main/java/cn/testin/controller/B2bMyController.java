package cn.testin.controller;

import cn.testin.bean.*;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkFactoryService;
import cn.testin.service.CloudWorkLaborService;
import cn.testin.service.CloudWorkPersonService;
import cn.testin.service.CloudWorkRecruitmentService;
import cn.testin.util.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
 * 对象功能:我发布的信息页面controller
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-05-03 14:03:17
 *</pre>
 */
@Controller
@RequestMapping("/b2b/myInfo/")
public class B2bMyController {

	private static Logger log = Logger.getLogger(B2bMyController.class);

	@Resource
	private CloudWorkPersonService cloudWorkPersonService;

	@Resource
	private CloudWorkRecruitmentService cloudWorkRecruitmentService;

	@Resource
	private CloudWorkFactoryService cloudWorkFactoryService;

	@Resource
	private CloudWorkLaborService cloudWorkLaborService;


	/**
	 *
	 * @Description: 我发布的信息栏目页
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("infoColumn.do")
	public ModelAndView infoColumn(HttpServletRequest req, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/b2b/myInfo/infoColumn");
		try {
			String pageIndexStr = req.getParameter("pageIndex");
			String type = req.getParameter("type");
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

			if (StringUtils.isBlank(type)) {
				type="1";
			}

			req.setAttribute("type", type);

			// pageIndex不是数字或为null时，重置为1
			if (!StringUtils.isNumeric(pageIndexStr)) {
				pageIndexStr = "1";
			}
			int pageIndex = Integer.parseInt(pageIndexStr);
			pageIndex = pageIndex == 0 ? 1 : pageIndex;// 默认设置为1

			LocalUser user = null;
			Object userObj = session.getAttribute("user");
			if (userObj != null) {
				user = (LocalUser) userObj;
			}

			if (user == null){
				return mv;
			}

			Map<String, Object> result = new HashMap<>();

			if (type.equals("1")) {
				// 工人信息分页
				result = cloudWorkPersonService.getMyPage(pageIndex, textsearch, user.getUserId());
			}

			if (type.equals("2")) {
				result = cloudWorkRecruitmentService.getMyPage(pageIndex, textsearch, user.getUserId());
			}

			if (type.equals("3")) {
				result = cloudWorkLaborService.getMyPage(pageIndex, textsearch, user.getUserId());
			}

			if (type.equals("4")) {
				result = cloudWorkFactoryService.getMyPage(pageIndex, textsearch, user.getUserId());
			}
			result.put("pageIndex", pageIndex);
			req.setAttribute("pageBean", result);
		} catch (Exception e) {
			String msg = "我发布的信息栏目页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}

		return mv;
	}

	/**
	 *
	 * @Description: 工人信息详细页
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
	 * @Description: 工人信息编辑页
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
			String msg = "工人信息明细页异常：id参数格式异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		} catch (Exception e) {
			String msg = "工人信息明细页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
	}

	/**
	 *
	 * @Description: 工人信息发布页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("infoUpdate.do")
	public ModelAndView personPublish(HttpServletRequest req) {
		ModelAndView mv = null;

		Long id = Long.valueOf(req.getParameter("id"));
		Integer type = Integer.valueOf(req.getParameter("type"));

		if (type == 1) {
			CloudWorkPerson person = cloudWorkPersonService.findBeanById(id);
			req.setAttribute("person", person);
			mv = new ModelAndView("/b2b/myInfo/personUpdate");
		} else if (type == 2) {
			CloudWorkRecruitment recruitment = cloudWorkRecruitmentService.findBeanById(id);
			req.setAttribute("recruitment", recruitment);
			mv = new ModelAndView("/b2b/myInfo/recruitmentUpdate");
		} else  if (type == 3) {
			CloudWorkLabor labor = cloudWorkLaborService.findBeanById(id);
			req.setAttribute("labor", labor);
			mv = new ModelAndView("/b2b/myInfo/laborUpdate");
		} else  if (type == 4) {
			CloudWorkFactory factory = cloudWorkFactoryService.findBeanById(id);
			req.setAttribute("factory", factory);
			mv = new ModelAndView("/b2b/myInfo/factoryUpdate");
		}
		return mv;
	}

	/**
	 *
	 * @Description: 工人信息发布
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("personPublish.json")
	@ResponseBody
	public Map<String,Object> personPublish(@RequestBody CloudWorkPerson person, HttpSession session) {
		Map<String,Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "发布工人信息失败，请稍后再试！");

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
        person.setStatus(1);
        person.setCreateTime(new Date());
        person.setCreateUser(user.getUserId());
        person.setUpdateTime(new Date());
        person.setUpdateUser(user.getUserId());
        int i = cloudWorkPersonService.insert(person);
        if (i == 1) {
            result.put("errCode", Constants.result_success);
            result.put("errMsg", "发布工人信息成功！");

            log.info("发布工人信息成功！personId= " + person.getId());
        }
        return result;
	}


	/**
	 *
	 * @Description: 刷新信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("refreshInfo.json")
	@ResponseBody
	public Map<String,Object> refreshInfo(@RequestBody PageBean bean, HttpSession session){
		Map<String,Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "刷新失败，请稍后再试！");

		Long id = bean.getNeedId();
		Integer type = Integer.valueOf(bean.getQueryType());

		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		if (user == null){
			result.put("errMsg", "未登录");
			return result;
		}

		int i = 0;

		if (type == 1) {
			CloudWorkPerson person = cloudWorkPersonService.findBeanById(id);
			person.setUpdateTime(new Date());
			person.setUpdateUser(user.getUserId());
			i = cloudWorkPersonService.update(person);
		} else if (type == 2) {
			CloudWorkRecruitment recruitment = cloudWorkRecruitmentService.findBeanById(id);
			recruitment.setUpdateTime(new Date());
			recruitment.setUpdateUser(user.getUserId());
			i = cloudWorkRecruitmentService.update(recruitment);
		} else  if (type == 3) {
			CloudWorkLabor labor = cloudWorkLaborService.findBeanById(id);
			labor.setUpdateTime(new Date());
			labor.setUpdateUser(user.getUserId());
			i = cloudWorkLaborService.update(labor);
		} else  if (type == 4) {
			CloudWorkFactory factory = cloudWorkFactoryService.findBeanById(id);
			factory.setUpdateTime(new Date());
			factory.setUpdateUser(user.getUserId());
			i = cloudWorkFactoryService.update(factory);
		}

		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "刷新成功！");
		}
		return result;
	}

}
