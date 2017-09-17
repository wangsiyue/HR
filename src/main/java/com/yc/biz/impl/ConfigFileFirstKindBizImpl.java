package com.yc.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.SalaryStandard;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class ConfigFileFirstKindBizImpl implements ConfigFileFirstKindBiz {
	
	private BasicMybatisDao basicMybatisDao;
	
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	/**
	 * 查询方法
	 */
	public List find() {
		return this.basicMybatisDao.select(new ConfigFileFirstKind(), "findAll");
	}

	//获取一级机构编号的最大值
	@Override
	public ConfigFileFirstKind getMaxFirstKindId() {
		List<ConfigFileFirstKind> list=this.basicMybatisDao.select(new ConfigFileFirstKind(), "getMaxFirstKindId");
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public void add(ConfigFileFirstKind configFileFirstKind) {
		this.basicMybatisDao.insert(configFileFirstKind, "add");
	}

	@Override
	public ConfigFileFirstKind findByFirstKindId(ConfigFileFirstKind configFileFirstKind) {
		List<ConfigFileFirstKind> list=this.basicMybatisDao.select(configFileFirstKind, "findByFirstKindId");
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Integer changeConfigfilefirstkind(ConfigFileFirstKind configFileFirstKind) {
		return this.basicMybatisDao.update(configFileFirstKind, "changeConfigfilefirstkind");
	}

	@Override
	public Integer delete(ConfigFileFirstKind configFileFirstKind) {
		return this.basicMybatisDao.delete(configFileFirstKind, "delConfigfilefirstkind");
	}
	
}