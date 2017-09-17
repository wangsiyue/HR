package com.yc.biz;

import java.util.List;

import com.yc.bean.EngageInterview;

public interface EngageInterviewBiz {
	public List<EngageInterview> find(EngageInterview enageInterview);
	
	public Integer addInterview(EngageInterview engageInterview);
	
	//筛选面试
	public Integer checkInterview(EngageInterview engageInterview);
	
	public Integer deleteInterview(EngageInterview engageInterview);
	
	public List<EngageInterview> findResumeExit(EngageInterview engageInterview);
	
	public Integer updateInterview(EngageInterview engageInterview);
}
