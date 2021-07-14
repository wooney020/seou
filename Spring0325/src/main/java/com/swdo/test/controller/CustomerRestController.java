package com.swdo.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.swdo.test.service.CustomerService;

@RestController
@RequestMapping(value ="/customer")
public class CustomerRestController {

	@Autowired
	private CustomerService service;
	
	@RequestMapping(value ="/idCheck" ,method= RequestMethod.POST)
	public boolean idCheck(String customer_id) {
		
		//DB에 가서 아이디가 중복되었는지 검사.
		boolean flag = service.idCheck(customer_id);
		
		return flag;
	}
	
}
