package cn.testin.controller;

import cn.testin.bean.Advertisement;
import cn.testin.bean.Article;
import cn.testin.service.AdvertisementService;
import cn.testin.service.ArticleService;
import cn.testin.service.CloudWorkPersonService;
import cn.testin.service.CloudWorkRecruitmentService;
import cn.testin.util.StringUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
@RequestMapping("/common/")
public class CommonController {
	private static Logger log = LogManager.getLogger(CommonController.class);
	@Resource
	private AdvertisementService advertisementService;

	@Resource
	private ArticleService articleService;

	@Resource
	private CloudWorkRecruitmentService cloudWorkRecruitmentService;

	/**
	 * 
	 * @Description: 首页
	 * @author: shenjinni
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping("home.do")
	public ModelAndView home(HttpServletRequest req,HttpServletResponse res){
		try {
			// 招工信息
			Map<String, Object> result = cloudWorkRecruitmentService.getPage(1, "");
			req.setAttribute("pageBean", result);

			Article article = articleService.getById(6);
			req.setAttribute("article", article);
		} catch (Exception e) {
			String msg = "招工信息栏目页异常！";
			log.warn(msg);
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView("/common/index");
		return mv;
	}


	/**
	 * 获取广告数据
	 * @author guwei
	 * @return
	 */
	@RequestMapping("homeGetAdv.json")
	@ResponseBody
	public Map<String,Object> homeGetAdv(HttpServletRequest req, HttpServletResponse res){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			result = saveAdv();
			result.put("flag", true);
		} catch (Exception e) {
			log.warn("获取导航栏数据异常！");
			e.printStackTrace();
			result.put("flag", false);
			result.put("msg", "抱歉，出现异常！");
		}
		return result;
	}

	public Map<String,Object> saveAdv() throws Exception{
		Map<String,Object> result = new HashMap<String,Object>();
		List<Advertisement> bottomList = new ArrayList<Advertisement>();
		//数据库查询
		List<Advertisement> list = advertisementService.getList();
		for(int i=0;i<list.size();i++){
			Advertisement temp = list.get(i);
			if("L".equalsIgnoreCase(temp.getAdLocation())){
				continue;
			}else if("R".equalsIgnoreCase(temp.getAdLocation())){
				continue;
			}else if("T".equalsIgnoreCase(temp.getAdLocation())){
				continue;
			}else if("B".equalsIgnoreCase(temp.getAdLocation())){
				bottomList.add(temp);
				continue;
			}
		}

		//底部
		if(bottomList.size()==0){
			result.put("bottomAdvEmpty", true);
		}else{
			result.put("bottomAdvEmpty", false);
			result.put("bottomAdv", bottomList);
		}

		return result;
	}

	/**
	 *
	 * @Description: 文章
	 * @author: shenjinni
	 * @return
	 */
	@RequestMapping("article.do")
	public ModelAndView help(@RequestParam(name="id", required = false) Long id){
		ModelAndView mv = new ModelAndView("/common/article");
		if(null != id){
			Article article = articleService.getById(id);
			mv.addObject("article", article);
		}
		return mv;
	}


}
