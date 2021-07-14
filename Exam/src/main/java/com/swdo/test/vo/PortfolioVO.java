package com.swdo.test.vo;

import lombok.Data;

@Data
public class PortfolioVO {
	
	
	private int portfolio_no;	// 포트폴리오 번호
	private String applier_id;	// 작성자 아이디
	private String portfolio_title; // 제목
	private String portfolio_content; //내용
	private int portfolio_type; //1.학력,2.경력,3.프로젝트
	private String portfolio_st; //시작일
	private String portfolio_et; //종료일
	private String portfolio_gb; //공개여부
	private String portfolio_gb_date; //작성한(공개한) 날짜
	 

}
