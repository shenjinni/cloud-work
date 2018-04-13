package cn.testin.controller;


import javax.annotation.Resource;
import cn.testin.bean.CloudWorkFactory;
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
@RequestMapping("/work/")
public class CloudWorkFactoryController {

	private static Logger log = Logger.getLogger(CloudWorkFactoryController.class);

	@Resource
	private CloudWorkFactoryService cloudWorkFactoryService;


	/**
	 *
	 * @Description: 查询加工厂列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("factoryList.do")
	public ModelAndView factoryList() {
		return new ModelAndView("/work/factoryList");
	}

	/**
	 *
	 * @Description: 加工厂列表json
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "factoryList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> factoryList(@RequestBody CloudWorkFactory factory) {
		Map<String, Object> result = new HashMap<>();

		List<CloudWorkFactory> factoryList = cloudWorkFactoryService.findList(factory);
		result.put("rows", factoryList);
		result.put("total", cloudWorkFactoryService.findListCount(factory));
		Map<String, Object> resultq = new HashMap<>();
		resultq.put("model", result);
		return resultq;
	}

	/**
	 *
	 * @Description: 新增/修改加工厂信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("factoryEdit.do")
	public ModelAndView factoryEdit(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/work/factoryEdit");
		if(null != id){
			CloudWorkFactory factory = cloudWorkFactoryService.findBeanById(id);
			mv.addObject("factory", factory);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 新增/修改加工厂信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updateFactory.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateCloudWorkFactory(@RequestBody CloudWorkFactory factory){
		Map<String, Object> result = new HashMap<>();
		Long factoryId = factory.getId();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", (factoryId == null ? "新增" : "修改" ) + "加工厂信息失败，请稍后再试！");

		if (factoryId == null) {
			factory.setId(RandomUtils.g());
			factory.setStatus(1);
			factory.setCreateTime(new Date());
			factory.setCreateUser(1L);
			factory.setUpdateTime(new Date());
			factory.setUpdateUser(1L);
			int i = cloudWorkFactoryService.insert(factory);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "新增加工厂信息成功！");

				log.info("新增加工厂信息成功！factoryId= " + factory.getId());
			}
		} else {
			factory.setUpdateTime(new Date());
			int i = cloudWorkFactoryService.update(factory);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "修改加工厂信息成功！");

				log.info("修改加工厂信息成功！factoryId= " + factory.getId());
			}
		}

		return result;
	}

	/**
	 *
	 * @Description: 删除加工厂信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("deleteFactory.json")
	@ResponseBody
	public ModelAndView deleteCloudWorkFactory(@RequestBody CloudWorkFactory factory){
		ModelAndView mv = new ModelAndView();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", "删除加工厂信息失败，请稍后再试！");
		int i = cloudWorkFactoryService.delete(factory.getId());
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "删除加工厂信息成功！");
			log.info("删除加工厂信息成功！factoryId=" + factory.getId());
		}
		return mv;
	}


}
