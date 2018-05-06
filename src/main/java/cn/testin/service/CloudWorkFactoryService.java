package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.bean.CloudWorkFactory;
import cn.testin.bean.CloudWorkFactory;
import cn.testin.dao.CloudWorkFactoryMapper;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


	/**
	 * 前台分页
	 *
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getPage(int pageIndex, String text) throws Exception {
		Map<String, Object> result = new HashMap<>();
		// 每页数据
		CloudWorkFactory factory = new CloudWorkFactory();
		factory.setSearchText(text);
		factory.setOffset((pageIndex - 1) * 10);
		factory.setLimit(10);
		factory.setStatus(1);
		factory.setValidityTime(new Date());
		List<CloudWorkFactory> pageList = findList(factory);
		// 总页数
		int dataCount = findListCount(factory);
		int pageSum;
		if (dataCount % 10 == 0) {
			pageSum = dataCount / 10;
		} else {
			pageSum = dataCount / 10 + 1;
		}
		result.put("pageList", pageList);
		result.put("pageSum", pageSum);
		result.put("pageIndex", pageIndex);
		return result;
	}



	/**
	 * 前台分页
	 *
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMyPage(int pageIndex, String text, Long userId) throws Exception {
		Map<String, Object> result = new HashMap<>();
		// 每页数据
		CloudWorkFactory factory = new CloudWorkFactory();
		factory.setSearchText(text);
		factory.setCreateUser(userId);
		factory.setOffset((pageIndex - 1) * 10);
		factory.setLimit(10);
		factory.setValidityTime(new Date());
		List<CloudWorkFactory> pageList = findList(factory);
		// 总页数
		int dataCount = findListCount(factory);
		int pageSum;
		if (dataCount % 10 == 0) {
			pageSum = dataCount / 10;
		} else {
			pageSum = dataCount / 10 + 1;
		}
		result.put("pageList", pageList);
		result.put("pageSum", pageSum);
		result.put("pageIndex", pageIndex);
		return result;
	}
}
