package cn.testin.service;


import javax.annotation.Resource;

import cn.testin.dao.CloudWorkPersonMapper;
import org.springframework.stereotype.Service;
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


}
