package com.yc.bean;

import java.io.Serializable;
/* 创建新表 "config_question_second_kind"。                                                        */
/* "config_question_second_kind" : 试题二级分类设置                                                   */
/* 	"qsk_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 试题一级分类编号                                                                */
/* 	"first_kind_name" : 试题一级分类名称                                                              */
/* 	"second_kind_id" : 试题二级分类编号                                                               */
/* 	"second_kind_name" : 试题二级分类名称                                                             */  
public class ConfigQuestionSecondKind implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8369045590576266236L;
	private Integer qsk_id;
	private String first_kind_id;
	private String first_kind_name;
	private String second_kind_id;
	private String second_kind_name;
	public Integer getQsk_id() {
		return qsk_id;
	}
	public void setQsk_id(Integer qsk_id) {
		this.qsk_id = qsk_id;
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
	public String getSecond_kind_id() {
		return second_kind_id;
	}
	public void setSecond_kind_id(String second_kind_id) {
		this.second_kind_id = second_kind_id;
	}
	public String getSecond_kind_name() {
		return second_kind_name;
	}
	public void setSecond_kind_name(String second_kind_name) {
		this.second_kind_name = second_kind_name;
	}
	@Override
	public String toString() {
		return "ConfigQuestionSecondKind [qsk_id=" + qsk_id + ", first_kind_id=" + first_kind_id + ", first_kind_name="
				+ first_kind_name + ", second_kind_id=" + second_kind_id + ", second_kind_name=" + second_kind_name
				+ "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((first_kind_id == null) ? 0 : first_kind_id.hashCode());
		result = prime * result + ((first_kind_name == null) ? 0 : first_kind_name.hashCode());
		result = prime * result + ((qsk_id == null) ? 0 : qsk_id.hashCode());
		result = prime * result + ((second_kind_id == null) ? 0 : second_kind_id.hashCode());
		result = prime * result + ((second_kind_name == null) ? 0 : second_kind_name.hashCode());
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
		ConfigQuestionSecondKind other = (ConfigQuestionSecondKind) obj;
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
		if (qsk_id == null) {
			if (other.qsk_id != null)
				return false;
		} else if (!qsk_id.equals(other.qsk_id))
			return false;
		if (second_kind_id == null) {
			if (other.second_kind_id != null)
				return false;
		} else if (!second_kind_id.equals(other.second_kind_id))
			return false;
		if (second_kind_name == null) {
			if (other.second_kind_name != null)
				return false;
		} else if (!second_kind_name.equals(other.second_kind_name))
			return false;
		return true;
	}
	
}
