package com.yc.biz;

import java.util.List;

import com.yc.bean.HumanFile;
import com.yc.bean.SalaryGrant;
import com.yc.bean.SalaryGrantDetails;
import com.yc.bean.SalaryStandard;
import com.yc.bean.SalaryStandardDetails;

public interface SalaryGrantDetailsBiz {
	
	public List<SalaryGrantDetails> findBysgId(SalaryGrantDetails salaryGrantDetails);

	public Integer changeSalaryGrantDetails(SalaryGrantDetails salaryGrantDetails);
	
	public  List<SalaryGrantDetails> findByHumanId(SalaryGrantDetails salaryGrantDetails);
	
	public List<SalaryGrantDetails> findBySalaryGrantId(SalaryGrantDetails salaryGrantDetails);

	public List<SalaryGrantDetails> findSalaryGrantDeatilsBySalaryGrantIdAndPage(SalaryGrantDetails salaryGrantDetails, int pageNo, int pageSize);
}