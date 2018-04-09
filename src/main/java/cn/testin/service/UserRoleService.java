package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.bean.UserRole;
import cn.testin.dao.UserRoleMapper;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserRoleService {

	@Resource
	private UserRoleMapper userRoleMapper;

	public List<UserRole> findList(UserRole ur) {
		return userRoleMapper.selectList(ur);
	}

	public Integer findListCount(UserRole pb) {
		return userRoleMapper.selectCount(pb);
	}

	public UserRole findBeanById(Long id) {
		return userRoleMapper.selectByPrimaryKey(id);
	}

	public Integer insert(UserRole t) {
		return userRoleMapper.insertSelective(t);
	}

	public Integer update(UserRole t) {
		return userRoleMapper.updateByPrimaryKeySelective(t);
	}

	public Integer delete(Long id) {
		return userRoleMapper.deleteByPrimaryKey(id);
	}
	
	public Integer updateUserRoleByUserId(UserRole ur){
		return userRoleMapper.updateUserRoleByUserId(ur);
	}
}
