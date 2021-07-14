package com.swdo.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
	public void memberInsert(MemberVO member) {
		
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.memberInsert(member);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	
	
	
	
	
	
	}
}
