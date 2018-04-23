package cn.testin.bean;

import cn.testin.basic.BasicPage;

import java.math.BigDecimal;
import java.util.Date;


public class LocalUser extends BasicPage {
	private Long userId;

	private String userLoginName;

	private String password;

	private String userEmail;

	private String userPhone;

	private String realName;

	private String sex;

	private String birthday;

	private String address;

	private String companyName;

	private String userToken;

	private Date createTime;

	private Date updateTime;

	private String userStatus;

	private String checkCode;// 图片验证码或手机验证码

	private String profilePhoto;

	private BigDecimal totalAmount;

	private Integer loginTimes;

	private Date lastLoginTime;

	private String password2;// 确认密码

	// 用户积分
	private Integer userScore;

	// 实验室积分
	private Integer labScore;

	// 钱包余额
	private BigDecimal walletAmount;

	// 开票信息id
	private Long reservationId;
	// 角色Id
	private Long roleId;
	// 角色缩写
	private String roleShortName;
	// 角色名
	private String roleName;

	private String qq;

	protected Date validityTime;

	public Date getValidityTime() {
		return validityTime;
	}

	public void setValidityTime(Date validityTime) {
		this.validityTime = validityTime;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Long getReservationId() {
		return reservationId;
	}

	public void setReservationId(Long reservationId) {
		this.reservationId = reservationId;
	}

	public Integer getUserScore() {
		return userScore;
	}

	public void setUserScore(Integer userScore) {
		this.userScore = userScore;
	}

	public Integer getLabScore() {
		return labScore;
	}

	public void setLabScore(Integer labScore) {
		this.labScore = labScore;
	}

	public BigDecimal getWalletAmount() {
		return walletAmount;
	}

	public void setWalletAmount(BigDecimal walletAmount) {
		this.walletAmount = walletAmount;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserLoginName() {
		return userLoginName;
	}

	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName == null ? null : userLoginName.trim();
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName == null ? null : realName.trim();
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday == null ? null : birthday.trim();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName == null ? null : companyName.trim();
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail == null ? null : userEmail.trim();
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone == null ? null : userPhone.trim();
	}

	public String getUserToken() {
		return userToken;
	}

	public void setUserToken(String userToken) {
		this.userToken = userToken;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus == null ? null : userStatus.trim();
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto == null ? null : profilePhoto.trim();
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Integer getLoginTimes() {
		return loginTimes;
	}

	public void setLoginTimes(Integer loginTimes) {
		this.loginTimes = loginTimes;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getPassword() {
		return password;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getRoleShortName() {
		return roleShortName;
	}

	public void setRoleShortName(String roleShortName) {
		this.roleShortName = roleShortName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}