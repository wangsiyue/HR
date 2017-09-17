package com.yc.biz;

import java.util.List;
import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigMajor;

public interface ConfigMajorBiz {
	
	public List find();
	
	public List findByMajorKindID(ConfigMajor cm);
	
	public Integer add(ConfigMajor configMajor);
	
	public Integer del(ConfigMajor configMajor);
	
	public ConfigMajor findMaxMajorId(ConfigMajor configMajor);
	
	public List<ConfigMajor> findByname(ConfigMajor configMajor);
	
	public Integer subAmount(ConfigMajor configMajor);
	
}
