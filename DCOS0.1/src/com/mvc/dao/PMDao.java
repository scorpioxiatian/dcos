package com.mvc.dao;

import java.util.List;

import com.mvc.entity.PM;


public class PMDao extends BaseDao<PM, String> {
	
	public PMDao(){
		super(PM.class);
	}

	public List<PM> getAllPM(){
		return super.getAll();
	}
	
	public List<PM> getSomePM(Integer n){
		return super.getSome(n);
	}
	
	public PM getByHostname(String hostname){
		return super.get(hostname);
	}
	
	public  List<PM> getPageListPM(Integer pageNo, Integer pageSize){
		return super.pageDivideList(pageNo, pageSize);
	}
	

}
