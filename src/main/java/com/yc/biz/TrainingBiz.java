package com.yc.biz;

import java.util.List;

import com.yc.bean.Training;

public interface TrainingBiz {

	public void add(Training training) ;
	public void delete(Training training) ;
	
	public void update(Training training) ;
	public List<Training> findAll();
	public List<Training> findByPage(Training training);
	public List<Training> find1(Training training);
    Training findOne(Training training);
	

}
