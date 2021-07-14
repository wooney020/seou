package com.swdo.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.CalendarService;
import com.swdo.test.service.StatisticService;
import com.swdo.test.service.TimerService;
import com.swdo.test.service.UserService;
import com.swdo.test.vo.UserVO;


@Controller
public class HomeController {
	@Autowired
	private UserService service;
	@Autowired
	private TimerService tmService;
	@Autowired
	private CalendarService cService;
	@Autowired
	private StatisticService sService;
	@Autowired
	private HttpSession session;
	
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		tmService.totalTimerSelect();
		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		
		if(loginVO != null) {
			
			cService.selectToDoList();
			sService.selectStatisticGraph();
			
		}
		return "home";
	}
	
	
	
	
	
}
