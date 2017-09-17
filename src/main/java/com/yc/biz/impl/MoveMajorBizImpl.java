package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.MajorChange;
import com.yc.bean.Training;
import com.yc.bean.Users;
import com.yc.biz.MoveMajorBiz;
import com.yc.biz.TrainingBiz;
import com.yc.biz.UsersBiz;
import com.yc.biz.UsersBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class MoveMajorBizImpl implements MoveMajorBiz {
		private BasicMybatisDao basicMybatisDao;
		@Resource(name="basicMybatisDaoImpl")
		public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
			this.basicMybatisDao = basicMybatisDao;
		}
		@Override
		public void add(MajorChange mc) {
			this.basicMybatisDao.insert(mc, "add");
		}
		@Override
		public List<MajorChange> FindAll() {
			MajorChange mc=new MajorChange();
			List<MajorChange> list=this.basicMybatisDao.select(mc, "findAll");
			return list;
		}
		@Override
		public MajorChange FindOne(int mch_id) {
			MajorChange mc=new MajorChange();
			mc.setMch_id(mch_id);
			List<MajorChange> l=this.basicMybatisDao.select(mc, "findOne");
			return l.get(0);
		}
		@Override
		public void delete(String human_id) {
			MajorChange mc=new MajorChange();
			mc.setHuman_id(human_id);
			this.basicMybatisDao.delete(mc, "delMajorChange");
		}
		@Override
		public List<MajorChange> FindAllBypage(MajorChange m) {
			
			return this.basicMybatisDao.select(m,"findAllBypage" );
		}
	//-----------------------------------------------------------------	
		/*@Override
		public List<MajorChange> findByCheck_status1(MajorChange m) {
			return this.basicMybatisDao.select(m, "findByCheck_status1");
		}
		@Override
		public List<MajorChange> findByCheck_status0(MajorChange m) {
			return this.basicMybatisDao.select(m,  "findByCheck_status0");
		}*/
		@Override
		public void UpCheck_status1(MajorChange mc) {
			this.basicMybatisDao.update(mc, "UpCheck_status1");
			
		}
		@Override
		public void UpAdd(MajorChange mc) {
			this.basicMybatisDao.update(mc, "UpAdd");
			
		}
}

	