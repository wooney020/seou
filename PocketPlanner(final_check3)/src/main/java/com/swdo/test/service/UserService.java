package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.StatisticDAO;
import com.swdo.test.dao.TimerDAO;
import com.swdo.test.dao.UserDAO;
import com.swdo.test.vo.StatisticVO;
import com.swdo.test.vo.TimerVO;
import com.swdo.test.vo.UserVO;

@Service
public class UserService {
	
	@Autowired
	private UserDAO dao;
	@Autowired
	private TimerDAO tdao;
	@Autowired
	private StatisticDAO sdao;
	@Autowired
	private HttpSession session;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	//회원가입
	public String userJoin(UserVO user) {
		
		int cnt = dao.userJoin(user);
		String path = "";
	
		if(cnt == 0) {
			logger.info("회원가입 실패");
			path = "redirect:/user/joinForm";
		}else {
			logger.info("회원가입 성공");
			
			//빈 타이머 데이터 추가
			TimerVO timer = new TimerVO();
			timer.setUser_id(user.getUser_id());
			tdao.timerInsert(timer);
			
			
			
			path = "redirect:/";
		}
	
		return path;
	}
	
	//로그인
	public String userLogin(UserVO user) {
	
		UserVO result = dao.userSelectOne(user.getUser_id());
		String path = "";
		
		if(result != null) {
			if(result.getUser_pw().equals(user.getUser_pw())) {
				logger.info("로그인 성공");
				session.setAttribute("loginVO", result);
				path = "redirect:/";
			}else {//비밀번호 오류
				logger.info("비밀번호 오류");
				session.setAttribute("loginCheck", false);
				path = "redirect:/user/loginForm";
				
			}}else {//아이디 오류
				logger.info("아이디 오류");
				session.setAttribute("loginCheck", false);
				path = "redirect:/user/loginForm";
				
			}
		
		return path;
		
	}
	
	//아이디 중복확인 
	public int idCheck(String user_id) {
		
		UserVO user = dao.userSelectOne(user_id);
		int cnt = 0;
		
		if(user != null) {
			cnt = 1;
		}
		
		return cnt;
	}
	

	//로그아웃
	public void userLogout() {
		
		session.removeAttribute("loginVO");
		session.removeAttribute("planList");
		session.removeAttribute("statisticGraph");
	}

	
	//학습목표 설정
	public void goalSetting(String user_goal) {
		
		
		//user_id을 추가
		
		  UserVO user = (UserVO) session.getAttribute("loginVO");
		  user.setUser_goal(user_goal);
		  int cnt = dao.goalSetting(user);
		  
		  user = dao.userSelectOne(user.getUser_id());
		//String user_goal = result.getUser_goal();
	
		if(cnt == 0) {
			logger.info("목표설정 실패");
			
		}else {
			logger.info("목표설정 성공");
			session.removeAttribute("loginVO");
			session.setAttribute("loginVO", user);
			
		}
		
	}
	
	
	//회원정보 수정
	public void userUpdate(UserVO user) {
		
		int cnt = dao.userUpdate(user);
		
		if(cnt == 0) {
			logger.info("회원정보수정 실패");
		
		}else {
			logger.info("회원정보수정 성공");
			session.removeAttribute("loginVO");
			session.setAttribute("loginVO", user);
		}
		
	}
}
