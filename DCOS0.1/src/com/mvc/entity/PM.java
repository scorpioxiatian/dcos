package com.mvc.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@org.hibernate.annotations.Proxy(lazy=false)
@Table(name="pm")
public class PM {
	
	@Column(name="pm_name", nullable=false, length=20)
	@Id	
    private String pm_name;
	
	@Column(name="dcos_id", nullable=true)
    private BigInteger dcos_id;
    
	@Column(name="pm_ip", nullable=true, length=20)
    private String pm_ip;
	
	@Column(name="mem_size", nullable=true)
    private BigInteger mem_size;
	
	@Column(name="mem_used", nullable=true)
    private BigInteger mem_used;
	
	@Column(name="disk_size", nullable=true)
    private BigInteger disk_size;
	
	@Column(name="disk_used", nullable=true)
    private BigInteger disk_used;
	
	@Column(name="cpu_utilization", nullable=false)
    private Float cpu_utilization;
	
	@Column(name="mem_utilization", nullable=false)
    private Float mem_utilization;
	
	@Column(name="max_vm_number", nullable=true)
    private Integer max_vm_number;
	
	@Column(name="cores", nullable=true)
    private Integer cores;
	
	@Column(name="cores_used", nullable=true)
    private Integer cores_used;

	public String getPm_name() {
		return pm_name;
	}

	public void setPm_name(String pm_name) {
		this.pm_name = pm_name;
	}

	public BigInteger getDcos_id() {
		return dcos_id;
	}

	public void setDcos_id(BigInteger dcos_id) {
		this.dcos_id = dcos_id;
	}

	public String getPm_ip() {
		return pm_ip;
	}

	public void setPm_ip(String pm_ip) {
		this.pm_ip = pm_ip;
	}

	public BigInteger getMem_size() {
		return mem_size;
	}

	public void setMem_size(BigInteger mem_size) {
		this.mem_size = mem_size;
	}

	public BigInteger getMem_used() {
		return mem_used;
	}

	public void setMem_used(BigInteger mem_used) {
		this.mem_used = mem_used;
	}

	public BigInteger getDisk_size() {
		return disk_size;
	}

	public void setDisk_size(BigInteger disk_size) {
		this.disk_size = disk_size;
	}

	public BigInteger getDisk_used() {
		return disk_used;
	}

	public void setDisk_used(BigInteger disk_used) {
		this.disk_used = disk_used;
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

	public Integer getMax_vm_number() {
		return max_vm_number;
	}

	public void setMax_vm_number(Integer max_vm_number) {
		this.max_vm_number = max_vm_number;
	}

	public Integer getCores() {
		return cores;
	}

	public void setCores(Integer cores) {
		this.cores = cores;
	}

	public Integer getCores_used() {
		return cores_used;
	}

	public void setCores_used(Integer cores_used) {
		this.cores_used = cores_used;
	}

	@Override
	public String toString() {
		return "PM [pm_name=" + pm_name + ", dcos_id=" + dcos_id + ", pm_ip="
				+ pm_ip + ", mem_size=" + mem_size + ", mem_used=" + mem_used
				+ ", disk_size=" + disk_size + ", disk_used=" + disk_used
				+ ", cpu_utilization=" + cpu_utilization + ", mem_utilization="
				+ mem_utilization + ", max_vm_number=" + max_vm_number
				+ ", cores=" + cores + ", cores_used=" + cores_used + "]";
	}

	
	
}
