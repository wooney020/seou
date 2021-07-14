package com.join.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.join.test.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSession session;
	
	public int userInsert(UserVO user) {
		int cnt = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.userInsert(user);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}
	
	public UserVO userSelectOne(String user_id) {
		
		UserVO result = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.userSelectOne(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<UserVO> userSelectAll() {
		ArrayList<UserVO> result = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.userSelectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
