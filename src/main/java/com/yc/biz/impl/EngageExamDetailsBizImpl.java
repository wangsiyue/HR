package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.EngageExamDetails;
import com.yc.bean.Users;
import com.yc.biz.EngageExamDetailsBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class EngageExamDetailsBizImpl implements EngageExamDetailsBiz{
	private BasicMybatisDao basicMybatisDao;
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}
	@Override
	public EngageExamDetails add(EngageExamDetails engageExamDetails) {
		this.basicMybatisDao.insert(engageExamDetails, "addEngageExamDetails");
		return engageExamDetails;
	}

	@Override
	public EngageExamDetails update(EngageExamDetails engageExamDetails) {
		this.basicMybatisDao.update(engageExamDetails, "updateEngageExamDetails");
		return engageExamDetails;
	}

	@Override
	public List<EngageExamDetails> find(EngageExamDetails engageExamDetails) {
		List<EngageExamDetails> list=this.basicMybatisDao.select(engageExamDetails, "findEngageExamDetails");
		return list;
	}

}
