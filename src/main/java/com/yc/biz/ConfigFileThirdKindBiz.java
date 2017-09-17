package com.yc.biz;

import java.util.List;
import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileSecondKind;
import com.yc.bean.ConfigFileThirdKind;

public interface ConfigFileThirdKindBiz {
	public List find();
	
	public List findBySecondKind(ConfigFileThirdKind s);
	
	public ConfigFileThirdKind getMaxThirdKindIdBySecondId(ConfigFileThirdKind configFileThirdKind);
	
	public Integer add(ConfigFileThirdKind configFileThirdKind);
	
	public ConfigFileThirdKind findByFtkId(ConfigFileThirdKind configFileThirdKind);

	public Integer changeConfigFileThirdkind(ConfigFileThirdKind configFileThirdKind);

	public Integer delByFtkId(ConfigFileThirdKind configFileThirdKind);
	
	public List<ConfigFileThirdKind> findBythirdName(ConfigFileThirdKind configFileThirdKind);

}
