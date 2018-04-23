package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.bean.UserRole;
import cn.testin.dao.UserRoleMapper;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
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
		if (ur.getValidityTime() == null) {
			Calendar calendar= Calendar.getInstance();
			calendar.set(2999, 12, 31);  //年月日  也可以具体到时分秒如calendar.set(2015, 10, 12,11,32,52);
			Date date = calendar.getTime();//date就是你需要的时间
			ur.setValidityTime(date);
		}

		return userRoleMapper.updateUserRoleByUserId(ur);
	}

	public UserRole getUserRoleByUserId(Long id) {
		return userRoleMapper.getUserRoleByUserId(id);
	}
}
