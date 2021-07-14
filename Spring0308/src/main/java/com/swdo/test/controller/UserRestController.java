package com.swdo.test.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.swdo.test.service.UserService;
import com.swdo.test.vo.UserVO;

@RestController
@RequestMapping(value="/user")
public class UserRestController {

	@Autowired
	private UserService service;
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public ArrayList<UserVO> delete(int user_no){
		//데이터 삭제
		service.userDelete(user_no);
		//삭제 후 전체 데이터
		ArrayList<UserVO> list = service.userSelectAll();
		
		return list; //비동기 방식이므로 model에 담는 것이 아닌 데이터를 그냥 보내줌.
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
