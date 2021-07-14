package com.swdo.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
//	회원등록 memberInsert
	public int memberInsert(MemberVO member) {
		int cnt=0;
		try {
			MemberMapper mapper= session.getMapper(MemberMapper.class);
			cnt=mapper.memberInsert(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
//	로그인 memberLogin
	public MemberVO memberLogin(String id) {
		MemberVO result= null;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result= mapper.memberLogin(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
// 회원 조회 memberSelect
	public ArrayList<MemberVO> memberSelect(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
	 try {
		 MemberMapper mapper = session.getMapper(MemberMapper.class);
		 list= mapper.memberSelect();
	} catch (Exception e) {
		e.printStackTrace();
	}
	 return list;
	}
	
	
}
