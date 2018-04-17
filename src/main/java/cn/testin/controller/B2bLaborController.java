package cn.testin.controller;

import cn.testin.bean.CloudWorkLabor;
import cn.testin.service.CloudWorkLaborService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
public class B2bLaborController {

	private static Logger log = Logger.getLogger(B2bLaborController.class);

	@Resource
	private CloudWorkLaborService cloudWorkLaborService;


	/**
	 *
	 * @Description: 工人信息栏目页
	 * @author Jinni Shen
	 * @return ModelAndView
	 */
	@RequestMapping("laborColumn.do")
	public ModelAndView laborColumn(HttpServletRequest req) throws Exception {
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
			Map<String, Object> result = cloudWorkLaborService.getPage(pageIndex, text);
			result.put("pageIndex", pageIndex);
			req.setAttribute("pageBean", result);
		} catch (Exception e) {
			String msg = "工人信息栏目页异常！";
			log.warn(msg);
			e.printStackTrace();
			throw new Exception(msg);
		}
		ModelAndView mv = new ModelAndView("/b2b/laborColumn");
		return mv;
	}

	/**
	 *
	 * @Description: 工人信息详细页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("laborDetail.do")
	public ModelAndView laborDetail(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");
		if (StringUtils.isBlank(idStr)) {
			return new ModelAndView("redirect:/common/404.jsp");
		}

		CloudWorkLabor labor = cloudWorkLaborService.findBeanById(Long.parseLong(idStr));
		if (labor == null) {
			return new ModelAndView("redirect:/common/404.jsp");
		} else {
			req.setAttribute("labor", labor);
			return new ModelAndView("b2b/laborDetail");
		}

	}

	/**
	 *
	 * @Description: 工人信息编辑页
	 * @author guwei
	 * @return ModelAndView
	 */
	@RequestMapping("laborUpdate.do")
	public ModelAndView laborUpdate(HttpServletRequest req) throws Exception {
		String idStr = req.getParameter("id");

		CloudWorkLabor labor = null;
		try {
			labor = cloudWorkLaborService.findBeanById(Long.parseLong(idStr));

			if (labor == null) {
				return new ModelAndView("redirect:/common/404.jsp");
			} else {
				req.setAttribute("labor", labor);
				return new ModelAndView("/b2b/laborUpdate");
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
	@RequestMapping("laborPublish.do")
	public ModelAndView laborPublish() {
		return new ModelAndView("/b2b/laborPublish");
	}


}