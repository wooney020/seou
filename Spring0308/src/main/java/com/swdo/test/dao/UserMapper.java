package com.swdo.test.dao;

import java.util.ArrayList;
import com.swdo.test.vo.UserVO;

public interface UserMapper {

	public int userInsert(UserVO user);
	
	public ArrayList<UserVO> userSelectAll();
	
	public int userDelete(int user_no);
	
	public UserVO userDetail(int user_no);
	
	public int userUpdate(UserVO user);
	
	public UserVO userLogin(UserVO user);
	
	
}
