package cn.testin.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import cn.testin.bean.CloudWorkPerson;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkPersonService;
import cn.testin.util.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 *<pre>
 * 对象功能:cloud_work_person 工人信息管理 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:02:52
 *</pre>
 */
@Controller
@RequestMapping("/work/")
public class CloudWorkPersonController {

	private static Logger log = Logger.getLogger(CloudWorkPersonController.class);

	@Resource
	private CloudWorkPersonService cloudWorkPersonService;


	/**
	 *
	 * @Description: 查询工人列表
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("personList.do")
	public ModelAndView personList() {
		ModelAndView personList = new ModelAndView("/work/personList");
		return personList;
	}

	/**
	 *
	 * @Description: 工人列表json
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "personList.json", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView personList(@RequestBody CloudWorkPerson person) {
		ModelAndView mav = new ModelAndView();
		List<CloudWorkPerson> personList = cloudWorkPersonService.findList(person);
		mav.addObject("rows", personList);
		mav.addObject("total", cloudWorkPersonService.findListCount(person));
		return mav;
	}

	/**
	 *
	 * @Description: 新增/修改工人信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("personEdit.do")
	public ModelAndView personEdit(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/work/personEdit");
		if(null != id){
			CloudWorkPerson person = cloudWorkPersonService.findBeanById(id);
			mv.addObject("person", person);
		}
		return mv;
	}

	/**
	 *
	 * @Description: 新增/修改工人信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updatePerson.json", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateCloudWorkPerson(@RequestBody CloudWorkPerson person, HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		Long personId = person.getId();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", (personId == null ? "新增" : "修改" ) + "工人信息失败，请稍后再试！");

		if (personId == null) {
			person.setId(RandomUtils.g());
			person.setCreateTime(new Date());

			int i = cloudWorkPersonService.insert(person);
			if (i == 1) {
				mv.addObject("errCode", Constants.result_success);
				mv.addObject("errMsg", "新增工人信息成功！");

				log.info("新增工人信息成功！personId= " + person.getId());
			}
		} else {
			int i = cloudWorkPersonService.update(person);
			if (i == 1) {
				mv.addObject("errCode", Constants.result_success);
				mv.addObject("errMsg", "修改工人信息成功！");

				log.info("修改工人信息成功！personId= " + person.getId());
			}
		}

		return mv;
	}

	/**
	 *
	 * @Description: 删除工人信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("deletePerson.json")
	@ResponseBody
	public ModelAndView deleteCloudWorkPerson(@RequestBody CloudWorkPerson person, HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", "删除工人信息失败，请稍后再试！");
		int i = cloudWorkPersonService.delete(person.getId());
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "删除工人信息成功！");
			log.info("删除工人信息成功！personId=" + person.getId());
		}
		return mv;
	}
}
