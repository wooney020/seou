package com.swdo.test.dao;

import java.util.ArrayList;

import com.swdo.test.vo.BoardVO;

public interface BoardMapper {
//	글등록
	public int boardInsert(BoardVO board);

	/*
	 * // 글 전체 조회 public ArrayList<BoardVO> boardSelect();
	 */
//	글 조회(조건= id)
	public ArrayList<BoardVO> boardSelectAll(String id);
	
	

//	글상세조회(조건= boardnum, PK)
	public BoardVO boardSelectOne(int boardnum);
	
//	게시글 삭제
	public int boardDelete(BoardVO board);
	
//	게시글 수정
	public int boardUpdate(BoardVO board);

//  추천수 증가
	public int boardUpdateHits (int boardnum);
}

