package cn.testin.dao;

import cn.testin.basic.IBaseDao;
import cn.testin.bean.Article;
import cn.testin.bean.PageBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ArticleMapper extends IBaseDao<Article> {
	//获取最新的count条数据
    public List<Article> getTopList(int count);

    //Lucene定时同步查询
  	public List<Article> getLuceneAll();

    
    public List<Map<String,Object>> getNewsApp(PageBean pb);

    public Map<String,Object> getNewsDetailApp(@Param("newsId") Long newsId);

    //根据分类和数量获取最新新闻列表
    public List<Article> getListByTypeAndCount(Map<String, Object> param);
}