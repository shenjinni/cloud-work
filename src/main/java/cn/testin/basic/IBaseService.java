package cn.testin.basic;

import cn.testin.bean.PageBean;

import java.util.List;


public interface IBaseService<T> {

	public List<T> findList(PageBean pb);

	public Integer findListCount(PageBean pb);
	
	public T findBeanById(Long id);
	
	public Integer insert(T t);
	
	public Integer update(T t);
	
	public Integer delete(Long id);
}
