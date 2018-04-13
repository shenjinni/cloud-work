package cn.testin.controller;

import cn.testin.bean.CloudWorkLabor;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkLaborService;
import cn.testin.util.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
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
@RequestMapping("/work/")
public class CloudWorkLaborController {

	private static Logger log = Logger.getLogger(CloudWorkLaborController.class);

	@Resource
	private CloudWorkLaborService cloudWorkLaborService;


	/**
	 *
	 * @Description: 查询加工活列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("laborList.do")
	public ModelAndView laborList() {
		return new ModelAndView("/work/laborList");
	}

	/**
	 *
	 * @Description: 加工活列表json
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "laborList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> laborList(@RequestBody CloudWorkLabor labor) {
		Map<String, Object> result = new HashMap<>();

		List<CloudWorkLabor> laborList = cloudWorkLaborService.findList(labor);
		result.put("rows", laborList);
		result.put("total", cloudWorkLaborService.findListCount(labor));
		Map<String, Object> resultq = new HashMap<>();
		resultq.put("model", result);
		return resultq;
	}

	/**
	 *
	 * @Description: 新增/修改加工活信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("laborEdit.do")
	public ModelAndView laborEdit(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/work/laborEdit");
		if(null != id){
			CloudWorkLabor labor = cloudWorkLaborService.findBeanById(id);
			mv.addObject("labor", labor);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 新增/修改加工活信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updateLabor.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateCloudWorkLabor(@RequestBody CloudWorkLabor labor){
		Map<String, Object> result = new HashMap<>();
		Long laborId = labor.getId();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", (laborId == null ? "新增" : "修改" ) + "加工活信息失败，请稍后再试！");

		if (laborId == null) {
			labor.setId(RandomUtils.g());
			labor.setStatus(1);
			labor.setCreateTime(new Date());
			labor.setCreateUser(1L);
			labor.setUpdateTime(new Date());
			labor.setUpdateUser(1L);
			int i = cloudWorkLaborService.insert(labor);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "新增加工活信息成功！");

				log.info("新增加工活信息成功！laborId= " + labor.getId());
			}
		} else {
			labor.setUpdateTime(new Date());
			int i = cloudWorkLaborService.update(labor);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "修改加工活信息成功！");

				log.info("修改加工活信息成功！laborId= " + labor.getId());
			}
		}

		return result;
	}

	/**
	 *
	 * @Description: 删除加工活信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("deleteLabor.json")
	@ResponseBody
	public ModelAndView deleteCloudWorkLabor(@RequestBody CloudWorkLabor labor){
		ModelAndView mv = new ModelAndView();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", "删除加工活信息失败，请稍后再试！");
		int i = cloudWorkLaborService.delete(labor.getId());
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "删除加工活信息成功！");
			log.info("删除加工活信息成功！laborId=" + labor.getId());
		}
		return mv;
	}
}
