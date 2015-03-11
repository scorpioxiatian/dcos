package com.mvc.entity;

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
@Table(name="app_batch")
public class BatchApp {
	
	@Column(name="id", nullable=false)	
	@Id	
	@GeneratedValue(generator="MODEL_SHOPPINGDETAIL_ID_GENERATOR")	
	@org.hibernate.annotations.GenericGenerator(name="MODEL_SHOPPINGDETAIL_ID_GENERATOR", strategy="native")
	private Integer id;
	
	
	@ManyToOne(targetEntity=VM.class, fetch=FetchType.LAZY)	
	@org.hibernate.annotations.Cascade({org.hibernate.annotations.CascadeType.LOCK})	
	@JoinColumns({ @JoinColumn(name="master_name", referencedColumnName="vm_name", nullable=true) })
	private VM master;
	
	@ManyToOne(targetEntity=VM.class, fetch=FetchType.LAZY)	
	@org.hibernate.annotations.Cascade({org.hibernate.annotations.CascadeType.LOCK})	
	@JoinColumns({ @JoinColumn(name="slave_name", referencedColumnName="vm_name", nullable=true) })
	private VM slave;
	
	@Column(name="throughput", nullable=true)
	private Float throughtput;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public VM getMaster() {
		return master;
	}

	public void setMaster(VM master) {
		this.master = master;
	}

	public VM getSlave() {
		return slave;
	}

	public void setSlave(VM slave) {
		this.slave = slave;
	}

	public Float getThroughtput() {
		return throughtput;
	}

	public void setThroughtput(Float throughtput) {
		this.throughtput = throughtput;
	}

	@Override
	public String toString() {
		return "BatchApp [id=" + id + ", master=" + master + ", slave=" + slave
				+ ", throughtput=" + throughtput + "]";
	}


}
