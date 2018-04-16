package cn.testin.service;


import cn.testin.bean.CloudWorkVip;
import cn.testin.dao.CloudWorkVipMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 *<pre>
 * 对象功能:cloud_work_person Service类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:02:52
 *</pre>
 */
@Service
public class CloudWorkVipService
{
	@Resource
	private CloudWorkVipMapper dao;

	public Integer insert(CloudWorkVip b) {
		return dao.insertSelective(b);
	}

	public Integer update(CloudWorkVip b) {
		return dao.updateByPrimaryKeySelective(b);
	}

	public CloudWorkVip findBeanById(Long id) {
		return dao.selectByPrimaryKey(id);
	}

	public CloudWorkVip findBeanByWork(CloudWorkVip b) {
		return dao.findBeanByWork(b);
	}

}
