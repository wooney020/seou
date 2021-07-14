package com.swdo.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.CustomerService;
import com.swdo.test.vo.CustomerVO;

@Controller
@RequestMapping(value="/customer")
public class CustomerViewController {

	@Autowired
	private CustomerService service;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerViewController.class);
	
	@RequestMapping(value = "/loginForm" , method = RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인 폼 이동");
		return "customer/loginForm";
	}
	
	@RequestMapping(value ="/login" , method = RequestMethod.POST)
	public String login(CustomerVO customer) {
		logger.info("입력된 로그인 정보 {}",customer);
		String path = service.customerLogin(customer);
		
		return path;
	}
	
	@RequestMapping(value = "/logout" , method = RequestMethod.GET)
	public String logout() {
		service.logout();
		
		return "redirect:/";
	}
}
