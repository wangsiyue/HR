package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.EngageSubjects;
import com.yc.biz.EngageSubjectsBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class EngageSubjectsBizImpl implements EngageSubjectsBiz {
	private BasicMybatisDao basicMybatisDao;
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}
	@Override
	public List<EngageSubjects> findEngageSubjects(EngageSubjects engageSubjects) {
		List<EngageSubjects> list =this.basicMybatisDao.select(engageSubjects, "findEngageSubjects");
		return list;
	}

	@Override
	public Integer add(EngageSubjects engageSubjects) {
		return  this.basicMybatisDao.insert(engageSubjects, "addEngageSubjects");
	}
	@Override
	public List<EngageSubjects> findBy(EngageSubjects engageSubjects) {
		return this.basicMybatisDao.select(engageSubjects, "findBy");
	}
	@Override
	public List<EngageSubjects> findEngageSubjectByConditionAndPage(EngageSubjects engageSubjects, int page, int rows) {
		int a = (page - 1) * rows;
		int b = page * rows;
		engageSubjects.setPage(a);
		engageSubjects.setRows(b);
		return this.basicMybatisDao.select(engageSubjects, "findEngageSubjectByConditionAndPage");
	}
	@Override
	public Integer changeEngageSubjects(EngageSubjects engageSubjects) {
		return this.basicMybatisDao.update(engageSubjects, "changeEngageSubjects");
	}
	@Override
	public Integer deleteEngageSubjects(EngageSubjects engageSubjects) {
		return this.basicMybatisDao.delete(engageSubjects, "deleteEngageSubjects");
	}
	@Override
	public List<EngageSubjects> find() {
		return this.basicMybatisDao.select(new EngageSubjects(), "find");
	}
	@Override
	public List<EngageSubjects> getRandomSubject(EngageSubjects engageSubjects) {
		return this.basicMybatisDao.select(engageSubjects, "getRandomSubject");
	}
}
