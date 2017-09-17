package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.HumanFile;
import com.yc.bean.SalaryGrant;
import com.yc.bean.SalaryGrantDetails;
import com.yc.bean.SalaryStandard;
import com.yc.biz.SalaryGrantBiz;
import com.yc.dao.BasicMybatisDao;

@Service
@Transactional
public class SalaryGrantBizImpl implements SalaryGrantBiz {

	private BasicMybatisDao basicMybatisDao;

	@Resource(name = "basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public Integer addSalaryGrant(SalaryGrant salaryGrant,List<SalaryGrantDetails> sgdList) {
		
		for(int a=0;a<sgdList.size();a++){
			int x=this.basicMybatisDao.insert(sgdList.get(a), "addSalaryGrantDetails");
			HumanFile humanFile=new HumanFile();
			humanFile.setHuman_id(sgdList.get(a).getHuman_id());
			humanFile.setPaid_salary_sum(sgdList.get(a).getSalary_paid_sum());
			int y=this.basicMybatisDao.update(humanFile, "updPaidSalarySum");
		}
		int j=this.basicMybatisDao.insert(salaryGrant, "addSalaryGrant");
		if(j>0){
			return 1;
		}else{
			return 0;
		}
	}

	@Override
	public SalaryGrant findMaxSGID() {
		List<SalaryGrant> list=this.basicMybatisDao.select(new SalaryGrant(), "findMaxSGID");
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public List<SalaryGrantDetails> findByPage(SalaryGrant salaryGrant, int pageNo, int pageSize) throws Exception {
		int a=(pageNo-1)*pageSize;
		int b=pageNo*pageSize;
		salaryGrant.setPage(a);
		salaryGrant.setRows(b);
		return this.basicMybatisDao.select(salaryGrant,"findByPage");
	}

	@Override
	public List<SalaryGrantDetails> findCheckSalaryGrant() throws Exception {
		return this.basicMybatisDao.select(new SalaryGrant(), "findCheckSalaryGrant");
	}

	@Override
	public Integer checkSalaryGrant(SalaryGrant salaryGrant) {
		return this.basicMybatisDao.update(salaryGrant, "checkSalaryGrant");
	}

	@Override
	public List<SalaryGrant> findBy(SalaryGrant ss) throws Exception {
		return this.basicMybatisDao.select(ss, "findBy");
	}

	@Override
	public List<SalaryGrant> findSalaryGrantByConditionAndPage(SalaryGrant ss, int pageNo, int pageSize)
			throws Exception {
		int a = (pageNo - 1) * pageSize;
		int b = pageNo * pageSize;
		ss.setPage(a);
		ss.setRows(b);
		return this.basicMybatisDao.select(ss,"findSalaryGrantByConditionAndPage");
	}
	
}