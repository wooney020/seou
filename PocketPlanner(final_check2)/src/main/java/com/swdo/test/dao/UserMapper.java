package com.swdo.test.dao;

import com.swdo.test.vo.UserVO;

public interface UserMapper {
	
	//회원가입
	public int userJoin(UserVO user);
	
	//로그인
	public UserVO userSelectOne(String user_id);
	
	//학습목표 설정
	public int goalSetting(UserVO user);
	
	//회원정보 수정
	public int userUpdate(UserVO user);
	

}
 