package com.swdo.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value ="/customer")
public class CustomerController {

	
	@RequestMapping(value = "/loginform" , method = RequestMethod.GET)
	public String loginForm() {
		
		return "customer/loginform";
	}
	
	@RequestMapping(value = "/joinform" , method = RequestMethod.GET)
	public String joinForm() {
		
		return "customer/joinform";
	}
}
