package cn.testin.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/common/")
public class CommonController {
	private static Logger log = LogManager.getLogger(CommonController.class);
	

	/**
	 * 
	 * @Description: 首页
	 * @author: tianpengw
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping("home.do")
	public ModelAndView home(HttpServletRequest req,HttpServletResponse res){
		ModelAndView mv = new ModelAndView("/index");
		return mv;
	}
	
}
