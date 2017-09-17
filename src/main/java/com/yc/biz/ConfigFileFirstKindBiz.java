package com.yc.biz;

import java.util.List;
import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.SalaryStandard;

public interface ConfigFileFirstKindBiz {
	
	public List find();
	
	// 获取一级机构编号的最大值
	public ConfigFileFirstKind getMaxFirstKindId();
	
	/**
	 * 查询方法，重载
	 * @param condition 对象，该对象中设定了查询条件
	 * @return　存放ConfigFileFirstKind对象的集合
	 */
	//public List find(final ConfigFileFirstKind condition);

	/**
	 * 添加
	 * @param item ConfigFileFirstKindind对象
	 */
	public void add(ConfigFileFirstKind configFileFirstKind);
	
	public ConfigFileFirstKind findByFirstKindId(ConfigFileFirstKind configFileFirstKind);
	
	/**
	 * 更新方法
	 * @param item ConfigFileFirstKind对象
	 */
	public Integer changeConfigfilefirstkind(ConfigFileFirstKind configFileFirstKind);
	
	/**
	 * 删除方法
	 */
	public Integer delete(ConfigFileFirstKind configFileFirstKind);
	/**
	 * 删除方法，重载
	 * @param item ConfigFileFirstKind对象
	 */
}
