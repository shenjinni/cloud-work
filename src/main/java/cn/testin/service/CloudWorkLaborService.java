package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.bean.CloudWorkLabor;
import cn.testin.bean.CloudWorkLabor;
import cn.testin.dao.CloudWorkLaborMapper;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	/**
	 * 前台分页
	 *
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getPage(int pageIndex, String text) throws Exception {
		Map<String, Object> result = new HashMap<>();
		// 每页数据
		CloudWorkLabor labor = new CloudWorkLabor();
		labor.setSearchText(text);
		labor.setOffset((pageIndex - 1) * 10);
		labor.setLimit(10);
		labor.setStatus(1);
		labor.setValidityTime(new Date());
		List<CloudWorkLabor> pageList = findList(labor);
		// 总页数
		int dataCount = findListCount(labor);
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
		CloudWorkLabor labor = new CloudWorkLabor();
		labor.setSearchText(text);
		labor.setCreateUser(userId);
		labor.setOffset((pageIndex - 1) * 10);
		labor.setLimit(10);
		labor.setValidityTime(new Date());
		List<CloudWorkLabor> pageList = findList(labor);
		// 总页数
		int dataCount = findListCount(labor);
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
