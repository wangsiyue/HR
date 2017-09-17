package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.EngageAnswerDetails;
import com.yc.biz.EngageAnswerDetailsBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class EngageAnswerDetailsBizImpl implements EngageAnswerDetailsBiz {
	private BasicMybatisDao basicMybatisDao;
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}
	@Override
	public List<EngageAnswerDetails> find(EngageAnswerDetails engageAnswerDetails) {
		List<EngageAnswerDetails> list =this.basicMybatisDao.select(engageAnswerDetails, "findEngageAnswerDetails");
		return list;
	}

}
