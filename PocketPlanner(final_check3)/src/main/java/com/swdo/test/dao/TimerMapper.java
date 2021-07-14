package com.swdo.test.dao;

import com.swdo.test.vo.TimerVO;

public interface TimerMapper {
	
	//첫 타이머 값 넣기
	public int timerInsert(TimerVO timer);
	
	//특정 사용자의 타이머 값 불러오기
	public TimerVO timerSelect(String user_id);
	
	//타이머 데이터 수정
	public int timerUpdate(TimerVO timer);
	
	//timer_today 데이터 리셋
	public int todayReset(TimerVO timer);
	
	//timer 리셋
	public int timerReset(TimerVO timer);
	

}
