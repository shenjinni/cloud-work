package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.bean.CloudWorkPerson;
import cn.testin.dao.CloudWorkPersonMapper;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


	/**
	 * 前台分页
	 *
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getPage(int pageIndex, String text) throws Exception {
		Map<String, Object> result = new HashMap<>();
		// 每页数据
		CloudWorkPerson person = new CloudWorkPerson();
		person.setSearchText(text);
		person.setOffset((pageIndex - 1) * 10);
		person.setLimit(10);
		person.setStatus(1);
		person.setValidityTime(new Date());
		List<CloudWorkPerson> pageList = findList(person);
		// 总页数
		int dataCount = findListCount(person);
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
		CloudWorkPerson person = new CloudWorkPerson();
		person.setSearchText(text);
		person.setCreateUser(userId);
		person.setOffset((pageIndex - 1) * 10);
		person.setLimit(10);
		person.setValidityTime(new Date());
		List<CloudWorkPerson> pageList = findList(person);
		// 总页数
		int dataCount = findListCount(person);
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
