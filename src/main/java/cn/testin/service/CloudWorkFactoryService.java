package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.bean.CloudWorkFactory;
import cn.testin.dao.CloudWorkFactoryMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *<pre>
 * 对象功能:cloud_work_factory Service类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:02:26
 *</pre>
 */
@Service
public class CloudWorkFactoryService
{
	@Resource
	private CloudWorkFactoryMapper dao;

	public List<CloudWorkFactory> findList(CloudWorkFactory b) {
		return dao.selectList(b);
	}

	public Integer findListCount(CloudWorkFactory b) {
		return dao.selectCount(b);
	}

	public Integer insert(CloudWorkFactory b) {
		return dao.insertSelective(b);
	}

	public Integer update(CloudWorkFactory b) {
		return dao.updateByPrimaryKeySelective(b);
	}

	public Integer delete(Long id) {
		return dao.deleteByPrimaryKey(id);
	}

	public CloudWorkFactory findBeanById(Long id) {
		return dao.selectByPrimaryKey(id);
	}

	
	
}
