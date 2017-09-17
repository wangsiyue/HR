package com.yc.bean;

import java.io.Serializable;

/* 创建新表 "config_file_first_kind"。                                                             */
/* "config_file_first_kind" : 一级机构设置                                                          */
/* 	"ffk_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 一级机构编号                                                                  */
/* 	"first_kind_name" : 一级机构名称                                                                */
/* 	"first_kind_salary_id" : 一级机构薪酬发放责任人编号                                                    */
/* 	"first_kind_sale_id" : 一级机构销售责任人编号                                                        */ 
public class ConfigFileFirstKind implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6502933049514913098L;
	private Integer ffk_id;
	private String first_kind_id;
	private String first_kind_name;
	private String first_kind_salary_id;
	private String first_kind_sale_id;
	public Integer getFfk_id() {
		return ffk_id;
	}
	public void setFfk_id(Integer ffk_id) {
		this.ffk_id = ffk_id;
	}
	public String getFirst_kind_id() {
		return first_kind_id;
	}
	public void setFirst_kind_id(String first_kind_id) {
		this.first_kind_id = first_kind_id;
	}
	public String getFirst_kind_name() {
		return first_kind_name;
	}
	public void setFirst_kind_name(String first_kind_name) {
		this.first_kind_name = first_kind_name;
	}
	public String getFirst_kind_salary_id() {
		return first_kind_salary_id;
	}
	public void setFirst_kind_salary_id(String first_kind_salary_id) {
		this.first_kind_salary_id = first_kind_salary_id;
	}
	public String getFirst_kind_sale_id() {
		return first_kind_sale_id;
	}
	public void setFirst_kind_sale_id(String first_kind_sale_id) {
		this.first_kind_sale_id = first_kind_sale_id;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ffk_id == null) ? 0 : ffk_id.hashCode());
		result = prime * result + ((first_kind_id == null) ? 0 : first_kind_id.hashCode());
		result = prime * result + ((first_kind_name == null) ? 0 : first_kind_name.hashCode());
		result = prime * result + ((first_kind_salary_id == null) ? 0 : first_kind_salary_id.hashCode());
		result = prime * result + ((first_kind_sale_id == null) ? 0 : first_kind_sale_id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ConfigFileFirstKind other = (ConfigFileFirstKind) obj;
		if (ffk_id == null) {
			if (other.ffk_id != null)
				return false;
		} else if (!ffk_id.equals(other.ffk_id))
			return false;
		if (first_kind_id == null) {
			if (other.first_kind_id != null)
				return false;
		} else if (!first_kind_id.equals(other.first_kind_id))
			return false;
		if (first_kind_name == null) {
			if (other.first_kind_name != null)
				return false;
		} else if (!first_kind_name.equals(other.first_kind_name))
			return false;
		if (first_kind_salary_id == null) {
			if (other.first_kind_salary_id != null)
				return false;
		} else if (!first_kind_salary_id.equals(other.first_kind_salary_id))
			return false;
		if (first_kind_sale_id == null) {
			if (other.first_kind_sale_id != null)
				return false;
		} else if (!first_kind_sale_id.equals(other.first_kind_sale_id))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "ConfigFileFirstKind [ffk_id=" + ffk_id + ", first_kind_id=" + first_kind_id + ", first_kind_name="
				+ first_kind_name + ", first_kind_salary_id=" + first_kind_salary_id + ", first_kind_sale_id="
				+ first_kind_sale_id + "]";
	}
	
}
