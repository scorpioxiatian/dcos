package com.mvc.manager;

import java.util.ArrayList;
import java.util.List;

import com.mvc.dao.AppNutchDao;
import com.mvc.dao.AppTomcatDao;
import com.mvc.dao.BatchAppDao;
import com.mvc.dao.PMDao;
import com.mvc.dao.VMDao;
import com.mvc.entity.AppNutch;
import com.mvc.entity.AppTomcat;
import com.mvc.entity.BatchApp;
import com.mvc.entity.PM;
import com.mvc.entity.VM;

public class OverviewManager {
	
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
	
	
	public List<PM> getAllPM(){
		List<PM> list = new ArrayList<PM>();
		list = pmDao.getAllPM();
		return list;
	}
	
	public List<VM> getAllVM(){
		List<VM> list = new ArrayList<VM>();
		list = vmDao.getAll();
		return list;
	}
	
	public List<AppNutch> getAllNutch(){
		List<AppNutch> list = new ArrayList<AppNutch>();
		list = appNutchDao.getAll();
		return list;
	}
	
	public List<BatchApp> getAllBatch(){
		return batchAppDao.getAll();
	}
	
	//获得部分记录
	public List<PM> getSomePM(Integer n){
		List<PM> list = new ArrayList<PM>();
		list = pmDao.getSome(n);
		return list;
	}
	
	public List<VM> getSomeVM(Integer n){
		List<VM> list = new ArrayList<VM>();
		list = vmDao.getSome(n);
		return list;
	}
	
	public List<AppNutch> getSomeNutch(Integer n){
		List<AppNutch> list = new ArrayList<AppNutch>();
		list = appNutchDao.getSome(n);
		return list;
	}
	
	public List<BatchApp> getSomeBatch(Integer n){
		List<BatchApp> list = new ArrayList<BatchApp>();
		list = batchAppDao.getSome(n);
		return list;
	}
	
	public List<AppTomcat> getSomeTomcat(int i) {
		List<AppTomcat> list = new ArrayList<AppTomcat>();
		list = appTomcatDao.getSome(i);
		return list;
	}
	
//	
//	public AppTomcat getTomcatByName(String master_name) {
//		List<AppTomcat> list = appTomcatDao.findBy("vm_name", master_name, "vm_name", true);
//		if(list != null)return list.get(0);
//		return null;
//	}
	
	//获得单独页面分页记录
	public List<PM> getPagePM(Integer no, Integer size){
		return pmDao.pageDivideList(no, size);
	}
	public List<VM> getPageVM(Integer no, Integer size){
		return vmDao.pageDivideList(no, size);
	}
	public List<AppNutch> getPageNutch(Integer no, Integer size){
		return appNutchDao.pageDivideList(no, size);
	}
	public List<BatchApp> getPageBatch(Integer no, Integer size){
		return batchAppDao.pageDivideList(no, size);
	}
	public AppTomcat getTomcatByName(String vm_hostname) {
		List<AppTomcat> list = appTomcatDao.findBy("tomcat_hostname", vm_hostname, "id", true);
		if(!list.isEmpty())
			return list.get(0);
		return null;
	}
	

	

}
