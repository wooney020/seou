package com.swdo.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.MemberDAO;
import com.swdo.test.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;
	
	
	public void memberInsert(MemberVO member) {
		
		dao.memberInsert(member);
	}
}
