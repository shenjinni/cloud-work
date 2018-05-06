package cn.testin.service;

import java.util.List;

import javax.annotation.Resource;

import cn.testin.bean.Role;
import cn.testin.dao.RoleMapper;
import org.springframework.stereotype.Service;


/** 
 * @ClassName: RoleServiceImpl 
 * @Description: 
 * @author shenjinni
 * @date 2017年4月9日 上午11:49:39 
 *  
 */
@Service
public class RoleService {

	@Resource
	public RoleMapper roleDao;
	
	public List<Role> selectRoles() {
		return roleDao.selectRoles();
	}

	public int selectRolesCount() {
		return roleDao.selectRoleCount();
	}

	public Role findRoleByUserId(Long userId){
		return roleDao.findRoleByUserId(userId);
	}
	
	public Role findRoleByShortName(String roleShortName){
		return roleDao.findRoleByShortName(roleShortName);
	}
}
