package cn.testin.controller;

import cn.testin.bean.Advertisement;
import cn.testin.service.AdvertisementService;
import cn.testin.util.StringUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
import java.util.*;

@Controller
@RequestMapping("/common/")
public class CommonController {
	private static Logger log = LogManager.getLogger(CommonController.class);
	@Resource
	private AdvertisementService advertisementService;

	/**
	 * 
	 * @Description: 首页
	 * @author: tianpengw
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping("home.do")
	public ModelAndView home(HttpServletRequest req,HttpServletResponse res){
		ModelAndView mv = new ModelAndView("/index");
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

	@RequestMapping("uploadFileByDS.json")
	public void uploadFileByDS(HttpServletRequest reuqest, HttpServletResponse reponse, MultipartFile myfile) {
		PrintWriter out = null;
		try {
			String name = reuqest.getParameter("name");
			if(StringUtil.isEmpty(name)){
				name = "uploadFile";
			}
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) reuqest;
			CommonsMultipartFile file1 = (CommonsMultipartFile)multipartRequest.getFile(name);
			String mulFileName= file1.getOriginalFilename();
			int numLast=mulFileName.lastIndexOf(".");
			String str = mulFileName.substring(0, numLast);
			String fileType="";
			int index=0;
			if((index=mulFileName.lastIndexOf("."))>=0){
				fileType=mulFileName.substring(index);
			}

			String key = StringUtil.getFileType(fileType) + "/casic_t/" + System.currentTimeMillis() + "_" + mulFileName;
			File s=new File(str);
			file1.transferTo(s);
			/*UploadFile uf=new UploadFile();
			String token=uf.getUpToken0();
			uf.upload(s.getPath(), key, token);*/
			reponse.setContentType("text/html;charset=UTF-8");
			out = reponse.getWriter();
			JSONObject json = new JSONObject();
			String url =  key;
			json.put("url", url);
			out.print(json);
			s.delete();
			log.info("七牛云上传操作成功：" + key);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			log.error("七牛云上传操作失败："+ StringUtil.getStackTrace(e));
		} catch (IOException e) {
			e.printStackTrace();
			log.error("七牛云上传操作失败："+ StringUtil.getStackTrace(e));
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}

	@RequestMapping("uploadFile.json")
	@ResponseBody
	public Map<String, Object> uploadFile(@RequestBody  MultipartFile myfile)
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
}
