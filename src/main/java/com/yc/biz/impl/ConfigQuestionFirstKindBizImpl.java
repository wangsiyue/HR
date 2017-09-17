package com.yc.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yc.bean.ConfigQuestionFirstKind;
import com.yc.biz.ConfigQuestionFirstKindBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class ConfigQuestionFirstKindBizImpl implements ConfigQuestionFirstKindBiz {
	private BasicMybatisDao basicMybatisDao;
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}
	@Override
	public List<ConfigQuestionFirstKind> findAll(ConfigQuestionFirstKind configQuestionFirstKind) {
		return this.basicMybatisDao.select(configQuestionFirstKind, "findAll");
	}
	@Override
	public ConfigQuestionFirstKind getMaxFirstKindId() {
		List<ConfigQuestionFirstKind> list= this.basicMybatisDao.select(new ConfigQuestionFirstKind(), "getMaxFirstKindId");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public void add(ConfigQuestionFirstKind configQuestionFirstKind) {
		this.basicMybatisDao.insert(configQuestionFirstKind, "add");
	}
	@Override
	public Integer changeConfigQuestionfirstkind(ConfigQuestionFirstKind configQuestionFirstKind) {
		return this.basicMybatisDao.update(configQuestionFirstKind, "changeConfigQuestionfirstkind");
	}
	@Override
	public Integer delete(ConfigQuestionFirstKind configQuestionFirstKind) {
		return this.basicMybatisDao.delete(configQuestionFirstKind, "delete");
	}
	@Override
	public ConfigQuestionFirstKind findByID(ConfigQuestionFirstKind configQuestionFirstKind) {
		List<ConfigQuestionFirstKind> list= this.basicMybatisDao.select(configQuestionFirstKind, "findByID");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
}
