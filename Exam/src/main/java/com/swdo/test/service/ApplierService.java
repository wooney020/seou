package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.controller.ApplierViewController;
import com.swdo.test.dao.ApplierDAO;
import com.swdo.test.vo.ApplierVO;

@Service
public class ApplierService {
	
	@Autowired
	private ApplierDAO dao;
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(ApplierService.class);
	
	public String applierInsert(ApplierVO applier) {
		int cnt = dao.applierInsert(applier);
		String path = "";
		
		if(cnt == 0) {
			logger.info("회원가입 실패");
			path = "redirect:joinForm";
		}else {
			logger.info("회원가입 성공");
			path = "redirect:/";
		}
		
		return path;
	}
	
	public String applierSelectOne(ApplierVO applier) {
		ApplierVO result = dao.applierSelectOne(applier);
		String path = "";
		
		if(result == null) {
			logger.info("로그인 실패 : 아이디가 다릅니다");
			path = "redirect:loginForm";
		}else {
			
			if(result.getApplier_pw().equals(applier.getApplier_pw())) {
				logger.info("로그인 성공");
				session.setAttribute("loginVO", result);
				path = "redirect:/";
				
			}else {
				logger.info("로그인 실패 : 비밀번호가 틀립니다");
				path = "redirect:loginForm";
			}	
		}
		
		return path;
	}
	
	public void logout() {
		session.removeAttribute("loginVO");
		logger.info("로그아웃 성공");
		
	}
}
