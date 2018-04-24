package cn.testin.dao;


import cn.testin.basic.IBaseDao;
import cn.testin.bean.Advertisement;

import java.util.List;

public interface AdvertisementMapper extends IBaseDao<Advertisement> {
	//获取发布状态的广告
    public List<Advertisement> getList();
}