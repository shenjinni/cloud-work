package cn.testin.bean;

import cn.testin.basic.BasicPage;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.Date;

/**
 * <pre>
 * 对象功能:cloud_work_person Model对象
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:02:52
 * </pre>
 */
public class CloudWorkPerson extends BasicPage
{
	// 主键
	protected Long  id;
	// 个人工作意向、工种
	protected String  workIntent;
	// 薪资要求
	protected String  salary;
	// 姓名
	protected String  contactsName;
	// 电话
	protected String  mobile;
	// 年龄
	protected String  age;
	// 生肖
	protected String  zodiac;
	// 性别 1：男 2：女
	protected Short  sex;
	// 哪里人
	protected String  address;
	// 备注
	protected String  note;
	// 状态 1：普通开启 2：置顶 -1：关闭
	protected Integer  status;
	// 用户id
	protected Long  createUser;
	// 发布时间
	protected java.util.Date  createTime;
	// 更新时间
	protected java.util.Date  updateTime;
	// update_user
	protected Long  updateUser;
	// 前台模糊查询条件
	protected String searchText;
	// vip等级
	protected Integer weights;
	// 失效时间
	protected Date validityTime;

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

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getZodiac() {
		return zodiac;
	}

	public void setZodiac(String zodiac) {
		this.zodiac = zodiac;
	}

	public Short getSex() {
		return sex;
	}

	public void setSex(Short sex) {
		this.sex = sex;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}



	public void setId(Long id)
	{
		this.id = id;
	}
	/**
	 * 返回 id
	 * @return
	 */
	public Long getId() 
	{
		return this.id;
	}
	public void setWorkIntent(String workIntent) 
	{
		this.workIntent = workIntent;
	}
	/**
	 * 返回 个人工作意向
	 * @return
	 */
	public String getWorkIntent() 
	{
		return this.workIntent;
	}
	public void setAddress(String address) 
	{
		this.address = address;
	}
	/**
	 * 返回 address
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

	public void setStatus(Integer status)
	{
		this.status = status;
	}
	/**
	 * 返回 状态
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
	 * 返回 用户id
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
	 * 返回 update_user
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
		if (!(object instanceof CloudWorkPerson)) 
		{
			return false;
		}
		CloudWorkPerson rhs = (CloudWorkPerson) object;
		return new EqualsBuilder()
		.append(this.id, rhs.id)
		.append(this.workIntent, rhs.workIntent)
		.append(this.address, rhs.address)
		.append(this.contactsName, rhs.contactsName)
		.append(this.mobile, rhs.mobile)
		.append(this.salary, rhs.salary)
		.append(this.status, rhs.status)
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
		.append(this.workIntent) 
		.append(this.address) 
		.append(this.contactsName) 
		.append(this.mobile) 
		.append(this.salary) 
		.append(this.status) 
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
		.append("workIntent", this.workIntent) 
		.append("address", this.address) 
		.append("contactsName", this.contactsName) 
		.append("mobile", this.mobile) 
		.append("salary", this.salary) 
		.append("status", this.status) 
		.append("createUser", this.createUser) 
		.append("createTime", this.createTime) 
		.append("updateTime", this.updateTime) 
		.append("updateUser", this.updateUser) 
		.toString();
	}
   
  

}