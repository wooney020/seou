package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.swdo.test.controller.HomeController;
import com.swdo.test.dao.CustomerDAO;
import com.swdo.test.vo.CustomerVO;
import com.swdo.test.vo.ProfileVO;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDAO dao;
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerService.class);

	public String customerInsert(CustomerVO customer) {
		
		int cnt = dao.customerInsert(customer);
		String path = "";
		
		if(cnt == 0) {
			logger.info("회원가입 실패");
			path = "redirect:/customer/joinForm";
		}else {
			logger.info("회원가입 성공");
			path = "redirect:/";
		}
		
		return path;	
	}
	
	//로그인
	public String login(CustomerVO customer) {
		
		CustomerVO result = dao.customerSelectOne(customer.getCustomer_id());
		String path = "";
		
		if(result != null) {
			if(result.getCustomer_pw().equals(customer.getCustomer_pw())) {
				logger.info("로그인 성공");
				session.setAttribute("loginId", result.getCustomer_id());
				session.setAttribute("loginName", result.getCustomer_nm());
				path = "redirect:/";
			}else {//비밀번호 오류
				logger.info("비밀번호 오류");
				path = "redirect:/customer/loginForm";
				
			}}else {//아이디 오류
				logger.info("아이디 오류");
				path = "redirect:/customer/loginForm";
			}
		
		return path;
		
	}
	
	public void logout() {
		session.removeAttribute("loginId");
		session.removeAttribute("loginName");
	}
	
	public ModelAndView profile() {
		//로그인한 사용자의 아이디
		String customer_id = (String)session.getAttribute("loginId");
		//로그인한 사용자의 아이디를 가지고 프로필 테이블 조회.
		ProfileVO profile = dao.profileSelect(customer_id);
		
		ModelAndView mv = new ModelAndView();
		
		//로그인한 사용자가 프로필을 등록하지 않은 경우 - 프로필 등록화면
		if(profile == null) {
			logger.info("프로필 없음");
			mv.setViewName("customer/profileInsertForm"); //가야할 주소 지정
		}
		//프로필을 등록한 경우 - 프로필 확인화면
		else {
			logger.info("프로필있음");
			mv.addObject("profile", profile); //model과 같이 데이터 저장.
			mv.setViewName("customer/profileInfo"); //가야할 주소 지정
		}
		
		return mv;
	}
	
		public void profileInsert(ProfileVO profile) {
			//로그인한 아이디 셋팅
			String customer_id = (String)session.getAttribute("loginId");
			profile.setCustomer_id(customer_id);
			
			int cnt = dao.profileInsert(profile);
			
			if(cnt == 0) {
				logger.info("프로필 등록 실패");
			}else {
				logger.info("프로필 등록 성공");
			}
		}
		
		public boolean idCheck(String customer_id) {
			//사용자가 입력한 아이디 값으로 DB에서 조회한 결과
			CustomerVO result = dao.customerSelectOne(customer_id);
			boolean flag = false;
			//사용가능한 아이디
			if(result == null) {
				flag = true;
			}
			//사용 불가능한 아이디
			else {
				flag = false;
			}
			
			return flag;
		}
		
}
