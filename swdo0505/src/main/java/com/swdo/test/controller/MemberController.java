package com.swdo.test.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.Memberervice;
import com.swdo.test.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	@Autowired
	private Memberervice service;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

//	회원가입 페이지로 이동
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		logger.info("회원 가입 폼 이동");
		return "member/joinForm";
	}
	
// 데이터입력
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(MemberVO member) {
		logger.info("입력받은 데이터 값: "+ member);
		return service.memberInsert(member);
	}
	
// 로그인 폼 이동
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인 폼 이동");
		return "member/loginForm";
	}
	
// 로그인 기능
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(MemberVO member) {
		return service.memberLogin(member);
	}
	
//	로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout() {
		service.logout();
		logger.info("로그아웃");
		return "redirect:/";
	}
	
// 회원목록폼 이동
	@RequestMapping(value="/listForm", method=RequestMethod.GET)
	public String listForm(Model model) {
		ArrayList<MemberVO> list = service.memberSelect();
		model.addAttribute("userList", list);
		
		return "member/listForm";
	}
	
	
}
