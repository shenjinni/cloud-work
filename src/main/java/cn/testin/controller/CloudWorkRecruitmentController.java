package cn.testin.controller;


import javax.annotation.Resource;
import cn.testin.bean.CloudWorkRecruitment;
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
@RequestMapping("/work/")
public class CloudWorkRecruitmentController {
	private static Logger log = Logger.getLogger(CloudWorkRecruitmentController.class);

	@Resource
	private CloudWorkRecruitmentService cloudWorkRecruitmentService;


	/**
	 *
	 * @Description: 查询招工信息列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("recruitmentList.do")
	public ModelAndView recruitmentList() {
		return new ModelAndView("/work/recruitmentList");
	}

	/**
	 *
	 * @Description: 招工信息列表json
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "recruitmentList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> recruitmentList(@RequestBody CloudWorkRecruitment recruitment) {
		Map<String, Object> result = new HashMap<>();

		List<CloudWorkRecruitment> recruitmentList = cloudWorkRecruitmentService.findList(recruitment);
		result.put("rows", recruitmentList);
		result.put("total", cloudWorkRecruitmentService.findListCount(recruitment));
		Map<String, Object> resultq = new HashMap<>();
		resultq.put("model", result);
		return resultq;
	}

	/**
	 *
	 * @Description: 新增/修改招工信息信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("recruitmentEdit.do")
	public ModelAndView recruitmentEdit(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/work/recruitmentEdit");
		if(null != id){
			CloudWorkRecruitment recruitment = cloudWorkRecruitmentService.findBeanById(id);
			mv.addObject("recruitment", recruitment);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 新增/修改招工信息信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updateRecruitment.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateCloudWorkRecruitment(@RequestBody CloudWorkRecruitment recruitment){
		Map<String, Object> result = new HashMap<>();
		Long recruitmentId = recruitment.getId();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", (recruitmentId == null ? "新增" : "修改" ) + "招工信息信息失败，请稍后再试！");

		if (recruitmentId == null) {
			recruitment.setId(RandomUtils.g());
			recruitment.setStatus((short) 1);
			recruitment.setCreateTime(new Date());
			recruitment.setCreateUser(1L);
			recruitment.setUpdateTime(new Date());
			recruitment.setUpdateUser(1L);
			int i = cloudWorkRecruitmentService.insert(recruitment);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "新增招工信息信息成功！");

				log.info("新增招工信息信息成功！recruitmentId= " + recruitment.getId());
			}
		} else {
			recruitment.setUpdateTime(new Date());
			int i = cloudWorkRecruitmentService.update(recruitment);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "修改招工信息信息成功！");

				log.info("修改招工信息信息成功！recruitmentId= " + recruitment.getId());
			}
		}

		return result;
	}

	/**
	 *
	 * @Description: 删除招工信息信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("deleteRecruitment.json")
	@ResponseBody
	public ModelAndView deleteCloudWorkRecruitment(@RequestBody CloudWorkRecruitment recruitment){
		ModelAndView mv = new ModelAndView();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", "删除招工信息信息失败，请稍后再试！");
		int i = cloudWorkRecruitmentService.delete(recruitment.getId());
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "删除招工信息信息成功！");
			log.info("删除招工信息信息成功！recruitmentId=" + recruitment.getId());
		}
		return mv;
	}
	
}
