package cn.testin.controller;


import javax.annotation.Resource;

import cn.testin.service.CloudWorkFactoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *<pre>
 * 对象功能:cloud_work_factory 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:02:26
 *</pre>
 */
@Controller
@RequestMapping("/work/")
public class CloudWorkFactoryController
{
	@Resource
	private CloudWorkFactoryService cloudWorkFactoryService;
	
	
	/**
	 * 添加或更新cloud_work_factory。
	 * @param request
	 * @param response
	 * @param CloudWorkFactory 添加或更新的实体
	 * @param bindResult
	 * @param viewName
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("save")
	@Action(description="添加或更新cloud_work_factory")
	public void save(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String resultMsg=null;		
		CloudWorkFactory CloudWorkFactory=getFormObject(request);
		try{
			if(CloudWorkFactory.getId()==null||CloudWorkFactory.getId()==0){
				CloudWorkFactory.setId(UniqueIdUtil.genId());
				CloudWorkFactoryService.add(CloudWorkFactory);
				resultMsg=getText("record.added","cloud_work_factory");
			}else{
			    CloudWorkFactoryService.update(CloudWorkFactory);
				resultMsg=getText("record.updated","cloud_work_factory");
			}
			writeResultMessage(response.getWriter(),resultMsg,ResultMessage.Success);
		}catch(Exception e){
			writeResultMessage(response.getWriter(),resultMsg+","+e.getMessage(),ResultMessage.Fail);
		}
	}
	
	*//**
	 * 取得 CloudWorkFactory 实体 
	 * @param request
	 * @return
	 * @throws Exception
	 *//*
    protected CloudWorkFactory getFormObject(HttpServletRequest request) throws Exception {
    
    	JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher((new String[] { "yyyy-MM-dd" })));
    
		String json=RequestUtil.getString(request, "json");
		JSONObject obj = JSONObject.fromObject(json);
		
		CloudWorkFactory CloudWorkFactory = (CloudWorkFactory)JSONObject.toBean(obj, CloudWorkFactory.class);
		
		return CloudWorkFactory;
    }
	
	*//**
	 * 取得cloud_work_factory分页列表
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("list")
	@Action(description="查看cloud_work_factory分页列表")
	public ModelAndView list(HttpServletRequest request,HttpServletResponse response) throws Exception
	{	
		List<CloudWorkFactory> list=CloudWorkFactoryService.getAll(new QueryFilter(request,"CloudWorkFactoryItem"));
		ModelAndView mv=this.getAutoView().addObject("CloudWorkFactoryList",list);
		
		return mv;
	}
	
	*//**
	 * 删除cloud_work_factory
	 * @param request
	 * @param response
	 * @throws Exception
	 *//*
	@RequestMapping("del")
	@Action(description="删除cloud_work_factory")
	public void del(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String preUrl= RequestUtil.getPrePage(request);
		ResultMessage message=null;
		try{
			Long[] lAryId =RequestUtil.getLongAryByStr(request, "id");
			CloudWorkFactoryService.delByIds(lAryId);
			message=new ResultMessage(ResultMessage.Success, "删除cloud_work_factory成功!");
		}catch(Exception ex){
			message=new ResultMessage(ResultMessage.Fail, "删除失败" + ex.getMessage());
		}
		addMessage(message, request);
		response.sendRedirect(preUrl);
	}
	
	*//**
	 * 	编辑cloud_work_factory
	 * @param request
	 * @param response
	 * @throws Exception
	 *//*
	@RequestMapping("edit")
	@Action(description="编辑cloud_work_factory")
	public ModelAndView edit(HttpServletRequest request) throws Exception
	{
		Long id=RequestUtil.getLong(request,"id");
		String returnUrl=RequestUtil.getPrePage(request);
		CloudWorkFactory CloudWorkFactory=CloudWorkFactoryService.getById(id);
		
		return getAutoView().addObject("CloudWorkFactory",CloudWorkFactory).addObject("returnUrl", returnUrl);
	}

	*//**
	 * 取得cloud_work_factory明细
	 * @param request   
	 * @param response
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("get")
	@Action(description="查看cloud_work_factory明细")
	public ModelAndView get(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		long id=RequestUtil.getLong(request,"id");
		CloudWorkFactory CloudWorkFactory = CloudWorkFactoryService.getById(id);	
		return getAutoView().addObject("CloudWorkFactory", CloudWorkFactory);
	}*/
	
}
