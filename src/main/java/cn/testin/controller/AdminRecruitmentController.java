package cn.testin.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import cn.testin.bean.CloudWorkRecruitment;
import cn.testin.bean.LocalUser;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkRecruitmentService;
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
 * 对象功能:cloud_work_recruitment 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:01:52
 *</pre>
 */
@Controller
@RequestMapping("/admin/recruitment/")
public class AdminRecruitmentController {
	private static Logger log = Logger.getLogger(AdminRecruitmentController.class);

	@Resource
	private CloudWorkRecruitmentService cloudWorkRecruitmentService;


	/**
	 *
	 * @Description: 查询设计岗位信息列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("recruitmentList.do")
	public ModelAndView recruitmentList() {
		return new ModelAndView("/admin/recruitment/recruitmentList");
	}

	/**
	 *
	 * @Description: 设计岗位信息列表json
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "recruitmentList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> recruitmentList(@RequestBody CloudWorkRecruitment recruitment) {
		Map<String, Object> result = new HashMap<String, Object>();

		List<CloudWorkRecruitment> recruitmentList = cloudWorkRecruitmentService.findList(recruitment);
		result.put("rows", recruitmentList);
		result.put("total", cloudWorkRecruitmentService.findListCount(recruitment));
		Map<String, Object> resultq = new HashMap<String, Object>();
		resultq.put("model", result);
		return resultq;
	}

	/**
	 *
	 * @Description: 新增/修改设计岗位信息信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("recruitmentEdit.do")
	public ModelAndView recruitmentEdit(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/admin/recruitment/recruitmentEdit");
		if(null != id){
			CloudWorkRecruitment recruitment = cloudWorkRecruitmentService.findBeanById(id);
			mv.addObject("recruitment", recruitment);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 新增/修改设计岗位信息信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updateRecruitment.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateCloudWorkRecruitment(@RequestBody CloudWorkRecruitment recruitment, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		Long recruitmentId = recruitment.getId();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", (recruitmentId == null ? "新增" : "修改" ) + "设计岗位信息信息失败，请稍后再试！");
		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		if (user == null){
			result.put("errMsg", "未登录");
			return result;
		}
		if (recruitmentId == null) {
			recruitment.setId(RandomUtils.g());
			recruitment.setStatus(1);
			recruitment.setCreateTime(new Date());
			recruitment.setCreateUser(user.getUserId());
			recruitment.setUpdateTime(new Date());
			recruitment.setUpdateUser(user.getUserId());
			int i = cloudWorkRecruitmentService.insert(recruitment);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "新增设计岗位信息信息成功！");

				log.info("新增设计岗位信息信息成功！recruitmentId= " + recruitment.getId());
			}
		} else {
			recruitment.setUpdateTime(new Date());
			recruitment.setUpdateUser(user.getUserId());
			int i = cloudWorkRecruitmentService.update(recruitment);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "修改设计岗位信息信息成功！");

				log.info("修改设计岗位信息信息成功！recruitmentId= " + recruitment.getId());
			}
		}

		return result;
	}

	/**
	 *
	 * @Description: 设计岗位信息详情
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("recruitmentGet.do")
	public ModelAndView recruitmentGet(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/admin/recruitment/recruitmentGet");
		if(null != id){
			CloudWorkRecruitment recruitment = cloudWorkRecruitmentService.findBeanById(id);
			mv.addObject("recruitment", recruitment);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 修改设计岗位信息状态
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "changeStatus.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changeStatus(@RequestBody CloudWorkRecruitment recruitment, HttpSession session){
		Map<String, Object> result = new HashMap<>();
		Long recruitmentId = recruitment.getId();
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
		Integer status = recruitment.getStatus();
		if (status == null) {
			log.info("修改设计岗位信息状态，获取状态值失败！ recruitmentId" + recruitmentId);
			return result;
		}

		recruitment = cloudWorkRecruitmentService.findBeanById(recruitmentId);
		if (recruitment == null) {
			log.info("修改设计岗位信息状态！获取信息失败！recruitmentId=" + recruitmentId);
			return result;
		}

		recruitment.setStatus(status);
		recruitment.setUpdateTime(new Date());
		recruitment.setUpdateUser(user.getUserId());
		int i = cloudWorkRecruitmentService.update(recruitment);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "操作成功！");
			log.info("修改设计岗位信息状态成功！recruitmentId=" + recruitmentId + ", status = " + status);
		}
		return result;
	}

	/**
	 *
	 * @Description: 删除设计岗位信息信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("deleteRecruitment.json")
	@ResponseBody
	public ModelAndView deleteCloudWorkRecruitment(@RequestBody CloudWorkRecruitment recruitment){
		ModelAndView mv = new ModelAndView();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", "删除设计岗位信息信息失败，请稍后再试！");
		int i = cloudWorkRecruitmentService.delete(recruitment.getId());
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "删除设计岗位信息信息成功！");
			log.info("删除设计岗位信息信息成功！recruitmentId=" + recruitment.getId());
		}
		return mv;
	}
	
}
