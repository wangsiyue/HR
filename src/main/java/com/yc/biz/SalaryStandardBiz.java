package com.yc.biz;

import java.util.List;

import com.yc.bean.HumanFile;
import com.yc.bean.SalaryStandard;
import com.yc.bean.SalaryStandardDetails;

public interface SalaryStandardBiz {
	public List find();

	// 添加薪酬标准
	public int add(SalaryStandard salaryStandard,List<SalaryStandardDetails> list);

	// 获取当前薪酬标准编号的最大值
	public SalaryStandard getStandardId();

	// 根据id查看详情
	public List<SalaryStandard> findById(SalaryStandard ss) throws Exception;

	// 查询所有需要复核的薪酬标准
	public List<SalaryStandard> findCheckFile() throws Exception;

	// 分页查询需要复核的薪酬标准
	public List<SalaryStandard> findByPage(SalaryStandard ss, int pageNo, int pageSize) throws Exception;

	//复核薪酬标准
	public int checkSalaryStandard(SalaryStandard salaryStandard);
	
	//变更薪酬标准
	public int changeSalaryStandard(SalaryStandard salaryStandard);
	
	// 根据条件查询所有薪酬标准
	public List<SalaryStandard> findBy(SalaryStandard ss) throws Exception;
	
	// 根据条件分页薪酬标准  --模糊查询
 	public List<SalaryStandard> findSalaryStandardByConditionAndPage(SalaryStandard ss, int pageNo, int pageSize) throws Exception;

}