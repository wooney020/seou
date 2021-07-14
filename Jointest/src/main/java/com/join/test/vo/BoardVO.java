package com.join.test.vo;

import lombok.Data;

@Data
public class BoardVO {
 
	private int board_no;
	private String user_id;
	private String board_title;
	private String board_indate;
	private int hits;
	private String board_content;
	private String board_original; //원본이름
	private String board_saved; //저장된 주소
}
