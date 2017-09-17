package com.yc.biz;

import java.util.List;
import com.yc.bean.Users;

public interface UsersBiz {
	public Users add(Users users);
	public Integer update(Users users);
	public List<Users> findUsers(Users users);
	public List<Users> login(Users users);
}
