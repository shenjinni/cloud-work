package cn.testin.controller;

import cn.testin.constant.Constants;
import cn.testin.util.StringUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.http.client.utils.DateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

/**
 * 
 * @ClassName: QiniuUploadController 
 * @Description: 七牛云上传控制类
 * @author tianpengw 
 * @date 2017年3月21日 下午2:05:17 
 *
 */
@Controller
@RequestMapping("/common/qiniu")
public class QiniuUploadController {
	
	private static Logger log = LogManager.getLogger(QiniuUploadController.class);
	
	/*@RequestMapping("/ckUpload.json")
	public ModelAndView ckUpload(@RequestParam("upload") MultipartFile file, HttpServletRequest request , HttpServletResponse response) {
		// 服务器目录
		String key= Constants.qiniu_upload_file_dir+file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("upload");  
		String fileName = file.getOriginalFilename();  
		File targetFile = new File(path, fileName);  
		if(!targetFile.exists()){  
			targetFile.mkdirs();  
		}  
		
		//保存  
		try {  
			file.transferTo(targetFile);  
		} catch (Exception e) {  
			e.printStackTrace();  
		}
		UploadFile uf=new UploadFile(); 
		String token=uf.getUpToken0();
		uf.upload(path+File.separator+fileName, key, token);
		String CKEditorFuncNum = request.getParameter("CKEditorFuncNum");
		String s =  "<script type='text/javascript'>"
				+ "window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum
				+ ",'" + Constants.qiniu_outside_url +key+ "',''" + ")"+"</script>";
		
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(s);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}*/
	/**
	 * 
	 * @Description: 七牛云上传文件
	 * @author tianpengw 
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
			log.error("七牛云上传文件失败："+ StringUtil.getStackTrace(e));
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
	 * @Description: 上传文件
	 * @author tianpengw 
	 * @return void
	 */
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
			uf.upload(s.getPath(), key, token);
			reponse.setContentType("text/html;charset=UTF-8"); 
			out = reponse.getWriter();
			JSONObject json = new JSONObject();
			String url =  key;
			json.put("url", url);
			out.print(json);
			s.delete();
			log.info("七牛云上传操作成功：" + key);*/
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
	
	/**
	 * 
	 * @Description: 上传图片
	 * @author tianpengw 
	 * @return void
	 */
	@RequestMapping("/qnUploadImage.json")
	public void qnUploadImage(HttpServletRequest reuqest, HttpServletResponse reponse) {
		PrintWriter out = null;
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) reuqest;
			MultipartFile file1 = multipartRequest.getFile("upfile");
			
			String mulFileName= file1.getOriginalFilename();
			int numLast=mulFileName.lastIndexOf(".");
			String str = mulFileName.substring(0, numLast);
			String key = Constants.qiniu_upload_image_dir + System.currentTimeMillis() + ".jpg";
			
			File s = new File(str);
			file1.transferTo(s);
			/*UploadFile uf=new UploadFile();
			String token=uf.getUpToken0();
			uf.upload(s.getPath(), key, token);*/
			out = reponse.getWriter();
			JSONObject json = new JSONObject();
			String url = Constants.qiniu_outside_url + key;
			// 百度云必须返回json 按照下列要求返回
			json.put("original", url);
			json.put("url", url);
			json.put("state", "SUCCESS");
			out.print(json.toString());
			s.delete();
			log.info("七牛云上传图片成功：" + key);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			log.error("七牛云上传图片失败："+ StringUtil.getStackTrace(e));
		} catch (IOException e) {
			e.printStackTrace();
			log.error("七牛云上传图片失败："+ StringUtil.getStackTrace(e));
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
}

