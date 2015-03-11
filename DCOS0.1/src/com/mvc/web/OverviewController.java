package com.mvc.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.entity.AppNutch;
import com.mvc.entity.AppTomcat;
import com.mvc.manager.OverviewManager;

@Controller
public class OverviewController {
	
	private Integer totalRecord,totalPageNo;
	
	@Resource(name="overviewManager")
	private OverviewManager overviewManager;
	
	@RequestMapping("/loginCheck")
	private String loginUser(String username, String password ,HttpServletRequest request){
		if(username.equals("admin") && password.equals("admin")){
			return "redirect:/getOverview";
		}
		return "/login";
	}
	
	@RequestMapping("/getOverview")
	public String getOverView(HttpServletRequest request){
//
//		List<AppTomcat> list1 = new ArrayList<AppTomcat>();
//		List<AppNutch> list2 = overviewManager.getSomeNutch(4);
//		for(AppNutch li : list2){
//			list1.add(overviewManager.getTomcatByName(li.getMaster_name()));
//		}
		request.setAttribute("pmList", overviewManager.getSomePM(4));
		request.setAttribute("vmList", overviewManager.getSomeVM(4));
		request.setAttribute("nutchList",overviewManager.getSomeNutch(4));
		request.setAttribute("tomcatList", overviewManager.getSomeTomcat(4));
		request.setAttribute("batchList",overviewManager.getSomeBatch(4));
		return "/overview";
	}
	
	
	@RequestMapping("/get_pm_view")
	public String getPMView(Integer size, Integer pageno, HttpServletRequest request){
		this.totalRecord = overviewManager.getAllPM().size();
		totalPageNo = totalRecord / size;
		if(0 != totalRecord % size ) 
			++totalPageNo;
		if(pageno < 1) pageno = 1;
		if(pageno > totalPageNo) pageno = totalPageNo;
		request.setAttribute("pmList", overviewManager.getPagePM(pageno, size));
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("totalPageNo", totalPageNo);
		request.setAttribute("pageno", pageno);
		return "/view_pm";
	}
	
	@RequestMapping("/get_vm_view")
	public String getVMView(Integer size, Integer pageno, HttpServletRequest request){
		this.totalRecord = overviewManager.getAllVM().size();
		totalPageNo = totalRecord / size;
		if(0 != totalRecord % size ) 
			++totalPageNo;
		if(pageno < 1) pageno = 1;
		if(pageno > totalPageNo) pageno = totalPageNo;
		request.setAttribute("vmList", overviewManager.getPageVM(pageno, size));
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("totalPageNo", totalPageNo);
		request.setAttribute("pageno", pageno);
		return "/view_vm";
	}
	
	@RequestMapping("/get_nutch_view")
	public String getNutchView(Integer size, Integer pageno, HttpServletRequest request){
		List<AppTomcat> list1 = new ArrayList<AppTomcat>();
		List<AppNutch> list2 = overviewManager.getAllNutch();
		List<AppNutch> list3 = overviewManager.getPageNutch(pageno, size);
		for(AppNutch li : list3){
			list1.add(overviewManager.getTomcatByName(li.getMaster().getVm_hostname()));
		}
		
		this.totalRecord = list2.size();
		totalPageNo = totalRecord / size;
		if(0 != totalRecord % size ) 
			++totalPageNo;
		if(pageno < 1) pageno = 1;
		if(pageno > totalPageNo) pageno = totalPageNo;
		request.setAttribute("nutchList",list3);
		request.setAttribute("tomcatList", list1);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("totalPageNo", totalPageNo);
		request.setAttribute("pageno", pageno);
		return "/view_nutch";
	}
	
	@RequestMapping("/get_batch_view")
	public String getBatchView(Integer size, Integer pageno, HttpServletRequest request){
		this.totalRecord = overviewManager.getAllBatch().size();
		totalPageNo = totalRecord / size;
		if(0 != totalRecord % size ) 
			++totalPageNo;
		if(pageno < 1) pageno = 1;
		if(pageno > totalPageNo) pageno = totalPageNo;
		request.setAttribute("batchList", overviewManager.getPageBatch(pageno, size));
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("totalPageNo", totalPageNo);
		request.setAttribute("pageno", pageno);
		return "/view_batch";
	}
	

}
