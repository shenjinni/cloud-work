package cn.testin.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import cn.testin.bean.CloudWorkFactory;
import cn.testin.bean.LocalUser;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkFactoryService;
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
 * 对象功能:cloud_work_factory 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:02:26
 *</pre>
 */
@Controller
@RequestMapping("/admin/factory/")
public class AdminFactoryController {

	private static Logger log = Logger.getLogger(AdminFactoryController.class);

	@Resource
	private CloudWorkFactoryService cloudWorkFactoryService;


	/**
	 *
	 * @Description: 查询设计工作室列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("factoryList.do")
	public ModelAndView factoryList() {
		return new ModelAndView("/admin/factory/factoryList");
	}

	/**
	 *
	 * @Description: 设计工作室列表json
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "factoryList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> factoryList(@RequestBody CloudWorkFactory factory) {
		Map<String, Object> result = new HashMap<String, Object>();

		List<CloudWorkFactory> factoryList = cloudWorkFactoryService.findList(factory);
		result.put("rows", factoryList);
		result.put("total", cloudWorkFactoryService.findListCount(factory));
		Map<String, Object> resultq = new HashMap<String, Object>();
		resultq.put("model", result);
		return resultq;
	}

	/**
	 *
	 * @Description: 新增/修改设计工作室信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("factoryEdit.do")
	public ModelAndView factoryEdit(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/admin/factory/factoryEdit");
		if(null != id){
			CloudWorkFactory factory = cloudWorkFactoryService.findBeanById(id);
			mv.addObject("factory", factory);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 新增/修改设计工作室信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updateFactory.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateCloudWorkFactory(@RequestBody CloudWorkFactory factory, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		Long factoryId = factory.getId();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", (factoryId == null ? "新增" : "修改" ) + "设计工作室信息失败，请稍后再试！");
		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		if (user == null){
			result.put("errMsg", "未登录");
			return result;
		}
		if (factoryId == null) {
			factory.setId(RandomUtils.g());
			factory.setStatus(1);
			factory.setCreateTime(new Date());
			factory.setCreateUser(user.getUserId());
			factory.setUpdateTime(new Date());
			factory.setUpdateUser(user.getUserId());
			int i = cloudWorkFactoryService.insert(factory);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "新增设计工作室信息成功！");

				log.info("新增设计工作室信息成功！factoryId= " + factory.getId());
			}
		} else {
			factory.setUpdateTime(new Date());
			factory.setUpdateUser(user.getUserId());
			int i = cloudWorkFactoryService.update(factory);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "修改设计工作室信息成功！");

				log.info("修改设计工作室信息成功！factoryId= " + factory.getId());
			}
		}

		return result;
	}

	/**
	 *
	 * @Description: 设计工作室信息详情
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("factoryGet.do")
	public ModelAndView factoryGet(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/admin/factory/factoryGet");
		if(null != id){
			CloudWorkFactory factory = cloudWorkFactoryService.findBeanById(id);
			mv.addObject("factory", factory);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 修改设计工作室信息状态
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "changeStatus.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changeStatus(@RequestBody CloudWorkFactory factory, HttpSession session){
		Map<String, Object> result = new HashMap<>();
		Long factoryId = factory.getId();
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
		Integer status = factory.getStatus();
		if (status == null) {
			log.info("修改设计工作室信息状态，获取状态值失败！ factoryId" + factoryId);
			return result;
		}

		factory = cloudWorkFactoryService.findBeanById(factoryId);
		if (factory == null) {
			log.info("修改设计工作室信息状态！获取信息失败！factoryId=" + factoryId);
			return result;
		}

		factory.setStatus(status);
		factory.setUpdateTime(new Date());
		factory.setUpdateUser(user.getUserId());
		int i = cloudWorkFactoryService.update(factory);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "操作成功！");
			log.info("修改设计工作室信息状态成功！factoryId=" + factoryId + ", status = " + status);
		}
		return result;
	}

	/**
	 *
	 * @Description: 删除设计工作室信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("deleteFactory.json")
	@ResponseBody
	public ModelAndView deleteCloudWorkFactory(@RequestBody CloudWorkFactory factory){
		ModelAndView mv = new ModelAndView();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", "删除设计工作室信息失败，请稍后再试！");
		int i = cloudWorkFactoryService.delete(factory.getId());
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "删除设计工作室信息成功！");
			log.info("删除设计工作室信息成功！factoryId=" + factory.getId());
		}
		return mv;
	}


}
