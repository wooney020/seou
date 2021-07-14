package com.swdo.test.vo;

import lombok.Data;

@Data
public class BoardVO {

		private int boardnum;
		private String id;
		private String title;
		private String content;
		private String inputdate;
		private int likecnt;
}
