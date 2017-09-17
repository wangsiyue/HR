package com.yc.biz;

import java.util.List;
import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigMajorKind;

public interface ConfigMajorKindBiz {
	
	public List find();
	public List<ConfigMajorKind> find(ConfigMajorKind configMajorKind);
	
	public Integer del(ConfigMajorKind configMajorkind);
	public Integer add(ConfigMajorKind configMajorKind);
	
	public ConfigMajorKind findMaxKindId();
	
	public ConfigMajorKind findByMfkId(ConfigMajorKind configMajorKind);
	
}
