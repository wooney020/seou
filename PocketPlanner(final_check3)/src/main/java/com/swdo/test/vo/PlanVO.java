package com.swdo.test.vo;

import lombok.Data;

@Data
public class PlanVO {
	
	private int plan_num;			//일정 번호
	private String user_id;			//회원 ID
	private String plan_content;	//일정 내용
	private String plan_title;		//일정 제목
	private String plan_sdate;		//일정 시작날짜
	private String plan_edate;		//일정 종료날짜
	private int plan_achv; 			//일정별 목표 달성률
	private String plan_allDay;		//하루종일 여부
	private String plan_color;		//일정 색상

}
