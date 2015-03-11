package com.mvc.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.entity.AppNutch;
import com.mvc.entity.AppTomcat;
import com.mvc.entity.VM;
import com.mvc.manager.MonitorManager;

@Controller
public class MonitorController {

	@Resource(name="monitorManager")
	private MonitorManager monitorManager;
	
	@RequestMapping("/getAllTomcat")
	public String getAllTomcat(HttpServletRequest request){
		List<String> list = monitorManager.getAllTomcatHostname();
		request.setAttribute("listTomcat", monitorManager.getAllTomcatHostname());
		for(int i=0; i<list.size(); i++)
			System.out.println(list.get(i));
		return "/monitor_serverce";
	}
	
	
	@RequestMapping("/getAppTotalTime")
	public void getAppTotalTime(String hostname, HttpServletRequest request, HttpServletResponse response){

		response.setContentType("text/xml; charset=UTF-8");  
	    response.setHeader("Cache-Control","no-cache");
		try {
			PrintWriter out = response.getWriter();
			out.println("<response>");
			//获得数据库最后一条记录的响应时间
			out.write("<timetomcat>"+monitorManager.getAverTotalTimeByHostname(hostname)+"</timetomcat>");
			out.write("<timetomcat>"+monitorManager.getAverTotalTimeByHostname(hostname)+"</timetomcat>");
			out.println("</response>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ;
	}
	
	//应用监控页面
	@RequestMapping("/getMonitor")
	public void getMonitor(String hostname, HttpServletRequest request, HttpServletResponse response){

		String res = "";
		VM master = monitorManager.getMaster(hostname);
		System.out.println(master.toString());
		List<VM> slavelist = monitorManager.getSlaveListByMaster(hostname);

		response.setContentType("text/xml; charset=UTF-8");  
	    response.setHeader("Cache-Control","no-cache");
		try {
			PrintWriter out = response.getWriter();

			out.println("<response>");
			
			if(master!=null){
				res += 
						"<mastername>"+master.getVm_hostname()+"</mastername>"+
						"<mastercpu>"+master.getVm_cpu()+"</mastercpu>"+
						"<mastermem>"+master.getVm_mem()+"</mastermem>"+
						"<totaltime>"+monitorManager.getAverTotalTimeByHostname(hostname)+"</totaltime>"+
						"<mastercpuu>"+master.getCpu_utilization().intValue()*100+"</mastercpuu>"+
//						"<mastercpuu>"+(int)(Math.random()*100)+"</mastercpuu>"+
						"<mastermemu>"+master.getMem_utilization().intValue()*100+"</mastermemu>";
//						"<mastermemu>"+(int)(Math.random()*100)+"</mastermemu>";
			}
			if(!slavelist.isEmpty()){

				for(int i=0; i<slavelist.size(); i++){
					System.out.println(slavelist.get(i).toString());
					res += ("<slavenamep>"+slavelist.get(i).getPm().getPm_name()+"</slavenamep>"+
									"<slavename>"+slavelist.get(i).getVm_hostname()+"</slavename>"+
									"<slavecpu>"+slavelist.get(i).getVm_cpu()+"</slavecpu>"+ 
									"<slavemem>"+slavelist.get(i).getVm_mem()+"</slavemem>"+
									"<slavecpuu>"+slavelist.get(i).getCpu_utilization().intValue()*100+"</slavecpuu>"+
									"<slavememu>"+slavelist.get(i).getMem_utilization().intValue()*100+"</slavememu>"
//									"<slavecpuu>"+(int)(Math.random()*100)+"</slavecpuu>"+
//									"<slavememu>"+(int)(Math.random()*100)+"</slavememu>"
							);
				}

			}
			
			System.out.println(res);
			out.write(res);
			out.println("</response>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ;
	}
	
	
//    @RequestMapping(value = "/getMonitorNutchList", method = RequestMethod.POST)  
//    public @ResponseBody Map<String,AppNutch> getSlaveMap(
//    			@RequestParam(value = "master_name", required = true)String master_name) {        
//        Map<String,AppNutch> slavemap = new HashMap<String,AppNutch>();
//        List<AppNutch> list = monitorManager.getSlaveListByMaster(master_name);
//        if(!list.isEmpty()){
//	        for(int i=0; i<list.size(); i++)
//	        slavemap.put("slave"+i, list.get(i));
//        }
//        return slavemap;  
//    }  
	
	@RequestMapping("/getNutchTime")
	public void getNutchResponseTime(HttpServletRequest request, HttpServletResponse response){
		Integer appid = Integer.parseInt((String) request.getAttribute("appid"));
		response.setContentType("text/xml; charset=UTF-8");
	    response.setHeader("Cache-Control","no-cache");
		try{
			PrintWriter out = response.getWriter();
			out.println("<response>");
			out.write("<time>"+monitorManager.getLateNutchTimeByAppid(appid)+"</time>");
			out.println("</response>");
			out.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		return ;
	}
	
	
	
	
}
