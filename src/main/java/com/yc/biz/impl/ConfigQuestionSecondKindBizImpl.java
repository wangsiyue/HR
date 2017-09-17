package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.ConfigQuestionSecondKind;
import com.yc.biz.ConfigQuestionSecondKindBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class ConfigQuestionSecondKindBizImpl implements ConfigQuestionSecondKindBiz {
	private BasicMybatisDao basicMybatisDao;
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}
	@Override
	public List<ConfigQuestionSecondKind> findByFirstId(ConfigQuestionSecondKind configQuestionSecondKind) {
		List<ConfigQuestionSecondKind>list =basicMybatisDao.select(configQuestionSecondKind, "findByFirstId");
		return list;
	}
	@Override
	public List<ConfigQuestionSecondKind> find(ConfigQuestionSecondKind configQuestionSecondKind) {
		return this.basicMybatisDao.select(configQuestionSecondKind, "find");
	}
	@Override
	public ConfigQuestionSecondKind findByID(ConfigQuestionSecondKind configQuestionSecondKind) {
		List<ConfigQuestionSecondKind> list = this.basicMybatisDao.select(configQuestionSecondKind, "findByID");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public ConfigQuestionSecondKind getMaxSecondKindId() {
		List<ConfigQuestionSecondKind> list = this.basicMybatisDao.select(new ConfigQuestionSecondKind(), "getMaxSecondKindId");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public void add(ConfigQuestionSecondKind configQuestionSecondKind) {
		this.basicMybatisDao.insert(configQuestionSecondKind, "add");
	}
	@Override
	public Integer changeConfigQuestionSecondkind(ConfigQuestionSecondKind configQuestionSecondKind) {
		return this.basicMybatisDao.update(configQuestionSecondKind, "changeConfigQuestionSecondkind");
	}
	@Override
	public Integer delete(ConfigQuestionSecondKind configQuestionSecondKind) {
		return this.basicMybatisDao.update(configQuestionSecondKind, "delete");
	}
}
