package com.yc.biz.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileSecondKind;
import com.yc.bean.ConfigFileThirdKind;
import com.yc.bean.ConfigPublicChar;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.biz.ConfigFileSecondKindBiz;
import com.yc.biz.ConfigFileThirdKindBiz;
import com.yc.biz.ConfigPublicCharBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class ConfigPublicCharBizImpl implements ConfigPublicCharBiz {
	
	private BasicMybatisDao basicMybatisDao;
	
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	//查询方法
	public List find() {
		return this.basicMybatisDao.select(new ConfigPublicChar(), "findAll");
	}

	//查看所有公共字段
	@Override
	public List findAllProfession() {
		return this.basicMybatisDao.select(new ConfigPublicChar(), "findAllProfession");
	}

	//添加公共字段
	@Override
	public Integer addConfigPublicChar(ConfigPublicChar configPublicChar) {
		return this.basicMybatisDao.insert(configPublicChar, "addConfigPublicChar");
	}
	
	//添加薪酬项目
	@Override
	public Integer addSalaryProject(ConfigPublicChar configPublicChar) {
		return this.basicMybatisDao.insert(configPublicChar, "addSalaryProject");
	}

	//修改薪酬项目
	@Override
	public Integer updSalaryProjectById(ConfigPublicChar configPublicChar) {
		return this.basicMybatisDao.update(configPublicChar, "updSalaryProjectById");
	}

	@Override
	public Integer delSalaryProjectById(ConfigPublicChar configPublicChar) {
		return this.basicMybatisDao.delete(configPublicChar, "delSalaryProjectById");
	}
	
//////////////
@Override
public List<ConfigPublicChar> findAllByattribute_kind() {

return this.basicMybatisDao.select(new ConfigPublicChar(), "findAllByattribute_kind");
}
@Override
public List<ConfigPublicChar> findAllGrade() {
 return this.basicMybatisDao.select(new ConfigPublicChar(), "findAllGrade");
}
	
}