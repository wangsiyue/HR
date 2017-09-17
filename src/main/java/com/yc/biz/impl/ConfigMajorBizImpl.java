package com.yc.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigMajor;
import com.yc.bean.ConfigMajorKind;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.biz.ConfigMajorBiz;
import com.yc.biz.ConfigMajorKindBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class ConfigMajorBizImpl implements ConfigMajorBiz {
	
	private BasicMybatisDao basicMybatisDao;
	
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	/**
	 * 查询方法
	 */
	public List find() {
		return this.basicMybatisDao.select(new ConfigMajor(), "findAll");
	}

	@Override
	public List findByMajorKindID(ConfigMajor cm) {
		return this.basicMybatisDao.select(cm, "findByMajorKindID");
	}

	@Override
	public Integer add(ConfigMajor configMajor) {
		return this.basicMybatisDao.insert(configMajor, "add");
	}

	@Override
	public Integer del(ConfigMajor configMajor) {
		return this.basicMybatisDao.delete(configMajor, "del");
	}

	@Override
	public ConfigMajor findMaxMajorId(ConfigMajor configMajor) {
		List<ConfigMajor> list=this.basicMybatisDao.select(configMajor, "findMaxMajorId");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public List<ConfigMajor> findByname(ConfigMajor configMajor) {
		
		return this.basicMybatisDao.select(configMajor, "findByname");
	}

	@Override
	public Integer subAmount(ConfigMajor configMajor) {
		return this.basicMybatisDao.update(configMajor, "subAmount");
	}
	
	
}