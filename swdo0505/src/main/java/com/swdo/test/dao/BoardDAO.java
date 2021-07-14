package com.swdo.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession session;
	

//	글등록
	public int boardInsert(BoardVO board) {
		int cnt=0;
		try {
			BoardMapper mapper= session.getMapper(BoardMapper.class);
			cnt = mapper.boardInsert(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	/*
	 * // 조회 public ArrayList<BoardVO> boardSelect(){ ArrayList<BoardVO> list =
	 * null; try { BoardMapper mapper = session.getMapper(BoardMapper.class); list =
	 * mapper.boardSelect(); }catch (Exception e) { e.printStackTrace(); } return
	 * list; }
	 */
	
	
//	전체 목록 조회
	public ArrayList<BoardVO> boardSelectAll(String id){
		ArrayList<BoardVO> list = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			list = mapper.boardSelectAll(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	

	//상세 내용 조회
		public BoardVO boardSelectOne(int boardnum) {
			BoardVO board = null;
			try {
				BoardMapper mapper = session.getMapper(BoardMapper.class);
				//특정글 조회
				board = mapper.boardSelectOne(boardnum);
						
			}catch(Exception e) {
				e.printStackTrace();
			}
			return board;
		}
		
		//글삭제
			public int boardDelete(BoardVO board) {
				int cnt=0;
				try {
					BoardMapper mapper =session.getMapper(BoardMapper.class);
					cnt= mapper.boardDelete(board);
				}catch(Exception e) {
					e.printStackTrace();
				}
				return cnt;
			}
				
		//글 수정
		public int boardUpdate(BoardVO board) {
			int cnt=0;
			try {
				BoardMapper mapper =session.getMapper(BoardMapper.class);
				cnt= mapper.boardUpdate(board);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return cnt;	
		}
		
		//추천수 증가
		public int boardUpdateHits(int boardnum) {
			int cnt=0;
			try {
				BoardMapper mapper =session.getMapper(BoardMapper.class);
				cnt= mapper.boardUpdateHits(boardnum);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return cnt;	
		}	
			
			
	
}
