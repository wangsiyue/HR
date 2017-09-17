package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.HumanFile;
import com.yc.bean.SalaryStandard;
import com.yc.bean.SalaryStandardDetails;
import com.yc.biz.SalaryStandardBiz;
import com.yc.dao.BasicMybatisDao;

@Service
@Transactional
public class SalaryStandardBizImpl implements SalaryStandardBiz {

	private BasicMybatisDao basicMybatisDao;

	@Resource(name = "basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	@Override
	public List find() {
		return this.basicMybatisDao.select(new SalaryStandard(), "findAll");
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public int add(SalaryStandard salaryStandard,List<SalaryStandardDetails> list) {
		System.out.println(salaryStandard+"-----"+list.size());
		int i=this.basicMybatisDao.insert(salaryStandard, "addSalaryStandard");
		int j=0;
		for(int a=0;a<list.size();a++){
			j=this.basicMybatisDao.insert(list.get(a), "addSalaryStandardDetails");
		}
		if(i>0&&j>0){
			return 1;
		}else{
			return 0;
		}
	}

	// 获取当前薪酬标准编号的最大值
	@Override
	public SalaryStandard getStandardId() {
		List<SalaryStandard> list=this.basicMybatisDao.select(new SalaryStandard(), "getStandardId");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public List<SalaryStandard> findById(SalaryStandard ss) throws Exception {
		return this.basicMybatisDao.select(ss, "findDetialById");
	}

	// 查看所有需要审核的薪酬标准
	@Override
	public List<SalaryStandard> findCheckFile() throws Exception {
		return this.basicMybatisDao.select(new SalaryStandard(), "findCheckSalaryStandard");
	}

	// 分页
	@Override
	public List<SalaryStandard> findByPage(SalaryStandard ss, int pageNo, int pageSize) throws Exception {
		int a = (pageNo - 1) * pageSize;
		int b = pageNo * pageSize;
		ss.setPage(a);
		ss.setRows(b);
		return this.basicMybatisDao.select(ss, "findCheckSalaryStandardByPage");
	}

	//按条件查询所有薪酬标准
	@Override
	public List<SalaryStandard> findBy(SalaryStandard ss) throws Exception {
		return this.basicMybatisDao.select(ss, "findBy");
	}
	
	@Override
	public List<SalaryStandard> findSalaryStandardByConditionAndPage(SalaryStandard ss, int pageNo, int pageSize) throws Exception {
		int a = (pageNo - 1) * pageSize;
		int b = pageNo * pageSize;
		ss.setPage(a);
		ss.setRows(b);
		return this.basicMybatisDao.select(ss,"findSalaryStandardByConditionAndPage");
	}

	//复核薪酬标准
	@Override
	public int checkSalaryStandard(SalaryStandard salaryStandard) {
		return this.basicMybatisDao.update(salaryStandard, "checkSalaryStandard");
	}

	//变更薪酬标准
	@Override
	public int changeSalaryStandard(SalaryStandard salaryStandard) {
		return this.basicMybatisDao.update(salaryStandard, "changeSalaryStandard");
	}

}
