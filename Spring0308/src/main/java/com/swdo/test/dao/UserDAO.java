package com.swdo.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSession session;
	
	public int userInsert(UserVO user) {
		
		int cnt = 0; // 지역안에서만 사용하고, 초기화가 안 되는 지역변수.
		
		try {
			//Mapper Interface의 객체를 생성해서 메소드를 호출한다.
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.userInsert(user);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt; 
		}
		
		public ArrayList<UserVO> userSelectAll(){
			ArrayList<UserVO> list = new ArrayList<UserVO>();
			try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.userSelectAll();
			}catch(Exception e) {
				e.printStackTrace();
			}
		
			return list;
		}
		
		
		public int userDelete(int user_no) {
		
			int cnt = 0;
			try {
				UserMapper mapper = session.getMapper(UserMapper.class);
				cnt = mapper.userDelete(user_no);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return cnt;
		}
		
		
		public UserVO userDetail(int user_no) {
			UserVO vo = null;
			try {
				UserMapper mapper = session.getMapper(UserMapper.class);
			    vo = mapper.userDetail(user_no);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return vo;
			
			
		}
		
		public int userUpdate(UserVO user) {
			
			int cnt = 0;
			try {
				UserMapper mapper = session.getMapper(UserMapper.class);
				cnt = mapper.userUpdate(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return cnt;
		}
		
		
		public UserVO userLogin(UserVO user) {
			
			UserVO result = null;
			try {
				UserMapper mapper = session.getMapper(UserMapper.class);
				result = mapper.userLogin(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
	
		}
	}
	
	
	

