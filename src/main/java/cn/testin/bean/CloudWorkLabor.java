package cn.testin.bean;

import cn.testin.basic.BasicPage;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.Date;

/**
 * <pre>
 * 对象功能:cloud_work_labor Model对象
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:03:17
 * </pre>
 */
public class CloudWorkLabor extends BasicPage
{
	// 主键
	protected Long  id;
	// 需求、设计种类
	protected String  workNeed;
	// 联系人
	protected String  contactsName;
	// 电话
	protected String  mobile;
	// 地址
	protected String  address;
	// 工厂名
	protected String  factoryName;
	// 加工数量
	protected String  number;
	// 备注
	protected String  note;
	// 薪资水平、目前未启用该字段
	protected String  salary;
	// 状态 -1：关闭  1：正常 2及以上：置顶 状态数字越大，优先级越高
	protected Integer  status;
	// 创建人
	protected Long  createUser;
	// 发布时间
	protected java.util.Date  createTime;
	// 更新时间
	protected java.util.Date  updateTime;
	// 修改者
	protected Long  updateUser;
	// vip等级
	protected Integer weights;
	// 失效时间
	protected Date validityTime;
	// 前台模糊查询条件
	protected String searchText;

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public Date getValidityTime() {
		return validityTime;
	}

	public void setValidityTime(Date validityTime) {
		this.validityTime = validityTime;
	}
	public Integer getWeights() {
		return weights;
	}

	public void setWeights(Integer weights) {
		this.weights = weights;
	}
	public void setId(Long id)
	{
		this.id = id;
	}
	/**
	 * 返回 主键
	 * @return
	 */
	public Long getId()
	{
		return this.id;
	}
	public void setWorkNeed(String workNeed)
	{
		this.workNeed = workNeed;
	}
	/**
	 * 返回 需求、设计种类
	 * @return
	 */
	public String getWorkNeed()
	{
		return this.workNeed;
	}
	public void setContactsName(String contactsName)
	{
		this.contactsName = contactsName;
	}
	/**
	 * 返回 联系人
	 * @return
	 */
	public String getContactsName()
	{
		return this.contactsName;
	}
	public void setMobile(String mobile)
	{
		this.mobile = mobile;
	}
	/**
	 * 返回 电话
	 * @return
	 */
	public String getMobile()
	{
		return this.mobile;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	/**
	 * 返回 地址
	 * @return
	 */
	public String getAddress()
	{
		return this.address;
	}
	public void setFactoryName(String factoryName)
	{
		this.factoryName = factoryName;
	}
	/**
	 * 返回 工厂名
	 * @return
	 */
	public String getFactoryName()
	{
		return this.factoryName;
	}
	public void setNumber(String number)
	{
		this.number = number;
	}
	/**
	 * 返回 加工数量
	 * @return
	 */
	public String getNumber()
	{
		return this.number;
	}
	public void setNote(String note)
	{
		this.note = note;
	}
	/**
	 * 返回 备注
	 * @return
	 */
	public String getNote()
	{
		return this.note;
	}
	public void setSalary(String salary)
	{
		this.salary = salary;
	}
	/**
	 * 返回 薪资水平、目前未启用该字段
	 * @return
	 */
	public String getSalary()
	{
		return this.salary;
	}
	public void setStatus(Integer status)
	{
		this.status = status;
	}
	/**
	 * 返回 状态 -1：关闭  1：正常 2及以上：置顶 状态数字越大，优先级越高
	 * @return
	 */
	public Integer getStatus()
	{
		return this.status;
	}
	public void setCreateUser(Long createUser)
	{
		this.createUser = createUser;
	}
	/**
	 * 返回 创建人
	 * @return
	 */
	public Long getCreateUser()
	{
		return this.createUser;
	}
	public void setCreateTime(java.util.Date createTime)
	{
		this.createTime = createTime;
	}
	/**
	 * 返回 发布时间
	 * @return
	 */
	public java.util.Date getCreateTime()
	{
		return this.createTime;
	}
	public void setUpdateTime(java.util.Date updateTime)
	{
		this.updateTime = updateTime;
	}
	/**
	 * 返回 更新时间
	 * @return
	 */
	public java.util.Date getUpdateTime()
	{
		return this.updateTime;
	}
	public void setUpdateUser(Long updateUser)
	{
		this.updateUser = updateUser;
	}
	/**
	 * 返回 修改者
	 * @return
	 */
	public Long getUpdateUser()
	{
		return this.updateUser;
	}


	/**
	 * @see java.lang.Object#equals(Object)
	 */
	public boolean equals(Object object)
	{
		if (!(object instanceof CloudWorkLabor))
		{
			return false;
		}
		CloudWorkLabor rhs = (CloudWorkLabor) object;
		return new EqualsBuilder()
				.append(this.id, rhs.id)
				.append(this.workNeed, rhs.workNeed)
				.append(this.contactsName, rhs.contactsName)
				.append(this.mobile, rhs.mobile)
				.append(this.address, rhs.address)
				.append(this.factoryName, rhs.factoryName)
				.append(this.number, rhs.number)
				.append(this.note, rhs.note)
				.append(this.salary, rhs.salary)
				.append(this.status, rhs.status)
				.append(this.createUser, rhs.createUser)
				.append(this.createTime, rhs.createTime)
				.append(this.updateTime, rhs.updateTime)
				.append(this.updateUser, rhs.updateUser)
				.isEquals();
	}

	/**
	 * @see java.lang.Object#hashCode()
	 */
	public int hashCode()
	{
		return new HashCodeBuilder(-82280557, -700257973)
				.append(this.id)
				.append(this.workNeed)
				.append(this.contactsName)
				.append(this.mobile)
				.append(this.address)
				.append(this.factoryName)
				.append(this.number)
				.append(this.note)
				.append(this.salary)
				.append(this.status)
				.append(this.createUser)
				.append(this.createTime)
				.append(this.updateTime)
				.append(this.updateUser)
				.toHashCode();
	}

	/**
	 * @see java.lang.Object#toString()
	 */
	public String toString()
	{
		return new ToStringBuilder(this)
				.append("id", this.id)
				.append("workNeed", this.workNeed)
				.append("contactsName", this.contactsName)
				.append("mobile", this.mobile)
				.append("address", this.address)
				.append("factoryName", this.factoryName)
				.append("number", this.number)
				.append("note", this.note)
				.append("salary", this.salary)
				.append("status", this.status)
				.append("createUser", this.createUser)
				.append("createTime", this.createTime)
				.append("updateTime", this.updateTime)
				.append("updateUser", this.updateUser)
				.toString();
	}

}