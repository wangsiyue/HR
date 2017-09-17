package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.EngageAnswer;
import com.yc.bean.EngageAnswerDetails;
import com.yc.bean.SalaryStandard;
import com.yc.biz.EngageAnswerBiz;
import com.yc.dao.BasicMybatisDao;
@Service
@Transactional
public class EngageAnswerBizImpl implements EngageAnswerBiz {
	private BasicMybatisDao basicMybatisDao;
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public Integer add(EngageAnswer engageAnswer,List<EngageAnswerDetails> list) {
		int i=this.basicMybatisDao.insert(engageAnswer, "addEngageAnswer");
		int j=0;
		for(int a=0;a<list.size();a++){
			j=this.basicMybatisDao.insert(list.get(a), "addEngageAnswerDetails");
		}
		if(i>0&&j>0){
			return 1;
		}else{
			return 0;
		}
	}

	@Override
	public EngageAnswer update(EngageAnswer engageAnswer) {
		this.basicMybatisDao.update(engageAnswer, "updateEngageAnswer");
		return engageAnswer;
	}

	@Override
	public List<EngageAnswer> find(EngageAnswer engageAnswer) {
		List<EngageAnswer> list =this.basicMybatisDao.select(engageAnswer, "findEngageAnswer");
		return list;
	}

	@Override
	public List<EngageAnswer> findBy(EngageAnswer es) throws Exception {
		return this.basicMybatisDao.select(es, "findBy");
	}
	@Override
	public List<EngageAnswer> findEngageExamGradeByConditionAndPage(EngageAnswer es, int pageNo, int pageSize)
			throws Exception {
		int a = (pageNo - 1) * pageSize;
		int b = pageNo * pageSize;
		es.setPage(a);
		es.setRows(b);
		return this.basicMybatisDao.select(es,"findEngageExamGradeByConditionAndPage");
	}
}
