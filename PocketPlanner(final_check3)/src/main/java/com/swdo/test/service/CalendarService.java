package com.swdo.test.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.swdo.test.dao.CalendarDAO;
import com.swdo.test.dao.StatisticDAO;
import com.swdo.test.vo.JsonPlanVO;
import com.swdo.test.vo.PlanVO;
import com.swdo.test.vo.StatisticVO;
import com.swdo.test.vo.UserVO;

@Service
public class CalendarService {

	@Autowired
	private HttpSession session;
	@Autowired
	private CalendarDAO dao;
	@Autowired
	private StatisticDAO sdao;

	private static final Logger logger = LoggerFactory.getLogger(CalendarService.class);

	public void planInsert(JSONArray arr) {

		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		int cnt = 0;
		ArrayList<PlanVO> result = null;

		// 일정 추가 전 사용자가 일정을 가지고 있는지 확인
		ArrayList<PlanVO> planList = dao.planSelectAll(loginVO.getUser_id());

		System.out.println(planList);
		

		if (!ObjectUtils.isEmpty(planList)) {// 이미 저장 된 일정이 있을 경우에는 삭제
			//전체 일정 조회
			result = dao.planSelectAll(loginVO.getUser_id());
			
			//삭제
			cnt = dao.planDeleteAll(loginVO.getUser_id());
			sdao.statisticDeleteAll(loginVO.getUser_id());

			if (cnt == 0) {
				logger.info("전체 일정 삭제 실패");
			} else {
				logger.info("전체 일정 삭제 성공");

			}

		}

		// 일정 저장
		for (int i = 0; i < arr.size(); i++) {

			PlanVO plan = new PlanVO();
			JSONObject list = (JSONObject) arr.get(i);

			System.out.println("plan_title : " + list.get("title"));
			System.out.println("allDay : " + list.get("allDay"));
			System.out.println("plan_sdate : " + list.get("start"));
			System.out.println("plan_edate : " + list.get("end"));
			System.out.println("plan_content : " + list.get("content"));

			plan.setPlan_title((String) list.get("title"));
			plan.setUser_id(loginVO.getUser_id());
			plan.setPlan_allDay(String.valueOf(list.get("allDay")));
			plan.setPlan_edate((String) list.get("end"));
			plan.setPlan_sdate((String) list.get("start"));
			plan.setPlan_content((String) list.get("content"));
			if (i < arr.size() -1)
				plan.setPlan_achv(result.get(i).getPlan_achv());
			System.out.println(plan);
			

			cnt = dao.planInsert(plan);

			if (cnt == 0) {
				logger.info("{}번 일정 저장 실패", i);
			} else {
				logger.info("{}번 일정 저장 성공", i);

				// 일정 저장시 statistic 테이블 생성
				StatisticVO statistic = new StatisticVO();
				statistic.setUser_id(loginVO.getUser_id());

				String st_date = plan.getPlan_sdate().substring(0, 10);
				statistic.setSt_date(st_date);
				 logger.info("statistic2:{}",statistic);
				 
				 	
					int scnt = sdao.statisticInsert(statistic);

					if (scnt == 0) {
						logger.info("학습통계 데이터 저장 실패");
					} else {
						logger.info("학습통계 데이터 저장 성공");
					}

				
			}
		
		}

	}

	// 특정 사용자 일정 전부 삭제
	public void planDeleteAll(String user_id) {

		int cnt = dao.planDeleteAll(user_id);

		if (cnt == 0) {
			logger.info("전체 일정 삭제 실패");
		} else {
			logger.info("전체 일정 삭제 성공");

		}

	}

	// 특정 사용자의 일정 전부 조회
	public ArrayList<PlanVO> planSelectAll() {

		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		ArrayList<PlanVO> planList = dao.planSelectAll(loginVO.getUser_id());

		return planList;
	}

	//
	public List<Map<String, Object>> planSendAll() {

		// 특정 사용자의 일정 전부 조회
		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		ArrayList<PlanVO> planList = dao.planSelectAll(loginVO.getUser_id());

		// 사용자의 일정을 map에 저장
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (int i = 0; i < planList.size(); i++) {

			JsonPlanVO data = new JsonPlanVO();
			Map<String, Object> map = new HashMap<String, Object>();

			data.setId(Integer.toString((int) planList.get(i).getPlan_num()));
			data.setTitle(planList.get(i).getPlan_title());
			data.setStart(planList.get(i).getPlan_sdate());
			data.setEnd(planList.get(i).getPlan_edate());
			data.setAllDay(planList.get(i).getPlan_allDay());

			map.put("id", data.getId());
			map.put("title", data.getTitle());
			map.put("start", data.getStart());
			map.put("end", data.getEnd());
			map.put("allDay", data.getAllDay());
			list.add(map);

		}

		// planVO 설정

		setPlanVO(planList);

		return list;

	}

	// PlanVO에 값 설정 후 세션 등록.
	public List<Map<String, Object>> setPlanVO(ArrayList<PlanVO> planList) {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (int i = 0; i < planList.size(); i++) {

			PlanVO data = new PlanVO();
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("plan_num", planList.get(i).getPlan_num());
			map.put("plan_content", planList.get(i).getPlan_content());
			map.put("user_id", planList.get(i).getUser_id());
			map.put("plan_title", planList.get(i).getPlan_title());
			map.put("plan_achv", planList.get(i).getPlan_achv());
			map.put("plan_sdate", planList.get(i).getPlan_sdate());
			map.put("plan_edate", planList.get(i).getPlan_edate());
			map.put("plan_allday", planList.get(i).getPlan_allDay());

			list.add(map);
		}

		session.setAttribute("planList", list);
		return list;
	}

	// 특정 사용자의 오늘의 일정 조회
	public void selectToDoList() {

		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		ArrayList<PlanVO> planList = dao.selectToDoList(loginVO.getUser_id());

		session.setAttribute("planList", planList);

	}

	// 특정 일정 완료여부 수정
	public void updateAchv(PlanVO plan) {

		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		plan.setUser_id(loginVO.getUser_id());

		int cnt = dao.updateAchv(plan);

		if (cnt == 0) {
			logger.info("일정 완료여부 수정 실패");
		} else {
			logger.info("일정 완료여부 수정 성공");
		}

	}

//	// 특정 사용자의 일주일간 일정 조회
//	public ArrayList<PlanVO> selectPlanWeek(String user_id){
//		
//		UserVO loginVO = (UserVO)session.getAttribute("loginVO");
//		ArrayList<PlanVO> planList = dao.selectPlanWeek(loginVO.getUser_id());
//		
//		return planList;
//	}
	

}
