package com.yc.bean;

import java.io.Serializable;
import java.util.List;
/* 创建新表 "config_question_first_kind"。                                                         */
/* "config_question_first_kind" : 试题一级分类设置                                                    */
/* 	"qfk_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 试题一级分类编号                                                                */
/* 	"first_kind_name" : 试题一级分类名称                                                              */  
public class ConfigQuestionFirstKind implements Serializable {
	private static final long serialVersionUID = -1705231000005531747L;
	private Integer qfk_id;
	private String first_kind_id;
	private String first_kind_name;
	
	public Integer getQfk_id() {
		return qfk_id;
	}
	public void setQfk_id(Integer qfk_id) {
		this.qfk_id = qfk_id;
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
	@Override
	public String toString() {
		return "ConfigQuestionFirstKind [qfk_id=" + qfk_id + ", first_kind_id=" + first_kind_id + ", first_kind_name="
				+ first_kind_name + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((first_kind_id == null) ? 0 : first_kind_id.hashCode());
		result = prime * result + ((first_kind_name == null) ? 0 : first_kind_name.hashCode());
		result = prime * result + ((qfk_id == null) ? 0 : qfk_id.hashCode());
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
		ConfigQuestionFirstKind other = (ConfigQuestionFirstKind) obj;
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
		if (qfk_id == null) {
			if (other.qfk_id != null)
				return false;
		} else if (!qfk_id.equals(other.qfk_id))
			return false;
		return true;
	}
}
