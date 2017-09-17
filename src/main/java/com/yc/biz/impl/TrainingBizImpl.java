package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Training;
import com.yc.bean.Users;
import com.yc.biz.TrainingBiz;
import com.yc.biz.UsersBiz;
import com.yc.biz.UsersBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class TrainingBizImpl implements TrainingBiz {
		private BasicMybatisDao basicMybatisDao;
		@Resource(name="basicMybatisDaoImpl")
		public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
			this.basicMybatisDao = basicMybatisDao;
		}
		@Override
		public void add(Training training) {
			this.basicMybatisDao.insert(training, "addtraining");
			
		}
		@Override
		public List<Training> findAll() {
			  List<Training>	list=this.basicMybatisDao.select(new Training(), "findallT");
			return list;
		}
		@Override
		public Training findOne(Training training) {
			List< Training> t=this.basicMybatisDao.select(training, "findOne");
			if(t.size()>0){
				return t.get(0);
			}
			return null;
		}
		@Override
		public List<Training> find1(Training training) {
			
			training.getHuman_id();
			 List<Training>  list=	this.basicMybatisDao.select(training, "find1");
			return list;
		}
		@Override
		public void update(Training training) {
			this.basicMybatisDao.update(training, "updateOne");
			
		}
		@Override
		public void delete(Training training) {
			training.getHuman_id();
			this.basicMybatisDao.delete(training, "deleteOne");
			
		}
		@Override
		public List<Training> findByPage(Training training) {
			return  this.basicMybatisDao.select(training, "findByPage");
			
		}
}

	