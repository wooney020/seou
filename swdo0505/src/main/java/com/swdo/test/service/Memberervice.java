package com.swdo.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.MemberDAO;
import com.swdo.test.vo.MemberVO;

@Service
public class Memberervice {

	@Autowired
	private MemberDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(Memberervice.class);
	
	
	 @Autowired private HttpSession session;
	
	
//	데이터 입력
	public String memberInsert(MemberVO member) {
		int cnt= dao.memberInsert(member);
		String path="";
		
		if(cnt==0) {
			logger.info("회원 가입 실패");
			path= "redirect:/member/joinForm";
		}else {
			logger.info("회원 가입 성공");
			path= "redirect:/";
		}
		return path;
	}
	
// 로그인
	public String memberLogin(MemberVO member) {
		MemberVO result = dao.memberLogin(member.getId());
		String path="";
//		member: 사용자가 입력한 값, 
//		result: DB에서 가져온 값
		if(result==null) { //id없다
			path="redirect:/member/loginForm";
		}else { //올바른 로그인정보
			if(member.getPassword().equals(result.getPassword())) {
				logger.info("로그인 완료");
				
				session.setAttribute("loginVO", result); //세션에 로그인VO 넣음.
				path="redirect:/";
			}else { //비밀번호 틀렸다
				path="redirect:/member/loginForm";
			}
		}
		return path;
	}
	
//	로그아웃
	public void logout() {
		session.removeAttribute("loginVO");
		logger.info("로그아웃 성공");
	}
	
//	데이터조회
	public ArrayList<MemberVO> memberSelect(){
		ArrayList<MemberVO> list=dao.memberSelect();
		return list;
	}
	
	
}
