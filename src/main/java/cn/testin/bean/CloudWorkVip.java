package cn.testin.bean;


import cn.testin.basic.BasicPage;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * <pre>
 * 对象功能:cloud_work_vip Model对象
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-13 17:03:12
 * </pre>
 */
public class CloudWorkVip extends BasicPage
{
	// 主键
	protected Long  id;
	// 业务id，工人信息id等
	protected Long  workId;
	// 业务类型 1：工人信息 2：招工信息 3：加工厂信息 4：加工活信息
	protected Short  workType;
	// 开通所需金钱
	protected String  money;
	// 权重 数越大优先级越高
	protected Long  weights;
	// 有效期
	protected java.util.Date  validityTime;
	// 创建时间
	protected java.util.Date  createTime;
	// 创建人
	protected Long  createUser;
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
	public void setWorkId(Long workId) 
	{
		this.workId = workId;
	}
	/**
	 * 返回 业务id，工人信息id等
	 * @return
	 */
	public Long getWorkId() 
	{
		return this.workId;
	}
	public void setWorkType(Short workType) 
	{
		this.workType = workType;
	}
	/**
	 * 返回 业务类型 1：工人信息 2：招工信息 3：加工厂信息 4：加工活信息
	 * @return
	 */
	public Short getWorkType() 
	{
		return this.workType;
	}
	public void setMoney(String money) 
	{
		this.money = money;
	}
	/**
	 * 返回 开通所需金钱
	 * @return
	 */
	public String getMoney() 
	{
		return this.money;
	}
	public void setWeights(Long weights) 
	{
		this.weights = weights;
	}
	/**
	 * 返回 权重 数越大优先级越高
	 * @return
	 */
	public Long getWeights() 
	{
		return this.weights;
	}
	public void setValidityTime(java.util.Date validityTime) 
	{
		this.validityTime = validityTime;
	}
	/**
	 * 返回 有效期
	 * @return
	 */
	public java.util.Date getValidityTime() 
	{
		return this.validityTime;
	}
	public void setCreateTime(java.util.Date createTime) 
	{
		this.createTime = createTime;
	}
	/**
	 * 返回 创建时间
	 * @return
	 */
	public java.util.Date getCreateTime() 
	{
		return this.createTime;
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


   	/**
	 * @see Object#equals(Object)
	 */
	public boolean equals(Object object) 
	{
		if (!(object instanceof CloudWorkVip)) 
		{
			return false;
		}
		CloudWorkVip rhs = (CloudWorkVip) object;
		return new EqualsBuilder()
		.append(this.id, rhs.id)
		.append(this.workId, rhs.workId)
		.append(this.workType, rhs.workType)
		.append(this.money, rhs.money)
		.append(this.weights, rhs.weights)
		.append(this.validityTime, rhs.validityTime)
		.append(this.createTime, rhs.createTime)
		.append(this.createUser, rhs.createUser)
		.isEquals();
	}

	/**
	 * @see Object#hashCode()
	 */
	public int hashCode() 
	{
		return new HashCodeBuilder(-82280557, -700257973)
		.append(this.id) 
		.append(this.workId) 
		.append(this.workType) 
		.append(this.money) 
		.append(this.weights) 
		.append(this.validityTime) 
		.append(this.createTime) 
		.append(this.createUser) 
		.toHashCode();
	}

	/**
	 * @see Object#toString()
	 */
	public String toString() 
	{
		return new ToStringBuilder(this)
		.append("id", this.id) 
		.append("workId", this.workId) 
		.append("workType", this.workType) 
		.append("money", this.money) 
		.append("weights", this.weights) 
		.append("validityTime", this.validityTime) 
		.append("createTime", this.createTime) 
		.append("createUser", this.createUser) 
		.toString();
	}
   
  

}