package com.yc.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigMajorKind;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.biz.ConfigMajorKindBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class ConfigMajorKindBizImpl implements ConfigMajorKindBiz {
	
	private BasicMybatisDao basicMybatisDao;
	
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	/**
	 * 查询方法
	 */
	public List find() {
		return this.basicMybatisDao.select(new ConfigMajorKind(), "findAll");
	}

	@Override
	public Integer del(ConfigMajorKind configMajorkind) {
		return this.basicMybatisDao.delete(configMajorkind, "del");
	}

	@Override
	public Integer add(ConfigMajorKind configMajorKind) {
		return this.basicMybatisDao.insert(configMajorKind, "add");
	}

	@Override
	public ConfigMajorKind findMaxKindId() {
		List<ConfigMajorKind> list= this.basicMybatisDao.select(new ConfigMajorKind(), "findMaxKindId");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public ConfigMajorKind findByMfkId(ConfigMajorKind configMajorKind) {
		List<ConfigMajorKind> list= this.basicMybatisDao.select(configMajorKind, "findByMfkId");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<ConfigMajorKind> find(ConfigMajorKind configMajorKind) {
		List<ConfigMajorKind> list =this.basicMybatisDao.select(configMajorKind, "findAll");
		return list;
	}
	
}