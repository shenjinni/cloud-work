package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.bean.UserRole;
import cn.testin.dao.UserRoleMapper;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserRoleService {

	@Resource
	private UserRoleMapper dao;

	public List<UserRole> findList(UserRole ur) {
		return dao.selectList(ur);
	}

	public Integer findListCount(UserRole pb) {
		return dao.selectCount(pb);
	}

	public UserRole findBeanById(Long id) {
		return dao.selectByPrimaryKey(id);
	}

	public Integer insert(UserRole t) {
		return dao.insertSelective(t);
	}

	public Integer update(UserRole t) {
		return dao.updateByPrimaryKeySelective(t);
	}

	public Integer delete(Long id) {
		return dao.deleteByPrimaryKey(id);
	}
	
	public Integer updateUserRoleByUserId(UserRole ur){
		return dao.updateUserRoleByUserId(ur);
	}
}
