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
 * 对象功能:我的发布信息页面controller
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
	 * @Description: 我的发布信息栏目页
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
				// 设计师信息分页
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
			String msg = "我的发布信息栏目页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}

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
	 * @Description: 设计师信息发布页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("infoUpdate.do")
	public ModelAndView infoUpdate(HttpServletRequest req) {
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

	/**
	 *
	 * @Description: 设计师信息发布
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("personPublish.json")
	@ResponseBody
	public Map<String,Object> personPublish(@RequestBody CloudWorkPerson person) {
		Map<String,Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "发布设计师信息失败，请稍后再试！");

		CloudWorkPerson personOld = cloudWorkPersonService.findBeanById(person.getId());
		personOld.setWorkIntent(person.getWorkIntent());
		personOld.setSalary(person.getSalary());
		personOld.setContactsName(person.getContactsName());
		personOld.setMobile(person.getMobile());
		personOld.setAge(person.getAge());
		personOld.setZodiac(person.getZodiac());
		personOld.setSex(person.getSex());
		personOld.setAddress(person.getAddress());
		personOld.setNote(person.getNote());
		personOld.setStatus(-1);
		personOld.setUpdateTime(new Date());
		int i = cloudWorkPersonService.update(personOld);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "修改设计师信息成功！");

			log.info("修改设计师信息成功！personId= " + person.getId());
		}
		return result;
	}

	/**
	 *
	 * @Description: 发布设计岗位信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "recruitmentPublish.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> recruitmentPublish(@RequestBody CloudWorkRecruitment recruitment){
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "发布设计岗位信息信息失败，请稍后再试！");
		CloudWorkRecruitment recruitmentOld = cloudWorkRecruitmentService.findBeanById(recruitment.getId());

		recruitmentOld.setWorkType(recruitment.getWorkType());
		recruitmentOld.setSalary(recruitment.getSalary());
		recruitmentOld.setCompany(recruitment.getCompany());
		recruitmentOld.setAddress(recruitment.getAddress());
		recruitmentOld.setContactsName(recruitment.getContactsName());
		recruitmentOld.setMobile(recruitment.getMobile());
		recruitmentOld.setNote(recruitment.getNote());
		recruitmentOld.setStatus(-1);
		recruitmentOld.setUpdateTime(new Date());
		int i = cloudWorkRecruitmentService.update(recruitmentOld);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "修改设计岗位信息信息成功！");

			log.info("修改设计岗位信息信息成功！recruitmentId= " + recruitment.getId());
		}

		return result;
	}

	/**
	 *
	 * @Description: 发布设计项目信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "laborPublish.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> laborPublish(@RequestBody CloudWorkLabor labor){
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "发布设计项目信息失败，请稍后再试！");

		CloudWorkLabor laborOld = cloudWorkLaborService.findBeanById(labor.getId());
		laborOld.setWorkNeed(labor.getWorkNeed());
		laborOld.setContactsName(labor.getContactsName());
		laborOld.setMobile(labor.getMobile());
		laborOld.setAddress(labor.getAddress());
		laborOld.setFactoryName(labor.getFactoryName());
		laborOld.setNumber(labor.getNumber());
		laborOld.setNote(labor.getNote());
		laborOld.setStatus(-1);
		laborOld.setUpdateTime(new Date());
		int i = cloudWorkLaborService.update(laborOld);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "修改设计项目信息成功！");

			log.info("修改设计项目信息成功！laborId= " + labor.getId());
		}

		return result;
	}

	/**
	 *
	 * @Description: 发布设计工作室信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "factoryPublish.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> factoryPublish(@RequestBody CloudWorkFactory factory){
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "发布设计工作室信息失败，请稍后再试！");

		CloudWorkFactory factoryOld = cloudWorkFactoryService.findBeanById(factory.getId());

		factoryOld.setWorkNeed(factory.getWorkNeed());
		factoryOld.setContactsName(factory.getContactsName());
		factoryOld.setMobile(factory.getMobile());
		factoryOld.setAddress(factory.getAddress());
		factoryOld.setScale(factory.getScale());
		factoryOld.setNote(factory.getNote());
		factoryOld.setStatus(-1);
		factoryOld.setUpdateTime(new Date());
		int i = cloudWorkFactoryService.update(factoryOld);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "修改设计工作室信息成功！");

			log.info("修改设计工作室信息成功！factoryId= " + factory.getId());
		}

		return result;
	}


}
