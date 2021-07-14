package com.swdo.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.StatisticVO;
import com.swdo.test.vo.TimerVO;

@Repository
public class StatisticDAO {

	@Autowired
	private SqlSession session;

	// 학습 통계 데이터 넣기
	public int statisticInsert(StatisticVO statistic) {

		int cnt = 0;
		try {
			StatisticMapper mapper = session.getMapper(StatisticMapper.class);
			cnt = mapper.statisticInsert(statistic);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}

	// 학습통계 데이터 전체 삭제
	public int statisticDeleteAll(String user_id) {

		int cnt = 0;

		try {
			StatisticMapper mapper = session.getMapper(StatisticMapper.class);
			cnt = mapper.statisticDeleteAll(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}

	// 학습통계 성취도 추가
	public int statisticUpdate(StatisticVO statistic) {
		int cnt = 0;

		try {
			StatisticMapper mapper = session.getMapper(StatisticMapper.class);
			cnt = mapper.statisticUpdate(statistic);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}

	// 특정 사용자의 학습통계 데이터 조회
	public ArrayList<StatisticVO> statisticSelectOne(StatisticVO statistic) {

		ArrayList<StatisticVO> result = null;

		try {
			StatisticMapper mapper = session.getMapper(StatisticMapper.class);
			result = mapper.statisticSelectOne(statistic);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

//	// 특정 사용자의 지난 주 학습통계 데이터 불러오기
//	public ArrayList<StatisticVO> selectStatisticWeek(String user_id) {
//		ArrayList<StatisticVO> result = null;
//
//		try {
//			StatisticMapper mapper = session.getMapper(StatisticMapper.class);
//			result = mapper.selectStatisticWeek(user_id);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return result;
//
//	}

	// 학습통계 그래프용 지난 주 데이터 불러오기
	public ArrayList<StatisticVO> selectStatisticGraph(String user_id){
		ArrayList<StatisticVO> result = null;

		try {
			StatisticMapper mapper = session.getMapper(StatisticMapper.class);
			result = mapper.selectStatisticGraph(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
