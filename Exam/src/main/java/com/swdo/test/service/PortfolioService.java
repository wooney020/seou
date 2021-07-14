package com.swdo.test.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.net.httpserver.HttpsConfigurator;
import com.swdo.test.controller.ApplierViewController;
import com.swdo.test.dao.PortfolioDAO;
import com.swdo.test.dao.PortfolioMapper;
import com.swdo.test.vo.ApplierVO;
import com.swdo.test.vo.PortfolioVO;

@Service
public class PortfolioService {
	
	@Autowired
	private PortfolioDAO dao;
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(PortfolioService.class);
	
	

	//포트폴리오 등록
	public String portfolioInsert(PortfolioVO portfolio) {
		
		ApplierVO applier = (ApplierVO) session.getAttribute("loginVO");
		portfolio.setApplier_id(applier.getApplier_id());
		
		int cnt = dao.portfolioInsert(portfolio);
		String path = "";
		
		if(cnt == 0) {
			logger.info("글 등록 실패");
			path = "redirect:/portfolio/writeForm";
		}else {
			logger.info("글 등록 성공");
			path = "redirect:/portfolio/portfolioList";
		}
		
		return path;
		
}
	//개인 포트폴리오 목록 조회
	public ArrayList<PortfolioVO> portfolioSelectAll(){
		ApplierVO applier = (ApplierVO) session.getAttribute("loginVO");
		ArrayList<PortfolioVO> list = dao.portfolioSelectAll(applier.getApplier_id());
		
		return list;
	}
	
	
	 //공개여부 바꾸기 
	public void gbUpdate(PortfolioVO portfolio) {
	  
	  int cnt = dao.gbUpdate(portfolio);
	  if( cnt == 0) {
		  logger.info("공개여부 변경 실패");
	  }else {
		  logger.info("공개여부 변경 성공");
	  }
	 
	  }
	 
	
	//포트폴리오 상세 가져오기
	public PortfolioVO portfolioSelectOne(int portfolio_no) {
		PortfolioVO portfolio = dao.portfolioSelectOne(portfolio_no);
		
		return portfolio;

	}
	
	//포트폴리오 삭제
	public void portfolioDelete(int portfolio_no) {
		
		int cnt = dao.portfolioDelete(portfolio_no);
	
		
		if(cnt == 0) {
			logger.info("글 삭제 실패");
			
		}else {
			logger.info("글 삭제 성공");
	
		}
		
	}
	
	//공개된 포트폴리오 리스트
	public ArrayList<HashMap<String,Object>> portfolioAll(){
		ArrayList<HashMap<String,Object>> list = dao.portfolioAll();
		
		return list;
		
	}
		
}