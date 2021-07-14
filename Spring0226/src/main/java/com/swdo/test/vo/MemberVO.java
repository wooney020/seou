package com.swdo.test.vo;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String pw;
//	private String pwCheck; 전달하지 않아도됨.
	private String name;
	private int age;
	private String gender;
	private String hobby[];
	private String introduce ;
	private String indate; // db의 자료형 date를 tochar로 문자열자료형으로 바꾸고 string으로 자료형
}
