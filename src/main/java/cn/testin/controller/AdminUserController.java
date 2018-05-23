package cn.testin.controller;


import cn.testin.bean.CloudWorkTurnover;
import cn.testin.bean.LocalUser;
import cn.testin.bean.Role;
import cn.testin.bean.UserRole;
import cn.testin.constant.Constants;
import cn.testin.service.CloudWorkTurnoverService;
import cn.testin.service.LocalUserService;
import cn.testin.service.RoleService;
import cn.testin.service.UserRoleService;
import cn.testin.util.RandomUtils;
import cn.testin.util.StringUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Resource
	private UserRoleService userRoleService;

	@Resource
	private RoleService roleService;

	@Resource
	private CloudWorkTurnoverService cloudWorkTurnoverService;
	
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
	public Map<String, Object> userList(HttpServletRequest req, @RequestBody LocalUser lu) {
		Map<String, Object> result = new HashMap<String, Object>();
		lu.setUserStatus("1");
		List<LocalUser> userList = userService.findList(lu);
		result.put("rows", userList);
		result.put("total", userService.findListCount(lu));
		Map<String, Object> resultq = new HashMap<String, Object>();
		resultq.put("model", result);
		return resultq;
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

			List<Role> roles = roleService.selectRoles();
			mv.addObject("user", User);
			mv.addObject("roles", roles);

			// 获取后七天，后一个月时间
			String day7 = StringUtil.getDateAdd(7);
			String day30 = StringUtil.getDateAdd(30);
			String day60 = StringUtil.getDateAdd(60);
			String day90 = StringUtil.getDateAdd(90);
			String dayBn = StringUtil.getDateAdd(180);
			mv.addObject("day7", day7).addObject("day30", day30).addObject("day60", day60)
					.addObject("day90", day90).addObject("dayBn", dayBn);
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
	public Map<String, Object> updateUser(@RequestBody UserRole userRole, HttpSession session){
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "新增turnover充值信息失败，请稍后再试！");

		Long userId = userRole.getUserId();
		Long roleId = userRole.getRoleId();

		if (userId == null || roleId == null) {
			return result;
		}

		LocalUser user = null;
		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			user = (LocalUser) userObj;
		}

		Integer i = userRoleService.updateUserRoleByUserId(userRole);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "修改用户角色成功！");
			log.info("修改用户成功！userId=" + userRole.getUserId());

			if (userRole.getMoney() != null && roleId.equals(1801031821250000L)) {
				// 添加流水
				CloudWorkTurnover turnover = new CloudWorkTurnover();
				turnover.setId(RandomUtils.g());
				turnover.setWorkId(userId);
				turnover.setWorkType((short) 5);
				turnover.setWorkName("充值会员");
				turnover.setMoney(userRole.getMoney());
				turnover.setCreateTime(new Date());
				turnover.setCreateUser(user.getUserId());
				int j = cloudWorkTurnoverService.insert(turnover);
				if (j == 1) {
					log.info("添加流水成功！userId=" + userRole.getUserId());
				}
			}
		}
		return result;
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
