package com.swdo.test.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.swdo.test.service.BoardService;
import com.swdo.test.util.PageNavigator;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.ReplyVO;

@Controller
@RequestMapping(value = "/board")
public class BoardViewController {
	
	@Autowired
	private BoardService service;
	private static final Logger logger = LoggerFactory.getLogger(BoardViewController.class);
	
	private static final int COUNT_PER_PAGE = 2;
	private static final int PAGE_PER_GROUP = 3;
	
	@RequestMapping(value="/listForm" , method = RequestMethod.GET)
	public String listForm(Model model 
			, @RequestParam(name = "searchText" ,defaultValue = "")  String searchText
			, @RequestParam(name = "page",defaultValue = "1") int page) { //page = 보여줄 page값
		logger.info("글 목록 페이지 이동: {}",searchText);
		//전체 글의 개수
		int totalRecord = service.boardTotalRecord(searchText);
		//PageNavigater 객체 생성
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, page, totalRecord);
		
		//DB에 가서 글 전체 목록을 조회한 후에 그 데이터를 가지고 이동한다.
		// 전체글을 가져오는 구문을 페이징 기술로 대체해서 수정함.
		ArrayList<HashMap<String,Object>> list = service.boardSelectAll(searchText,navi.getStartRecord(),navi.getCountPerPage());
		model.addAttribute("boardList", list);
		model.addAttribute("boardNavi",navi);
		model.addAttribute("searchText", searchText);
		return "board/listForm";
	}
	
	@RequestMapping(value = "/writeForm" , method = RequestMethod.GET)
	public String writeForm() {
		logger.info("글 등록 페이지 이동");
		return "board/writeForm";
		
	}
	
	@RequestMapping(value="/write" , method = RequestMethod.POST)
	public String write(BoardVO board, MultipartFile upload) { // 이 객체에는 글제목, 글내용만 담겨있음
		logger.info("전달된 글 등록 데이터{}",board);
		service.boardInsert(board,upload);
		return "redirect:/board/listForm";
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	   public String detail(int board_no,Model model) {
	      logger.info("전달받은 글 번호 :{}",board_no);
	      //조회수 증가 후 데이터를 조회(새로 고침을 하면 조회수 계속 증가=포워드, 새로고침해도 안되면 기능을 분리시킨거)
	      
	      //해당 글번호의 상세 내용을 조회한 후에 jsp로 전달한다
	      HashMap<String,Object> board=service.boardSelectOne(board_no);
	      model.addAttribute("detail",board);
	      
	      
	      //해당 글의 댓글 정보를 조회한다
	      HashMap<String,Object> map = service.replySelectList(board_no);
	      model.addAttribute("map",map);//모델에 맵이랑 디테일 담아져있음 //맵에는 리플리스트랑 고객아이디 들어있음
	      return "board/detail";
	   }
	
	@RequestMapping(value ="/delete" , method = RequestMethod.GET)
	public String delete(BoardVO board) {
		
		logger.info("특정 글 삭제 기능 : {}" , board);
		service.boardDelete(board);
		return "redirect:/board/listForm";
		
	}
	
	@RequestMapping(value="/updateForm",method= RequestMethod.GET)
	public String updateForm(int board_no, Model model) {
		logger.info("특정 글 수정 폼 이동: {}"+board_no);

		HashMap<String, Object> board = service.boardSelectOne(board_no);
		model.addAttribute("detail", board);
		return "board/updateForm";
	}
	
	@RequestMapping(value = "/update" ,method = RequestMethod.POST)
	public String update(BoardVO board , MultipartFile upload) {
		logger.info("특정 글 수정 기능 : {}",board);
		service.boardUpdate(board , upload);
		return "redirect:/board/listForm";
		
	}
	
	@RequestMapping(value = "/download" , method = RequestMethod.GET)
	public void download(int board_no) {
		service.download(board_no);
		
		
	}
}
