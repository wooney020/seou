package com.swdo.test.dao;


import java.util.ArrayList;

import com.swdo.test.vo.StatisticVO;

public interface StatisticMapper {
	
	//학습통계 데이터 추가
	public int statisticInsert(StatisticVO statistic);
	
	//학습통계 데이터 전체 삭제
	public int statisticDeleteAll(String user_id);
	
	//학습통계 성취도 추가
	public int statisticUpdate(StatisticVO statistic);
	
	//특정 사용자의 학습통계 데이터 조회
	public ArrayList<StatisticVO> statisticSelectOne(StatisticVO statistic);
	
//	//특정 사용자의 지난 주 학습통계 데이터 불러오기  
//	public ArrayList<StatisticVO> selectStatisticWeek(String user_id);

	//학습통계 그래프용 지난 주 데이터 불러오기
	public ArrayList<StatisticVO> selectStatisticGraph(String user_id); 
}
 