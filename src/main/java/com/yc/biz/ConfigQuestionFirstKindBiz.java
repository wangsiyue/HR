package com.yc.biz;

import java.util.List;

import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigQuestionFirstKind;

public interface ConfigQuestionFirstKindBiz {
	public List<ConfigQuestionFirstKind> findAll(ConfigQuestionFirstKind configQuestionFirstKind);
	
	public ConfigQuestionFirstKind findByID(ConfigQuestionFirstKind configQuestionFirstKind);
	
	// 获取一级机构编号的最大值
	public ConfigQuestionFirstKind getMaxFirstKindId();
	
	public void add(ConfigQuestionFirstKind configQuestionFirstKind);
	
	public Integer changeConfigQuestionfirstkind(ConfigQuestionFirstKind configQuestionFirstKind);
	
	public Integer delete(ConfigQuestionFirstKind configQuestionFirstKind);

}
