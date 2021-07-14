package com.swdo.test.dao;

import java.util.ArrayList;

import com.swdo.test.vo.PlanVO;

public interface CalendarMapper {
	
	//일정 추가
	public int planInsert(PlanVO plan);
	
	//특정 사용자 일정 전부 삭제
	public int planDeleteAll(String user_id);
	
	//특정 사용자의 일정 전부 조회
	public ArrayList<PlanVO> planSelectAll(String user_id);
	
	//특정 사용자의 오늘의 일정 조회
	public ArrayList<PlanVO> selectToDoList(String user_id);

	//특정 일정 완료여부 수정
	public int updateAchv(PlanVO plan);
	
//	//특정 사용자의 일주일간 일정 조회
//	public ArrayList<PlanVO> selectPlanWeek(String user_id);
	
	
}
 