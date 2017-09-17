package com.yc.biz;

import java.util.List;

import com.yc.bean.EngageAnswer;
import com.yc.bean.EngageAnswerDetails;
import com.yc.bean.SalaryStandard;



public interface EngageAnswerBiz {
	public Integer add(EngageAnswer engageAnswer,List<EngageAnswerDetails> list);
	public EngageAnswer update(EngageAnswer engageAnswer);
	public List<EngageAnswer> find(EngageAnswer engageAnswer);
	
	public List<EngageAnswer> findBy(EngageAnswer es) throws Exception;
 	public List<EngageAnswer> findEngageExamGradeByConditionAndPage(EngageAnswer es, int pageNo, int pageSize) throws Exception;

}
