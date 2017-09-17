package com.yc.biz;

import java.util.List;

import com.yc.bean.EngageMajorRelease;

public interface EngageMajorReleaseBiz {
	public EngageMajorRelease add(EngageMajorRelease engageMajorRelease);
	public Integer update(EngageMajorRelease engageMajorRelease);
	public List<EngageMajorRelease> findEngageMajorRelease(EngageMajorRelease engageMajorRelease);
	public EngageMajorRelease delete(EngageMajorRelease engageMajorRelease);
	
	public List<EngageMajorRelease> findDetailByMreId(EngageMajorRelease engageMajorRelease);
	
	//更改次数
	public Integer updateHumanAmount(EngageMajorRelease engageMajorRelease);
}
