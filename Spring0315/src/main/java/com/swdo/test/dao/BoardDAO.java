package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.ReplyVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession session;
	
	public int boardInsert(BoardVO board) {
		int cnt = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			cnt = mapper.boardInsert(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt ;
	}
	
	public ArrayList<HashMap<String,Object>> boardSelectAll(String searchText , int startRecord , int countPerPage){
		
		ArrayList<HashMap<String,Object>> list = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			
			
			list = mapper.boardSelectAll(searchText, rb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public HashMap<String, Object> boardSelectOne(int board_no) {
		
		HashMap<String, Object> board = null;
	
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			//조회수 증가
			mapper.boardUpdateHits(board_no);
			//특정 글 조회
			board = mapper.boardSelectOne(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
		
	}
	
	public int boardDelete(BoardVO board) {
		int cnt = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			cnt = mapper.boardDelete(board);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;

	}
	
	public int boardUpdate(BoardVO board) {
		int cnt = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			cnt = mapper.boardUpdate(board);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	public int boardTotalRecord(String searchText) {
	int totalRecord = 0;
	try {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		totalRecord = mapper.boardTotalRecord(searchText);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		return totalRecord;
	}
	
	public int replyInsert(ReplyVO reply) {
		int cnt = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			cnt = mapper.replyInsert(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public ArrayList<ReplyVO> replySelectList(int board_no){
		
		ArrayList<ReplyVO> list = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			list = mapper.replySelectList(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public int replyDelete (ReplyVO reply) {
		
		int cnt = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			cnt = mapper.replyDelete(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}
	
	public int replyUpdate(ReplyVO reply) {
		int cnt = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			cnt = mapper.replyUpdate(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}
