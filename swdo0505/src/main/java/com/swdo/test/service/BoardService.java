package com.swdo.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.swdo.test.dao.BoardDAO;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.MemberVO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);

	@Autowired
	private HttpSession session; 
	

//	 글 등록
	 public void boardInsert(BoardVO board) {
			MemberVO member = (MemberVO)session.getAttribute("loginVO");
			board.setId(member.getId());
			
			int cnt = dao.boardInsert(board);
			
			if(cnt == 0) {
				logger.info("글 등록 실패 : {}",board);
			} else {
				logger.info("글 등록 성공 : {}",board);
			}
			
		}
		/*
		 * // 글 조회 public ArrayList<BoardVO> boardSelect(){ ArrayList<BoardVO> list =
		 * dao.boardSelect(); logger.info("글 전체 목록 조회 : {}",list); return list; }
		 */
	 
//		글 조회
		public ArrayList<BoardVO> boardSelectAll(String id){
			
			ArrayList<BoardVO> list = dao.boardSelectAll(id);
			
			return list;
		}

		
//		특정 글 조회(상세 내용 조회)
		public BoardVO boardSelectOne(int boardnum) {
			BoardVO board = dao.boardSelectOne(boardnum);
			logger.info("특정 글 조회 : {}", board);
			return board;
		}
		
//글 삭제하기(글 작성한 사람이 삭제가능)
		public void boardDelete(BoardVO board) {
			//로그인한 사람의 정보를 가져와서 그 아이디를 setting 해준다
			MemberVO member=(MemberVO)session.getAttribute("loginVO");
			board.setId(member.getId());
			//DB에서 삭제
			int cnt = dao.boardDelete(board);

			if(cnt==0) {
				logger.info("글 삭제 실패 : {}", board);
			}else {
				logger.info("글 삭제 성공 : {}",board);	
			}
		}
	 
//		글 수정
		public void boardUpdate(BoardVO board) {
			//로그인한 사람의 정보를 가져와서 그 아이디를 setting 해준다
			MemberVO member=(MemberVO)session.getAttribute("loginVO");
			board.setId(member.getId());
			//db에서 삭제
			int cnt = dao.boardUpdate(board);
			
			if(cnt==0) {
				logger.info("글 수정 실패 : {}",board);
			}else {
				logger.info("글 수정 성공 : {}",board);
			}
		} 
		
//	 추천하기
		public String boardUpdateHits(int boardnum) {
			int cnt = dao.boardUpdateHits(boardnum);
			
			
			String path = "";
			
			if(cnt==0) {
				logger.info("추천 실패 : {}", boardnum);
				
			}else {
				logger.info("추천 성공 : {}",boardnum);
				
			}
			
			return path;
		}
	 
}
