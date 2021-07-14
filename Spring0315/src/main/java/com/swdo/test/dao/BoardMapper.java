package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.ReplyVO;

public interface BoardMapper {

	public int boardInsert(BoardVO board);
	
	public ArrayList<HashMap<String, Object>> boardSelectAll(String searchText , RowBounds rb);
	
	public HashMap<String, Object> boardSelectOne(int board_no);
	
	public void boardUpdateHits(int board_no);
	
	public int boardDelete(BoardVO board);
	
	public int boardUpdate(BoardVO board);
	
	public int boardTotalRecord(String searchText);
	
	public int replyInsert(ReplyVO reply);
	
	public ArrayList<ReplyVO> replySelectList(int board_no);

	public int replyDelete (ReplyVO reply);
	
	public int replyUpdate(ReplyVO reply);
	
	

}
