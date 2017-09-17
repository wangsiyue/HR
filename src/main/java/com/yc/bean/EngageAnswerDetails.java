package com.yc.bean;

import java.io.Serializable;
/* 创建新表 "engage_answer_details"。                                                              */
/* "engage_answer_details" : 考试答题详细信息                                                         */
/* 	"and_id" : 答案详细信息                                                                         */
/* 	"answer_number" : 答案编号                                                                    */
/* 	"subject_id" : 试题编号                                                                       */
/* 	"answer" : 答题者答案  */
public class EngageAnswerDetails implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3484756009558152413L;
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((and_id == null) ? 0 : and_id.hashCode());
		result = prime * result + ((answer == null) ? 0 : answer.hashCode());
		result = prime * result + ((answer_number == null) ? 0 : answer_number.hashCode());
		result = prime * result + ((subject_id == null) ? 0 : subject_id.hashCode());
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
		EngageAnswerDetails other = (EngageAnswerDetails) obj;
		if (and_id == null) {
			if (other.and_id != null)
				return false;
		} else if (!and_id.equals(other.and_id))
			return false;
		if (answer == null) {
			if (other.answer != null)
				return false;
		} else if (!answer.equals(other.answer))
			return false;
		if (answer_number == null) {
			if (other.answer_number != null)
				return false;
		} else if (!answer_number.equals(other.answer_number))
			return false;
		if (subject_id == null) {
			if (other.subject_id != null)
				return false;
		} else if (!subject_id.equals(other.subject_id))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "EngageAnswerDetails [and_id=" + and_id + ", answer_number=" + answer_number + ", subject_id="
				+ subject_id + ", answer=" + answer + "]";
	}
	private Integer and_id;
	private String answer_number;
	private Integer subject_id;
	private String answer;
	public Integer getAnd_id() {
		return and_id;
	}
	public void setAnd_id(Integer and_id) {
		this.and_id = and_id;
	}
	public String getAnswer_number() {
		return answer_number;
	}
	public void setAnswer_number(String answer_number) {
		this.answer_number = answer_number;
	}
	public Integer getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(Integer subject_id) {
		this.subject_id = subject_id;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
