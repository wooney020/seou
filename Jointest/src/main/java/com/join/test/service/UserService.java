package com.join.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.join.test.UserViewController;
import com.join.test.dao.UserDAO;
import com.join.test.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserDAO dao;
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	
	public String userInsert(UserVO user) {
		int cnt = dao.userInsert(user);
		String path = "";
		if(cnt == 0) {
			logger.info("회원가입 실패");
			path = "redirect:/user/joinForm";
		}else {
			logger.info("회원가입 성공");
			path = "redirect:/";
		}
		
		return path;
	}
	
	public String userLogin(UserVO user) {
		
		UserVO result = dao.userSelectOne(user.getUser_id());
		String path = "";
		
		if(result == null) {
			logger.info("ID가 없습니다.");
			path = "redirect:/user/loginForm";
		}else {
			if(result.getUser_pw().equals(user.getUser_pw())) {
				logger.info("로그인 성공");
				session.setAttribute("loginVO", result);

				path ="redirect:/";
			}else {
				logger.info("비밀번호가 올바르지 않습니다.");
				path = "redirect:/user/loginForm";
			}
		}
		
		return path;
		
	}
	
	public void userLogout() {
		session.removeAttribute("loginVO");
		
	}
	
	public ArrayList<UserVO> userSelectAll() {
		ArrayList<UserVO> result = dao.userSelectAll();
		
		return result;
	}

}
