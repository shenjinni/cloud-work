package cn.testin.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.testin.service.CloudWorkPersonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *<pre>
 * 对象功能:cloud_work_person 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:02:52
 *</pre>
 */
@Controller
@RequestMapping("/testin/cloudWorkPerson/cloudWorkPerson/CloudWorkPerson/")
public class CloudWorkPersonController
{
	@Resource
	private CloudWorkPersonService cloudWorkPersonService;
	
	
	/**
	 * 添加或更新cloud_work_person。
	 * @param request
	 * @param response
	 * @param CloudWorkPerson 添加或更新的实体
	 * @param bindResult
	 * @param viewName
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("save")
	@Action(description="添加或更新cloud_work_person")
	public void save(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String resultMsg=null;		
		CloudWorkPerson CloudWorkPerson=getFormObject(request);
		try{
			if(CloudWorkPerson.getId()==null||CloudWorkPerson.getId()==0){
				CloudWorkPerson.setId(UniqueIdUtil.genId());
				CloudWorkPersonService.add(CloudWorkPerson);
				resultMsg=getText("record.added","cloud_work_person");
			}else{
			    CloudWorkPersonService.update(CloudWorkPerson);
				resultMsg=getText("record.updated","cloud_work_person");
			}
			writeResultMessage(response.getWriter(),resultMsg,ResultMessage.Success);
		}catch(Exception e){
			writeResultMessage(response.getWriter(),resultMsg+","+e.getMessage(),ResultMessage.Fail);
		}
	}
	
	*//**
	 * 取得 CloudWorkPerson 实体 
	 * @param request
	 * @return
	 * @throws Exception
	 *//*
    protected CloudWorkPerson getFormObject(HttpServletRequest request) throws Exception {
    
    	JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher((new String[] { "yyyy-MM-dd" })));
    
		String json=RequestUtil.getString(request, "json");
		JSONObject obj = JSONObject.fromObject(json);
		
		CloudWorkPerson CloudWorkPerson = (CloudWorkPerson)JSONObject.toBean(obj, CloudWorkPerson.class);
		
		return CloudWorkPerson;
    }
	
	*//**
	 * 取得cloud_work_person分页列表
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("list")
	@Action(description="查看cloud_work_person分页列表")
	public ModelAndView list(HttpServletRequest request,HttpServletResponse response) throws Exception
	{	
		List<CloudWorkPerson> list=CloudWorkPersonService.getAll(new QueryFilter(request,"CloudWorkPersonItem"));
		ModelAndView mv=this.getAutoView().addObject("CloudWorkPersonList",list);
		
		return mv;
	}
	
	*//**
	 * 删除cloud_work_person
	 * @param request
	 * @param response
	 * @throws Exception
	 *//*
	@RequestMapping("del")
	@Action(description="删除cloud_work_person")
	public void del(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String preUrl= RequestUtil.getPrePage(request);
		ResultMessage message=null;
		try{
			Long[] lAryId =RequestUtil.getLongAryByStr(request, "id");
			CloudWorkPersonService.delByIds(lAryId);
			message=new ResultMessage(ResultMessage.Success, "删除cloud_work_person成功!");
		}catch(Exception ex){
			message=new ResultMessage(ResultMessage.Fail, "删除失败" + ex.getMessage());
		}
		addMessage(message, request);
		response.sendRedirect(preUrl);
	}
	
	*//**
	 * 	编辑cloud_work_person
	 * @param request
	 * @param response
	 * @throws Exception
	 *//*
	@RequestMapping("edit")
	@Action(description="编辑cloud_work_person")
	public ModelAndView edit(HttpServletRequest request) throws Exception
	{
		Long id=RequestUtil.getLong(request,"id");
		String returnUrl=RequestUtil.getPrePage(request);
		CloudWorkPerson CloudWorkPerson=CloudWorkPersonService.getById(id);
		
		return getAutoView().addObject("CloudWorkPerson",CloudWorkPerson).addObject("returnUrl", returnUrl);
	}

	*//**
	 * 取得cloud_work_person明细
	 * @param request   
	 * @param response
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("get")
	@Action(description="查看cloud_work_person明细")
	public ModelAndView get(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		long id=RequestUtil.getLong(request,"id");
		CloudWorkPerson CloudWorkPerson = CloudWorkPersonService.getById(id);	
		return getAutoView().addObject("CloudWorkPerson", CloudWorkPerson);
	}*/
	
}
