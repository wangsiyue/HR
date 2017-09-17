package com.yc.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileSecondKind;
import com.yc.bean.HumanFile;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.biz.ConfigFileSecondKindBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class ConfigFileSecondKindBizImpl implements ConfigFileSecondKindBiz {
	
	private BasicMybatisDao basicMybatisDao;
	
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	/**
	 * 查询方法
	 */
	public List find() {
		return this.basicMybatisDao.select(new ConfigFileSecondKind(), "findAll");
	}

	@Override
	public List findByFirstKind(ConfigFileSecondKind f) {
		return this.basicMybatisDao.select(f, "findByFirstKindID");
	}

	@Override
	public ConfigFileSecondKind getMaxSecondKindId() {
		List<ConfigFileSecondKind> list=this.basicMybatisDao.select(new ConfigFileSecondKind(), "getMaxSecondKindId");
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Integer add(ConfigFileSecondKind configFileSecondKind) {
		return this.basicMybatisDao.insert(configFileSecondKind, "add");
	}

	@Override
	public ConfigFileSecondKind findBySecondKindId(ConfigFileSecondKind configFileSecondKind) {
		List<ConfigFileSecondKind> list=this.basicMybatisDao.select(configFileSecondKind, "findBySecondKindId");
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Integer changeConfigFileSecondkind(ConfigFileSecondKind configFileSecondKind) {
		return this.basicMybatisDao.update(configFileSecondKind, "changeConfigFileSecondkind");
	}

	@Override
	public Integer del(ConfigFileSecondKind configFileSecondKind) {
		return this.basicMybatisDao.delete(configFileSecondKind, "delConfigFileSecondKind");
	}

}