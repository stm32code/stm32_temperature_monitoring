package com.chengxusheji.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.chengxusheji.utils.ExportExcelUtil;
import com.chengxusheji.utils.UserException;
import com.chengxusheji.service.ThresholdService;
import com.chengxusheji.po.Threshold;

//Threshold管理控制层
@Controller
@RequestMapping("/Threshold")
public class ThresholdController extends BaseController {

    /*业务层对象*/
    @Resource ThresholdService thresholdService;

	@InitBinder("threshold")
	public void initBinderThreshold(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("threshold.");
	}
	/*跳转到添加Threshold视图*/
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Model model,HttpServletRequest request) throws Exception {
		model.addAttribute(new Threshold());
		return "Threshold_add";
	}

	/*客户端ajax方式提交添加阀值信息*/
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void add(@Validated Threshold threshold, BindingResult br,
			Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		String message = "";
		boolean success = false;
		if (br.hasErrors()) {
			message = "输入信息不符合要求！";
			writeJsonResponse(response, success, message);
			return ;
		}
        thresholdService.addThreshold(threshold);
        message = "阀值添加成功!";
        success = true;
        writeJsonResponse(response, success, message);
	}
	/*ajax方式按照查询条件分页查询阀值信息*/
	@RequestMapping(value = { "/list" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void list(String addTime,Integer page,Integer rows, Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		if (page==null || page == 0) page = 1;
		if (addTime == null) addTime = "";
		if(rows != 0)thresholdService.setRows(rows);
		List<Threshold> thresholdList = thresholdService.queryThreshold(addTime, page);
	    /*计算总的页数和总的记录数*/
	    thresholdService.queryTotalPageAndRecordNumber(addTime);
	    /*获取到总的页码数目*/
	    int totalPage = thresholdService.getTotalPage();
	    /*当前查询条件下总记录数*/
	    int recordNumber = thresholdService.getRecordNumber();
        response.setContentType("text/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//将要被返回到客户端的对象
		JSONObject jsonObj=new JSONObject();
		jsonObj.accumulate("total", recordNumber);
		JSONArray jsonArray = new JSONArray();
		for(Threshold threshold:thresholdList) {
			JSONObject jsonThreshold = threshold.getJsonObject();
			jsonArray.put(jsonThreshold);
		}
		jsonObj.accumulate("rows", jsonArray);
		out.println(jsonObj.toString());
		out.flush();
		out.close();
	}

	/*ajax方式按照查询条件分页查询阀值信息*/
	@RequestMapping(value = { "/listAll" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void listAll(HttpServletResponse response) throws Exception {
		List<Threshold> thresholdList = thresholdService.queryAllThreshold();
        response.setContentType("text/json;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		JSONArray jsonArray = new JSONArray();
		for(Threshold threshold:thresholdList) {
			JSONObject jsonThreshold = new JSONObject();
			jsonThreshold.accumulate("thresholdId", threshold.getThresholdId());
			jsonArray.put(jsonThreshold);
		}
		out.println(jsonArray.toString());
		out.flush();
		out.close();
	}

	/*前台按照查询条件分页查询阀值信息*/
	@RequestMapping(value = { "/frontlist" }, method = {RequestMethod.GET,RequestMethod.POST})
	public String frontlist(String addTime,Integer currentPage, Model model, HttpServletRequest request) throws Exception  {
		if (currentPage==null || currentPage == 0) currentPage = 1;
		if (addTime == null) addTime = "";
		List<Threshold> thresholdList = thresholdService.queryThreshold(addTime, currentPage);
	    /*计算总的页数和总的记录数*/
	    thresholdService.queryTotalPageAndRecordNumber(addTime);
	    /*获取到总的页码数目*/
	    int totalPage = thresholdService.getTotalPage();
	    /*当前查询条件下总记录数*/
	    int recordNumber = thresholdService.getRecordNumber();
	    request.setAttribute("thresholdList",  thresholdList);
	    request.setAttribute("totalPage", totalPage);
	    request.setAttribute("recordNumber", recordNumber);
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("addTime", addTime);
		return "Threshold/threshold_frontquery_result"; 
	}

     /*前台查询Threshold信息*/
	@RequestMapping(value="/{thresholdId}/frontshow",method=RequestMethod.GET)
	public String frontshow(@PathVariable Integer thresholdId,Model model,HttpServletRequest request) throws Exception {
		/*根据主键thresholdId获取Threshold对象*/
        Threshold threshold = thresholdService.getThreshold(thresholdId);

        request.setAttribute("threshold",  threshold);
        return "Threshold/threshold_frontshow";
	}

	/*ajax方式显示阀值修改jsp视图页*/
	@RequestMapping(value="/{thresholdId}/update",method=RequestMethod.GET)
	public void update(@PathVariable Integer thresholdId,Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
        /*根据主键thresholdId获取Threshold对象*/
        Threshold threshold = thresholdService.getThreshold(thresholdId);

        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
		//将要被返回到客户端的对象 
		JSONObject jsonThreshold = threshold.getJsonObject();
		out.println(jsonThreshold.toString());
		out.flush();
		out.close();
	}
	
	
	/*ajax方式显示阀值修改jsp视图页*/
	@RequestMapping(value="/getRecentThreshold",method=RequestMethod.GET)
	public void getRecentThreshold(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
        /*根据主键thresholdId获取Threshold对象*/
        Threshold threshold = (Threshold)thresholdService.queryAllThreshold().get(0);  
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
		//将要被返回到客户端的对象 
		JSONObject jsonThreshold = threshold.getJsonObject();
		out.println(jsonThreshold.toString());
		out.flush();
		out.close();
	}
	
	
	

	/*ajax方式更新阀值信息*/
	@RequestMapping(value = "/{thresholdId}/update", method = RequestMethod.POST)
	public void update(@Validated Threshold threshold, BindingResult br,
			Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		String message = "";
    	boolean success = false;
		if (br.hasErrors()) { 
			message = "输入的信息有错误！";
			writeJsonResponse(response, success, message);
			return;
		}
		try {
			thresholdService.updateThreshold(threshold);
			message = "阀值更新成功!";
			success = true;
			writeJsonResponse(response, success, message);
		} catch (Exception e) {
			e.printStackTrace();
			message = "阀值更新失败!";
			writeJsonResponse(response, success, message); 
		}
	}
    /*删除阀值信息*/
	@RequestMapping(value="/{thresholdId}/delete",method=RequestMethod.GET)
	public String delete(@PathVariable Integer thresholdId,HttpServletRequest request) throws UnsupportedEncodingException {
		  try {
			  thresholdService.deleteThreshold(thresholdId);
	            request.setAttribute("message", "阀值删除成功!");
	            return "message";
	        } catch (Exception e) { 
	            e.printStackTrace();
	            request.setAttribute("error", "阀值删除失败!");
				return "error";

	        }

	}

	/*ajax方式删除多条阀值记录*/
	@RequestMapping(value="/deletes",method=RequestMethod.POST)
	public void delete(String thresholdIds,HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException {
		String message = "";
    	boolean success = false;
        try { 
        	int count = thresholdService.deleteThresholds(thresholdIds);
        	success = true;
        	message = count + "条记录删除成功";
        	writeJsonResponse(response, success, message);
        } catch (Exception e) { 
            //e.printStackTrace();
            message = "有记录存在外键约束,删除失败";
            writeJsonResponse(response, success, message);
        }
	}

	/*按照查询条件导出阀值信息到Excel*/
	@RequestMapping(value = { "/OutToExcel" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void OutToExcel(String addTime, Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
        if(addTime == null) addTime = "";
        List<Threshold> thresholdList = thresholdService.queryThreshold(addTime);
        ExportExcelUtil ex = new ExportExcelUtil();
        String _title = "Threshold信息记录"; 
        String[] headers = { "记录id","阀值上限","阀值下限","生成时间"};
        List<String[]> dataset = new ArrayList<String[]>(); 
        for(int i=0;i<thresholdList.size();i++) {
        	Threshold threshold = thresholdList.get(i); 
        	dataset.add(new String[]{threshold.getThresholdId() + "",threshold.getUpperLimit() + "",threshold.getLowerLimit() + "",threshold.getAddTime()});
        }
        /*
        OutputStream out = null;
		try {
			out = new FileOutputStream("C://output.xls");
			ex.exportExcel(title,headers, dataset, out);
		    out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
		OutputStream out = null;//创建一个输出流对象 
		try { 
			out = response.getOutputStream();//
			response.setHeader("Content-disposition","attachment; filename="+"Threshold.xls");//filename是下载的xls的名，建议最好用英文 
			response.setContentType("application/msexcel;charset=UTF-8");//设置类型 
			response.setHeader("Pragma","No-cache");//设置头 
			response.setHeader("Cache-Control","no-cache");//设置头 
			response.setDateHeader("Expires", 0);//设置日期头  
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			ex.exportExcel(rootPath,_title,headers, dataset, out);
			out.flush();
		} catch (IOException e) { 
			e.printStackTrace(); 
		}finally{
			try{
				if(out!=null){ 
					out.close(); 
				}
			}catch(IOException e){ 
				e.printStackTrace(); 
			} 
		}
    }
}
