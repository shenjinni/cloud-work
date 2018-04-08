package cn.testin.dao;

import java.util.List;

import cn.testin.basic.IBaseDao;
import cn.testin.bean.Role;
import org.apache.ibatis.annotations.Param;


public interface RoleMapper extends IBaseDao<Role> {
	
	public List<Role> selectRoles();
    
	public int selectRoleCount();
	
	public Role findRoleByShortName(@Param("shortName") String shortName);
	
	public Role findRoleByUserId(@Param("userId") Long userId);
}