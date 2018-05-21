package cn.testin.bean;

import java.util.Date;

public class UserRole {
	
	private Long id;
	
	private Long roleId;
	
	private Long userId;

	// 失效时间
	protected Date validityTime;

	private String roleName;

	private String roleShortName;

	// 开通所需金钱
	protected String  money;

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
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

	public Date getValidityTime() {
		return validityTime;
	}

	public void setValidityTime(Date validityTime) {
		this.validityTime = validityTime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	
}
