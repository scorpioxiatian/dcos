package com.mvc.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@org.hibernate.annotations.Proxy(lazy=false)
@Table(name="app_nutch")
public class AppNutch {
	
	@Column(name="id", nullable=false)	
	@Id	
	@GeneratedValue(generator="MODEL_SHOPPINGDETAIL_ID_GENERATOR")	
	@org.hibernate.annotations.GenericGenerator(name="MODEL_SHOPPINGDETAIL_ID_GENERATOR", strategy="native")
	private Integer id;
	
	@ManyToOne(targetEntity=VM.class, fetch=FetchType.LAZY)	
	@org.hibernate.annotations.Cascade({org.hibernate.annotations.CascadeType.LOCK})	
	@JoinColumns({ @JoinColumn(name="slave_name", referencedColumnName="vm_name", nullable=true) })
	private VM slave;
	
	@ManyToOne(targetEntity=VM.class, fetch=FetchType.LAZY)	
	@org.hibernate.annotations.Cascade({org.hibernate.annotations.CascadeType.LOCK})	
	@JoinColumns({ @JoinColumn(name="master_name", referencedColumnName="vm_name", nullable=true) })
	private VM master;
	
	@Column(name="response_time", nullable=true)
	private Integer nutch_resp_time;
	
	@Column(name="timestamp", nullable=true)
	private BigInteger time_stamp;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public VM getSlave() {
		return slave;
	}
	public void setSlave(VM slave) {
		this.slave = slave;
	}
	public VM getMaster() {
		return master;
	}
	public void setMaster(VM master) {
		this.master = master;
	}
	public Integer getNutch_resp_time() {
		return nutch_resp_time;
	}
	public void setNutch_resp_time(Integer nutch_resp_time) {
		this.nutch_resp_time = nutch_resp_time;
	}
	public BigInteger getTime_stamp() {
		return time_stamp;
	}
	public void setTime_stamp(BigInteger time_stamp) {
		this.time_stamp = time_stamp;
	}
	@Override
	public String toString() {
		return "AppNutch [id=" + id + ", slave=" + slave + ", master=" + master
				+ ", nutch_resp_time=" + nutch_resp_time + ", time_stamp="
				+ time_stamp + "]";
	}

	

}
