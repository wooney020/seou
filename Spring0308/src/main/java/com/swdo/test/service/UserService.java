package com.swdo.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.UserDAO;
import com.swdo.test.vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDAO dao;
	@Autowired
	private HttpSession session;
	
	
	public String userInsert(UserVO user) {
		int cnt = dao.userInsert(user);
		String path = ""; //상황에 따라 응답에 대한 정보를 담아주는 변수
		
		//비지니스 로직
		if(cnt == 0) {
			System.out.println("회원 가입 실패");
			path = "redirect:/user/joinForm";
		}else {
			System.out.println("회원 가입 성공");
			path = "redirect:/";
		}
		
		return path;
	}
	
	public ArrayList<UserVO> userSelectAll(){
		ArrayList<UserVO> list = dao.userSelectAll();		
		return list;
	
	}
	
	public void userDelete(int user_no) {
		int cnt = dao.userDelete(user_no); //위에서 다오에 의존성을 주입했음.
	
		if(cnt == 0) {
			System.out.println("삭제 실패");
			
		}else {
			System.out.println("삭제 성공");
		}

	}
	
	public UserVO userDetail(int user_no) {
		UserVO vo = dao.userDetail(user_no);
		return vo;
	}
	

	public String userUpdate(UserVO user) {
		int cnt = dao.userUpdate(user);
		String path = "";
		
		if(cnt == 0) {
			System.out.println("회원 정보 수정 실패");
			path = "redirect:/user/updateForm?user_no="+user.getUser_no();
		}else {
			System.out.println("회원 정보 수정 성공");
			path = "redirect:/user/listForm";
		}
		
		return path;
		
	}
	
	public String userLogin(UserVO user) {
		
		UserVO result = dao.userLogin(user);
		String path = "";
		
		if(result == null) {
			System.out.println("ID가 없습니다.");
			path = "redirect:/user/loginForm";
		}else {
			System.out.println("ID가 있습니다.");
			//비밀번호 조회
			if(result.getUser_pw().equals(user.getUser_pw())) { //result는 DB값, user는 작성자가 입력한 값
				System.out.println("로그인 정보가 올바르다.");
				//세션스코프에 검증이 됬다는 데이터를 넣어준다.
				session.setAttribute("loginVO", result); //로그인한사람의 데이터를 통채로 넣어놓음.
				path = "redirect:/";
			}else {
				System.out.println("비밀번호가 틀렸습니다.");
				path = "redirect:/user/loginForm";
			}
		}
		
		return path;
	}
	
	public void logout() {
		//session Scope에 있는 로그인된 정보를 삭제한다.
		session.removeAttribute("loginVO"); //세션스코프에서 선택한 항목 하나만 지움.
		//session.invalidate(); //세션스코프에 저장된 모든 것을 지움
	}

	
}
