package com.swdo.test.vo;

import lombok.Data;

@Data
public class StatisticVO {
	
	private String st_date; //일정 날짜
	private String user_id;
	private int st_statistic; //날짜별 학습 성취도
	private int st_planAll; // 날짜별 일정 개수
	private int st_endPlan; // 날짜별 끝낸 일정 개수 

}
