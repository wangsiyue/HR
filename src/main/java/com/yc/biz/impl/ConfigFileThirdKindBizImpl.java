package com.yc.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileSecondKind;
import com.yc.bean.ConfigFileThirdKind;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.biz.ConfigFileSecondKindBiz;
import com.yc.biz.ConfigFileThirdKindBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class ConfigFileThirdKindBizImpl implements ConfigFileThirdKindBiz {
	
	private BasicMybatisDao basicMybatisDao;
	
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	/**
	 * 查询方法
	 */
	public List find() {
		return this.basicMybatisDao.select(new ConfigFileThirdKind(), "findAll");
	}

	@Override
	public List findBySecondKind(ConfigFileThirdKind t) {
		return this.basicMybatisDao.select(t, "findBySecondKindID");
	}

	@Override
	public ConfigFileThirdKind getMaxThirdKindIdBySecondId(ConfigFileThirdKind configFileThirdKind) {
		return (ConfigFileThirdKind) this.basicMybatisDao.select(configFileThirdKind, "getMaxThirdKindIdBySecondId");
		
	}

	@Override
	public Integer add(ConfigFileThirdKind configFileThirdKind) {
		return this.basicMybatisDao.insert(configFileThirdKind, "add");
	}

	@Override
	public ConfigFileThirdKind findByFtkId(ConfigFileThirdKind configFileThirdKind) {
		List<ConfigFileThirdKind> list=this.basicMybatisDao.select(configFileThirdKind, "findByFtkId");
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Integer changeConfigFileThirdkind(ConfigFileThirdKind configFileThirdKind) {
		return this.basicMybatisDao.update(configFileThirdKind, "changeConfigFileThirdkind");
	}

	@Override
	public Integer delByFtkId(ConfigFileThirdKind configFileThirdKind) {
		return this.basicMybatisDao.delete(configFileThirdKind, "delByFtkId");
	}
	
	@Override
	public List<ConfigFileThirdKind> findBythirdName(ConfigFileThirdKind configFileThirdKind){
		return this.basicMybatisDao.select(configFileThirdKind, "findByThirdName");
	}
	
}