package cn.testin.controller;

import cn.testin.bean.CloudWorkPerson;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkPersonService;
import cn.testin.util.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *<pre>
 * 对象功能:前台工人信息页面controller
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-12 14:03:17
 *</pre>
 */
@Controller
@RequestMapping("/b2b/")
public class B2bPersonController {

	private static Logger log = Logger.getLogger(B2bPersonController.class);

	@Resource
	private CloudWorkPersonService cloudWorkPersonService;


	/**
	 *
	 * @Description: 工人信息栏目页
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("personColumn.do")
	public ModelAndView personColumn(HttpServletRequest req) throws Exception {
		try {
			String pageIndexStr = req.getParameter("pageIndex");
			String text = req.getParameter("text");
			// pageIndex不是数字或为null时，重置为1
			if (!StringUtils.isNumeric(pageIndexStr)) {
				pageIndexStr = "1";
			}
			int pageIndex = Integer.parseInt(pageIndexStr);

			req.setAttribute("text", text);
			// 获取总数
			req.setAttribute("count", 2);
			// 工人信息分页
			pageIndex = pageIndex == 0 ? 1 : pageIndex;// 默认设置为1
			Map<String, Object> result = cloudWorkPersonService.getPage(pageIndex, text);
			result.put("pageIndex", pageIndex);
			req.setAttribute("pageBean", result);
		} catch (Exception e) {
			String msg = "工人信息栏目页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
		ModelAndView mv = new ModelAndView("/b2b/personColumn");
		return mv;
	}

	/**
	 *
	 * @Description: 工人信息详细页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("personDetail.do")
	public ModelAndView personDetail(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");
		if (StringUtils.isBlank(idStr)) {
			return new ModelAndView("redirect:/common/404.jsp");
		}

		CloudWorkPerson person = cloudWorkPersonService.findBeanById(Long.parseLong(idStr));
		if (person == null) {
			return new ModelAndView("redirect:/common/404.jsp");
		} else {
			req.setAttribute("person", person);
			return new ModelAndView("b2b/personDetail");
		}

	}

	/**
	 *
	 * @Description: 工人信息编辑页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("personUpdate.do")
	public ModelAndView personUpdate(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");

		CloudWorkPerson person = null;
		try {
			person = cloudWorkPersonService.findBeanById(Long.parseLong(idStr));

			if (person == null) {
				return new ModelAndView("redirect:/common/404.jsp");
			} else {
				req.setAttribute("person", person);
				return new ModelAndView("/b2b/personUpdate");
			}
		} catch (NumberFormatException e) {
			String msg = "工人信息明细页异常：id参数格式异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		} catch (Exception e) {
			String msg = "工人信息明细页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
	}

	/**
	 *
	 * @Description: 工人信息发布页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("personPublish.do")
	public ModelAndView personPublish() {
		return new ModelAndView("/b2b/personPublish");
	}

	/**
	 *
	 * @Description: 工人信息发布
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("personPublish.json")
	@ResponseBody
	public Map<String,Object> personPublish(@RequestBody CloudWorkPerson person) {
		Map<String,Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "发布工人信息失败，请稍后再试！");

        person.setId(RandomUtils.g());
        person.setStatus(1);
        person.setCreateTime(new Date());
        person.setCreateUser(1L);
        person.setUpdateTime(new Date());
        person.setUpdateUser(1L);
        int i = cloudWorkPersonService.insert(person);
        if (i == 1) {
            result.put("errCode", Constants.result_success);
            result.put("errMsg", "发布工人信息成功！");

            log.info("发布工人信息成功！personId= " + person.getId());
        }
        return result;
	}


}
