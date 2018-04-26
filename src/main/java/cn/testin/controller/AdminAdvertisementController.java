package cn.testin.controller;


import cn.testin.bean.Advertisement;
import cn.testin.constant.Constants;
import cn.testin.service.AdvertisementService;
import cn.testin.util.RandomUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * 
  * @ClassName: AdminAdvertisementController 
  * @Description: 广告后台管理
  * @author: Jinni Shen
  * @date 2018年1月29日 下午16:12:08 
  *
 */
@Controller
@RequestMapping("/admin/advertisement/")
public class AdminAdvertisementController {
	private static Logger log = LogManager.getLogger(AdminAdvertisementController.class);
	
	@Resource
	private AdvertisementService advertisementService;

	/**
	 * 
	 * @Description: 查询广告列表
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping("advertisementList.do")
	public ModelAndView advertisementList(){
		ModelAndView advertisementList = new ModelAndView("admin/advertisement/advertisementList");
		return advertisementList;
	}
	
	/**
	 * 
	 * @Description: 广告列表json
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "advertisementList.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> advertisementList(HttpServletRequest req, @RequestBody Advertisement cp) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Advertisement> advertisementList = advertisementService.findList(cp);
		result.put("rows", advertisementList);
		result.put("total", advertisementService.findListCount(cp));
		Map<String, Object> resultq = new HashMap<String, Object>();
		resultq.put("model", result);
		return resultq;
	}
	
	
	/**
	 * 
	 * @Description: 新增/修改广告
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping("advertisementModify.do")
	public ModelAndView advertisementModify(@RequestParam(name="adId",required=false) Long id){
		ModelAndView mv = new ModelAndView("/admin/advertisement/advertisementModify");
		
		if(null != id){
			Advertisement advertisement = advertisementService.findBeanById(id);
			mv.addObject("advertisement", advertisement);
		}
		return mv;
	}
	
	/**
	 * 
	 * @Description: 新增/修改广告
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "updateAdvertisement.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateAdvertisement(@RequestBody Advertisement advertisement, HttpServletRequest req){
		Map<String, Object> result = new HashMap<String, Object>();
		Long projectId = advertisement.getAdId();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", (projectId == null ? "新增" : "修改" ) + "广告失败，请稍后再试！");
		
		if (projectId == null) {
			advertisement.setAdId(RandomUtils.g());
			advertisement.setCreateTime(new Date());
			advertisement.setPublishTime(new Date());
			advertisement.setAdStatus("0");
			int i = advertisementService.insert(advertisement);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "新增广告成功！");
				log.info("新增广告成功！projectId= " + advertisement.getAdId());
			}
		} else {
			int i = advertisementService.update(advertisement);
			if (i == 1) {
				result.put("errCode", Constants.result_success);
				result.put("errMsg", "修改广告成功！");
				log.info("修改广告成功！projectId= " + advertisement.getAdId());
			}
		}

		return result;
	}
	
	/**
	 * 
	 * @Description: 隐藏或者显示广告
	 * @author Jinni Shen 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "coAdvertisement.json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> coAdvertisement(HttpServletRequest request, @RequestBody Advertisement advertisement){
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "操作失败，请稍后再试！");
		
		String status = advertisement.getAdStatus();
		
		advertisement = advertisementService.findBeanById(advertisement.getAdId());
		if (advertisement == null) {
			return result;
		}
		
		advertisement.setAdStatus(status);
		if (status.equals(1)) {
			advertisement.setPublishTime(new Date());
		}
		
		int i = advertisementService.update(advertisement);
		if (i == 1) {
			result.put("errCode", Constants.result_success);
			result.put("errMsg", "操作成功！");
			log.info("隐藏或者显示广告成功！adId=" + advertisement.getAdId() + ", adStatus=" + status);
		}

		return result;
	}

	@RequestMapping("uploadFile.json")
	@ResponseBody
	public Map<String, Object> uploadFile(@RequestBody MultipartFile myfile)
			throws IllegalStateException, IOException {
		// 原始名称
		String oldFileName = myfile.getOriginalFilename(); // 获取上传文件的原名
//      System.out.println(oldFileName);
		// 存储图片的虚拟本地路径（这里需要配置tomcat的web模块路径，双击猫进行配置）
		String saveFilePath = "E://picture";
		// 上传图片
		if (myfile != null && oldFileName != null && oldFileName.length() > 0) {
			// 新的图片名称
			String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
			// 新图片
			File newFile = new File(saveFilePath + "\\" + newFileName);
			// 将内存中的数据写入磁盘
			myfile.transferTo(newFile);
			// 将新图片名称返回到前端
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", "成功啦");
			map.put("url", newFileName);
			return map;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("error", "图片不合法");
			return map;
		}
	}

	@RequestMapping(value="uploadImg.json",method=RequestMethod.POST)
	@ResponseBody
	private Map<String, Object> uploadImg(
							  HttpServletRequest request)throws Exception{
		Map<String, Object> result = new HashMap<>();
		result.put("errCode", Constants.result_fail);
		result.put("errMsg", "上传失败，请稍后再试！");

		//获得物理路径webapp所在路径
//		String pathRoot = request.getSession().getServletContext().getRealPath("");
//		String path = "";
//		if (!file.isEmpty()) {
//			//生成uuid作为文件名称
//			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
//			//获得文件类型（可以判断如果不是图片，禁止上传）
//			String contentType = file.getContentType();
//			//获得文件后缀名称
//			String imageName = contentType.substring(contentType.indexOf("/") + 1);
//			//地址
//			path = "/static/images/" + uuid + "." + imageName;
//			file.transferTo(new File(pathRoot+path));
//		} else {
//			return result;
//		}
//		result.put("errCode", Constants.result_success);
//		result.put("errMsg", "操作成功！");
//		result.put("imagesPath", path);
//		log.info("上传成功！path=" + path);

		return result;
	}
}
