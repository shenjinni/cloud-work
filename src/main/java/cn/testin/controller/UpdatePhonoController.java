package cn.testin.controller;

import cn.testin.constant.Constants;
import cn.testin.util.StringUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 上传图片公共Controller
 * @qq 1026290752
 *
 */
@Controller
@RequestMapping("/admin/")
public class UpdatePhonoController {


	@RequestMapping("/uploadPhoto.json")
	@ResponseBody
	public Map<String, Object> updatePhoto(HttpServletRequest request, HttpServletResponse response, @RequestParam("myFile") MultipartFile myFile){
		Map<String, Object> json = new HashMap<>();
		try {
			//输出文件后缀名称
			System.out.println(myFile.getOriginalFilename());
			DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			//图片名称
			String name = df.format(new Date());

			Random r = new Random();
			for(int i = 0 ;i<3 ;i++){
				name += r.nextInt(10);
			}
			//
			String ext = FilenameUtils.getExtension(myFile.getOriginalFilename());
			//保存图片       File位置 （全路径）   /upload/fileName.jpg
			String filePath = "";
			Properties props = System.getProperties();
			String osName = props.getProperty("os.name");
			if (osName.contains("Windows")) {
				filePath = Constants.WINDOWS_ORDER_DIC;
			} else if (osName.contains("Linux")) {
				filePath = Constants.LINUX_ORDER_DIC;
			}
			//相对路径
			String path = "/"+name + "." + ext;
			File file = new File(filePath);
			if(!file.exists()){
				file.mkdirs();
			}
			myFile.transferTo(new File(filePath+path));
			json.put("success", Constants.NGINX_URL+path);
			json.put("errCode", Constants.result_success);
			json.put("errMsg", "上传成功！");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json ;

	}

	/**
	 *
	 * @Description: 七牛云上传文件
	 * @author shenjinni
	 * @return void
	 */
	@RequestMapping("/qnUploadFile.json")
	public void qnUploadFile(HttpServletRequest reuqest, HttpServletResponse reponse) {
		PrintWriter out = null;
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) reuqest;
			MultipartFile file1 = multipartRequest.getFile("upfile");
			String mulFileName=file1.getOriginalFilename();
			/*String str = DateUtils.formatDate(new Date(), DateUtils.DATE1)+new Random(23);
			String key=Constants.qiniu_upload_file_dir + DateUtils.formatDate(new Date(), DateUtils.DATETIME2) + "_"+mulFileName;
			File s=new File(str);
			file1.transferTo(s);
			UploadFile uf=new UploadFile();
			String token=uf.getUpToken0();
			uf.upload(s.getPath(), key, token);
			reponse.setContentType("text/html;charset=UTF-8");
			out = reponse.getWriter();
			JSONObject json = new JSONObject();
			// 百度云必须返回json 按照下列要求返回
			json.put("url",Constants.qiniu_outside_url+key+"?download/"+mulFileName);
			json.put("fileName", key);
			out.print(json.toString());
			s.delete();
			log.info("七牛云上传文件成功：" + key);*/
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} /*catch (IOException e) {
			e.printStackTrace();
			log.error("七牛云上传文件失败："+ StringUtil.getStackTrace(e));
		} */finally {
			if (out != null) {
				out.close();
			}
		}
	}



	/**
	 *
	 * @Description: 上传图片
	 * @author shenjinni
	 * @return void
	 */
	@RequestMapping("/qnUploadImage.json")
	public void qnUploadImage(HttpServletRequest reuqest, HttpServletResponse reponse) {
		PrintWriter out = null;
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) reuqest;
			MultipartFile myFile = multipartRequest.getFile("upfile");

			System.out.println(myFile.getOriginalFilename());
			DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			//图片名称
			String name = df.format(new Date());

			Random r = new Random();
			for(int i = 0 ;i<3 ;i++){
				name += r.nextInt(10);
			}
			//
			String ext = FilenameUtils.getExtension(myFile.getOriginalFilename());
			//保存图片       File位置 （全路径）   /upload/fileName.jpg
			String filePath = "";
			Properties props = System.getProperties();
			String osName = props.getProperty("os.name");
			if (osName.contains("Windows")) {
				filePath = Constants.WINDOWS_ORDER_DIC;
			} else if (osName.contains("Linux")) {
				filePath = Constants.LINUX_ORDER_DIC;
			}
			//相对路径
			String path = "/"+name + "." + ext;
			File file = new File(filePath);
			if(!file.exists()){
				file.mkdirs();
			}
			myFile.transferTo(new File(filePath+path));

			/*UploadFile uf=new UploadFile();
			String token=uf.getUpToken0();
			uf.upload(s.getPath(), key, token);*/
			out = reponse.getWriter();
			JSONObject json = new JSONObject();
			json.put("original", Constants.NGINX_URL+path);
			json.put("url", Constants.NGINX_URL+path);
			json.put("state", "SUCCESS");
			out.print(json.toString());
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
}