package com.yc.bean;

import java.io.Serializable;

/* 创建新表 "training"。                                                                           */
/* "training" : 培训登记表                                                                         */
/* 	"tra_id" : 主键，自动增长列                                                                       */
/* 	"major_kind_id" : 职位分类编号                                                                  */
/* 	"major_kind_name" : 职位分类名称                                                                */
/* 	"major_id" : 职位名称                                                                         */
/* 	"major_name" : 职位名称                                                                       */
/* 	"human_id" : 人力资源档案编号                                                                     */
/* 	"human_name" : 姓名                                                                         */
/*	"training_item" ：培训项目										*/
/* 	"training_time" : 培训时间                                                                    */
/* 	"training_hour" : 培训课时                                                                    */
/* 	"training_degree" : 培训成绩等级                                                                */
/* 	"register" : 登记人                                                                          */
/* 	"checker" : 复核人                                                                           */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"check_time" : 复核时间                                                                       */
/* 	"checkstatus" : 培训复核状态                                                                    */
/* 	"remark" : 备注                                                                             */  
public class Training implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4882180306821337618L;
	@Override
	public String toString() {
		return "Training [tra_id=" + tra_id + ", major_kind_id=" + major_kind_id + ", major_kind_name="
				+ major_kind_name + ", major_id=" + major_id + ", major_name=" + major_name + ", human_id=" + human_id
				+ ", human_name=" + human_name + ", training_item=" + training_item + ", training_time=" + training_time
				+ ", training_hour=" + training_hour + ", training_degree=" + training_degree + ", register=" + register
				+ ", checker=" + checker + ", regist_time=" + regist_time + ", check_time=" + check_time
				+ ", checkstatus=" + checkstatus + ", remark=" + remark + ", page=" + page + ", rows=" + rows + "]";
	}
	private Integer tra_id;
	private String major_kind_id;
	private String major_kind_name;
	private String major_id;
	private String major_name;
	private String human_id;
	private String human_name;
	private String training_item;
	private String training_time;
	private Integer training_hour;
	private String training_degree;
	private String register;
	private String checker;
	private String regist_time;
	private String check_time;
	private Integer checkstatus;
	private String remark;
	
	private Integer page;
	private Integer rows;
	
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
	
	
	public Integer getTra_id() {
		return tra_id;
	}
	public void setTra_id(Integer tra_id) {
		this.tra_id = tra_id;
	}
	public String getMajor_kind_id() {
		return major_kind_id;
	}
	public void setMajor_kind_id(String major_kind_id) {
		this.major_kind_id = major_kind_id;
	}
	public String getMajor_kind_name() {
		return major_kind_name;
	}
	public void setMajor_kind_name(String major_kind_name) {
		this.major_kind_name = major_kind_name;
	}
	public String getMajor_id() {
		return major_id;
	}
	public void setMajor_id(String major_id) {
		this.major_id = major_id;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public String getHuman_id() {
		return human_id;
	}
	public void setHuman_id(String human_id) {
		this.human_id = human_id;
	}
	public String getHuman_name() {
		return human_name;
	}
	public void setHuman_name(String human_name) {
		this.human_name = human_name;
	}
	public String getTraining_item() {
		return training_item;
	}
	public void setTraining_item(String training_item) {
		this.training_item = training_item;
	}
	public String getTraining_time() {
		return training_time;
	}
	public void setTraining_time(String training_time) {
		this.training_time = training_time;
	}
	public Integer getTraining_hour() {
		return training_hour;
	}
	public void setTraining_hour(Integer training_hour) {
		this.training_hour = training_hour;
	}
	public String getTraining_degree() {
		return training_degree;
	}
	public void setTraining_degree(String training_degree) {
		this.training_degree = training_degree;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getChecker() {
		return checker;
	}
	public void setChecker(String checker) {
		this.checker = checker;
	}
	public String getRegist_time() {
		return regist_time;
	}
	public void setRegist_time(String regist_time) {
		this.regist_time = regist_time;
	}
	public String getCheck_time() {
		return check_time;
	}
	public void setCheck_time(String check_time) {
		this.check_time = check_time;
	}
	public Integer getCheckstatus() {
		return checkstatus;
	}
	public void setCheckstatus(Integer checkstatus) {
		this.checkstatus = checkstatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
