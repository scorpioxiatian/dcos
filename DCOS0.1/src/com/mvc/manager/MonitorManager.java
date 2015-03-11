package com.mvc.manager;

import java.util.ArrayList;
import java.util.List;

import com.mvc.dao.AppNutchDao;
import com.mvc.dao.AppTomcatDao;
import com.mvc.dao.VMDao;
import com.mvc.entity.AppNutch;
import com.mvc.entity.AppTomcat;
import com.mvc.entity.VM;

public class MonitorManager {
	
	private AppTomcatDao appTomcatDao;
	
	private AppNutchDao appNutchDao;
	
	private VMDao vmDao;

	public AppTomcatDao getAppTomcatDao() {
		return appTomcatDao;
	}

	public void setAppTomcatDao(AppTomcatDao appTomcatDao) {
		this.appTomcatDao = appTomcatDao;
	}

	public AppNutchDao getAppNutchDao() {
		return appNutchDao;
	}

	public void setAppNutchDao(AppNutchDao appNutchDao) {
		this.appNutchDao = appNutchDao;
	}


	public VMDao getVmDao() {
		return vmDao;
	}

	public void setVmDao(VMDao vmDao) {
		this.vmDao = vmDao;
	}

	public Integer getNutchTimeByID(Integer id){
		AppNutch nutch = appNutchDao.getNutchByID(id);
		if(null != nutch )
			return nutch.getNutch_resp_time();
		return null;
	}
	
//	//获得最新数据最后一条记录响应时间
//	public Integer getLateTotalTimeByHostname(String  hostname) {
//		return appTomcatDao.getLateTime(hostname);
//	}

	public Integer getLateNutchTimeByAppid(Integer appid) {
		return appNutchDao.getLateTimeByAppid(appid);
		
	}

	public List<String> getAllTomcatHostname() {
		List<String> list  = appTomcatDao.getAllHostname();
		if(null != list)
			return list;
		return null;
	}

	public List<VM> getSlaveListByMaster(String master_name) {
		System.out.println("-->"+master_name);
		List<AppNutch> list = appNutchDao.getSlaveList(master_name);
		List<VM> listvm = new ArrayList<VM>(); 
		if(!list.isEmpty()){
			for(int i=0; i<list.size(); i++){
				listvm.add(list.get(i).getSlave());
			}
		}
		return listvm;
	}
	
//获得最新数据最后五条记录平均响应时间
	public Integer getAverTotalTimeByHostname(String hostname) {
		return appTomcatDao.getAverLateTime(hostname);
	}

	public VM getMaster(String hostname) {
		List<VM> list = vmDao.findBy("vm_hostname", hostname, "vm_hostname", true);
		if(!list.isEmpty()){
//			System.out.println("--->"+list.get(0).toString());
			return list.get(0);
		}
		return null;
	}

}
