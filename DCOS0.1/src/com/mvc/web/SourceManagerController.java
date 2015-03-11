package com.mvc.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.mvc.manager.OverviewManager;
import com.mvc.manager.SourceManager;

@Controller
public class SourceManagerController {
	
	private Integer totalRecord,totalPageNo;
	
	@Resource(name="sourceManager")
	private SourceManager sourceManager;
	
	@Resource(name="overviewManager")
	private OverviewManager overviewManager;
	
	@RequestMapping("/getSourcePM")
	public String getSourcePM(Integer size, Integer pageno, HttpServletRequest request){
		this.totalRecord = overviewManager.getAllPM().size();
		totalPageNo = totalRecord / size;
		if(0 != totalRecord % size ) 
			++totalPageNo;
		if(pageno < 1) pageno = 1;
		if(pageno > totalPageNo) pageno = totalPageNo;
		request.setAttribute("listPM", sourceManager.getPagePM(pageno, size));
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("totalPageNo", totalPageNo);
		request.setAttribute("pageno", pageno);
		return "/m_pmresource";
	}
	
	@RequestMapping("/getSourceVM")
	public String getSourceVM(Integer size, Integer pageno, HttpServletRequest request){
		System.out.println("size------>"+size);
		System.out.println("pageno----->"+pageno);
		this.totalRecord = overviewManager.getAllVM().size();
		totalPageNo = totalRecord / size;
		if(0 != totalRecord % size ) 
			++totalPageNo;
		if(pageno < 1) pageno = 1;
		if(pageno > totalPageNo) pageno = totalPageNo;
		request.setAttribute("listVM", sourceManager.getPageVM(pageno, size));
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("totalPageNo", totalPageNo);
		request.setAttribute("pageno", pageno);
		return "/m_vmresource";
	}
	
	@RequestMapping(value="/updatePM" , method = RequestMethod.POST)
	public String updatePM(String hostname,String cpu, String mem, HttpServletRequest request){
		System.out.println("-->"+hostname);
		System.out.println("-->"+cpu);
		System.out.println("-->"+mem);
		//Î´Ö´ÐÐÈÎºÎ²Ù×÷¡£¡£
		return "redirect:/getSourcePM?size=10&pageno=1";
	}
	
	@RequestMapping(value="/updateVM" , method = RequestMethod.POST)
	public String  updateVM(String hostname,String cpu, String mem, HttpServletRequest request){
		int r = sourceManager.mannerVM(hostname, Integer.parseInt(cpu), Integer.parseInt(mem));	
		if(1==r)
			request.setAttribute("update", true);
		else 
			request.setAttribute("update", false);
		return "redirect:/getSourceVM?size=10&pageno=1";
		
	}
	
	//ÔÝÍ£
	@RequestMapping(value="/callPauseVM", method = RequestMethod.GET)
	public String callPauseVM(Integer size, Integer pageno,String hostname, HttpServletRequest request){

		sourceManager.callPause(hostname);
		this.totalRecord = overviewManager.getAllVM().size();
		totalPageNo = totalRecord / size;
		if(0 != totalRecord % size ) 
			++totalPageNo;
		if(pageno < 1) pageno = 1;
		if(pageno > totalPageNo) pageno = totalPageNo;
		request.setAttribute("listVM", sourceManager.getPageVM(pageno, size));
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("totalPageNo", totalPageNo);
		request.setAttribute("pageno", pageno);

		return "/m_vmresource";
	}
	
	//»Ö¸´
	@RequestMapping(value="/callSuspendVM", method = RequestMethod.GET)
	public String callSuspendVM(Integer size, Integer pageno, String hostname, HttpServletRequest request){

		sourceManager.callSuspend(hostname);
		this.totalRecord = overviewManager.getAllVM().size();
		totalPageNo = totalRecord / size;
		if(0 != totalRecord % size ) 
			++totalPageNo;
		if(pageno < 1) pageno = 1;
		if(pageno > totalPageNo) pageno = totalPageNo;
		request.setAttribute("listVM", sourceManager.getPageVM(pageno, size));
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("totalPageNo", totalPageNo);
		request.setAttribute("pageno", pageno);

		return "/m_vmresource";
	
	}
}
