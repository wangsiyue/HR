package com.yc.biz;

import java.util.List;
import com.yc.bean.HumanFile;

public interface HumanFileBiz {
	// 根据ID号返回对象
	// public HumanFile getbyID(java.io.Serializable id);

	// 添加档案
	public Integer add(HumanFile humanFile) throws Exception;

	// 复核
	public Integer checkHumanFile(HumanFile humanFile) throws Exception;

	// 更新
	public Integer update(HumanFile humanFile) throws Exception;

	// 查询
	public List<HumanFile> findById(HumanFile humanFile) throws Exception;

	// 查询所有复核文件
	public List<HumanFile> findCheckFile() throws Exception;

	// 分页查询
	public List<HumanFile> findByPage(HumanFile humanFile, int pageNo, int pageSize) throws Exception;

	// 按条件查询并分页
	public List<HumanFile> findByConditionAndPage(HumanFile humanFile, int pageNo, int pageSize) throws Exception;

	// 查看所有符合条件的档案
	public List<HumanFile> findAllMatchConditionFile(HumanFile humanFile) throws Exception;

	// 删除
	public Integer delete(HumanFile humanFile) throws Exception;

	// 恢复
	public Integer recoveryHumanFile(HumanFile humanFile) throws Exception;

	// 薪酬发放-----------------------------------------------------------------------------------
	public List<HumanFile> findSalaryGrantByFirstKind();

	public List<HumanFile> findSalaryGrantBySecondKind();

	public List<HumanFile> findByFirstOrSecondId(HumanFile humanFile);
	
	
	
	
	public List<HumanFile> findBysex(HumanFile humanFile);

	public void updatestatus0(HumanFile humanFile);

	public void updatestatus1(HumanFile humanFile);

	public List<HumanFile> findByName(HumanFile humanFile);

	public List<HumanFile> FindAll();

	public List<HumanFile> selectOne(int huf_id);

	public List<HumanFile> AllfindByPage(HumanFile humanFile) throws Exception;

	public List<HumanFile> select1(String human_id);

}
