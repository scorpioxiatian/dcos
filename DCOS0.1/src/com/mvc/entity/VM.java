package com.mvc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@org.hibernate.annotations.Proxy(lazy=false)
@Table(name="vm")
public class VM {
	
	@Column(name="vm_name", nullable=false, length=20)
	@Id	
    private String vm_hostname;
	
	@Column(name="uid", nullable=true)
	private String uid;
	
	@ManyToOne(targetEntity=PM.class, fetch=FetchType.LAZY)	
	@org.hibernate.annotations.Cascade({org.hibernate.annotations.CascadeType.LOCK})	
	@JoinColumns({ @JoinColumn(name="pm_name", referencedColumnName="pm_name", nullable=true) })
    private PM pm;
    
	@Column(name="vm_cpu", nullable=true)
    private Integer vm_cpu;
	
	@Column(name="vm_mem", nullable=true)
    private Integer vm_mem;
	
	@Column(name="cpu_utilization", nullable=false)
    private Float cpu_utilization;
	
	@Column(name="mem_utilization", nullable=false)
    private Float mem_utilization;
	
	@Column(name="vm_state", nullable=true, length=20)
    private String vm_state;
	
	@Column(name="app_type", nullable=true)
	private String app_type;
	
	@Column(name="vm_type", nullable=true)
	private String vm_type;


	public String getVm_hostname() {
		return vm_hostname;
	}

	public void setVm_hostname(String vm_hostname) {
		this.vm_hostname = vm_hostname;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public PM getPm() {
		return pm;
	}

	public void setPm(PM pm) {
		this.pm = pm;
	}

	public Integer getVm_cpu() {
		return vm_cpu;
	}

	public void setVm_cpu(Integer vm_cpu) {
		this.vm_cpu = vm_cpu;
	}

	public Integer getVm_mem() {
		return vm_mem;
	}

	public void setVm_mem(Integer vm_mem) {
		this.vm_mem = vm_mem;
	}

	public Float getCpu_utilization() {
		return cpu_utilization;
	}

	public void setCpu_utilization(Float cpu_utilization) {
		this.cpu_utilization = cpu_utilization;
	}

	public Float getMem_utilization() {
		return mem_utilization;
	}

	public void setMem_utilization(Float mem_utilization) {
		this.mem_utilization = mem_utilization;
	}

	public String getVm_state() {
		return vm_state;
	}

	public void setVm_state(String vm_state) {
		this.vm_state = vm_state;
	}


	public String getApp_type() {
		return app_type;
	}

	public void setApp_type(String app_type) {
		this.app_type = app_type;
	}

	public String getVm_type() {
		return vm_type;
	}

	public void setVm_type(String vm_type) {
		this.vm_type = vm_type;
	}

	@Override
	public String toString() {
		return "VM [vm_Hostname=" + vm_hostname + ", uid=" + uid + ", pm=" + pm
				+ ", vm_cpu=" + vm_cpu + ", vm_mem=" + vm_mem
				+ ", cpu_utilization=" + cpu_utilization + ", mem_utilization="
				+ mem_utilization + ", vm_state=" + vm_state + ", app_type="
				+ app_type + ", vm_type=" + vm_type + "]";
	}


	
	    
	

}
