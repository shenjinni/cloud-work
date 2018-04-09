package cn.testin.controller;

import cn.testin.service.CloudWorkLaborService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 *<pre>
 * 对象功能:cloud_work_labor 控制器类
 * 开发公司:sjn
 * 开发人员:shenjinni
 * 创建时间:2018-04-09 14:03:17
 *</pre>
 */
@Controller
@RequestMapping("/testin/cloudWorkLabor/cloudWorkLabor/CloudWorkLabor/")
public class CloudWorkLaborController
{
	@Resource
	private CloudWorkLaborService cloudWorkLaborService;
	
	
	/**
	 * 添加或更新cloud_work_labor。
	 * @param request
	 * @param response
	 * @param CloudWorkLabor 添加或更新的实体
	 * @param bindResult
	 * @param viewName
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("save")
	@Action(description="添加或更新cloud_work_labor")
	public void save(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String resultMsg=null;		
		CloudWorkLabor CloudWorkLabor=getFormObject(request);
		try{
			if(CloudWorkLabor.getId()==null||CloudWorkLabor.getId()==0){
				CloudWorkLabor.setId(UniqueIdUtil.genId());
				CloudWorkLaborService.add(CloudWorkLabor);
				resultMsg=getText("record.added","cloud_work_labor");
			}else{
			    CloudWorkLaborService.update(CloudWorkLabor);
				resultMsg=getText("record.updated","cloud_work_labor");
			}
			writeResultMessage(response.getWriter(),resultMsg,ResultMessage.Success);
		}catch(Exception e){
			writeResultMessage(response.getWriter(),resultMsg+","+e.getMessage(),ResultMessage.Fail);
		}
	}
	
	*//**
	 * 取得 CloudWorkLabor 实体 
	 * @param request
	 * @return
	 * @throws Exception
	 *//*
    protected CloudWorkLabor getFormObject(HttpServletRequest request) throws Exception {
    
    	JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher((new String[] { "yyyy-MM-dd" })));
    
		String json=RequestUtil.getString(request, "json");
		JSONObject obj = JSONObject.fromObject(json);
		
		CloudWorkLabor CloudWorkLabor = (CloudWorkLabor)JSONObject.toBean(obj, CloudWorkLabor.class);
		
		return CloudWorkLabor;
    }
	
	*//**
	 * 取得cloud_work_labor分页列表
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("list")
	@Action(description="查看cloud_work_labor分页列表")
	public ModelAndView list(HttpServletRequest request,HttpServletResponse response) throws Exception
	{	
		List<CloudWorkLabor> list=CloudWorkLaborService.getAll(new QueryFilter(request,"CloudWorkLaborItem"));
		ModelAndView mv=this.getAutoView().addObject("CloudWorkLaborList",list);
		
		return mv;
	}
	
	*//**
	 * 删除cloud_work_labor
	 * @param request
	 * @param response
	 * @throws Exception
	 *//*
	@RequestMapping("del")
	@Action(description="删除cloud_work_labor")
	public void del(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String preUrl= RequestUtil.getPrePage(request);
		ResultMessage message=null;
		try{
			Long[] lAryId =RequestUtil.getLongAryByStr(request, "id");
			CloudWorkLaborService.delByIds(lAryId);
			message=new ResultMessage(ResultMessage.Success, "删除cloud_work_labor成功!");
		}catch(Exception ex){
			message=new ResultMessage(ResultMessage.Fail, "删除失败" + ex.getMessage());
		}
		addMessage(message, request);
		response.sendRedirect(preUrl);
	}
	
	*//**
	 * 	编辑cloud_work_labor
	 * @param request
	 * @param response
	 * @throws Exception
	 *//*
	@RequestMapping("edit")
	@Action(description="编辑cloud_work_labor")
	public ModelAndView edit(HttpServletRequest request) throws Exception
	{
		Long id=RequestUtil.getLong(request,"id");
		String returnUrl=RequestUtil.getPrePage(request);
		CloudWorkLabor CloudWorkLabor=CloudWorkLaborService.getById(id);
		
		return getAutoView().addObject("CloudWorkLabor",CloudWorkLabor).addObject("returnUrl", returnUrl);
	}

	*//**
	 * 取得cloud_work_labor明细
	 * @param request   
	 * @param response
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping("get")
	@Action(description="查看cloud_work_labor明细")
	public ModelAndView get(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		long id=RequestUtil.getLong(request,"id");
		CloudWorkLabor CloudWorkLabor = CloudWorkLaborService.getById(id);	
		return getAutoView().addObject("CloudWorkLabor", CloudWorkLabor);
	}*/
	
}
