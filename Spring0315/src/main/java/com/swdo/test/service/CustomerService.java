package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.controller.CustomerViewController;
import com.swdo.test.dao.CustomerDAO;
import com.swdo.test.vo.CustomerVO;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDAO dao;
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerService.class);

	public String customerLogin(CustomerVO customer) {
		CustomerVO result = dao.customerLogin(customer);
		String path = "";
		
		if( result == null){
			logger.info("잘못된 ID입력");
			path = "redirect:/customer/loginForm";
		}else {
			if(result.getCustomer_pw().equals(customer.getCustomer_pw())){
				logger.info("올바른 로그인 정보 입력");
				session.setAttribute("loginVO", result);
				path = "redirect:/";
				
			}else {
				logger.info("잘못된 PW 입력");
				path = "redirect:/customer/loginForm";
			}
		}
		
		return path;

	}
	
	public void logout() {
		logger.info("로그아웃 기능");
		session.removeAttribute("loginVO");
		
		}
	}













