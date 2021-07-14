package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.swdo.test.vo.PortfolioVO;

public interface PortfolioMapper {
	
	//글 작성
	public int portfolioInsert(PortfolioVO portfolio);
	
	//개인 포트폴리오 목록 전체 불러오기
	public ArrayList<PortfolioVO> portfolioSelectAll(String applier_id);
	
	//공개여부 바꾸기
	public int gbUpdate(PortfolioVO portfolio);
	
	//한 개의 포트폴리오 가져오기
	public PortfolioVO portfolioSelectOne(int portfolio_no);
	
	//포트폴리오 삭제
	public int portfolioDelete(int portfolio_no);
	
	//공개 포트폴리오만 가져오기
	public ArrayList<HashMap<String,Object>> portfolioAll();
	

}
