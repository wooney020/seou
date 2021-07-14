package com.swdo.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swdo.test.service.CustomerService;
import com.swdo.test.vo.CustomerVO;
import com.swdo.test.vo.ProfileVO;

@Controller
@RequestMapping(value = "/customer")
public class CustomerViewController {
	@Autowired
	private CustomerService service;

	private static final Logger logger = LoggerFactory.getLogger(CustomerViewController.class);
	
	@RequestMapping(value ="/joinForm" , method = RequestMethod.GET)
	public String joinForm() {
		logger.info("회원가입 폼 이동");
		return "customer/joinForm";
	}
	
	@RequestMapping(value = "/join" , method = RequestMethod.POST)
	public String join(CustomerVO customer) {
		String path = service.customerInsert(customer);
		logger.info("회원가입 된 정보: {}",customer);
		return path;
	}
	
	@RequestMapping(value = "/loginForm" , method = RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인 폼 이동");
		return "customer/loginForm";
		
	}
	
	@RequestMapping(value="/login" , method = RequestMethod.POST)
	public String login(CustomerVO customer) {
		String path = service.login(customer);
		return path;
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout() {
		service.logout();
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/profile" , method = RequestMethod.GET)
	public ModelAndView profile() {
		ModelAndView mv = service.profile();
		return mv;
		
	}
	
	@RequestMapping(value = "/profileInsert" , method = RequestMethod.POST)
	public String profileInsert(ProfileVO profile) {
		
		service.profileInsert(profile);
		return "redirect:/";
	}
	
	
	
}
