package com.mvc.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@org.hibernate.annotations.Proxy(lazy=false)
@Table(name="app_tomcat")
public class AppTomcat {

	@Column(name="id", nullable=false)	
	@Id	
	@GeneratedValue(generator="MODEL_SHOPPINGDETAIL_ID_GENERATOR")	
	@org.hibernate.annotations.GenericGenerator(name="MODEL_SHOPPINGDETAIL_ID_GENERATOR", strategy="native")
	private Integer id;
	
	@Column(name="vm_name", nullable=true)
	private String tomcat_hostname;
	
	@Column(name="qos_requiremont", nullable=true)
	private Integer qos_requiremount;
	
	@Column(name="response_time", nullable=true)
	private Integer response_time;
	
	@Column(name="timestamp", nullable=true)
	private BigInteger time_stamp;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTomcat_hostname() {
		return tomcat_hostname;
	}

	public void setTomcat_hostname(String tomcat_hostname) {
		this.tomcat_hostname = tomcat_hostname;
	}

	public Integer getQos_requiremount() {
		return qos_requiremount;
	}

	public void setQos_requiremount(Integer qos_requiremount) {
		this.qos_requiremount = qos_requiremount;
	}

	public Integer getResponse_time() {
		return response_time;
	}

	public void setResponse_time(Integer response_time) {
		this.response_time = response_time;
	}

	public BigInteger getTime_stamp() {
		return time_stamp;
	}

	public void setTime_stamp(BigInteger time_stamp) {
		this.time_stamp = time_stamp;
	}

	@Override
	public String toString() {
		return "AppTomcat [tomcat_hostname=" + tomcat_hostname
				+ ", qos_requiremount=" + qos_requiremount + ", response_time="
				+ response_time + ", time_stamp=" + time_stamp + "]";
	}



}
