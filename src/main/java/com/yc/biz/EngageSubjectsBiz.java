package com.yc.biz;

import java.util.List;

import com.yc.bean.EngageSubjects;

public interface EngageSubjectsBiz {
	public List<EngageSubjects> findEngageSubjects(EngageSubjects engageSubjects);
	public Integer add(EngageSubjects engageSubjects);
	public List<EngageSubjects> findBy(EngageSubjects engageSubjects);
	public List<EngageSubjects> findEngageSubjectByConditionAndPage(EngageSubjects engageSubjects, int page, int rows);
	public Integer changeEngageSubjects(EngageSubjects engageSubjects);
	public Integer deleteEngageSubjects(EngageSubjects engageSubjects);
	//<!-- 考试出题时的查询 -->
	public List<EngageSubjects> find();
	public List<EngageSubjects> getRandomSubject(EngageSubjects engageSubjects);
}
