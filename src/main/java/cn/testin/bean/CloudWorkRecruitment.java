package cn.testin.bean;

import cn.testin.basic.BasicPage;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
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
	// 工种
	protected String  workType;
	// 招工单位
	protected String  company;
	// 电话
	protected String  mobile;
	// 薪资水平
	protected Double  salary;
	// 状态
	protected Short  status;
	// 联系人
	protected String  contactsName;
	// 创建人
	protected Long  createUser;
	// 发布时间
	protected java.util.Date  createTime;
	// 更新时间
	protected java.util.Date  updateTime;
	// 修改者
	protected Long  updateUser;
	// 薪资水平
	protected Double  salaryBegin;
	// 薪资水平
	protected Double  salaryEnd;

	public Double getSalaryBegin() {
		return salaryBegin;
	}

	public void setSalaryBegin(Double salaryBegin) {
		this.salaryBegin = salaryBegin;
	}

	public Double getSalaryEnd() {
		return salaryEnd;
	}

	public void setSalaryEnd(Double salaryEnd) {
		this.salaryEnd = salaryEnd;
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
	 * 返回 工种
	 * @return
	 */
	public String getWorkType() 
	{
		return this.workType;
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
	public void setSalary(Double salary) 
	{
		this.salary = salary;
	}
	/**
	 * 返回 薪资水平
	 * @return
	 */
	public Double getSalary() 
	{
		return this.salary;
	}
	public void setStatus(Short status) 
	{
		this.status = status;
	}
	/**
	 * 返回 状态
	 * @return
	 */
	public Short getStatus() 
	{
		return this.status;
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
	 * @see Object#equals(Object)
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
		.append(this.company, rhs.company)
		.append(this.mobile, rhs.mobile)
		.append(this.salary, rhs.salary)
		.append(this.status, rhs.status)
		.append(this.contactsName, rhs.contactsName)
		.append(this.createUser, rhs.createUser)
		.append(this.createTime, rhs.createTime)
		.append(this.updateTime, rhs.updateTime)
		.append(this.updateUser, rhs.updateUser)
		.isEquals();
	}

	/**
	 * @see Object#hashCode()
	 */
	public int hashCode() 
	{
		return new HashCodeBuilder(-82280557, -700257973)
		.append(this.id) 
		.append(this.workType) 
		.append(this.company) 
		.append(this.mobile) 
		.append(this.salary) 
		.append(this.status) 
		.append(this.contactsName) 
		.append(this.createUser) 
		.append(this.createTime) 
		.append(this.updateTime) 
		.append(this.updateUser) 
		.toHashCode();
	}

	/**
	 * @see Object#toString()
	 */
	public String toString() 
	{
		return new ToStringBuilder(this)
		.append("id", this.id) 
		.append("workType", this.workType) 
		.append("company", this.company) 
		.append("mobile", this.mobile) 
		.append("salary", this.salary) 
		.append("status", this.status) 
		.append("contactsName", this.contactsName) 
		.append("createUser", this.createUser) 
		.append("createTime", this.createTime) 
		.append("updateTime", this.updateTime) 
		.append("updateUser", this.updateUser) 
		.toString();
	}
   
  

}