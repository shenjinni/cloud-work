package cn.testin.controller;


import cn.testin.bean.LocalUser;
import cn.testin.constant.Constants;
import cn.testin.service.LocalUserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 
  * @ClassName: AdminUserController 
  * @Description: 后台用户管理
  * @author: Jinni Shen
  * @date 2018年1月16日 下午1:53:08 
  *
 */
@Controller
@RequestMapping("/admin/user/")
public class AdminUserController {

	private static Logger log = LogManager.getLogger(AdminUserController.class);
	
	@Resource
	private LocalUserService userService;
	
	/**
	 * 
	 * @Description: 查询用户列表
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping("userList.do")
	public ModelAndView userList(){
		ModelAndView userList = new ModelAndView("admin/user/userList");
		return userList;
	}
	
	/**
	 * 
	 * @Description: 用户列表json
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "userList.json", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView userList(HttpServletRequest req, @RequestBody LocalUser lu) {
		ModelAndView mav = new ModelAndView();
		lu.setUserStatus("1");
		List<LocalUser> userList = userService.findList(lu);
		mav.addObject("rows", userList);
		mav.addObject("total", userService.findListCount(lu));
		return mav;
	}


	/**
	 * 
	 * @Description: 修改用户
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping("userModify.do")
	public ModelAndView userModify(@RequestParam(name="id",required=false) Long id){
		ModelAndView mv = new ModelAndView("/admin/user/userModify");
		if(null != id){
			LocalUser User = userService.findUserById(id);
			mv.addObject("user", User);
		}
		return mv;
	}
	
	/**
	 * 
	 * @Description: 修改用户
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updateUser.json", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateUser(@RequestBody LocalUser user, HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		Long id = user.getUserId();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", null == id ? "新增" : "修改" + "用户失败，请稍后再试！");
		user.setUpdateTime(new Date());
		int i = userService.update(user);
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "修改用户成功！");
			log.info("修改用户成功！userId=" + user.getUserId());
		}
		return mv;
	}
	
	/**
	 * 
	 * @Description: 删除用户
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "deleteUser.json", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView deleteUser(HttpServletRequest request, @RequestBody LocalUser user){
		ModelAndView mv = new ModelAndView();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", "删除用户失败，请稍后再试！");
		
		user = userService.findUserById(user.getUserId());
		if (user == null) {
			return mv;
		}
		
		user.setUserStatus("0");
		user.setUpdateTime(new Date());
		int i = userService.update(user);
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "删除用户成功！");
			log.info("删除用户成功！userId=" + user.getUserId());
		}
		return mv;
	}
}
