package com.swdo.test.vo;

import lombok.Data;

@Data
public class BoardVO {

	private int board_no; //글번호
	private String board_title; //글제목
	private String customer_id;
	private int board_hits;
	private String board_content;
	private String board_indate;
	private String board_original;
	private String board_saved;
}
