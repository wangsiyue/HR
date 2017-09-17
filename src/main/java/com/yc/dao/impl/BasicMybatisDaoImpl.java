package com.yc.dao.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import com.yc.dao.BasicMybatisDao;
@Repository
public class BasicMybatisDaoImpl<T> extends SqlSessionDaoSupport implements BasicMybatisDao<T> {
	private String mapperLocation="com.yc.mapper.";
	@Override
	@Resource(name="sqlSessionFactory")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	/*
	 * 获取mapper
	 * @see com.yc.dao.BasicDao#select(java.lang.Object, java.lang.String)
	 */
	private String getMapperId(T t,String sqlId){
		return mapperLocation+t.getClass().getSimpleName()+"Mapper."+sqlId;
	}
	/*
	 * 查询(条件查询，分页查询)
	 */
	@Override
	public List<T> select(T t, String sqlId) {
		return super.getSqlSession().selectList(getMapperId(t,sqlId),t);
	}
	@Override
	public List<T> select(T t, Map map, String sqlId) {
		return super.getSqlSession().selectList(getMapperId(t,sqlId), map);
	}
	/*
	 *添加
	 */
	
	/*
	 * 删除(批量删除)
	 */
	@Override
	public Integer delete(T t, String sqlId) {
		return super.getSqlSession().delete(getMapperId(t,sqlId), t);
	}
	@Override
	public Integer delete(T t, Map map, String sqlId) {
		return super.getSqlSession().delete(getMapperId(t,sqlId), map);
	}
	@Override
	public Integer deleteMany(T t, List list, String sqlId) {
		return super.getSqlSession().update(getMapperId(t,sqlId), list);
	}
	/*
	 * 修改
	 */
	@Override
	public Integer update(T t, String sqlId) {
		return super.getSqlSession().update(getMapperId(t,sqlId), t);
	}
	@Override
	public Integer update(T t, Map map, String sqlId) {
		return super.getSqlSession().update(getMapperId(t,sqlId), map);
	}
	/*
	 * 聚合函数
	 */
	@Override
	public double getCount(T t, String sqlId) {
		return super.getSqlSession().selectOne(getMapperId(t,sqlId),t);
	}
	@Override
	public double getCount(T t, Map map, String sqlId) {
		return super.getSqlSession().selectOne(getMapperId(t,sqlId),map);
	}
	@Override
	public Integer insert(T t, String sqlId) {
		return super.getSqlSession().insert(getMapperId(t,sqlId),t);
	}
	@Override
	public Integer insert(T t, Map map, String sqlId) {
		return super.getSqlSession().insert(getMapperId(t,sqlId),map);
	}
	
	
	
	
	

}
