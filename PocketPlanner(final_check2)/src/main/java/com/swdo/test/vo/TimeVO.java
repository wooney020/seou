package com.swdo.test.vo;

import lombok.Data;


//총 학습시간, 오늘 학습시간 저장용 VO
@Data
public class TimeVO {

	private int total_hh;
	private int total_mm;
	private int total_ss;
	
	private int today_hh;
	private int today_mm;
	private int today_ss;
}
