package com.swdo.test;

import lombok.Data;

@Data //어노테이션 데이타 하고 롬복을 import (게터세터 자동생성)


public class MemberVO {

	//전달받은 데이터를 받을 클래스.
	//스프링의 역할.
	//데이터의 변수명과 클래스의 데이터 변수명을 일치시켜주고, 
	//게터세터만 만들어주면 알아서 변수의 값을 꺼내 클래스의 변수에 값을 넣어줌.
	private String sendId; //롬복이 사용되면 노란밑줄이 사라짐.
	private String sendPw;
	
	//데이터를 받기 위해서는 기본생성자가 반드시 있어야함.
	//생성자 자체가 없으면 기본생성자를 자동으로 생성해주므로 안 해도 되지만,
	//멤버변수를 받는 다른 생성자가 있다면 기본생성자를 반드시 생성해줘야함.
//	public MemberVO() {
//		
//	}
//	
//	//게터세터 (반드시 있어야함)
//	public String getSendId() {
//		return sendId;
//	}
//	public void setSendId(String sendId) {
//		this.sendId = sendId;
//	}
//	public String getSendPw() {
//		return sendPw;
//	}
//	public void setSendPw(String sendPw) {
//		this.sendPw = sendPw;
//	}
//	
//	//다시 이해필요
//	@Override
//	public String toString() {
//		return "MemberVo [sendId =" +sendId+", sendPw=" +sendPw+"]";
//	}
//	
}
