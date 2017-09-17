package com.yc.biz;

import java.util.List;

import com.yc.bean.HumanFile;
import com.yc.bean.SalaryGrant;
import com.yc.bean.SalaryGrantDetails;
import com.yc.bean.SalaryStandard;
import com.yc.bean.SalaryStandardDetails;

public interface SalaryGrantBiz {

	public Integer addSalaryGrant(SalaryGrant salaryGrant,List<SalaryGrantDetails> sgdList);
	
	public SalaryGrant findMaxSGID();
	
	public List<SalaryGrantDetails> findByPage(SalaryGrant salaryGrant,int pageNo, int pageSize) throws Exception;
	
	public List<SalaryGrantDetails> findCheckSalaryGrant() throws Exception;
	
	public Integer checkSalaryGrant(SalaryGrant salaryGrant);
	
	// 根据条件查询所有薪酬发放
	public List<SalaryGrant> findBy(SalaryGrant ss) throws Exception;
	
	// 根据条件分页薪酬发放  --模糊查询
 	public List<SalaryGrant> findSalaryGrantByConditionAndPage(SalaryGrant ss, int pageNo, int pageSize) throws Exception;

	
}