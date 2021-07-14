package com.swdo.test.vo;

import lombok.Data;

//타이머 테이블 VO
@Data
public class TimerVO {
	
	private int timer_total;
	private int timer_today;
	private String user_id;
	private String timer_indate;
	private int saveTime;
	
}
