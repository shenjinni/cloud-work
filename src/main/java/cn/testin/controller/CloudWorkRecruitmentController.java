package cn.testin.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.testin.service.CloudWorkRecruitmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *<pre>
 * 对象功能:cloud_work_recruitment 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:01:52
 *</pre>
 */
@Controller
@RequestMapping("/testin/cloudWorkRecruitment/cloudWorkRecruitment/CloudWorkRecruitment/")
public class CloudWorkRecruitmentController
{
	@Resource
	private CloudWorkRecruitmentService cloudWorkRecruitmentService;
	
	
	/**
	 * 添加或更新cloud_work_recruitment。
	 * @param request
	 * @param response
	 * @param CloudWorkRecruitment 添加或更新的实体
	 * @param bindResult
	 * @param viewName
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("save")
	@Action(description="添加或更新cloud_work_recruitment")
	public void save(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String resultMsg=null;		
		CloudWorkRecruitment CloudWorkRecruitment=getFormObject(request);
		try{
			if(CloudWorkRecruitment.getId()==null||CloudWorkRecruitment.getId()==0){
				CloudWorkRecruitment.setId(UniqueIdUtil.genId());
				CloudWorkRecruitmentService.add(CloudWorkRecruitment);
				resultMsg=getText("record.added","cloud_work_recruitment");
			}else{
			    CloudWorkRecruitmentService.update(CloudWorkRecruitment);
				resultMsg=getText("record.updated","cloud_work_recruitment");
			}
			writeResultMessage(response.getWriter(),resultMsg,ResultMessage.Success);
		}catch(Exception e){
			writeResultMessage(response.getWriter(),resultMsg+","+e.getMessage(),ResultMessage.Fail);
		}
	}
	
	*//**
	 * 取得 CloudWorkRecruitment 实体 
	 * @param request
	 * @return
	 * @throws Exception
	 *//*
    protected CloudWorkRecruitment getFormObject(HttpServletRequest request) throws Exception {
    
    	JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher((new String[] { "yyyy-MM-dd" })));
    
		String json=RequestUtil.getString(request, "json");
		JSONObject obj = JSONObject.fromObject(json);
		
		CloudWorkRecruitment CloudWorkRecruitment = (CloudWorkRecruitment)JSONObject.toBean(obj, CloudWorkRecruitment.class);
		
		return CloudWorkRecruitment;
    }
	
	*//**
	 * 取得cloud_work_recruitment分页列表
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("list")
	@Action(description="查看cloud_work_recruitment分页列表")
	public ModelAndView list(HttpServletRequest request,HttpServletResponse response) throws Exception
	{	
		List<CloudWorkRecruitment> list=CloudWorkRecruitmentService.getAll(new QueryFilter(request,"CloudWorkRecruitmentItem"));
		ModelAndView mv=this.getAutoView().addObject("CloudWorkRecruitmentList",list);
		
		return mv;
	}
	
	*//**
	 * 删除cloud_work_recruitment
	 * @param request
	 * @param response
	 * @throws Exception
	 *//*
	@RequestMapping("del")
	@Action(description="删除cloud_work_recruitment")
	public void del(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String preUrl= RequestUtil.getPrePage(request);
		ResultMessage message=null;
		try{
			Long[] lAryId =RequestUtil.getLongAryByStr(request, "id");
			CloudWorkRecruitmentService.delByIds(lAryId);
			message=new ResultMessage(ResultMessage.Success, "删除cloud_work_recruitment成功!");
		}catch(Exception ex){
			message=new ResultMessage(ResultMessage.Fail, "删除失败" + ex.getMessage());
		}
		addMessage(message, request);
		response.sendRedirect(preUrl);
	}
	
	*//**
	 * 	编辑cloud_work_recruitment
	 * @param request
	 * @param response
	 * @throws Exception
	 *//*
	@RequestMapping("edit")
	@Action(description="编辑cloud_work_recruitment")
	public ModelAndView edit(HttpServletRequest request) throws Exception
	{
		Long id=RequestUtil.getLong(request,"id");
		String returnUrl=RequestUtil.getPrePage(request);
		CloudWorkRecruitment CloudWorkRecruitment=CloudWorkRecruitmentService.getById(id);
		
		return getAutoView().addObject("CloudWorkRecruitment",CloudWorkRecruitment).addObject("returnUrl", returnUrl);
	}

	*//**
	 * 取得cloud_work_recruitment明细
	 * @param request   
	 * @param response
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("get")
	@Action(description="查看cloud_work_recruitment明细")
	public ModelAndView get(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		long id=RequestUtil.getLong(request,"id");
		CloudWorkRecruitment CloudWorkRecruitment = CloudWorkRecruitmentService.getById(id);	
		return getAutoView().addObject("CloudWorkRecruitment", CloudWorkRecruitment);
	}*/
	
}
