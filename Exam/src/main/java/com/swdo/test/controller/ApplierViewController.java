package com.swdo.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.ApplierService;
import com.swdo.test.vo.ApplierVO;

@Controller
@RequestMapping(value = "/applier")
public class ApplierViewController {
	@Autowired
	private ApplierService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ApplierViewController.class);
	
	//회원가입폼으로 이동
	@RequestMapping(value = "/joinForm" , method = RequestMethod.GET)
	public String joinForm() {
		logger.info("회원가입 폼 이동");
		
		return "applier/joinForm";
	}
	
	//회원가입
		@RequestMapping(value = "/join" , method = RequestMethod.POST)
		public String joinForm(ApplierVO applier) {
			logger.info("전달 받은 데이터 :{}" , applier);
			String path = service.applierInsert(applier);
			
			return path;
		}
		
	//로그인폼 이동
		@RequestMapping(value = "/loginForm" , method = RequestMethod.GET)
		public String loginForm() {
			logger.info("로그인 폼 이동");
		
			return "applier/loginForm";
		}	
		
	//로그인
		@RequestMapping(value = "/login" , method = RequestMethod.POST)
		public String login(ApplierVO applier) {
			logger.info("전달 받은 데이터 :{}" , applier);
			String path = service.applierSelectOne(applier);
					
			return path;
		}
		
	//로그아웃
		@RequestMapping(value = "/logout" , method = RequestMethod.GET)
		public String logout() {

			 service.logout();
							
			return "redirect:/";
		}
}
