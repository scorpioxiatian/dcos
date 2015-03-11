package com.mvc.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.FlushMode;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.mvc.dao.IBaseDao;

/**
 * 提供hibernate dao的所有操作 * 
 */
@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW )
public class BaseDao<T,PK extends Serializable> extends HibernateDaoSupport implements IBaseDao<T,PK> {
	protected Class<T> entityClass;			// DAO所管理的Entity类型.
    
    /**
     *让spring提供构造函数注入
     */
    public BaseDao(Class<T> type) {
        this.entityClass = type;
        //this.getHibernateTemplate().getSessionFactory().getCurrentSession().setFlushMode(FlushMode.AUTO);
    }
    
    public BaseDao(){
    }

    protected Class<T> getEntityClass() {
        return entityClass;
    }

	@Override
	public T get(PK id) {
		  return getHibernateTemplate().load(getEntityClass(), id);
	}
	
	@Override
	public List<T> getAll() {
		return (List<T>)(getHibernateTemplate().loadAll(getEntityClass()));
	}
	
	
	
	@Override
	@SuppressWarnings("unchecked")
	public List<T> getAll(String orderBy, boolean isAsc) {
		Assert.hasText(orderBy);
        if (isAsc)
            return (List<T>) getHibernateTemplate().findByCriteria(
                    DetachedCriteria.forClass(getEntityClass()).addOrder(Order.asc(orderBy)));
        else
            return (List<T>) getHibernateTemplate().findByCriteria(
                    DetachedCriteria.forClass(getEntityClass()).addOrder(Order.desc(orderBy)));
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<T> findBy(String orderBy, boolean isAsc, Criterion... criterions) {
    	DetachedCriteria criteria = DetachedCriteria.forClass(getEntityClass());
        for (Criterion c : criterions) {
            criteria.add(c);
        }
        if (isAsc)
        	criteria.addOrder(Order.asc(orderBy));
        else
        	criteria.addOrder(Order.desc(orderBy));

        return (List<T>) getHibernateTemplate().findByCriteria(criteria);
	}

	@Override
	public List<T> findBy(String propertyName, Object value, String orderBy, boolean isAsc) {
        Assert.hasText(propertyName);
        Assert.hasText(orderBy);
        return findBy(orderBy, isAsc, Restrictions.eq(propertyName, value));
        //return createCriteria(orderBy, isAsc, Restrictions.eq(propertyName, value)).list();
	}
	
	@Override
	public List<T> findLike(String propertyName, Object value, String orderBy, boolean isAsc) {
        Assert.hasText(propertyName);
        Assert.hasText(orderBy);
        return findBy(orderBy, isAsc, Restrictions.or(Restrictions.like(propertyName, value.toString(), MatchMode.START)));
        //return createCriteria(orderBy, isAsc, Restrictions.eq(propertyName, value)).list();
	}
	
	@Override
	public void save(T entity) {
		//add here
		getHibernateTemplate().getSessionFactory().getCurrentSession().setFlushMode(FlushMode.AUTO);
		getHibernateTemplate().save(entity);//saveOrUpdate()
		getHibernateTemplate().flush(); 
	}
	
	@Override
	public void update(T entity) {
		//add here
		getHibernateTemplate().getSessionFactory().getCurrentSession().setFlushMode(FlushMode.AUTO);
		getHibernateTemplate().clear();  
		getHibernateTemplate().update(entity);
		getHibernateTemplate().flush(); 
	}
	
	@Override
	public void remove(T entity) {
		getHibernateTemplate().getSessionFactory().getCurrentSession().setFlushMode(FlushMode.AUTO);
		getHibernateTemplate().delete(entity);
		getHibernateTemplate().flush();
	}
	
	@Override
	public void removeById(PK id) {
		remove(get(id));
	}
	
	@Override
	public void evit(T entity) {
		getHibernateTemplate().evict(entity);
	}
	
	@Override
	public void flush() {
		getHibernateTemplate().flush();
	}
	
	@Override
	public void clear() {
		getHibernateTemplate().clear();
	}

	@Override
	public List<T> getSome(Integer n) {
	
		List<T> ll = this.getAll();
		List<T> ls = new ArrayList<T>();
		if(ll.size() > n){
			for(Integer i=0; i<n; i++){
				ls.add(ll.get(i));
			}
			return ls;
		}
		return ll;
	}
	
	@SuppressWarnings("unchecked")
	public List<T> pageDivideList(int pageNo,int pageSize) {
	    DetachedCriteria criteria=DetachedCriteria.forClass(getEntityClass());
		int firstResult=(pageNo-1)*pageSize;
		return (List<T>) getHibernateTemplate().findByCriteria(criteria,firstResult,pageSize);
	}
	


}