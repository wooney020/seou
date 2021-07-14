package com.swdo.test.vo;

import lombok.Data;

@Data
public class ReplyVO {

	private int reply_no;
	private String customer_id;
	private String reply_context;
	private String reply_indate;
	private int board_no;
}
