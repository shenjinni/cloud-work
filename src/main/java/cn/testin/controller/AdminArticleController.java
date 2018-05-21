package cn.testin.controller;

import cn.testin.bean.Article;
import cn.testin.constant.Constants;
import cn.testin.service.ArticleService;
import cn.testin.util.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
  * @ClassName: AdminArticleController 
  * @Description: 文章[或者称为新闻]后台管理
  * @author: Jinni Shen
  * @date 2018年1月25日 下午16:12:08 
  *
 */
@Controller
@RequestMapping("/admin/article/")
public class AdminArticleController {
	private static Logger log = LogManager.getLogger(AdminArticleController.class);
	
	@Resource
	private ArticleService articleService;


	/**
	 * 
	 * @Description: 查询文章列表
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping("articleList.do")
	public ModelAndView articleList(){
		ModelAndView articleList = new ModelAndView("admin/article/articleList");
		return articleList;
	}
	
	/**
	 * 
	 * @Description: 文章列表json
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "articleList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> articleListJson() {
		Map<String, Object> result = new HashMap<>();
		List<Article> articleList = articleService.findList(new Article());
		result.put("rows", articleList);
		result.put("total", articleService.findListCount(new Article()));
		Map<String, Object> resultq = new HashMap<>();
		resultq.put("model", result);
		return resultq;
	}
	
	
	/**
	 * 
	 * @Description: 新增/修改文章
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping("articleModify.do")
	public ModelAndView articleModify(@RequestParam(name="articleId", required = false) Long id){
		ModelAndView mv = new ModelAndView("/admin/article/articleModify");
		if(null != id){
			Article article = articleService.getById(id);
			mv.addObject("article", article);
		}
		return mv;
	}
	
	/**
	 * 
	 * @Description: 新增/修改文章
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updateArticle.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateArticle(@RequestBody Article article, HttpServletRequest req){
		Map<String, Object> result = new HashMap<String, Object>();
		Long articleId = article.getArticleId();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "修改文章失败，请稍后再试！");

		Article articleOld = articleService.getById(articleId);
		articleOld.setArticleType(article.getArticleType());
		articleOld.setArticleTitle(article.getArticleTitle());
		articleOld.setArticleContent(article.getArticleContent());
		int i = articleService.update(articleOld);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "修改文章成功！");

			log.info("修改文章成功！articleId= " + article.getArticleId());
		}
		
		return result;
	}
	
	/**
	 * 
	 * @Description: 删除文章
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping("deleteArticle.json")
	@ResponseBody
	public ModelAndView deleteArticle(@RequestBody Article article, HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		mv.addObject("errCode", Constants.result_fail);
		mv.addObject("errMsg", "删除文章失败，请稍后再试！");
		int i = articleService.delete(article.getArticleId());
		if (i == 1) {
			mv.addObject("errCode", Constants.result_success);
			mv.addObject("errMsg", "删除文章成功！");

			log.info("删除文章成功！articleId=" + article.getArticleId());
		}
		return mv;
	}
}
