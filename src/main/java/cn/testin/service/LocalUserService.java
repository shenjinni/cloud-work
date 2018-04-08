package cn.testin.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import cn.testin.bean.LocalUser;
import cn.testin.bean.Role;
import cn.testin.bean.UserRole;
import cn.testin.constant.Constants;
import cn.testin.dao.LocalUserMapper;
import cn.testin.dao.RoleMapper;
import cn.testin.dao.UserRoleMapper;
import cn.testin.util.MD5Util;
import cn.testin.util.RandomUtils;
import org.springframework.stereotype.Service;


@Service
public class LocalUserService {

	@Resource
	private LocalUserMapper dao;
	@Resource
	private RoleMapper roleDao;
	@Resource
	private UserRoleMapper userRoleDao;


	// 通过用户名查找用户
	public LocalUser findUserByLoginName(String loginName) {
		return dao.findUserByLoginName(loginName);
	}

	// 通过用户名检查用户是否存在
	public boolean checkUserExistByLoginName(String loginName) {
		if (dao.getUserCountByLoginName(loginName) > 0) {
			return true;
		}
		return false;
	}
	
	// 通过用户名检查用户是否存在
	public boolean checkUserExistByUsernamePhone(Map<String,Object> params) {
		if (dao.getUserCountByUserNamePhone(params) > 0) {
			return true;
		}
		return false;
	}
	
	

	// 通过邮箱检查用户是否存在
	public boolean checkUserExistByEmail(String email) {
		if (dao.getUserCountByEmail(email) > 0) {
			return true;
		}
		return false;
	}

	// 通过手机号检查用户是否存在
	public boolean checkUserExistByPhone(String phone) {
		if (dao.getUserCountByPhone(phone) > 0) {
			return true;
		}
		return false;
	}

	// 通过id查找用户
	public LocalUser findUserById(Long id) {
		return dao.selectByPrimaryKey(id);
	}
	
	//创建用户
	public int createUser(LocalUser lu) throws Exception{
		//MD5对密码加密
		lu.setPassword(MD5Util.getMD5(lu.getPassword()));
		lu.setUserId(RandomUtils.g());
		lu.setCreateTime(new Date());
		lu.setUserStatus("1");
		if(dao.insert(lu) == 1){
			//增加用户和角色关系记录表
			Role role = roleDao.findRoleByShortName(Constants.role_normal);
			UserRole ur = new UserRole();
			ur.setId(RandomUtils.g());
			ur.setRoleId(role.getRoleId());
			ur.setUserId(lu.getUserId());
			userRoleDao.insert(ur);
			/*//增加积分记录
			Score score = new Score();
			score.setScoreId(RandomUtils.g());
			score.setUserId(lu.getUserId());
			score.setUserScore(0);
			score.setLabScore(new BigDecimal("0"));
			score.setUserLevel("Lv0");
			score.setLabLevel("Lv0");
			scoreDao.insert(score);
			//增加钱包记录
			Wallet wallet = new Wallet();
			wallet.setWalletId(RandomUtils.g());
			wallet.setUserId(lu.getUserId());
			wallet.setWalletAmount(new BigDecimal(0));
			walletDao.insert(wallet);*/
			return 1;
		}
		return 0;
	}
	
	// 查询用户列表
	public List<LocalUser> findList(LocalUser lu) {
		return dao.selectList(lu);
	}

	// 获取用户数
	public Integer findListCount(LocalUser lu) {
		return dao.selectCount(lu);
	}
	
	// 查询所有用户或者检测用户（userType=1）的uid，查询结果除去userId的值
	public List<Long> getUserIdsByType(Long userId, Integer userType){
		return dao.getUserIdsByType(userId, userType);
	}
	
	public Integer update(LocalUser lu) {
		return dao.updateByPrimaryKeySelective(lu);
	}
	
	public LocalUser findUserByToken(String userToken){
		return dao.findUserByToken(userToken);
	}
	
	// 通过手机号查找用户
	public LocalUser findUserByPhone(String phone) {
		return dao.getUserByPhone(phone);
	}
	
	public Map<String,Object> getUserInfoApp(Long userId){
		return dao.getUserInfoApp(userId);
	}
}
