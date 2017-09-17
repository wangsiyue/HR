package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.SalaryGrantDetails;
import com.yc.biz.SalaryGrantDetailsBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class SalaryGrantDetailsBizImpl implements SalaryGrantDetailsBiz {

	private BasicMybatisDao basicMybatisDao;

	@Resource(name = "basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	@Override
	public List<SalaryGrantDetails> findBysgId(SalaryGrantDetails salaryGrantDetails) {
		return this.basicMybatisDao.select(salaryGrantDetails, "findBysgId");
	}

	@Override
	public Integer changeSalaryGrantDetails(SalaryGrantDetails salaryGrantDetails) {
		return this.basicMybatisDao.update(salaryGrantDetails, "changeSalaryGrantDetails");
	}

	@Override
	public List<SalaryGrantDetails> findByHumanId(SalaryGrantDetails salaryGrantDetails) {
		return (List<SalaryGrantDetails>) this.basicMybatisDao.select(salaryGrantDetails, "findByHumanId");
	}

	@Override
	public List<SalaryGrantDetails> findBySalaryGrantId(SalaryGrantDetails salaryGrantDetails) {
		return this.basicMybatisDao.select(salaryGrantDetails, "findBySalaryGrantId");
	}

	@Override
	public List<SalaryGrantDetails> findSalaryGrantDeatilsBySalaryGrantIdAndPage(
			SalaryGrantDetails salaryGrantDetails, int pageNo, int pageSize) {
		int a=(pageNo-1)*pageSize;
		int b=pageNo*pageSize;
		salaryGrantDetails.setPage(a);
		salaryGrantDetails.setRows(b);
		return this.basicMybatisDao.select(salaryGrantDetails, "findSalaryGrantDeatilsBySalaryGrantIdAndPage");
	}

}
