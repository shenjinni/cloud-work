package cn.testin.service;


import cn.testin.bean.CloudWorkTurnover;
import cn.testin.dao.CloudWorkTurnoverMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
public class CloudWorkTurnoverService
{
	@Resource
	private CloudWorkTurnoverMapper dao;

	public List<CloudWorkTurnover> findList(CloudWorkTurnover b) {
		return dao.selectList(b);
	}

	public Integer findListCount(CloudWorkTurnover b) {
		return dao.selectCount(b);
	}

	public Integer insert(CloudWorkTurnover b) {
		return dao.insertSelective(b);
	}

	public Integer update(CloudWorkTurnover b) {
		return dao.updateByPrimaryKeySelective(b);
	}

	public Integer delete(Long id) {
		return dao.deleteByPrimaryKey(id);
	}

	public CloudWorkTurnover findBeanById(Long id) {
		return dao.selectByPrimaryKey(id);
	}

}
