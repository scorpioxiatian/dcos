package com.mvc.dao;

import java.util.List;

import com.mvc.entity.BatchApp;

public class BatchAppDao extends BaseDao<BatchApp, Integer> {

	public BatchAppDao() {
		super(BatchApp.class);
		// TODO Auto-generated constructor stub
	}

	public BatchAppDao(Class<BatchApp> type) {
		super(type);
		// TODO Auto-generated constructor stub
	}
	
	public List<BatchApp>getAllBatch(){
		return super.getAll();
	}
	
	public List<BatchApp> getSomeBatch(Integer n){
		return super.getSome(n);
	}
	

}
