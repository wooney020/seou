package com.swdo.test.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.BoardService;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.MemberVO;

@Controller 
@RequestMapping(value="/board")
public class Boardcontroller {

	@Autowired
	private BoardService service;
	

	private static final Logger logger = LoggerFactory.getLogger(Boardcontroller.class);

//	글쓰기ㅇ 수정 삭제d 목록보기ㅇ 상세보기d 추천하기d

//	게시물 리스트 페이지로 이동(글 조회 boardSelectAll)
	@RequestMapping(value="/listForm", method=RequestMethod.GET)
	public String listForm(Model model, String id) {
		logger.info("게시물 리스트 페이지 이동");
		
		//DB에 가서 글 전체 목록을 조회한 후에 그 데이터를 가지고 이동한다.
		ArrayList<BoardVO> list= service.boardSelectAll(id);
		model.addAttribute("boardList", list); //boardList
		model.addAttribute("id", id);
		return "board/listForm";
	}
	

//	글등록 페이지 이동
	@RequestMapping(value="/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		logger.info("글 등록 페이지 이동");
		return "board/writeForm";
	}
	
//	글 등록 기능(boardInsert)
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(BoardVO board) {
		logger.info("전달된 글 등록 데이터 : {}",board);
		service.boardInsert(board);
		return "redirect:/board/listForm?id="+board.getId();
	}
	

//	글 상세조회(boardSelectOne)
	@RequestMapping(value="/detail" , method = RequestMethod.GET)
	public String detail(int boardnum, Model model) {
		logger.info("전달받은 글번호 : {}" ,boardnum);
		// 해당 글번호의 상세 내용을 조회 한 후에 jsp로 전달한다.
		
		BoardVO board= service.boardSelectOne(boardnum);
		model.addAttribute("detail", board); //detail 
		return "board/detail";
	}
	
	//글 삭제 delete
		@RequestMapping(value="/delete", method = RequestMethod.GET)
		public String delete(BoardVO board) {
			logger.info("특정 글 삭제 기능 : {}", board);
			
			service.boardDelete(board);
			String id = board.getId();
			
			
			return "redirect:/board/listForm?id="+id;
		}
		
	//글 수정 폼으로 이동 updateForm
		@RequestMapping(value="/updateForm", method=RequestMethod.GET)
		public String updateForm(int boardnum, Model model) {
			logger.info("특정 글 수정 폼 이동 : {}", boardnum);
			
			
			BoardVO board = service.boardSelectOne(boardnum);
			//logger.info("가져온 데이터:{}",board);
			model.addAttribute("detail", board);
			//여기에 있던 boardnum은 굳이 모델로 안 넣어도 detail 안에 다 있음.
			
			return "board/updateForm";
			
		}
				
		//글 수정 update
		@RequestMapping(value="/update", method=RequestMethod.POST)
		public String update(BoardVO board , Model model) {
			logger.info("특정 글 수정 기능 : {}",board);
			service.boardUpdate(board);
			String id = board.getId();
			
			
			return "redirect:/board/listForm?id="+id;
		}
		
//		추천하기
		@RequestMapping(value="/updateHit", method=RequestMethod.GET)
		public String updateHit(int boardnum) {
			logger.info("추천하기", boardnum);
			service.boardUpdateHits(boardnum);
			//String id = board.getId();
			
			return "redirect:/board/detail?boardnum="+boardnum ;
		}
		
		
		
}
