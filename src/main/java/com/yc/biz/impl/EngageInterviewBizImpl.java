package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.EngageInterview;
import com.yc.bean.EngageResume;
import com.yc.biz.EngageInterviewBiz;
import com.yc.dao.BasicMybatisDao;
@Service		
public class EngageInterviewBizImpl implements EngageInterviewBiz {
	private BasicMybatisDao basicMybatisDao;
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}
	@Override
	public List<EngageInterview> find(EngageInterview enageInterview) {
		List<EngageInterview> list=this.basicMybatisDao.select(enageInterview, "findInterview");
		return list;
	}
	
	@Override
	public Integer addInterview(EngageInterview engageInterview) {
		return this.basicMybatisDao.insert(engageInterview, "addInterview");
	}
	@Override
	public Integer checkInterview(EngageInterview engageInterview) {
		if("建议面试".equals(engageInterview.getResult())){
			//简历表中面试状态改为0  登记面试时面试次数加1 其余不用加1
			EngageResume engageResume=new EngageResume();
			engageResume.setInterview_status(0);
			engageResume.setRes_id(engageInterview.getResume_id());
			int i=this.basicMybatisDao.update(engageResume, "updInterview");
			engageInterview.setInterview_amount(engageInterview.getInterview_amount()+1);
		}
		if("建议面试".equals(engageInterview.getResult())){
			engageInterview.setCheck_status(0);
		}else{
			engageInterview.setCheck_status(1);
		}
		return this.basicMybatisDao.update(engageInterview, "checkInterview");
	}
	@Override
	public Integer deleteInterview(EngageInterview engageInterview) {
		return this.basicMybatisDao.delete(engageInterview, "deleteInterview");
	}
	@Override
	public List<EngageInterview> findResumeExit(EngageInterview engageInterview) {
		return this.basicMybatisDao.select(engageInterview, "findResumeExit");
	}
	@Override
	public Integer updateInterview(EngageInterview engageInterview) {
		return this.basicMybatisDao.update(engageInterview, "updateInterview");
	}
	
	

}
