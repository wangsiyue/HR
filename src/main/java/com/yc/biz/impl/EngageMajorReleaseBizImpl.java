package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.EngageMajorRelease;
import com.yc.biz.EngageMajorReleaseBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class EngageMajorReleaseBizImpl implements EngageMajorReleaseBiz {
	private BasicMybatisDao basicMybatisDao;
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}
	@Override
	public EngageMajorRelease add(EngageMajorRelease engageMajorRelease) {
		this.basicMybatisDao.insert(engageMajorRelease, "addEngageMajorRelease");
		return engageMajorRelease;
	}

	@Override
	public Integer update(EngageMajorRelease engageMajorRelease) {
		return this.basicMybatisDao.update(engageMajorRelease, "updateEngageMajorRelease");
	}

	@Override
	public List<EngageMajorRelease> findEngageMajorRelease(EngageMajorRelease engageMajorRelease) {
		List<EngageMajorRelease> list=this.basicMybatisDao.select(engageMajorRelease, "findEngageMajorRelease");
		return list;
	}
	@Override
	public EngageMajorRelease delete(EngageMajorRelease engageMajorRelease) {
		this.basicMybatisDao.insert(engageMajorRelease, "deleteEngageMajorRelease");
		return engageMajorRelease;
	}
	@Override
	public List<EngageMajorRelease> findDetailByMreId(EngageMajorRelease engageMajorRelease) {
		return this.basicMybatisDao.select(engageMajorRelease, "findDetailByMreId");
	}
	@Override
	public Integer updateHumanAmount(EngageMajorRelease engageMajorRelease) {
		return this.basicMybatisDao.update(engageMajorRelease, "updateHumanAmount");
	}

}
