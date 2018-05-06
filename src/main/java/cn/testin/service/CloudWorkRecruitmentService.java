package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.bean.CloudWorkRecruitment;
import cn.testin.bean.CloudWorkRecruitment;
import cn.testin.dao.CloudWorkRecruitmentMapper;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *<pre>
 * 对象功能:cloud_work_recruitment Service类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:01:52
 *</pre>
 */
@Service
public class CloudWorkRecruitmentService
{
	@Resource
	private CloudWorkRecruitmentMapper dao;

	public List<CloudWorkRecruitment> findList(CloudWorkRecruitment b) {
		return dao.selectList(b);
	}

	public Integer findListCount(CloudWorkRecruitment b) {
		return dao.selectCount(b);
	}

	public Integer insert(CloudWorkRecruitment b) {
		return dao.insertSelective(b);
	}

	public Integer update(CloudWorkRecruitment b) {
		return dao.updateByPrimaryKeySelective(b);
	}

	public Integer delete(Long id) {
		return dao.deleteByPrimaryKey(id);
	}

	public CloudWorkRecruitment findBeanById(Long id) {
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
		CloudWorkRecruitment rec = new CloudWorkRecruitment();
		rec.setSearchText(text);
		rec.setOffset((pageIndex - 1) * 10);
		rec.setLimit(10);
		rec.setStatus(1);
		rec.setValidityTime(new Date());
		List<CloudWorkRecruitment> pageList = findList(rec);
		// 总页数
		int dataCount = findListCount(rec);
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
		CloudWorkRecruitment rec = new CloudWorkRecruitment();
		rec.setSearchText(text);
		rec.setCreateUser(userId);
		rec.setOffset((pageIndex - 1) * 10);
		rec.setLimit(10);
		rec.setValidityTime(new Date());
		List<CloudWorkRecruitment> pageList = findList(rec);
		// 总页数
		int dataCount = findListCount(rec);
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
