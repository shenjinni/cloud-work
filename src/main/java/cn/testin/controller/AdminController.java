package cn.testin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 后台
 */
@Controller
@RequestMapping("/admin/")
public class AdminController {

	/**
	 * 
	 * @Description: 后台首页
	 * @author shenjinni
	 * @return ModelAndView
	 */
	@RequestMapping("home.do")
	public ModelAndView home() {
		return new ModelAndView("/admin/home");
	} 
}
