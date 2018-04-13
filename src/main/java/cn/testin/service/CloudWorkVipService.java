package cn.testin.service;


import cn.testin.bean.CloudWorkVip;
import cn.testin.dao.CloudWorkVipMapper;
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
public class CloudWorkVipService
{
	@Resource
	private CloudWorkVipMapper dao;

	public List<CloudWorkVip> findList(CloudWorkVip b) {
		return dao.selectList(b);
	}

	public Integer findListCount(CloudWorkVip b) {
		return dao.selectCount(b);
	}

	public Integer insert(CloudWorkVip b) {
		return dao.insertSelective(b);
	}

	public Integer update(CloudWorkVip b) {
		return dao.updateByPrimaryKeySelective(b);
	}

	public Integer delete(Long id) {
		return dao.deleteByPrimaryKey(id);
	}

	public CloudWorkVip findBeanById(Long id) {
		return dao.selectByPrimaryKey(id);
	}

}
