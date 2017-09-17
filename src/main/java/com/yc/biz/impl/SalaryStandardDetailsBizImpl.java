package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.SalaryStandard;
import com.yc.bean.SalaryStandardDetails;
import com.yc.biz.SalaryStandardDetailsBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class SalaryStandardDetailsBizImpl implements SalaryStandardDetailsBiz {

	private BasicMybatisDao basicMybatisDao;

	@Resource(name = "basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	@Override
	public List<SalaryStandardDetails> findSalaryStandardDetailsByStandardId(SalaryStandardDetails salaryStandardDetails) {
		return this.basicMybatisDao.select(salaryStandardDetails, "findSalaryStandardDetailsByStandardId");
	}
	
	@Override
	public List<SalaryStandardDetails> findAll() {
		return this.basicMybatisDao.select(new SalaryStandardDetails(), "findAll");
	}

}
