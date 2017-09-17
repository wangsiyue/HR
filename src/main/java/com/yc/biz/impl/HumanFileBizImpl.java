package com.yc.biz.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.HumanFile;
import com.yc.biz.HumanFileBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class HumanFileBizImpl implements HumanFileBiz {
	
	private BasicMybatisDao basicMybatisDao;
	
	@Resource(name="basicMybatisDaoImpl")
	public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
		this.basicMybatisDao = basicMybatisDao;
	}

	//添加档案信息
	@Override
	public Integer add(HumanFile humanFile) throws Exception {
		return this.basicMybatisDao.insert(humanFile, "addHumanFile");
	}

	@Override
	public Integer update(HumanFile humanFile) throws Exception {
		return this.basicMybatisDao.update(humanFile, "updateHumanFile");
	}

	@Override
	public List<HumanFile> findById(HumanFile humanFile) throws Exception {
		return this.basicMybatisDao.select(humanFile, "findById");
	}

	@Override
	public Integer delete(HumanFile humanFile) throws Exception {
		return this.basicMybatisDao.delete(humanFile, "delHumanFile");
	}

	//查看所有需要审核的档案
	@Override
	public List<HumanFile> findCheckFile() throws Exception {
		return this.basicMybatisDao.select(new HumanFile(), "findCheckFile");
	}

	//分页
	@Override
	public List<HumanFile> findByPage(HumanFile humanFile, int pageNo, int pageSize) throws Exception {
		int a=(pageNo-1)*pageSize;
		int b=pageNo*pageSize;
		humanFile.setPage(a);
		humanFile.setRows(b);
		return this.basicMybatisDao.select(humanFile,"findByPage");
	}

	@Override
	public List<HumanFile> findByConditionAndPage(HumanFile humanFile, int pageNo, int pageSize) throws Exception {
		int a=(pageNo-1)*pageSize;
		int b=pageNo*pageSize;
		humanFile.setPage(a);
		humanFile.setRows(b);
		return this.basicMybatisDao.select(humanFile,"findByConditionAndPage");
	}

	@Override
	public List<HumanFile> findAllMatchConditionFile(HumanFile humanFile) throws Exception {
		return this.basicMybatisDao.select(humanFile,"findAllMatchConditionFile");
	}

	//恢复
	@Override
	public Integer recoveryHumanFile(HumanFile humanFile) throws Exception {
		return this.basicMybatisDao.update(humanFile, "recoveryHumanFile");
	}
	
	

//薪酬发放---------------------------------------------------------------------------
	@Override
	public List<HumanFile> findSalaryGrantByFirstKind() {
		return this.basicMybatisDao.select(new HumanFile(), "findSalaryGrantByFirstKind");
	}

	@Override
	public List<HumanFile> findSalaryGrantBySecondKind() {
		return this.basicMybatisDao.select(new HumanFile(), "findSalaryGrantBySecondKind");
	}

	@Override
	public List<HumanFile> findByFirstOrSecondId(HumanFile humanFile) {
		return this.basicMybatisDao.select(humanFile, "findByFirstOrSecondId");
	}

	@Override
	public Integer checkHumanFile(HumanFile humanFile) throws Exception {
		return this.basicMybatisDao.update(humanFile, "checkHumanFile");
	}
	
	
	//**************************************************************************************
		@Override
		public List<HumanFile> FindAll() {
			 List<HumanFile>  t=this.basicMybatisDao.select(new HumanFile(), "findAll");
			return t;
		}
		@Override
		public List<HumanFile> selectOne(int huf_id) {
			HumanFile h=new HumanFile();
			h.setHuf_id(huf_id);
			List<HumanFile> list=this.basicMybatisDao.select(h, "selectOne");
			return list;
		}
		@Override
		public List<HumanFile> AllfindByPage(HumanFile humanFile) throws Exception {
			return this.basicMybatisDao.select(humanFile,"AllfindByPage");
		}
		@Override 
		public List<HumanFile> select1(String human_id) {
			HumanFile h=new HumanFile();
			h.setHuman_id(human_id);
			return this.basicMybatisDao.select(h, "select1");
		}
		
		@Override
		public List<HumanFile> findBysex(HumanFile humanFile) {
			return this.basicMybatisDao.select(humanFile, "findBysex");
		}
		@Override
		public void updatestatus0(HumanFile humanFile) {
			this.basicMybatisDao.update(humanFile, "updatestatus0");
		}
		@Override
		public void updatestatus1(HumanFile humanFile) {
			this.basicMybatisDao.update(humanFile, "updatestatus1");
		}
		@Override
		public List<HumanFile> findByName(HumanFile humanFile) {
			return this.basicMybatisDao.select(humanFile, "findByName");
		}
}