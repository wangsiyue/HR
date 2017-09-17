package com.yc.biz;

import java.util.List;

import com.yc.bean.EngageExam;
import com.yc.bean.EngageExamDetails;

public interface EngageExamBiz {
	public Integer add(EngageExam engageexam,List<EngageExamDetails> list);
	public EngageExam update(EngageExam engageexam);
	public List<EngageExam> find(EngageExam engageexam);
	//随机产生提套
	public EngageExam getRandomExam(EngageExam engageExam);
}
