package com.yc.biz;

import java.util.List;
import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileThirdKind;
import com.yc.bean.ConfigPublicChar;

public interface ConfigPublicCharBiz {
	public List find();
	
	public List findAllProfession();
	
	public Integer addConfigPublicChar(ConfigPublicChar configPublicChar);

	public Integer addSalaryProject(ConfigPublicChar configPublicChar);
	
	public Integer updSalaryProjectById(ConfigPublicChar configPublicChar);
	
	public Integer delSalaryProjectById(ConfigPublicChar configPublicChar);
	
///////////////////
public List<ConfigPublicChar> findAllByattribute_kind();
public List<ConfigPublicChar> findAllGrade();
	
}
