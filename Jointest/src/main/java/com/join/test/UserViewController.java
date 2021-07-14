package com.join.test;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.join.test.service.UserService;
import com.join.test.vo.UserVO;

@Controller
@RequestMapping(value="/user")
public class UserViewController {
	@Autowired
	private UserService service;
	private static final Logger logger = LoggerFactory.getLogger(UserViewController.class);
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {

		return "user/joinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO user) {
		logger.info("전달 받은 데이터: {}",user);
		//jsp에서 전달받은 데이터를 DB에 insert.
		String path = service.userInsert(user);

		return path;
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
	
		return "/user/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO user) {
		String path = service.userLogin(user);
		
		return path;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		service.userLogout();
		
		return "redirect:/";
	}
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm(Model model) {
		//회원 전체 정보를 JSP에 보내주기
		ArrayList<UserVO> result = service.userSelectAll();
		model.addAttribute("userList", result);
		
		return "/user/listForm";
	}
	
	
	
}
