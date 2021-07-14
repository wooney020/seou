package com.swdo.test;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swdo.test.vo.CustomerVO;

@Controller
public class AjaxController {

	@ResponseBody // 여기서 리턴되는 값은 HTML의 BODY로 전달한다는 뜻.
	@RequestMapping(value = "/ajaxtest1" , method = RequestMethod.GET)
	public void ajaxtest1(String id , int num , boolean bool) {
		System.out.println("전달된 문자열 값:"+ id);
		System.out.println("전달된 숫자 값:"+ num);
		System.out.println("전달된 boolean 값:"+ bool);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxtest2",method = RequestMethod.POST)
	public CustomerVO ajaxtest2(CustomerVO customer) {
		System.out.println("전달받은 객체 값:"+customer);
		//DB에 가서 조회한 고객 정보를 전달한다.
		CustomerVO result = new CustomerVO();
		result.setCustid("test");
		result.setPassword("password");
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("스포츠");
		list.add("영화감상");
		list.add("노래부르기");
		
		result.setHobby(list);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxtest3" , method = RequestMethod.POST)
	public CustomerVO ajaxtest3(@RequestBody CustomerVO customer) {
		System.out.println("전달받은 객체 값:"+customer);
		
		CustomerVO result = new CustomerVO();
		result.setCustid("test");
		result.setPassword("password");
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("스포츠");
		list.add("영화감상");
		list.add("노래부르기");
		
		result.setHobby(list);
		
		return result;
	
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxtest4" , method = RequestMethod.POST)
	public CustomerVO ajaxtest4(@RequestBody HashMap<String, Object> obj) {
		System.out.println("전달받은 객체 값:"+obj);
		
		CustomerVO result = new CustomerVO();
		result.setCustid("test");
		result.setPassword("password");
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("스포츠");
		list.add("영화감상");
		list.add("노래부르기");
		
		result.setHobby(list);
		
		return result;
	
	}
}
