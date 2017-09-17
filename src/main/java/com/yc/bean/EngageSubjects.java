package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

/* 创建新表 "engage_subjects"。                                                                    */
/* "engage_subjects" : 试题题库登记表                                                                */
/* 	"sub_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 试题I级分类编号                                                                */
/* 	"first_kind_name" : 试题I级分类名称                                                              */
/* 	"second_kind_id" : 试题II级分类编号                                                              */
/* 	"second_kind_name" : 试题II级分类名称                                                            */
/* 	"register" : 登记人                                                                          */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"derivation" : 试题出处                                                                       */
/* 	"content" : 题干                                                                            */
/* 	"key_a" : 答案a                                                                             */
/* 	"key_b" : 答案b                                                                             */
/* 	"key_c" : 答案c                                                                             */
/* 	"key_d" : 答案d                                                                             */
/* 	"key_e" : 答案e                                                                             */
/* 	"correct_key" : 正确答案                                                                      */
/* 	"changer" : 变更人                                                                           */
/* 	"change_time" : 变更时间                                                                      */  
public class EngageSubjects implements Serializable {
	private Integer sub_id;
	private String first_kind_id;
	private String first_kind_name;
	private String second_kind_id;
	private String second_kind_name;
	private String 	register;
	private String regist_time;
	private String derivation;
	private String content;
	private String key_a;
	private String key_b;
	private String key_c;
	private String key_d;
	private String key_e;
	private String correct_key;
	private String changer;
	private String change_time;
	
	private String key;
	private String minTime;
	private String maxTime;
	
	private Integer page;
	private Integer rows;
	
	// 考试出题时的查询 所用
	private Integer count;
	
	//随机选择limit个题目
	private Integer limit;
	
	//应试者答案
	private String userAnswer;
	
	public String getUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getMinTime() {
		return minTime;
	}
	public void setMinTime(String minTime) {
		this.minTime = minTime;
	}
	public String getMaxTime() {
		return maxTime;
	}
	public void setMaxTime(String maxTime) {
		this.maxTime = maxTime;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getSub_id() {
		return sub_id;
	}
	public void setSub_id(Integer sub_id) {
		this.sub_id = sub_id;
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
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getRegist_time() {
		return regist_time;
	}
	public void setRegist_time(String regist_time) {
		this.regist_time = regist_time;
	}
	public String getDerivation() {
		return derivation;
	}
	public void setDerivation(String derivation) {
		this.derivation = derivation;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getKey_a() {
		return key_a;
	}
	public void setKey_a(String key_a) {
		this.key_a = key_a;
	}
	public String getKey_b() {
		return key_b;
	}
	public void setKey_b(String key_b) {
		this.key_b = key_b;
	}
	public String getKey_c() {
		return key_c;
	}
	public void setKey_c(String key_c) {
		this.key_c = key_c;
	}
	public String getKey_d() {
		return key_d;
	}
	public void setKey_d(String key_d) {
		this.key_d = key_d;
	}
	public String getKey_e() {
		return key_e;
	}
	public void setKey_e(String key_e) {
		this.key_e = key_e;
	}
	public String getCorrect_key() {
		return correct_key;
	}
	public void setCorrect_key(String correct_key) {
		this.correct_key = correct_key;
	}
	public String getChanger() {
		return changer;
	}
	public void setChanger(String changer) {
		this.changer = changer;
	}
	public String getChange_time() {
		return change_time;
	}
	public void setChange_time(String change_time) {
		this.change_time = change_time;
	}
	@Override
	public String toString() {
		return "EngageSubjects [sub_id=" + sub_id + ", first_kind_id=" + first_kind_id + ", first_kind_name="
				+ first_kind_name + ", second_kind_id=" + second_kind_id + ", second_kind_name=" + second_kind_name
				+ ", register=" + register + ", regist_time=" + regist_time + ", derivation=" + derivation
				+ ", content=" + content + ", key_a=" + key_a + ", key_b=" + key_b + ", key_c=" + key_c + ", key_d="
				+ key_d + ", key_e=" + key_e + ", correct_key=" + correct_key + ", changer=" + changer
				+ ", change_time=" + change_time + ", key=" + key + ", minTime=" + minTime + ", maxTime=" + maxTime
				+ ", page=" + page + ", rows=" + rows + ", count=" + count + ", limit=" + limit + ", userAnswer="
				+ userAnswer + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((change_time == null) ? 0 : change_time.hashCode());
		result = prime * result + ((changer == null) ? 0 : changer.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((correct_key == null) ? 0 : correct_key.hashCode());
		result = prime * result + ((count == null) ? 0 : count.hashCode());
		result = prime * result + ((derivation == null) ? 0 : derivation.hashCode());
		result = prime * result + ((first_kind_id == null) ? 0 : first_kind_id.hashCode());
		result = prime * result + ((first_kind_name == null) ? 0 : first_kind_name.hashCode());
		result = prime * result + ((key == null) ? 0 : key.hashCode());
		result = prime * result + ((key_a == null) ? 0 : key_a.hashCode());
		result = prime * result + ((key_b == null) ? 0 : key_b.hashCode());
		result = prime * result + ((key_c == null) ? 0 : key_c.hashCode());
		result = prime * result + ((key_d == null) ? 0 : key_d.hashCode());
		result = prime * result + ((key_e == null) ? 0 : key_e.hashCode());
		result = prime * result + ((limit == null) ? 0 : limit.hashCode());
		result = prime * result + ((maxTime == null) ? 0 : maxTime.hashCode());
		result = prime * result + ((minTime == null) ? 0 : minTime.hashCode());
		result = prime * result + ((page == null) ? 0 : page.hashCode());
		result = prime * result + ((regist_time == null) ? 0 : regist_time.hashCode());
		result = prime * result + ((register == null) ? 0 : register.hashCode());
		result = prime * result + ((rows == null) ? 0 : rows.hashCode());
		result = prime * result + ((second_kind_id == null) ? 0 : second_kind_id.hashCode());
		result = prime * result + ((second_kind_name == null) ? 0 : second_kind_name.hashCode());
		result = prime * result + ((sub_id == null) ? 0 : sub_id.hashCode());
		result = prime * result + ((userAnswer == null) ? 0 : userAnswer.hashCode());
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
		EngageSubjects other = (EngageSubjects) obj;
		if (change_time == null) {
			if (other.change_time != null)
				return false;
		} else if (!change_time.equals(other.change_time))
			return false;
		if (changer == null) {
			if (other.changer != null)
				return false;
		} else if (!changer.equals(other.changer))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (correct_key == null) {
			if (other.correct_key != null)
				return false;
		} else if (!correct_key.equals(other.correct_key))
			return false;
		if (count == null) {
			if (other.count != null)
				return false;
		} else if (!count.equals(other.count))
			return false;
		if (derivation == null) {
			if (other.derivation != null)
				return false;
		} else if (!derivation.equals(other.derivation))
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
		if (key == null) {
			if (other.key != null)
				return false;
		} else if (!key.equals(other.key))
			return false;
		if (key_a == null) {
			if (other.key_a != null)
				return false;
		} else if (!key_a.equals(other.key_a))
			return false;
		if (key_b == null) {
			if (other.key_b != null)
				return false;
		} else if (!key_b.equals(other.key_b))
			return false;
		if (key_c == null) {
			if (other.key_c != null)
				return false;
		} else if (!key_c.equals(other.key_c))
			return false;
		if (key_d == null) {
			if (other.key_d != null)
				return false;
		} else if (!key_d.equals(other.key_d))
			return false;
		if (key_e == null) {
			if (other.key_e != null)
				return false;
		} else if (!key_e.equals(other.key_e))
			return false;
		if (limit == null) {
			if (other.limit != null)
				return false;
		} else if (!limit.equals(other.limit))
			return false;
		if (maxTime == null) {
			if (other.maxTime != null)
				return false;
		} else if (!maxTime.equals(other.maxTime))
			return false;
		if (minTime == null) {
			if (other.minTime != null)
				return false;
		} else if (!minTime.equals(other.minTime))
			return false;
		if (page == null) {
			if (other.page != null)
				return false;
		} else if (!page.equals(other.page))
			return false;
		if (regist_time == null) {
			if (other.regist_time != null)
				return false;
		} else if (!regist_time.equals(other.regist_time))
			return false;
		if (register == null) {
			if (other.register != null)
				return false;
		} else if (!register.equals(other.register))
			return false;
		if (rows == null) {
			if (other.rows != null)
				return false;
		} else if (!rows.equals(other.rows))
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
		if (sub_id == null) {
			if (other.sub_id != null)
				return false;
		} else if (!sub_id.equals(other.sub_id))
			return false;
		if (userAnswer == null) {
			if (other.userAnswer != null)
				return false;
		} else if (!userAnswer.equals(other.userAnswer))
			return false;
		return true;
	}
}
