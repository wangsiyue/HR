package com.yc.biz;

import java.util.List;

import com.yc.bean.EngageExamDetails;



public interface EngageExamDetailsBiz {
	public EngageExamDetails add(EngageExamDetails engageExamDetails);
	public EngageExamDetails update(EngageExamDetails engageExamDetails);
	public List<EngageExamDetails> find(EngageExamDetails engageExamDetails);
}
