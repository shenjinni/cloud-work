package cn.testin.bean;

import cn.testin.basic.BasicPage;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.Date;

/**
 * <pre>
 * 对象功能:cloud_work_recruitment Model对象
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:01:52
 * </pre>
 */
public class CloudWorkRecruitment extends BasicPage
{
	// 主键
	protected Long  id;
	// 招工工种
	protected String  workType;
	// 工资待遇
	protected String  salary;
	// 招工单位
	protected String  company;
	// 地址
	protected String  address;
	// 联系人
	protected String  contactsName;
	// 电话
	protected String  mobile;
	// 备注
	protected String  note;
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
	public void setWorkType(String workType)
	{
		this.workType = workType;
	}
	/**
	 * 返回 招工工种
	 * @return
	 */
	public String getWorkType()
	{
		return this.workType;
	}
	public void setSalary(String salary)
	{
		this.salary = salary;
	}
	/**
	 * 返回 工资待遇
	 * @return
	 */
	public String getSalary()
	{
		return this.salary;
	}
	public void setCompany(String company)
	{
		this.company = company;
	}
	/**
	 * 返回 招工单位
	 * @return
	 */
	public String getCompany()
	{
		return this.company;
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
		if (!(object instanceof CloudWorkRecruitment))
		{
			return false;
		}
		CloudWorkRecruitment rhs = (CloudWorkRecruitment) object;
		return new EqualsBuilder()
				.append(this.id, rhs.id)
				.append(this.workType, rhs.workType)
				.append(this.salary, rhs.salary)
				.append(this.company, rhs.company)
				.append(this.address, rhs.address)
				.append(this.contactsName, rhs.contactsName)
				.append(this.mobile, rhs.mobile)
				.append(this.note, rhs.note)
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
				.append(this.workType)
				.append(this.salary)
				.append(this.company)
				.append(this.address)
				.append(this.contactsName)
				.append(this.mobile)
				.append(this.note)
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
				.append("workType", this.workType)
				.append("salary", this.salary)
				.append("company", this.company)
				.append("address", this.address)
				.append("contactsName", this.contactsName)
				.append("mobile", this.mobile)
				.append("note", this.note)
				.append("status", this.status)
				.append("createUser", this.createUser)
				.append("createTime", this.createTime)
				.append("updateTime", this.updateTime)
				.append("updateUser", this.updateUser)
				.toString();
	}


}