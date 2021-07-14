package com.swdo.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swdo.test.vo.CustomerVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/selector1" , method = RequestMethod.GET)
	public String selector1() {
		return "selector1";
	}
	
	@RequestMapping(value = "/selector2" , method = RequestMethod.GET)
	public String selector2() {
		return "selector2";
	}
	
	@RequestMapping(value = "/selector3" , method = RequestMethod.GET)
	public String selector3() {
		return "selector3";
	}
	
	@RequestMapping(value = "/selector4" , method = RequestMethod.GET)
	public String selector4() {
		return "selector4";
	}
	
	@RequestMapping(value = "/selector5" , method = RequestMethod.GET)
	public String selector5() {
		return "selector5";
	}
	
	@RequestMapping(value = "/selector6" , method = RequestMethod.GET)
	public String selector6() {
		return "selector6";
	}
	
	@RequestMapping(value = "/selector7" , method = RequestMethod.GET)
	public String selector7() {
		return "selector7";
	}
	
	@RequestMapping(value = "/selector8" , method = RequestMethod.GET)
	public String selector8() {
		return "selector8";
	}
	@RequestMapping(value = "/each" , method = RequestMethod.GET)
	public String each() {
		return "each";
	}
	@RequestMapping(value = "/selector9" , method = RequestMethod.GET)
	public String selector9() {
		return "selector9";
	}
	@RequestMapping(value = "/attr1" , method = RequestMethod.GET)
	public String attr1() {
		return "attr1";
	}
	@RequestMapping(value = "/attr2" , method = RequestMethod.GET)
	public String attr2() {
		return "attr2";
	}
	@RequestMapping(value = "/attr3" , method = RequestMethod.GET)
	public String attr3() {
		return "attr3";
	}
	@RequestMapping(value = "/attr4" , method = RequestMethod.GET)
	public String attr4() {
		return "attr4";
	}
	@RequestMapping(value = "/event1" , method = RequestMethod.GET)
	public String event1() {
		return "event1";
	}
	
	@RequestMapping(value = "/ajax1" , method = RequestMethod.GET)
	public String ajax1() {
		return "ajax1";
	}
	
	@ResponseBody
	@RequestMapping(value = "ajaxtest1" , method = RequestMethod.GET)
	public String ajaxtest1(int num) {
		System.out.println("화면으로부터 전달받은 데이터:"+num);
		return "test"; //보내줄 데이터의 변수명
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxtest2" , method = RequestMethod.POST)
	public void ajaxtest2(String name , int age, String phone) {
		System.out.println("이름:"+name );
		System.out.println("나이:"+age );
		System.out.println("전화번호:"+phone );
	
	}
	
	




}
