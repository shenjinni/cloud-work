package cn.testin.dao;

import java.util.List;
import java.util.Map;

import cn.testin.basic.IBaseDao;
import cn.testin.bean.LocalUser;
import org.apache.ibatis.annotations.Param;


public interface LocalUserMapper extends IBaseDao<LocalUser> {
	//通过用户名查找用户
	public LocalUser findUserByLoginName(@Param("loginName") String loginName);
	//通过用户名获取用户数量
	public int getUserCountByLoginName(@Param("loginName") String loginName);
	//通过邮箱获取用户数量
	public int getUserCountByEmail(@Param("email") String email);
	//通过手机号获取用户数量
	public int getUserCountByPhone(@Param("phone") String phone);
	// 获取 检测用户 或者 全部用户 uid
	public List<Long> getUserIdsByType(@Param("userId") Long userId, @Param("userType") Integer userType);
	
	public LocalUser findUserByToken(@Param("userToken") String userToken);
	//通过手机号获取用户
	public LocalUser getUserByPhone(@Param("phone") String phone);
	//通过用户名手机号获取用户数量
	public int getUserCountByUserNamePhone(Map<String, Object> params);
	
	public Map<String,Object> getUserInfoApp(@Param("userId") Long userId);
}