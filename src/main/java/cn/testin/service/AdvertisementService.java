package cn.testin.service;

import cn.testin.bean.Advertisement;
import cn.testin.dao.AdvertisementMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 广告业务类
 * @author guwei
 *
 */
@Service
public class AdvertisementService {
	@Resource
	private AdvertisementMapper dao;
	
	/**
	 * 获取发布的广告列表
	 * @author guwei
	 * @return
	 * @throws Exception
	 */
	public List<Advertisement> getList() throws Exception {
		return dao.getList();
	}
	
	public List<Advertisement> findList(Advertisement ad) {
		return dao.selectList(ad);
	}

	public Integer findListCount(Advertisement ad) {
		return dao.selectCount(ad);
	}

	public Integer insert(Advertisement m) {
		return dao.insertSelective(m);
	}

	public Integer update(Advertisement m) {
		return dao.updateByPrimaryKeySelective(m);
	}

	public Integer delete(Long id) {
		return dao.deleteByPrimaryKey(id);
	}

	public Advertisement findBeanById(Long id) {
		return dao.selectByPrimaryKey(id);
	}
}
