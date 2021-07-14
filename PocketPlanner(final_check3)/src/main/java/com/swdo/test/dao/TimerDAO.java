package com.swdo.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.TimerVO;

@Repository
public class TimerDAO {

	@Autowired
	private SqlSession session;
	
	//특정 사용자의 타이머 불러오기
		public TimerVO timerSelect(String user_id) {
			
				TimerVO timer = null;
				try {
					TimerMapper mapper = session.getMapper(TimerMapper.class);
					timer = mapper.timerSelect(user_id);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return timer;
				
			}
	//타이머 값 넣기
		public int timerInsert(TimerVO timer) {
			
			int cnt = 0;
			try {
				TimerMapper mapper = session.getMapper(TimerMapper.class);
				cnt = mapper.timerInsert(timer);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return cnt ;
		}
	
	//타이머 데이터 수정
		public int timerUpdate(TimerVO timer) {
			int cnt = 0;
			try {
				TimerMapper mapper = session.getMapper(TimerMapper.class);
				cnt = mapper.timerUpdate(timer);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return cnt ;
		}
	
	//timer_today 리셋
		public int todayReset(TimerVO timer) {
			
				int cnt = 0;
				try {
					TimerMapper mapper = session.getMapper(TimerMapper.class);
					cnt = mapper.todayReset(timer);
				} catch (Exception e) {
						e.printStackTrace();
				}
				
				return cnt;
		}
		
	//timer 리셋
		public int timerReset(TimerVO timer) {
			
			int cnt = 0;
			try {
				TimerMapper mapper = session.getMapper(TimerMapper.class);
				cnt = mapper.timerReset(timer);
			} catch (Exception e) {
					e.printStackTrace();
			}
			
			return cnt;
		}
}
