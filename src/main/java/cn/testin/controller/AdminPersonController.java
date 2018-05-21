package cn.testin.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import cn.testin.bean.CloudWorkPerson;
import cn.testin.bean.LocalUser;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkPersonService;
import cn.testin.util.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *<pre>
 * 对象功能:cloud_work_person 设计师信息管理 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:02:52
 *</pre>
 */
@Controller
@RequestMapping("/admin/person/")
public class AdminPersonController {

	private static Logger log = Logger.getLogger(AdminPersonController.class);

	@Resource
	private CloudWorkPersonService cloudWorkPersonService;


	/**
	 *
	 * @Description: 查询设计师列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("personList.do")
	public ModelAndView personList() {
		return new ModelAndView("/admin/person/personList");
	}

	/**
	 *
	 * @Description: 设计师列表json
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "personList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> personList(@RequestBody CloudWorkPerson person) {
		Map<String, Object> result = new HashMap<String, Object>();

		List<CloudWorkPerson> personList = cloudWorkPersonService.findList(person);
		result.put("rows", personList);
		result.put("total", cloudWorkPersonService.findListCount(person));
		Map<String, Object> resultq = new HashMap<String, Object>();
		resultq.put("model", result);
		return resultq;
	}

	/**
	 *
	 * @Description: 新增/修改设计师信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("personEdit.do")
	public ModelAndView personEdit(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/admin/person/personEdit");
		if(null != id){
			CloudWorkPerson person = cloudWorkPersonService.findBeanById(id);
			mv.addObject("person", person);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 新增/修改设计师信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updatePerson.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateCloudWorkPerson(@RequestBody CloudWorkPerson person, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		Long personId = person.getId();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", (personId == null ? "新增" : "修改" ) + "设计师信息失败，请稍后再试！");
		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		if (user == null){
			result.put("errMsg", "未登录");
			return result;
		}
		if (personId == null) {
			person.setId(RandomUtils.g());
			person.setStatus(1);
			person.setCreateTime(new Date());
			person.setCreateUser(user.getUserId());
			person.setUpdateTime(new Date());
			person.setUpdateUser(user.getUserId());
			int i = cloudWorkPersonService.insert(person);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "新增设计师信息成功！");

				log.info("新增设计师信息成功！personId= " + person.getId());
			}
		} else {
			person.setUpdateTime(new Date());
			person.setUpdateUser(user.getUserId());
			int i = cloudWorkPersonService.update(person);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "修改设计师信息成功！");

				log.info("修改设计师信息成功！personId= " + person.getId());
			}
		}

		return result;
	}

	/**
	 *
	 * @Description: 设计师信息详情
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("personGet.do")
	public ModelAndView personGet(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/admin/person/personGet");
		if(null != id){
			CloudWorkPerson person = cloudWorkPersonService.findBeanById(id);
			mv.addObject("person", person);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 修改设计师信息状态
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "changeStatus.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changeStatus(@RequestBody CloudWorkPerson person, HttpSession session){
		Map<String, Object> result = new HashMap<>();
		Long personId = person.getId();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "操作失败，请稍后再试！");
		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		if (user == null){
			result.put("errMsg", "未登录");
			return result;
		}
		Integer status = person.getStatus();
		if (status == null) {
			log.info("修改设计师信息状态，获取状态值失败！ personId" + personId);
			return result;
		}

		person = cloudWorkPersonService.findBeanById(personId);
		if (person == null) {
			log.info("修改设计师信息状态！获取信息失败！personId=" + personId);
			return result;
		}

		person.setStatus(status);
		person.setUpdateTime(new Date());
		person.setUpdateUser(user.getUserId());
		int i = cloudWorkPersonService.update(person);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "操作成功！");
			log.info("修改设计师信息状态成功！personId=" + personId + ", status = " + status);
		}
		return result;
	}

	/**
	 *
	 * @Description: 删除设计师信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("deletePerson.json")
	@ResponseBody
	public ModelAndView deleteCloudWorkPerson(@RequestBody CloudWorkPerson person){
		ModelAndView mv = new ModelAndView();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", "删除设计师信息失败，请稍后再试！");
		int i = cloudWorkPersonService.delete(person.getId());
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "删除设计师信息成功！");
			log.info("删除设计师信息成功！personId=" + person.getId());
		}
		return mv;
	}
}
