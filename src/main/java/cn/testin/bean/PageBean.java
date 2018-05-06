package cn.testin.bean;

import cn.testin.basic.BasicPage;

import java.math.BigDecimal;


/** 
 * @ClassName: PageBean 
 * @Description: 
 * @author shenjinni
 * @date 2017年4月1日 下午2:10:36 
 *  
 */
public class PageBean extends BasicPage {
	
	private Long roleId;
	
	private String queryType;
	
	private String leagueName;
	
	private Long leagueId;
	
	private String articleType;
	
	private Long createUserId;
	
	private Long checkSubId;
	
	//收藏类型 news-新闻 lib-实验室 need-需求 check -检测项目
	private String storageType;
	
	private Long storageObjId;
	
	private Long receiveUserId;
	
	private String specType;
	
	private Long checkPId;
	
	private Long labId;
	
	private String checkStatus;
	
	private Long checkTypeId;
	
	private Long labUserId;
	
	private Long needId;
	
	private BigDecimal orderPrice;//委托单价格
	
	private String projectName;
	
	private Long payOrderId;
	
	private String payNonceStr;
	
	private String payType; //交易方式 consume-支付  recharge-充值
	
	private BigDecimal amount;//实际支付价格
	
	private Long couponId;//优惠券id
	
	private Long orderId;//委托单id
	
	private String searchText;
	
	
	
	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getCouponId() {
		return couponId;
	}

	public void setCouponId(Long couponId) {
		this.couponId = couponId;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public Long getPayOrderId() {
		return payOrderId;
	}

	public void setPayOrderId(Long payOrderId) {
		this.payOrderId = payOrderId;
	}

	public String getPayNonceStr() {
		return payNonceStr;
	}

	public void setPayNonceStr(String payNonceStr) {
		this.payNonceStr = payNonceStr;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Long getLabUserId() {
		return labUserId;
	}

	public void setLabUserId(Long labUserId) {
		this.labUserId = labUserId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public String getLeagueName() {
		return leagueName;
	}

	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}

	public Long getLeagueId() {
		return leagueId;
	}

	public void setLeagueId(Long leagueId) {
		this.leagueId = leagueId;
	}

	public String getArticleType() {
		return articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	public Long getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}

	public Long getCheckSubId() {
		return checkSubId;
	}

	public void setCheckSubId(Long checkSubId) {
		this.checkSubId = checkSubId;
	}

	public String getStorageType() {
		return storageType;
	}

	public void setStorageType(String storageType) {
		this.storageType = storageType;
	}

	public Long getStorageObjId() {
		return storageObjId;
	}

	public void setStorageObjId(Long storageObjId) {
		this.storageObjId = storageObjId;
	}

	public Long getReceiveUserId() {
		return receiveUserId;
	}

	public void setReceiveUserId(Long receiveUserId) {
		this.receiveUserId = receiveUserId;
	}

	public String getSpecType() {
		return specType;
	}

	public void setSpecType(String specType) {
		this.specType = specType;
	}

	public Long getCheckPId() {
		return checkPId;
	}

	public void setCheckPId(Long checkPId) {
		this.checkPId = checkPId;
	}

	public Long getLabId() {
		return labId;
	}

	public void setLabId(Long labId) {
		this.labId = labId;
	}

	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}

	public Long getCheckTypeId() {
		return checkTypeId;
	}

	public void setCheckTypeId(Long checkTypeId) {
		this.checkTypeId = checkTypeId;
	}

	public Long getNeedId() {
		return needId;
	}

	public void setNeedId(Long needId) {
		this.needId = needId;
	}

	public BigDecimal getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(BigDecimal orderPrice) {
		this.orderPrice = orderPrice;
	}
}
