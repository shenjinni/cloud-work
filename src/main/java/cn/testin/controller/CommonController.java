package cn.testin.controller;

import cn.testin.bean.Advertisement;
import cn.testin.service.AdvertisementService;
import cn.testin.util.StringUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@RequestMapping("/uploadFileByDS.json")
	public void uploadFileByDS(HttpServletRequest reuqest, HttpServletResponse reponse) {
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
}
