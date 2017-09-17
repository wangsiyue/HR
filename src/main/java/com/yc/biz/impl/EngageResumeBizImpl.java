package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.EngageMajorRelease;
import com.yc.bean.EngageResume;
import com.yc.bean.SalaryStandard;
import com.yc.biz.EngageResumeBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class EngageResumeBizImpl implements EngageResumeBiz{
	private BasicMybatisDao basicMybatisDao;
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}
	@Override
	public Integer add(EngageResume engageResume) {
		return this.basicMybatisDao.insert(engageResume, "addEngageResume");
	}
	@Override
	public List<EngageResume> findEngageResume(EngageResume engageResume) {
		return this.basicMybatisDao.select(engageResume, "findEngageResume");
	}
	
	@Override
	public List<EngageResume> findBy(EngageResume ss) throws Exception {
		return this.basicMybatisDao.select(ss, "findBy");
	}
	
	@Override
	public List<EngageResume> findResumeByConditionAndPage(EngageResume ss, int pageNo, int pageSize) throws Exception {
		int a = (pageNo - 1) * pageSize;
		int b = pageNo * pageSize;
		ss.setPage(a);
		ss.setRows(b);
		return this.basicMybatisDao.select(ss,"findResumeByConditionAndPage");
	}
	@Override
	public Integer chooseResume(EngageResume engageResume) {
		return this.basicMybatisDao.insert(engageResume, "chooseResume");
	}
	@Override
	public List<EngageResume> findInterview() {
		return this.basicMybatisDao.select(new EngageResume(),"findInterview");
	}
	@Override
	public Integer deleteResume(EngageResume engageResume) {
		return this.basicMybatisDao.delete(engageResume, "deleteResume");
	}
	
	@Override
	public Integer updInterview(EngageResume engageResume) {
		return this.basicMybatisDao.update(engageResume, "updInterview");
	}
	@Override
	public List<EngageResume> findPassRegisterList() {
		return this.basicMybatisDao.select(new EngageResume(), "findPassRegisterList");
	}
	@Override
	public int passRegister(EngageResume engageResume) {
		return this.basicMybatisDao.update(engageResume, "passRegister");
	}
	@Override
	public List<EngageResume> findPassPassList() {
		return this.basicMybatisDao.select(new EngageResume(), "findPassPassList");
	}
	@Override
	public Integer passPass(EngageResume engageResume) {
		return this.basicMybatisDao.update(engageResume, "passPass");
	}
	@Override
	public List<EngageResume> findPassList() {
		return this.basicMybatisDao.select(new EngageResume(), "findPassList");
	}
	@Override
	public Integer updResume(EngageResume engageResume) {
		return this.basicMybatisDao.update(engageResume, "updResume");
	}
	@Override
	public Integer updResume2(EngageResume engageResume) {
		return this.basicMybatisDao.update(engageResume, "updResume2");
	}
}
