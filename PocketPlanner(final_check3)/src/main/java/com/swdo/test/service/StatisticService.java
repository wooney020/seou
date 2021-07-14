package com.swdo.test.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.transform.impl.AddStaticInitTransformer;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.swdo.test.dao.CalendarDAO;
import com.swdo.test.dao.StatisticDAO;
import com.swdo.test.vo.JsonPlanVO;
import com.swdo.test.vo.PlanVO;
import com.swdo.test.vo.StatisticVO;
import com.swdo.test.vo.StatisticWeekVO;
import com.swdo.test.vo.UserVO;

@Service
public class StatisticService {

	@Autowired
	private HttpSession session;
	@Autowired
	private StatisticDAO dao;
	@Autowired
	private CalendarDAO cdao;

	private static final Logger logger = LoggerFactory.getLogger(StatisticService.class);

	// 학습 통계 데이터 넣기
	public void statisticInsert(StatisticVO statistic) {

		int cnt = dao.statisticInsert(statistic);

		if (cnt == 0) {
			logger.info("학습통계 데이터 저장 실패");
		} else {
			logger.info("학습통계 데이터 저장 성공");
		}

	}

	// 학습통계 데이터 전체 삭제
	public void statisticDeleteAll() {

		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		int cnt = dao.statisticDeleteAll(loginVO.getUser_id());

		if (cnt == 0) {
			logger.info("전체학습통계 데이터 삭제 실패");
		} else {
			logger.info("전체학습통계 데이터 삭제 성공");
		}

	}

//	// 학습통계 데이터 수정
//	public void statisticUpdate() {
//
//		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
//		// ArrayList<StatisticVO> statisticList = null;
//
//		ArrayList<PlanVO> planList = cdao.selectToDoList(loginVO.getUser_id());
//
//		// String a = planList.get(0).getPlan_sdate().substring(0, 10);
//		logger.info("planList:{]", planList);
//		// System.out.println(planList.get(0).getPlan_sdate().substring(0, 10));
//
//		StatisticVO statistic = new StatisticVO();
//
//		int st_planAll = planList.size(); // 전체 오늘의 일정 개수
//		int st_endPlan = 0; // 오늘의 일정 중 완료한 일정
//
//		for (int i = 0; i < planList.size(); i++) {
//
//			int temp = planList.get(i).getPlan_achv();
//
//			if (temp == 1) {
//				st_endPlan++;
//			}
//		}
//		logger.info("st_planAll:{}", st_planAll);
//		logger.info("st_endPlan:{}", st_endPlan);
//
//		// 날짜별 학업 성취도
//		double st_statistic = ((((double) st_endPlan) / st_planAll)) * 100;
//		logger.info("st_statistic:{}", st_statistic);
//
//		statistic.setSt_date(planList.get(0).getPlan_sdate().substring(0, 10));
//		statistic.setUser_id(loginVO.getUser_id());
//		statistic.setSt_statistic((int) st_statistic);
//
//		// logger.info("statistic:{}", statistic);
//
//		int cnt = dao.statisticUpdate(statistic);
//
//		if (cnt == 0) {
//			logger.info("학업 성취도 입력 실패");
//		} else {
//			logger.info("학업 성취도 입력 성공");
//		}
//
//	}

//	// 특정 사용자의 지난 주 학습통계 데이터 불러오기 
//	public void selectStatisticWeek() { 
//	UserVO loginVO=(UserVO)session.getAttribute("loginVO");
//
//	ArrayList<StatisticVO> result = dao.selectStatisticWeek(loginVO.getUser_id());
//
//	// logger.info("지난 주 학습통계 데이터:{}",result); //
//	session.setAttribute("statisticList",result);
//
//	Calendar cal = Calendar.getInstance();
//	StatisticWeekVO weekSet = new
//	  StatisticWeekVO();
//
//	for(int i = 0;i<result.size();i++){
//	  
//	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
//	  
//	  // 현재 일자의 요일
//	  String date = result.get(i).getSt_date();
//	  
//	 logger.info(date); // logger.info("year:{}",date.substring(0,4)); //
//	 logger.info("mm:{}",date.substring(5,7)); //
//	 logger.info("dd:{}",date.substring(8,10));
//	  
//	  // int year = Integer.parseInt(date.substring(0, 4));
//	  
//	  cal.set(Integer.parseInt(date.substring(0, 4)),Integer.parseInt(date.substring(5, 7) + 1),Integer.parseInt(date.substring(8, 10)));
//	  int dayNum = cal.get(Calendar.DAY_OF_WEEK); 
//	  logger.info("요일:{}", dayNum); 
//	  String day = "";
//	  switch (dayNum) { 
//	  case 1: 
//		  day = "화";
//		  weekSet.setWednesday(result.get(i).getSt_statistic()); 
//		  break; 
//	  case 2:
//		  day = "수"; 
//		  weekSet.setWednesday(result.get(i).getSt_statistic()); 
//		  break; 
//	  case 3:
//		  day = "목"; 
//		  weekSet.setThursday(result.get(i).getSt_statistic()); 
//		  break; 
//	  case 4: 
//		  day = "금"; 
//		  weekSet.setFriday(result.get(i).getSt_statistic()); 
//		  break; 
//	  case 5: 
//		  day = "토"; 
//		  weekSet.setSaturday(result.get(i).getSt_statistic()); 
//		  break;
//	  case 6: 
//		  day = "일"; 
//		  weekSet.setSunday(result.get(i).getSt_statistic()); 
//		  break;
//	  case 7: 
//		  day = "월"; 
//		  weekSet.setMonday(result.get(i).getSt_statistic()); 
//		  break;
//	  }
//	  
//	  } // logger.info("현재 요일별 학습통계:{}",weekSet);
//	session.setAttribute("statisticWeekVO",weekSet);
//
//	}

	// 학습통계 그래프용 지난 주 데이터 불러오기
	public void selectStatisticGraph(){
		
		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		ArrayList<StatisticVO> result = dao.selectStatisticGraph(loginVO.getUser_id());

		Calendar cal = Calendar.getInstance();
		StatisticWeekVO weekSet = new StatisticWeekVO();

		for (int i = 0; i < result.size(); i++) {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);

			// 현재 일자의 요일
			String date = result.get(i).getSt_date();

			cal.set(Integer.parseInt(date.substring(0, 4)), Integer.parseInt(date.substring(5, 7) + 1),
					Integer.parseInt(date.substring(8, 10)));
			int dayNum = cal.get(Calendar.DAY_OF_WEEK);
			if(dayNum != 7) {
				dayNum += 1;
			}else {
				dayNum = 1;
			}
			String day = "";
			
			switch (dayNum) {
			case 1:
				day = "화";
				weekSet.setTuesday(result.get(i).getSt_statistic());
				break;
			case 2:
				day = "수";
				weekSet.setWednesday(result.get(i).getSt_statistic());
				break;
			case 3:
				day = "목";
				weekSet.setThursday(result.get(i).getSt_statistic());
				break;
			case 4:
				day = "금";
				weekSet.setFriday(result.get(i).getSt_statistic());
				break;
			case 5:
				day = "토";
				weekSet.setSaturday(result.get(i).getSt_statistic());
				break;
			case 6:
				day = "일";
				weekSet.setSunday(result.get(i).getSt_statistic());
				break;
			case 7:
				day = "월";
				weekSet.setMonday(result.get(i).getSt_statistic());
				break;
			}



		}
		session.setAttribute("statisticGraph", weekSet);
		
	}

}
