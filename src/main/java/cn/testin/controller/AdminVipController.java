package cn.testin.controller;


import cn.testin.bean.CloudWorkVip;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkVipService;
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
 * 对象功能:cloud_work_vip vip充值信息管理 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-13 14:02:52
 *</pre>
 */
@Controller
@RequestMapping("/admin/vip/")
public class AdminVipController {

	private static Logger log = Logger.getLogger(AdminVipController.class);

	@Resource
	private CloudWorkVipService cloudWorkVipService;


	/**
	 *
	 * @Description: 查询vip充值列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("vipList.do")
	public ModelAndView vipList() {
		return new ModelAndView("/admin/vip/vipList");
	}

	/**
	 *
	 * @Description: vip充值列表json
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "vipList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> vipList(@RequestBody CloudWorkVip vip) {
		Map<String, Object> result = new HashMap<>();

		List<CloudWorkVip> vipList = cloudWorkVipService.findList(vip);
		result.put("rows", vipList);
		result.put("total", cloudWorkVipService.findListCount(vip));
		Map<String, Object> resultq = new HashMap<>();
		resultq.put("model", result);
		return resultq;
	}

	/**
	 *
	 * @Description: 新增vip充值信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "addVip.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addVip(@RequestBody CloudWorkVip vip){
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "新增vip充值信息失败，请稍后再试！");

		vip.setId(RandomUtils.g());
		vip.setCreateTime(new Date());
		vip.setCreateUser(1L);
		int i = cloudWorkVipService.insert(vip);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "新增vip充值信息成功！");

			log.info("新增vip充值信息成功！vipId= " + vip.getId());
		}

		return result;
	}
}
