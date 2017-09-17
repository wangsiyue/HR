package com.yc.biz;

import java.util.List;

import com.yc.bean.MajorChange;

public interface MoveMajorBiz {

	public void add(MajorChange mc) ;
	public void delete(String human_id) ;

	public List<MajorChange> FindAll();
	public List<MajorChange> FindAllBypage(MajorChange m);
	public MajorChange FindOne(int mch_id);
//---------------------------------------------------------------------------------
	/*public List<MajorChange> findByCheck_status1(MajorChange m);
	public List<MajorChange> findByCheck_status0(MajorChange m);*/
	public void UpCheck_status1(MajorChange mc) ;
	public void UpAdd(MajorChange mc) ;
}
