package cn.testin.dao;


import cn.testin.basic.IBaseDao;
import cn.testin.bean.UserRole;

public interface UserRoleMapper extends IBaseDao<UserRole> {
    
	public Integer updateUserRoleByUserId(UserRole ur);
	public UserRole getUserRoleByUserId(Long userId);
}