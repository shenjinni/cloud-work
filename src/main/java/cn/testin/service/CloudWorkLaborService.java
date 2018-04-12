package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.bean.CloudWorkLabor;
import cn.testin.dao.CloudWorkLaborMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *<pre>
 * 对象功能:cloud_work_labor Service类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:03:17
 *</pre>
 */
@Service
public class CloudWorkLaborService
{
	@Resource
	private CloudWorkLaborMapper dao;

	public List<CloudWorkLabor> findList(CloudWorkLabor b) {
		return dao.selectList(b);
	}

	public Integer findListCount(CloudWorkLabor b) {
		return dao.selectCount(b);
	}

	public Integer insert(CloudWorkLabor b) {
		return dao.insertSelective(b);
	}

	public Integer update(CloudWorkLabor b) {
		return dao.updateByPrimaryKeySelective(b);
	}

	public Integer delete(Long id) {
		return dao.deleteByPrimaryKey(id);
	}

	public CloudWorkLabor findBeanById(Long id) {
		return dao.selectByPrimaryKey(id);
	}

	
	
}
