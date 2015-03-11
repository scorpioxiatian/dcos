package com.mvc.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.criterion.Restrictions;

import com.mvc.entity.AppTomcat;

public class AppTomcatDao extends BaseDao<AppTomcat, Integer> {

	public AppTomcatDao() {
		super(AppTomcat.class);
		// TODO Auto-generated constructor stub
	}

	public AppTomcatDao(Class<AppTomcat> type) {
		super(type);
		// TODO Auto-generated constructor stub
	}
	


//	@SuppressWarnings("unchecked")
//	public Integer getLateTime(String hostname) {
//		
//		List<AppTomcat> list = new ArrayList<AppTomcat>();
//		list = super.findBy("tomcat_hostname", hostname, "tomcat_hostname", true);
////		String sql = "select a.response_time from app_tomcat a where vm_name='"+hostname+"' order by app_tomcat desc limit 1 ";
////		SQLQuery query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createSQLQuery(sql);
////		List<Integer> res = query.list();
//		if(!list.isEmpty())
//			return list.get(0).getResponse_time();
//		return null;
//	}
	
	@SuppressWarnings("unchecked")
	public List<String> getAllHostname(){
		String sql = "select distinct(an.vm_name) from app_tomcat an"; 
		SQLQuery query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createSQLQuery(sql);
		List<String> list = query.list();
		return list;
		
	}

//	获得平均响应时间
	@SuppressWarnings("unchecked")
	public Integer getAverLateTime(String hostname) {
		Integer sumtime = 0;
		String sql = "select a.response_time from app_tomcat a where vm_name='"+hostname+"' order by id desc limit 5 ";
		SQLQuery query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createSQLQuery(sql);
		List<Integer> res = query.list();
		if(null != res){
			for(int i=0; i<res.size(); i++){
				sumtime += res.get(i);
			}
			System.out.println(sumtime / res.size());
			return (sumtime / res.size());
		}
		return null;
		
	}




}
