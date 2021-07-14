
package com.swdo.test.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.TimerDAO;
import com.swdo.test.vo.TimeVO;
import com.swdo.test.vo.TimerVO;
import com.swdo.test.vo.UserVO;

@Service
public class TimerService {
	

	@Autowired
	private TimerDAO dao;
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(TimerService.class);

	
	//특정 사용자의 타이머 불러오기
	public TimerVO timerSelect() {
		
		//user_id을 추가
		
		  UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		  TimerVO timer = new TimerVO();
		  timer.setUser_id(loginVO.getUser_id());
		  
		  
		  timer = dao.timerSelect(timer.getUser_id());
		  
		  //오늘 날짜 가져오기
		  SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
		  logger.info("date:{}",date);

	      Calendar c1 = Calendar.getInstance();

	      String today = date.format(c1.getTime());
	      
	      // 마지막으로 수정한 날짜가 오늘이 아닐 경우 날짜 오늘 학습시간 리셋.
		  if(!timer.getTimer_indate().equals(today)) { 
			
			 dao.todayReset(timer);
			 timer = dao.timerSelect(timer.getUser_id());
			 timer.setTimer_indate(today);
			 
		 }
		  
		  return timer;
			
		}
	
	//총 학습시간, 오늘 학습시간 불러오기
	public void totalTimerSelect() {
		
			//user_id을 추가
		
		  UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		 
		  if(loginVO != null) {
			  
			  TimerVO timer = dao.timerSelect(loginVO.getUser_id());
			  
			  //세션에 학습통계용 타이머 데이터 저장
			  TimeVO time = new TimeVO();
			  int temp = 0;
			  
			  //logger.info("timer객체:{}",timer);
			  //총 학습시간 저장
			  int total_hh = timer.getTimer_total()/3600;
			  temp = timer.getTimer_total()%3600;
			  int total_mm = temp/60;
			  int total_ss = temp%60;
			  
			  time.setTotal_hh(total_hh);
			  time.setTotal_mm(total_mm);
			  time.setTotal_ss(total_ss);
			  
			  //오늘 학습시간 저장
			  int today_hh = timer.getTimer_today()/3600;
			  temp = timer.getTimer_today()%3600;
			  int today_mm = temp/60;
			  int today_ss = temp%60;
			  
			  time.setToday_hh(today_hh);
			  time.setToday_mm(today_mm);
			  time.setToday_ss(today_ss);
			  
			  
			  //logger.info("time객체:{}",time);
				
			  session.setAttribute("TimeVO", time);
			  session.setAttribute("TimerVO", timer);
		  }
			
		}

	
	//타이머 값 추가 , 수정 
	public void timerInsert(TimerVO timer) {
		
		int cnt = 0;
		int saveTime = timer.getSaveTime();
		
		  
		//유저 id 설정 후 , 원래 타이머 데이터 불러오기
		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		timer.setUser_id(loginVO.getUser_id());
		TimerVO result = dao.timerSelect(timer.getUser_id());
		
		
		 

		//기존 타이머 값에 새로운 타이머 값 더하기
		  if( result == null) { //사용자가 타이머를 한 번도 사용하지 않았을 경우
			 
			 timer.setTimer_total(timer.getSaveTime());
			 timer.setTimer_today(timer.getSaveTime());
			 
			 //더한 타이머 데이터 추가
			 cnt = dao.timerInsert(timer);
			 
		  }else {
			  
			  SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");

		      Calendar c1 = Calendar.getInstance();

		      String today = date.format(c1.getTime());

			 if(result.getTimer_indate().equals(today)) { // 마지막으로 수정한 날짜가 오늘일 경우
				 
				 timer.setTimer_total(result.getTimer_total() + saveTime);
				 timer.setTimer_today(result.getTimer_today()+ saveTime);
				 
				 cnt = dao.timerUpdate(timer);
			 }else { // 마지막으로 수정한 날짜가 오늘 날짜가 아닌 경우.
				 dao.todayReset(result);
				 result = dao.timerSelect(timer.getUser_id());
				 timer.setTimer_total(result.getTimer_total() + saveTime);
				 timer.setTimer_today(result.getTimer_today()+ saveTime);
				 timer.setTimer_indate(result.getTimer_indate());
				 cnt = dao.timerUpdate(timer);
				 
			 }
			 
		  }
				if(cnt == 0) {
					logger.info("타이머저장 실패");
				}else {
					logger.info("타이머저장 성공");
					//logger.info("타이머 값:{}",timer);
				}
	}
	
	
	//timer 리셋
		public void timerReset(boolean total_flag , boolean today_flag) {
			
			TimerVO timer = (TimerVO)session.getAttribute("TimerVO");
			int cnt = 0;
			
			if(total_flag) {
				cnt = dao.timerReset(timer);
			}
			
			if(today_flag) {
				cnt = dao.todayReset(timer);
			}
			
			
			
			if(cnt == 0) {
				logger.info("타이머 리셋 실패");
			}else {
				logger.info("타이머 리셋 성공");
				timer = dao.timerSelect(timer.getUser_id());
				
				session.removeAttribute("TimerVO");
				session.setAttribute("TimerVO", timer);
				
				
			}
			
		
			
			
		}
	
	
	
}
