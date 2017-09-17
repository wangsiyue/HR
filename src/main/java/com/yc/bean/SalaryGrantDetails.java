package com.yc.bean;

import java.io.Serializable;
/* 创建新表 "salary_grant_details"。                                                               */
/* "salary_grant_details" : 薪酬发放详细信息                                                          */
/* 	"grd_id" : 主键，自动增长列                                                                       */
/* 	"salary_grant_id" : 薪酬发放编号                                                                */
/* 	"human_id" : 档案编号                                                                         */
/* 	"human_name" : 姓名                                                                         */
/* 	"bouns_sum" : 奖励金额                                                                        */
/* 	"sale_sum" : 销售绩效金额                                                                       */
/* 	"deduct_sum" : 应扣金额                                                                       */
/* 	"salary_standard_sum" : 标准薪酬总额                                                            */
/* 	"salary_paid_sum" : 实发薪酬总额                                                                */  
public class SalaryGrantDetails implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1039375313700250803L;
	private Integer grd_id;
	private String salary_grant_id;
	private String human_id;
	private String human_name;
	private double bouns_sum;
	private double sale_sum;
	private double deduct_sum;
	private double salary_standard_sum;
	private double salary_paid_sum;
	
	private SalaryGrant salaryGrant;
	
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
	public SalaryGrant getSalaryGrant() {
		return salaryGrant;
	}
	public void setSalaryGrant(SalaryGrant salaryGrant) {
		this.salaryGrant = salaryGrant;
	}
	public Integer getGrd_id() {
		return grd_id;
	}
	public void setGrd_id(Integer grd_id) {
		this.grd_id = grd_id;
	}
	public String getSalary_grant_id() {
		return salary_grant_id;
	}
	public void setSalary_grant_id(String salary_grant_id) {
		this.salary_grant_id = salary_grant_id;
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
	public double getBouns_sum() {
		return bouns_sum;
	}
	public void setBouns_sum(double bouns_sum) {
		this.bouns_sum = bouns_sum;
	}
	public double getSale_sum() {
		return sale_sum;
	}
	public void setSale_sum(double sale_sum) {
		this.sale_sum = sale_sum;
	}
	public double getDeduct_sum() {
		return deduct_sum;
	}
	public void setDeduct_sum(double deduct_sum) {
		this.deduct_sum = deduct_sum;
	}
	public double getSalary_standard_sum() {
		return salary_standard_sum;
	}
	public void setSalary_standard_sum(double salary_standard_sum) {
		this.salary_standard_sum = salary_standard_sum;
	}
	public double getSalary_paid_sum() {
		return salary_paid_sum;
	}
	public void setSalary_paid_sum(double salary_paid_sum) {
		this.salary_paid_sum = salary_paid_sum;
	}
	@Override
	public String toString() {
		return "SalaryGrantDetails [grd_id=" + grd_id + ", salary_grant_id=" + salary_grant_id + ", human_id="
				+ human_id + ", human_name=" + human_name + ", bouns_sum=" + bouns_sum + ", sale_sum=" + sale_sum
				+ ", deduct_sum=" + deduct_sum + ", salary_standard_sum=" + salary_standard_sum + ", salary_paid_sum="
				+ salary_paid_sum + ", salaryGrant=" + salaryGrant + ", page=" + page + ", rows=" + rows + "]";
	}
}
