package com.yc.dao;

import java.util.List;
import java.util.Map;

public interface BasicMybatisDao<T> {
	public List<T> select(T t,String sqlId);
	
	public List<T> select(T t,Map map,String sqlId);
	
	public Integer insert(T t,String sqlId);
	
	public Integer insert(T t,Map map,String sqlId);
	
	public Integer delete(T t,String sqlId);
	
	public Integer delete(T t,Map map ,String sqlId);
	
	public Integer deleteMany(T t,List list,String sqlId);
	
	public Integer update(T t,String sqlId);
	
	public Integer update(T t,Map map,String sqlId);
	
	public double getCount(T t,String sqlId);
	
	public double getCount(T t,Map map,String sqlId);
}
