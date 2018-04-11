package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.bean.CloudWorkPerson;
import cn.testin.dao.CloudWorkPersonMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *<pre>
 * 对象功能:cloud_work_person Service类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:02:52
 *</pre>
 */
@Service
public class CloudWorkPersonService
{
	@Resource
	private CloudWorkPersonMapper dao;

	public List<CloudWorkPerson> findList(CloudWorkPerson b) {
		return dao.selectList(b);
	}

	public Integer findListCount(CloudWorkPerson b) {
		return dao.selectCount(b);
	}

	public Integer insert(CloudWorkPerson b) {
		return dao.insertSelective(b);
	}

	public Integer update(CloudWorkPerson b) {
		return dao.updateByPrimaryKeySelective(b);
	}

	public Integer delete(Long id) {
		return dao.deleteByPrimaryKey(id);
	}

	public CloudWorkPerson findBeanById(Long id) {
		return dao.selectByPrimaryKey(id);
	}


}
