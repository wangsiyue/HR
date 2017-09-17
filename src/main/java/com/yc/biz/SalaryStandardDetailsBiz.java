package com.yc.biz;

import java.util.List;

import com.yc.bean.SalaryStandard;
import com.yc.bean.SalaryStandardDetails;

public interface SalaryStandardDetailsBiz {
	
	public List<SalaryStandardDetails> findSalaryStandardDetailsByStandardId(SalaryStandardDetails salaryStandardDetails);

	public List<SalaryStandardDetails> findAll();
}
