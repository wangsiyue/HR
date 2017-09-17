package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.EngageExam;
import com.yc.bean.EngageExamDetails;
import com.yc.bean.Users;
import com.yc.biz.EngageExamBiz;
import com.yc.dao.BasicMybatisDao;

@Service
@Transactional
public class EngageExamBizImpl implements EngageExamBiz {
	private BasicMybatisDao basicMybatisDao;
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public Integer add(EngageExam engageexam,List<EngageExamDetails> list) {
		int a=this.basicMybatisDao.insert(engageexam, "addEngageExam");
		int b=0;
		for(int i=0;i<list.size();i++){
			b=this.basicMybatisDao.insert(list.get(i), "addEngageExamDetails");
		}
		if(a>0&&b>0){
			return 1;
		}
		return 0;
	}
	@Override
	public EngageExam update(EngageExam engageexam) {
		this.basicMybatisDao.update(engageexam, "updateEngageExam");
		return engageexam;
	}
	@Override
	public List<EngageExam> find(EngageExam engageexam) {
		return this.basicMybatisDao.select(engageexam, "findEngageExam");
	}

	@Override
	public EngageExam getRandomExam(EngageExam engageExam) {
		List<EngageExam> list=this.basicMybatisDao.select(engageExam, "getRandomExam");
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
}
