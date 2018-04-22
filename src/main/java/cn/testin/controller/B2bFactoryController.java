package cn.testin.controller;

import cn.testin.bean.CloudWorkFactory;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkFactoryService;
import cn.testin.util.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *<pre>
 * 对象功能:前台加工厂信息页面controller
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-12 14:03:17
 *</pre>
 */
@Controller
@RequestMapping("/b2b/")
public class B2bFactoryController {

	private static Logger log = Logger.getLogger(B2bFactoryController.class);

	@Resource
	private CloudWorkFactoryService cloudWorkFactoryService;


	/**
	 *
	 * @Description: 加工厂信息栏目页
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("factoryColumn.do")
	public ModelAndView factoryColumn(HttpServletRequest req) throws Exception {
		try {
			String pageIndexStr = req.getParameter("pageIndex");
			String text = req.getParameter("text");
			String textsearch = "";
			if (StringUtils.isNotBlank(text)) {
				try {
					byte[] bytes= text.getBytes("ISO-8859-1");
					textsearch = new String(bytes,"utf-8");
					req.setAttribute("text", textsearch);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			// pageIndex不是数字或为null时，重置为1
			if (!StringUtils.isNumeric(pageIndexStr)) {
				pageIndexStr = "1";
			}
			int pageIndex = Integer.parseInt(pageIndexStr);

			// 加工厂信息分页
			pageIndex = pageIndex == 0 ? 1 : pageIndex;// 默认设置为1
			Map<String, Object> result = cloudWorkFactoryService.getPage(pageIndex, textsearch);
			result.put("pageIndex", pageIndex);
			req.setAttribute("pageBean", result);
		} catch (Exception e) {
			String msg = "加工厂信息栏目页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
		ModelAndView mv = new ModelAndView("/b2b/factoryColumn");
		return mv;
	}

	/**
	 *
	 * @Description: 加工厂信息详细页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("factoryDetail.do")
	public ModelAndView factoryDetail(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");
		if (StringUtils.isBlank(idStr)) {
			return new ModelAndView("redirect:/common/404.jsp");
		}

		CloudWorkFactory factory = cloudWorkFactoryService.findBeanById(Long.parseLong(idStr));
		if (factory == null) {
			return new ModelAndView("redirect:/common/404.jsp");
		} else {
			req.setAttribute("factory", factory);
			return new ModelAndView("b2b/factoryDetail");
		}

	}

	/**
	 *
	 * @Description: 加工厂信息编辑页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("factoryUpdate.do")
	public ModelAndView factoryUpdate(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");

		CloudWorkFactory factory = null;
		try {
			factory = cloudWorkFactoryService.findBeanById(Long.parseLong(idStr));

			if (factory == null) {
				return new ModelAndView("redirect:/common/404.jsp");
			} else {
				req.setAttribute("factory", factory);
				return new ModelAndView("/b2b/factoryUpdate");
			}
		} catch (NumberFormatException e) {
			String msg = "加工厂信息明细页异常：id参数格式异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		} catch (Exception e) {
			String msg = "加工厂信息明细页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
	}

	/**
	 *
	 * @Description: 加工厂信息发布页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("factoryPublish.do")
	public ModelAndView factoryPublish() {
		return new ModelAndView("/b2b/factoryPublish");
	}

	/**
	 *
	 * @Description: 发布加工厂信息
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping(value = "factoryPublish.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> factoryPublish(@RequestBody CloudWorkFactory factory){
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "发布加工厂信息失败，请稍后再试！");

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

		return result;
	}



}
