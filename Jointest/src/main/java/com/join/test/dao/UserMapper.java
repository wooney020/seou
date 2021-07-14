package com.join.test.dao;

import java.util.ArrayList;

import com.join.test.vo.UserVO;

public interface UserMapper {
	
	public int userInsert(UserVO user);
	public UserVO userSelectOne(String user_id);
	public ArrayList<UserVO> userSelectAll();

}
