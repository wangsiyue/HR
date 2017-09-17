package com.yc.biz;

import java.util.List;

import com.yc.bean.EngageMajorRelease;
import com.yc.bean.EngageResume;
import com.yc.bean.SalaryStandard;

public interface EngageResumeBiz {
	public Integer add(EngageResume engageResume);
	
	public List<EngageResume> findEngageResume(EngageResume engageResume);
	// 根据条件查询所有薪酬标准
	public List<EngageResume> findBy(EngageResume ss) throws Exception;
	
	// 根据条件分页薪酬标准  --模糊查询
 	public List<EngageResume> findResumeByConditionAndPage(EngageResume ss, int pageNo, int pageSize) throws Exception;

 	//筛选
 	public Integer chooseResume(EngageResume engageResume);
 	
 	//查看所有可以面试的简历
 	public List<EngageResume> findInterview();
 	
 	//删除
 	public Integer deleteResume(EngageResume engageResume);
 	
 	//添加面试时修改简历表中的面试状态或通过时间和通过人
 	public Integer updInterview(EngageResume engageResume);
 	
 //录用------------------------------------------------------------------------------------------
	//findPassRegisterList
	public List<EngageResume> findPassRegisterList();

	//申请录用  修改pass_checkComment
	public int passRegister(EngageResume engageResume);
	
	//审批
	public List<EngageResume> findPassPassList();
	
	public Integer passPass(EngageResume engageResume);
	
	//录用查询
	public List<EngageResume> findPassList();
	
	//笔试完成后修改简历信息
	public Integer updResume(EngageResume engageResume);

	public Integer updResume2(EngageResume engageResume);
}
