package com.mvc.manager;

import java.util.List;

import com.mvc.dao.AppNutchDao;
import com.mvc.dao.AppTomcatDao;
import com.mvc.dao.BatchAppDao;
import com.mvc.dao.PMDao;
import com.mvc.dao.VMDao;
import com.mvc.entity.PM;
import com.mvc.entity.VM;
import schedule.*;


public class SourceManager {
	
	private PMDao pmDao;
	private VMDao vmDao;
	private AppNutchDao appNutchDao;
	private AppTomcatDao appTomcatDao;
	private BatchAppDao batchAppDao;
	
	public PMDao getPmDao() {
		return pmDao;
	}
	public void setPmDao(PMDao pmDao) {
		this.pmDao = pmDao;
	}
	public VMDao getVmDao() {
		return vmDao;
	}
	public void setVmDao(VMDao vmDao) {
		this.vmDao = vmDao;
	}
	public AppNutchDao getAppNutchDao() {
		return appNutchDao;
	}
	public void setAppNutchDao(AppNutchDao appNutchDao) {
		this.appNutchDao = appNutchDao;
	}
	public AppTomcatDao getAppTomcatDao() {
		return appTomcatDao;
	}
	public void setAppTomcatDao(AppTomcatDao appTomcatDao) {
		this.appTomcatDao = appTomcatDao;
	}
	public BatchAppDao getBatchAppDao() {
		return batchAppDao;
	}
	public void setBatchAppDao(BatchAppDao batchAppDao) {
		this.batchAppDao = batchAppDao;
	}
	
	
	public List<PM> getPagePM(Integer no, Integer size){
		return pmDao.pageDivideList(no, size);
	}
	public List<VM> getPageVM(Integer no, Integer size){
		return vmDao.pageDivideList(no, size);
	}
	
	public int mannerVM(String hostname, int cpu, int mem){
		WebOperate wo = new WebOperate();
		return wo.resizeVM(hostname, cpu, mem);
	}
	
	public String mannerPM(String hostname, String manner){
		return null;
	}
	public int callPause(String hostname) {
		WebOperate wo = new WebOperate();
		return wo.controlVM(hostname, 1);
	}
	public int callSuspend(String hostname) {
		WebOperate wo = new WebOperate();
		return wo.controlVM(hostname, 2);
		
	}
	
	
	
	
	

}
