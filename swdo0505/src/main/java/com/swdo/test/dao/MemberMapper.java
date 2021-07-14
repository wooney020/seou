package com.swdo.test.dao;

import java.util.ArrayList;

import com.swdo.test.vo.MemberVO;

public interface MemberMapper {
	
	
//	데이터 입력
	public int memberInsert(MemberVO member);
	
// 로그인
	public MemberVO memberLogin(String id);
	
//	회원 조회
	public ArrayList<MemberVO> memberSelect();
}
