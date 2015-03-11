package com.mvc.dao;

import java.util.List;

import com.mvc.entity.VM;

public class VMDao extends BaseDao<VM, String> {
	
	public VMDao(){
		super(VM.class);
	}

	public List<VM> getAllVM(){
		return super.getAll();
	}
	
	public List<VM> getSomeVM(Integer n){
		return super.getSome(n);
	}
	
	public VM getByHostname(String hostname){
		return super.get(hostname);
	}
	
}
