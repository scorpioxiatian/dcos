package com.mvc.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Restrictions;

import com.mvc.entity.AppNutch;


public class AppNutchDao extends BaseDao<AppNutch, Integer>{
	
	public AppNutchDao(){
		super(AppNutch.class);
	}
	
	public List<AppNutch> getAllNutch(){
		return super.getAll();
	}
	
	public List<AppNutch> getSomeNutch(Integer n){
		return super.getSome(n);
	}
	
	public AppNutch getNutchByID(Integer id){
		try{
			return super.get(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public Integer getLateTimeByAppid(Integer appid) {
		// TODO Auto-generated method stub
		List<AppNutch> list = new ArrayList<AppNutch>();
		list = super.findBy("app_id", appid, "id", true);
		if(!list.isEmpty())
			return list.get(list.size()).getNutch_resp_time();
		return null;
	}

	public List<AppNutch> getSlaveList(String master_name) {
		List<AppNutch> list = new ArrayList<AppNutch>();
		list = super.findBy("id", true, 
				Restrictions.sqlRestriction(" master_name = '" + master_name +"'" ));
		System.out.println(master_name);
		System.out.println(list.size());
		return list;
	}
		

}
