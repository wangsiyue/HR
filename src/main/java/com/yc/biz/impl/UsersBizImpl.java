package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Users;
import com.yc.biz.UsersBiz;
import com.yc.dao.BasicMybatisDao;
@Service
public class UsersBizImpl implements UsersBiz {
		private BasicMybatisDao basicMybatisDao;
		@Resource(name="basicMybatisDaoImpl")
		public void setBasicMybatisDao(BasicMybatisDao basicMybatisDao) {
			this.basicMybatisDao = basicMybatisDao;
		}
		@Override
		public Users add(Users users) {
			this.basicMybatisDao.insert(users, "addUsers");
			return users;
		}
		@Override
		public Integer update(Users Users) {
			return this.basicMybatisDao.update(Users, "updateUsers");
		}
		@Override
		public List<Users> findUsers(Users Users) {
			List<Users> list=this.basicMybatisDao.select(Users, "findUsers");
			return list;
		}
		@Override
		public List<Users> login(Users users) {
			List<Users> list=this.basicMybatisDao.select(users, "dologin");
			return list;
		}
		
	
}

	