package com.yc.biz;

import java.util.List;

import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileSecondKind;
import com.yc.bean.HumanFile;

public interface ConfigFileSecondKindBiz {
	
	public List find();
	
	public List findByFirstKind(ConfigFileSecondKind f);
	
	// 获取二级机构编号的最大值
	public ConfigFileSecondKind getMaxSecondKindId();
	
	//添加
	public Integer add(ConfigFileSecondKind configFileSecondKind);
	
	
	public ConfigFileSecondKind findBySecondKindId(ConfigFileSecondKind configFileSecondKind);

	public Integer changeConfigFileSecondkind(ConfigFileSecondKind configFileSecondKind);
	
	public Integer del(ConfigFileSecondKind configFileSecondKind);
}
