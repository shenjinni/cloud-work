package cn.testin.controller;

import cn.testin.bean.CloudWorkLabor;
import cn.testin.bean.LocalUser;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkLaborService;
import cn.testin.util.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *<pre>
 * 对象功能:cloud_work_labor 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:03:17
 *</pre>
 */
@Controller
@RequestMapping("/admin/labor/")
public class AdminLaborController {

	private static Logger log = Logger.getLogger(AdminLaborController.class);

	@Resource
	private CloudWorkLaborService cloudWorkLaborService;


	/**
	 *
	 * @Description: 查询设计项目列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("laborList.do")
	public ModelAndView laborList() {
		return new ModelAndView("/admin/labor/laborList");
	}

	/**
	 *
	 * @Description: 设计项目列表json
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "laborList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> laborList(@RequestBody CloudWorkLabor labor) {
		HashMap<String, Object> result = new HashMap<String, Object>();

		List<CloudWorkLabor> laborList = cloudWorkLaborService.findList(labor);
		result.put("rows", laborList);
		result.put("total", cloudWorkLaborService.findListCount(labor));
		Map<String, Object> resultq = new HashMap<String, Object>();
		resultq.put("model", result);
		return resultq;
	}

	/**
	 *
	 * @Description: 新增/修改设计项目信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("laborEdit.do")
	public ModelAndView laborEdit(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/admin/labor/laborEdit");
		if(null != id){
			CloudWorkLabor labor = cloudWorkLaborService.findBeanById(id);
			mv.addObject("labor", labor);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 新增/修改设计项目信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updateLabor.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateCloudWorkLabor(@RequestBody CloudWorkLabor labor, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		Long laborId = labor.getId();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", (laborId == null ? "新增" : "修改" ) + "设计项目信息失败，请稍后再试！");
		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		if (user == null){
			result.put("errMsg", "未登录");
			return result;
		}
		if (laborId == null) {
			labor.setId(RandomUtils.g());
			labor.setStatus(1);
			labor.setCreateTime(new Date());
			labor.setCreateUser(user.getUserId());
			labor.setUpdateTime(new Date());
			labor.setUpdateUser(user.getUserId());
			int i = cloudWorkLaborService.insert(labor);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "新增设计项目信息成功！");

				log.info("新增设计项目信息成功！laborId= " + labor.getId());
			}
		} else {
			labor.setUpdateTime(new Date());
			labor.setUpdateUser(user.getUserId());
			int i = cloudWorkLaborService.update(labor);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "修改设计项目信息成功！");

				log.info("修改设计项目信息成功！laborId= " + labor.getId());
			}
		}

		return result;
	}

	/**
	 *
	 * @Description: 设计项目信息详情
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("laborGet.do")
	public ModelAndView laborGet(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/admin/labor/laborGet");
		if(null != id){
			CloudWorkLabor labor = cloudWorkLaborService.findBeanById(id);
			mv.addObject("labor", labor);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 修改设计项目信息状态
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "changeStatus.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changeStatus(@RequestBody CloudWorkLabor labor, HttpSession session){
		Map<String, Object> result = new HashMap<>();
		Long laborId = labor.getId();
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
		Integer status = labor.getStatus();
		if (status == null) {
			log.info("修改设计项目信息状态，获取状态值失败！ laborId" + laborId);
			return result;
		}

		labor = cloudWorkLaborService.findBeanById(laborId);
		if (labor == null) {
			log.info("修改设计项目信息状态！获取信息失败！laborId=" + laborId);
			return result;
		}

		labor.setStatus(status);
		labor.setUpdateTime(new Date());
		labor.setUpdateUser(user.getUserId());
		int i = cloudWorkLaborService.update(labor);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "操作成功！");
			log.info("修改设计项目信息状态成功！laborId=" + laborId + ", status = " + status);
		}
		return result;
	}

	/**
	 *
	 * @Description: 删除设计项目信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("deleteLabor.json")
	@ResponseBody
	public ModelAndView deleteCloudWorkLabor(@RequestBody CloudWorkLabor labor){
		ModelAndView mv = new ModelAndView();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", "删除设计项目信息失败，请稍后再试！");
		int i = cloudWorkLaborService.delete(labor.getId());
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "删除设计项目信息成功！");
			log.info("删除设计项目信息成功！laborId=" + labor.getId());
		}
		return mv;
	}
}
