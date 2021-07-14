package com.swdo.test.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.PortfolioService;
import com.swdo.test.vo.ApplierVO;
import com.swdo.test.vo.PortfolioVO;

@Controller
@RequestMapping(value = "/portfolio")
public class PortfolioViewController {

	private static final Logger logger = LoggerFactory.getLogger(PortfolioViewController.class);
	@Autowired
	private PortfolioService service;
	@Autowired
	private HttpSession session;

	// 개인 포트폴리오 리스트이동
	@RequestMapping(value = "/portfolioList", method = RequestMethod.GET)
	public String portfolioList(Model model) {
		logger.info("개인 포트폴리오 리스트 이동");

		ArrayList<PortfolioVO> list = service.portfolioSelectAll();
		model.addAttribute("portfolioList", list);

		return "portfolio/portfolioList";

	}

	// 포트폴리오 작성폼 이동
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		logger.info("포트폴리오 작성 폼 이동");

		return "portfolio/writeForm";

	}

	// 포트폴리오 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(PortfolioVO portfolio) {
		logger.info("작성 한 데이터 : {}", portfolio);
		String path = service.portfolioInsert(portfolio);

		return path;

	}

	// 상세페이지 이동
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String writeForm(int portfolio_no, Model model) {
		logger.info("상세페이지 이동");
		PortfolioVO portfolio = service.portfolioSelectOne(portfolio_no);
		model.addAttribute("portfolioDetail", portfolio);

		return "portfolio/detail";

	}

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String write(int portfolio_no, Model model) {
		logger.info("전달받은 데이터 : {}", portfolio_no);
		service.portfolioDelete(portfolio_no);

		ArrayList<PortfolioVO> list = service.portfolioSelectAll();
		model.addAttribute("portfolioList", list);

		return "redirect:/portfolio/portfolioList";

	}

	
	  //공개여부 변환
	  @RequestMapping(value ="/gbUpdate", method = RequestMethod.GET) 
	  public String gbUpdate(PortfolioVO portfolio, Model model ) {
	  logger.info("전달 받은 데이터 : {}", portfolio); 
	 
	  service.gbUpdate(portfolio);
	  
	  return "redirect:/portfolio/portfolioList";
	  
	  }
	 
}
