package com.yc.biz;

import java.util.List;

import com.yc.bean.ConfigQuestionFirstKind;
import com.yc.bean.ConfigQuestionSecondKind;

public interface ConfigQuestionSecondKindBiz {
	public List<ConfigQuestionSecondKind> findByFirstId(ConfigQuestionSecondKind configQuestionSecondKid);
	
	public List<ConfigQuestionSecondKind> find(ConfigQuestionSecondKind configQuestionSecondKind);
	
	public ConfigQuestionSecondKind findByID(ConfigQuestionSecondKind configQuestionSecondKind);
	
	// 获取一级机构编号的最大值
	public ConfigQuestionSecondKind getMaxSecondKindId();
	
	public void add(ConfigQuestionSecondKind configQuestionSecondKind);
	
	public Integer changeConfigQuestionSecondkind(ConfigQuestionSecondKind configQuestionSecondKind);
	
	public Integer delete(ConfigQuestionSecondKind configQuestionSecondKind);
}
