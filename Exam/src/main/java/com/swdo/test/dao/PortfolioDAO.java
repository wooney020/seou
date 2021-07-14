package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.PortfolioVO;

@Repository
public class PortfolioDAO {
	
	@Autowired
	private SqlSession session;
	
	
	//포트폴리오 작성
	public int portfolioInsert(PortfolioVO portfolio) {
		int cnt = 0;
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			cnt = mapper.portfolioInsert(portfolio);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt ;
	}
	
	//개인포트폴리오 목록 조회
	public ArrayList<PortfolioVO> portfolioSelectAll(String applier_id){
		ArrayList<PortfolioVO> list = null;
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			
			list = mapper.portfolioSelectAll(applier_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	  //공개여부 바꾸기 
	  public int gbUpdate(PortfolioVO portfolio) { 
	  int cnt = 0; 
	  try {
	  PortfolioMapper mapper = session.getMapper(PortfolioMapper.class); 
	  cnt = mapper.gbUpdate(portfolio);
	  
	  } catch (Exception e) { 
		  e.printStackTrace();
	  }
	  
	  return cnt;
	  
	 }
	 
	//한 개의 포트폴리오 가져오기
	public PortfolioVO portfolioSelectOne(int portfolio_no) {
		PortfolioVO portfolio = null;
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			
			portfolio = mapper.portfolioSelectOne(portfolio_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return portfolio;
	}
	
	//포트폴리오 삭제
	public int portfolioDelete(int portfolio_no) {
		int cnt = 0;
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			cnt = mapper.portfolioDelete(portfolio_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt ;
		
	}
	
	//공개 포트폴리오만 가져오기
	public ArrayList<HashMap<String,Object>> portfolioAll(){
		ArrayList<HashMap<String,Object>> list = null;
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			list = mapper.portfolioAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list ;
		
	}

}
