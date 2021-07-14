package com.swdo.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swdo.test.service.StatisticService;
import com.swdo.test.service.TimerService;
import com.swdo.test.service.UserService;
import com.swdo.test.vo.TimerVO;
import com.swdo.test.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService service;
	@Autowired
	private StatisticService sService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	// 회원가입 폼이동
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {

		return "user/joinForm";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO user) {

		service.userJoin(user);
		String path = login(user);

		return path;
	}

	// 네이버 회원 전용 회원가입
	@RequestMapping(value = "/naver_join", method = RequestMethod.GET)
	public String naver_join(UserVO user) {

		System.out.println("네이버 전용 회원 가입");

		UserVO data = new UserVO();
		data.setUser_id(user.getUser_id().substring(0, user.getUser_id().length() / 2));
		data.setUser_pw(user.getUser_id().substring(user.getUser_id().length() / 2, user.getUser_id().length()));
		data.setUser_nm(user.getUser_nm());

		service.userJoin(data);

		String path = login(data);

		return path;
	}

	// 로그인 폼이동
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {

		return "user/loginForm";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO user) {

		String path = service.userLogin(user);

		return path;
	}

	// 아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(String user_id) {

		int count = 0;
		count = service.idCheck(user_id);

		return count;
	}

	// 네이버 연동 가입 및 로그인
	@RequestMapping(value = "/naver_login", method = RequestMethod.GET)
	public String naver_login(UserVO user) {

		UserVO data = new UserVO();
		data.setUser_id(user.getUser_id().substring(0, user.getUser_id().length() / 2));
		data.setUser_pw(user.getUser_id().substring(user.getUser_id().length() / 2, user.getUser_id().length()));
		data.setUser_nm(user.getUser_nm());

		String path = service.userLogin(data);

		return path;
	}

	// 콜백
	@RequestMapping(value = "/collback", method = RequestMethod.GET)
	public String collback(UserVO user) {

		return "user/collback";
	}

	// 콜백2
	@RequestMapping(value = "/collbackJoin", method = RequestMethod.GET)
	public String collback_join(UserVO user) {

		return "user/collbackJoin";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {

		service.userLogout();

		return "redirect:/";
	}

	// 목표설정
	@RequestMapping(value = "/goalSetting", method = RequestMethod.GET)
	public String goalSetting(String user_goal) {

		service.goalSetting(user_goal);

		return "redirect:/";
	}

	// 회원정보 수정 폼 이동
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm() {

		return "user/updateForm";
	}

	// 회원정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(UserVO user) {

		service.userUpdate(user);

		return "user/updateForm";
	}

}
