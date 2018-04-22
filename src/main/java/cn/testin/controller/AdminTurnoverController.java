package cn.testin.controller;


import cn.testin.bean.CloudWorkTurnover;
import cn.testin.bean.CloudWorkVip;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkTurnoverService;
import cn.testin.service.CloudWorkVipService;
import cn.testin.util.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *<pre>
 * 对象功能:cloud_work_turnover turnover充值信息管理 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-13 14:02:52
 *</pre>
 */
@Controller
@RequestMapping("/admin/turnover/")
public class AdminTurnoverController {

	private static Logger log = Logger.getLogger(AdminTurnoverController.class);

	@Resource
	private CloudWorkTurnoverService cloudWorkTurnoverService;

	@Resource
	private CloudWorkVipService cloudWorkVipService;
	/**
	 *
	 * @Description: 查询turnover充值列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("turnoverList.do")
	public ModelAndView turnoverList() {
		return new ModelAndView("/admin/turnover/turnoverList");
	}

	/**
	 *
	 * @Description: turnover充值列表json
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "turnoverList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> turnoverList(@RequestBody CloudWorkTurnover turnover) {
		Map<String, Object> result = new HashMap<>();

		List<CloudWorkTurnover> turnoverList = cloudWorkTurnoverService.findList(turnover);
		result.put("rows", turnoverList);
		result.put("total", cloudWorkTurnoverService.findListCount(turnover));
		Map<String, Object> resultq = new HashMap<>();
		resultq.put("model", result);
		return resultq;
	}

	/**
	 *
	 * @Description: 查询turnover充值列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("turnoverEdit.do")
	public ModelAndView turnoverEdit(@RequestParam(value="workType",required=true) Integer workType,
									 @RequestParam(value="workId",required=true) String workId,
									 @RequestParam(value="workName",required=true) String workName,
									 HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/admin/turnover/turnoverEdit");
		mv.addObject("workId", workId);
		mv.addObject("workType", workType);

		String str=request.getParameter("workName");
		try {
			byte[] bytes= str.getBytes("ISO-8859-1");
			String name = new String(bytes,"utf-8");
			mv.addObject("workName", name);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}


		return mv;
	}


	/**
	 *
	 * @Description: 新增turnover充值信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "addVip.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addVip(@RequestBody CloudWorkTurnover turnover){
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "新增turnover充值信息失败，请稍后再试！");

		turnover.setId(RandomUtils.g());
		turnover.setCreateTime(new Date());
		turnover.setCreateUser(1L);
		int i = cloudWorkTurnoverService.insert(turnover);
		if (i != 1) {
			return result;
		}

		// 获取vip信息，没有则新增
		CloudWorkVip vip = new CloudWorkVip();
		vip.setWorkId(turnover.getWorkId());
		vip.setWorkType(turnover.getWorkType());
		int j;
		CloudWorkVip vipOld = cloudWorkVipService.findBeanByWork(vip);
		if (vipOld == null) {
			vip.setId(RandomUtils.g());
			vip.setWeights(turnover.getWeights());
			vip.setValidityTime(turnover.getValidityTime());
			vip.setCreateTime(new Date());
			vip.setCreateUser(1L);
			vip.setUpdateTime(new Date());
			vip.setUpdateUser(1L);
			j = cloudWorkVipService.insert(vip);
		} else {
			vipOld.setWeights(turnover.getWeights());
			vipOld.setValidityTime(turnover.getValidityTime());
			vipOld.setUpdateTime(new Date());
			vipOld.setUpdateUser(1L);
			j = cloudWorkVipService.update(vipOld);
		}

		if (j == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "新增turnover充值信息成功！");

			log.info("新增turnover充值信息成功！turnoverId= " + turnover.getId());
		}


		return result;
	}
}
