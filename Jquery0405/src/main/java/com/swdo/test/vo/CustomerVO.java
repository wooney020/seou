package com.swdo.test.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class CustomerVO {

	private String custid;
	private String password;
	private String name;
	private int age;
	private boolean flag;
	private ArrayList<String> hobby;
}
